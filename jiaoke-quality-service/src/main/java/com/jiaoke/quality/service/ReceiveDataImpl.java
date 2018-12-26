/**
 * FileName: ReceiveData
 * author:   Melone
 * Date:     2018/10/8 10:40
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.druid.util.StringUtils;
import com.jiake.utils.QualityWarningUtil;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.bean.QualityTimelyDataFalse;
import com.jiaoke.quality.bean.QualityWarningData;
import com.jiaoke.quality.bean.QualityWarningDataFalse;
import com.jiaoke.quality.dao.QualityTimelyDataFalseMapper;
import com.jiaoke.quality.dao.QualityWarningDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.xml.crypto.Data;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 *  <一句话功能描述>
 *  接受并处理生产本地发送过来的数据
 * @author: Melone
 * @create: 2018/10/8 10:40
 * @Description:
 */
@Service
public class ReceiveDataImpl implements ReceiveDataInf {

    @Resource
    private  QualityWarningDao qualityWarningDao;

    @Resource
    private QualityTimelyDataFalseMapper qualityTimelyDataFalseMapper;


    /**
     *
     * 功能描述: <br>
     *  <后台获取数据的字符串后解析放入表quality_warning中>
     * @param: [messageData]
     * @return: void
     * @auther:
     * @date: 2018/10/8 10:47
     */

    @Override
    public void receiveDataToDB(String messageData) {

        Map<String,String> map = new HashMap<String, String>();

        if(StringUtils.isEmpty(messageData)) return;

        //分解字符串同时替换日期
        String[] messageArray = QualityWarningUtil.splitDataToMap(messageData);

        if (0 == messageArray.length || null == messageArray) return;
        //分解出机组号
        String crewNum = messageArray[messageArray.length - 1];

        //获取相关数据后放入map中
        map.put("produce_date",messageArray[0]);
        map.put("produce_time",messageArray[1]);
        map.put("produce_disc_num",messageArray[2]);
        map.put("produce_ratio_id",messageArray[3]);
        map.put("produce_car_num",messageArray[4]);
        map.put("produce_custom_num",messageArray[5]);
        map.put("produce_crewNum",crewNum);

        //插入数据库表quality_warning_promessage_crew，返回主键ID
         qualityWarningDao.insertQualityWarningCrew(map);
        int id =Integer.parseInt(map.get("id"));

        //根据机组获取字段名称
        String fieldName = "";

        switch (Integer.parseInt(crewNum)){
            case 1:
                fieldName = "crew1_modele_id";
                break;
            case 2:
                fieldName = "crew2_modele_id";
                break;

                default:
                    fieldName = "";

        }

        //根据配比号，获取模板数据
        QualityRatioTemplate ratioTemplate = qualityWarningDao.selectRatioTemplateByCrew1MoudelId(map.get("produce_ratio_id"), fieldName);

        if (null == ratioTemplate) return;

        //混合料温度
        int mixture = Integer.parseInt(messageArray[19]);
        //骨料温度
        int aggregate = Integer.parseInt(messageArray[22]);
        //沥青温度
        int temperatureAsphalt = Integer.parseInt(messageArray[21]);
        //截取材料实际数值到数组
        String[] temArray;
        temArray = Arrays.copyOfRange(messageArray,6,18);

        //判断材料百分比差值后插入
        List<QualityWarningData>  warningDataList = QualityWarningUtil.materialWarningObj(id,temArray,ratioTemplate);

        //获取温度差值判断后插入
        warningDataList.add(QualityWarningUtil.temperatureWarningLevel(ratioTemplate.getTemperatureAsphalt(), ratioTemplate.getTemperatureAsphaltUp(), temperatureAsphalt, id, "沥青温度"));
        warningDataList.add(QualityWarningUtil.temperatureWarningLevel(ratioTemplate.getTemperatureMixture(), ratioTemplate.getTemperatureMixtureUp(), mixture, id, "混合料温度"));
        warningDataList.add(QualityWarningUtil.temperatureWarningLevel(ratioTemplate.getTemperatureAggregate(), ratioTemplate.getTemperatureAggregateUp(), aggregate, id, "骨料温度"));

        //插入数据库
        qualityWarningDao.insertQualityWarningData(warningDataList);

    }

    @Override
    public void receiveDataToDBSham(String messageData){
        if(StringUtils.isEmpty(messageData)){return;}

        //分解字符串同时替换日期
        String[] messageArray = QualityWarningUtil.splitDataToMap(messageData);

        if (0 == messageArray.length || null == messageArray) {return;}

        //分析出配比号
        String proportioningNum = messageArray[3];

        //分解出机组号
        String crewNum = messageArray[messageArray.length - 1];

        //分解出总重量
        String materialTotal = messageArray[17];

        //根据配比号获取配比信息
        QualityRatioTemplate templateRatio = qualityWarningDao.getQualityRatioTemplateById(Integer.parseInt(proportioningNum));

        //根据模板随机比例(6-3仓 2%  2,1仓,矿粉仓 1%  沥青上下3kg  温度 上下5)
        double repertorySixPercentage = positiveAndNegativeRandomDecimals(templateRatio.getRepertorySix(), 2, 4);

        double repertoryFivePercentage = positiveAndNegativeRandomDecimals(templateRatio.getRepertoryFive(), 2, 4);

        double repertoryFourPercentage = positiveAndNegativeRandomDecimals(templateRatio.getRepertoryFour(), 2, 4);

        double repertoryThreePercentage = positiveAndNegativeRandomDecimals(templateRatio.getRepertoryThree(), 2, 4);

        double repertoryTwoPercentage = positiveAndNegativeRandomDecimals(templateRatio.getRepertoryTwo(), 1, 2);

        double repertoryOnePercentage = positiveAndNegativeRandomDecimals(templateRatio.getRepertoryOne(), 1, 2);

        //矿粉
        double breezePercentage = positiveAndNegativeRandomDecimals(templateRatio.getBreeze(), 1, 2);

        //沥青
        DecimalFormat format = new DecimalFormat("#0.0");
        //沥青实际重量
        double asphaltActualWeight = Double.parseDouble(calculationWeightByPercentage(templateRatio.getRatioStone(),materialTotal,"#0.0"));
        //沥青数据美化
        double asphaltFalseWeight = positiveAndNegativeRandomDecimals(asphaltActualWeight, 1.5, 3);
        //计算美化后占比
        BigDecimal asphaltBeautifyAfter = new BigDecimal(asphaltFalseWeight);
        BigDecimal materialTotalNum = new BigDecimal(materialTotal);
        BigDecimal percentage = new BigDecimal(100);
        double ratioStonePercentage = Double.parseDouble(format.format(asphaltBeautifyAfter.divide(materialTotalNum, 1).multiply(percentage)));

        //再生料
        BigDecimal ratioRegenerate1 = new BigDecimal(templateRatio.getRatioRegenerate1());
        BigDecimal ratioRegenerate2 = new BigDecimal(templateRatio.getRatioRegenerate2());
        double ratioRegeneratePercentage = positiveAndNegativeRandomDecimals(Double.parseDouble(format.format(ratioRegenerate1.add(ratioRegenerate2))),1,2);

        //添加剂
        double ratioAdditivePercentage = positiveAndNegativeRandomDecimals(templateRatio.getRatioAdditive(), 1, 2);

        //沥青温度
        int temperatureAsphalt = randomNegativeAndPositiveInteger(templateRatio.getTemperatureAsphalt(),5, -5);

        //混合料温度
        int temperatureMixture = randomNegativeAndPositiveInteger(templateRatio.getTemperatureMixture(),5, -5);

        //骨料温度
        int temperatureAggregate = randomNegativeAndPositiveInteger(templateRatio.getTemperatureAggregate(),5, -5);

        /*-----------------------------------------------------------------------*/

        //计算实际值
        QualityTimelyDataFalse qualityTimelyDataFalse = new QualityTimelyDataFalse();

        try {
            qualityTimelyDataFalse.setProduceDate(new SimpleDateFormat("yyyy-MM-dd").parse(messageArray[0]));
            qualityTimelyDataFalse.setProductTime(new SimpleDateFormat("HH:mm:ss").parse(messageArray[1]));
        }catch (Exception e){
            e.printStackTrace();
        }
        qualityTimelyDataFalse.setProduceDiscNum(messageArray[2]);
        qualityTimelyDataFalse.setProduceProportioningNum(messageArray[3]);
        qualityTimelyDataFalse.setProduceCarNum(messageArray[4]);
        qualityTimelyDataFalse.setProduceCustomNum(messageArray[5]);

        //骨料
        int materialAggregate6 = Integer.parseInt(calculationWeightByPercentage(repertorySixPercentage,materialTotal,"#0"));

        int materialAggregate5 = Integer.parseInt(calculationWeightByPercentage(repertoryFivePercentage,materialTotal,"#0"));

        int materialAggregate4 = Integer.parseInt(calculationWeightByPercentage(repertoryFourPercentage,materialTotal,"#0"));

        int materialAggregate3 = Integer.parseInt(calculationWeightByPercentage(repertoryThreePercentage,materialTotal,"#0"));

        int materialAggregate2 = Integer.parseInt(calculationWeightByPercentage(repertoryTwoPercentage,materialTotal,"#0"));

        int materialAggregate1 = Integer.parseInt(calculationWeightByPercentage(repertoryOnePercentage,materialTotal,"#0"));

        ArrayList<Integer> list = new ArrayList<>();
        list.add(materialAggregate6);
        list.add(materialAggregate5);
        list.add(materialAggregate4);
        list.add(materialAggregate3);
        list.add(materialAggregate2);
        list.add(materialAggregate1);

        List<Integer> integerList = increaseProgressively(list);

        //骨料
        qualityTimelyDataFalse.setMaterialAggregate6(integerList.get(0));
        qualityTimelyDataFalse.setMaterialAggregate5(integerList.get(1));
        qualityTimelyDataFalse.setMaterialAggregate4(integerList.get(2));
        qualityTimelyDataFalse.setMaterialAggregate3(integerList.get(3));
        qualityTimelyDataFalse.setMaterialAggregate2(integerList.get(4));
        qualityTimelyDataFalse.setMaterialAggregate1(integerList.get(5));

        //矿粉
        qualityTimelyDataFalse.setMaterialStone1(0.0);
        qualityTimelyDataFalse.setMaterialStone2(Double.parseDouble(calculationWeightByPercentage(breezePercentage,materialTotal,"#0.0")));

        qualityTimelyDataFalse.setMaterialAsphalt(asphaltFalseWeight);
        qualityTimelyDataFalse.setMaterialRegenerate(Double.parseDouble(calculationWeightByPercentage(ratioRegeneratePercentage,materialTotal,"#0.0")));
        qualityTimelyDataFalse.setMaterialAdditive(Double.parseDouble(calculationWeightByPercentage(ratioAdditivePercentage,materialTotal,"#0.0")));
        qualityTimelyDataFalse.setMaterialTotal(Double.parseDouble(messageArray[17]));

        //温度
        qualityTimelyDataFalse.setTemperatureWarehouse1(Integer.parseInt(messageArray[18]));
        qualityTimelyDataFalse.setTemperatureMixture(temperatureMixture);
        qualityTimelyDataFalse.setTemperatureDuster(Integer.parseInt(messageArray[20]));
        qualityTimelyDataFalse.setTemperatureAsphalt(temperatureAsphalt);
        qualityTimelyDataFalse.setTemperatureAggregate(temperatureAggregate);
        qualityTimelyDataFalse.setCrewNum(Integer.parseInt(crewNum));
        qualityTimelyDataFalseMapper.insertSelective(qualityTimelyDataFalse);
    }

    private List<Integer> increaseProgressively(List<Integer> materialAggregate){
        List<Integer> list = new ArrayList<>();

        int flag = 0;
        for (int i = 0; i < materialAggregate.size(); i++) {
            flag += materialAggregate.get(i);
            list.add(flag);
        }
        return list;
    }

    /**
     * 计算重量
     *
     * @param modelPercentage 模板占比
     * @param materialTotal 总数
     * @return 实际重量
     */
    private String calculationWeightByPercentage(double modelPercentage,String materialTotal,String decimalPlace){
        DecimalFormat format = new DecimalFormat(decimalPlace);

        if (modelPercentage == 0){
            return format.format(modelPercentage);
        }else {
            BigDecimal randomModelPercentage = new BigDecimal(modelPercentage);
            BigDecimal total = new BigDecimal(materialTotal);
            BigDecimal percentage = new BigDecimal(100);
            // 占比/100*总数=重量
            BigDecimal result = randomModelPercentage.divide(percentage,1).multiply(total);
            return format.format(result);
        }
    }

    /**
     * 获取正负随机小数（#0.0）
     *
     * @param valueRange  取值范围
     * @param rangeLength 范围长度
     * @return double
     */
    private static double positiveAndNegativeRandomDecimals(double modelValue, double valueRange, int rangeLength){

        if (modelValue == 0){
            return modelValue;
        } else{
            //随机小数
            double random = valueRange - (Math.random()*rangeLength);

            //四舍五入保留一位
            DecimalFormat format = new DecimalFormat("#0.0");

            BigDecimal bigDecimal1 = new BigDecimal(random);
            BigDecimal bigDecimal2 = new BigDecimal(modelValue);

            BigDecimal decimal = bigDecimal1.add(bigDecimal2);
            String str = format.format(decimal);
            double parseDouble = Double.parseDouble(str);

            if (parseDouble > 0){
                return parseDouble;
            }else {
                //结果小于等于0则随机正小数%0-1
                Random randomPositiveNumber = new Random();
                BigDecimal bigDecimal3 = new BigDecimal(randomPositiveNumber.nextDouble() * 1);
                BigDecimal bigDecimal4 = new BigDecimal(modelValue);
                return Double.parseDouble(format.format(bigDecimal3.add(bigDecimal4)));
            }

        }
    }

    /**
     *  获取随机正小数（#0.0）
     * @return double
     */
    private static Double randomNormalDecimals(){
        Random random = new Random();
        DecimalFormat format = new DecimalFormat("#0.0");
        String randomStr = format.format(random.nextDouble() * 3);
        return Double.parseDouble(randomStr);
    }

    /**
     *  随机正负整数
     *
     * @param max 最大值
     * @param min 最小值
     * @return 随机整数
     */
    private static int randomNegativeAndPositiveInteger(int initialValue,int max,int min){
        if (initialValue == 0){
            return 0;
        }else {
            Random random = new Random();
            int randomNum = random.nextInt(max - (min) + 1) + (min);
            return initialValue + randomNum;
        }
    }
}
