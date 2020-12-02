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
import com.jiake.utils.QualityDataMontoringUtil;
import com.jiake.utils.QualityWarningUtil;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.bean.QualityTimelyDataFalse;
import com.jiaoke.quality.bean.QualityWaringDataFalse;
import com.jiaoke.quality.bean.QualityWarningData;
import com.jiaoke.quality.dao.QualityTimelyDataFalseMapper;
import com.jiaoke.quality.dao.QualityWarningDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.text.DecimalFormat;
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
     *  存入两个机组最后一盘生产时间，用于判断生产时预热时间
     */
    private Map<String,Object> productDate = new HashMap<>();
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
    public synchronized void receiveDataToDB(String messageData)  throws Exception  {

        if(StringUtils.isEmpty(messageData)) return;

        Map<String,String> map = new HashMap<String, String>();

        //分解字符串同时替换日期
        String[] messageArray = QualityWarningUtil.splitDataToMap(messageData);

        if (0 == messageArray.length || null == messageArray) return;
        //分解出机组号
        String crewNum = messageArray[messageArray.length - 1];
        //定义最后一个时间的key
        String lastTimeKey = "productTime_" + crewNum;
        //定义记录盘数
        String countKey = "productCount_" + crewNum;
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
        //获取相关数据后放入map中
        map.put("produce_date",messageArray[0]);
        map.put("produce_time",messageArray[1]);
        map.put("produce_disc_num",messageArray[2]);
        map.put("produce_ratio_id",messageArray[3]);
        map.put("produce_car_num",messageArray[4]);
        map.put("produce_custom_num",messageArray[5]);
        map.put("produce_crewNum",crewNum);

        //获取生产时间，确定所使用得模板
        String proDate = map.get("produce_date");

        //1. 判断生产时间间隔,产生两种可能性 一、生产间隔大于半个小时，前十盘处于热仓情况 二、小于半个小时，处于连续生产情况
            //拼接日期时间
        SimpleDateFormat dateFormat  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String produceTime = proDate + " " + map.get("produce_time");
        //程序第一次没有存入最后一条生产信息
        if (!productDate.containsKey(lastTimeKey)){
            String initTime = "2020-09-01 00:00:00";
//            Map<String,Date> lastProductMap = qualityWarningDao.selectLastProductTime(produceTime,crewNum);
            productDate.put(lastTimeKey,initTime);
            productDate.put(countKey,0);
        }

        //根据配比号，获取模板数据
        QualityRatioTemplate ratioTemplate = qualityWarningDao.selectRatioTemplateByCrew1MoudelId(map.get("produce_ratio_id"), fieldName,proDate);
        //根据配比ID，获取预警数据
        Map<String,String> warningLeveMap = qualityWarningDao.selectWarningLevelByRatioId(ratioTemplate.getId());
        if (null == ratioTemplate) {
            return;
        }
        if (null == warningLeveMap || warningLeveMap.isEmpty()){
            return;
        }
        //插入数据库表quality_warning_promessage_crew，返回主键ID
        qualityWarningDao.insertQualityWarningCrew(map);
        int id =Integer.parseInt(map.get("id"));
        //更新当日生产人员
        List<Map<String,String>> userList  = qualityWarningDao.selectProductionPeople(crewNum);
        //初始化生产时间
        String initTime = "2020-09-28 08:00:00";
        String productPeople = "";
        String phone = "";
        Date workTime = dateFormat.parse(initTime);
        Date proTime = dateFormat.parse(produceTime);
        //做取余 查看是否在班
        double workPoor = QualityDataMontoringUtil.getWorkTime(proTime, workTime);
        //班组号
        String teamNum = "";
        //根据取余结果确认班组
        if (workPoor <= 10){
            teamNum = "1";
        }else if ( workPoor <= 24){
            teamNum = "2";
        }else if (workPoor <= 34){
            teamNum = "3";
        }else if (workPoor <= 48){
            teamNum = "1";
        }else if (workPoor <= 58){
            teamNum = "2";
        }else if (workPoor <= 72){
            teamNum = "3";
        }
        for (int i = 0;i < userList.size();i++){
            String teamCode =String.valueOf(userList.get(i).get("team_num"));
            if (teamNum.equals(teamCode)){
                productPeople =  userList.get(i).get("team_leader");
                phone = userList.get(i).get("message_phone");
                qualityWarningDao.updateProductPeopleToRealTimeDate(proDate,map.get("produce_time"),crewNum,productPeople);
            }
        }
        //判断生产时间间隔
        String lastTime = productDate.get(lastTimeKey).toString();
        String count = productDate.get(countKey).toString();
        Date lastProductTime = dateFormat.parse(lastTime);
        Date productTime = dateFormat.parse(produceTime);
        //生产间隔时间分钟数
        long datePoor = QualityDataMontoringUtil.getDatePoor(productTime,lastProductTime);
        //插入数据库的预警集合
        List<QualityWarningData>  warningDataList = new ArrayList<>();

        //截取材料实际数值到数组
        String[] temArray;
        temArray = Arrays.copyOfRange(messageArray,6,27);

        //2. 计数大于10盘后更新日期map，
        if (datePoor > 30 && Integer.parseInt(count) <= 10){
            productDate.put(countKey,Integer.parseInt(count) + 1);
            //温度类型不预警
            warningDataList.add(QualityWarningUtil.threeTemperatureWarningLevel(warningLeveMap,ratioTemplate.getTemperatureMilling(), ratioTemplate.getTemperatureMillingUp(), Integer.parseInt(messageArray[27]), id, "一仓温度"));
            warningDataList.add(QualityWarningUtil.threeTemperatureWarningLevel(warningLeveMap,ratioTemplate.getTemperatureAsphalt(), ratioTemplate.getTemperatureAsphaltUp(), Integer.parseInt(messageArray[28]), id, "沥青温度"));
            warningDataList.add(QualityWarningUtil.threeTemperatureWarningLevel(warningLeveMap,ratioTemplate.getTemperatureMixture(), ratioTemplate.getTemperatureMixtureUp(), Integer.parseInt(messageArray[30]), id, "混合料温度"));
            warningDataList.add(QualityWarningUtil.threeTemperatureWarningLevel(warningLeveMap,ratioTemplate.getTemperatureAggregate(), ratioTemplate.getTemperatureAggregateUp(), Integer.parseInt(messageArray[31]), id, "骨料温度"));
            //刚开始生产的不进行三盘平均
            if (Integer.parseInt(count) < 3){
                //判断材料百分比差值后插入
                warningDataList.addAll(QualityWarningUtil.materialWarningObj(id,warningLeveMap,temArray,ratioTemplate));
            }else {
                String tem = dateFormat.format(productTime);
                //根据时间、机组号、产品类型获取最近的三盘数据
                List<Map<String,String>>  threeList =  qualityWarningDao.selectThreeProductByTime(tem,crewNum,map.get("produce_ratio_id"));
                //获取平均后的三盘数据，计算差值
                warningDataList.addAll(QualityWarningUtil.avgThreeProductWarningLeve(id,threeList,warningLeveMap,ratioTemplate));
            }

            if (Integer.parseInt(count) == 10){
                productDate.put(lastTimeKey,produceTime);
                productDate.put(countKey,0);
            }
        }else {
            productDate.put(lastTimeKey,produceTime);
            //同类型半个小时内的同类型三盘产品
            List<Map<String,String>>  threeList =  qualityWarningDao.selectThreeProductByTime(dateFormat.format(productTime),crewNum,map.get("produce_ratio_id"));

            //处理温度差值
            //一仓温度
            int warehouse = 0;
            //混合料温度
            int mixture = 0;
            //除尘器温度
//        int mixture = Integer.parseInt(messageArray[29]);
            //沥青温度
            int temperatureAsphalt = 0;
            //骨料温度
            int  aggregate = 0;

            for (int i = 0; i < threeList.size();i++){
                warehouse += Integer.parseInt(String.valueOf(threeList.get(i).get("temperature_warehouse_1")));
                mixture += Integer.parseInt(String.valueOf(threeList.get(i).get("temperature_mixture")));
                temperatureAsphalt += Integer.parseInt(String.valueOf(threeList.get(i).get("temperature_asphalt")));
                aggregate += Integer.parseInt(String.valueOf(threeList.get(i).get("temperature_aggregate")));
            }
            if (threeList.size() > 0 ){
                warningDataList.add(QualityWarningUtil.temperatureWarningLevel(warningLeveMap,ratioTemplate.getTemperatureMilling(), ratioTemplate.getTemperatureMillingUp(), warehouse/threeList.size(), id, "一仓温度"));
                warningDataList.add(QualityWarningUtil.temperatureWarningLevel(warningLeveMap,ratioTemplate.getTemperatureAsphalt(), ratioTemplate.getTemperatureAsphaltUp(), temperatureAsphalt/threeList.size(), id, "沥青温度"));
                warningDataList.add(QualityWarningUtil.temperatureWarningLevel(warningLeveMap,ratioTemplate.getTemperatureMixture(), ratioTemplate.getTemperatureMixtureUp(), mixture/threeList.size(), id, "混合料温度"));
                warningDataList.add(QualityWarningUtil.temperatureWarningLevel(warningLeveMap,ratioTemplate.getTemperatureAggregate(), ratioTemplate.getTemperatureAggregateUp(), aggregate/threeList.size(), id, "骨料温度"));
            }else {
                warningDataList.add(QualityWarningUtil.temperatureWarningLevel(warningLeveMap,ratioTemplate.getTemperatureMilling(), ratioTemplate.getTemperatureMillingUp(), warehouse, id, "一仓温度"));
                warningDataList.add(QualityWarningUtil.temperatureWarningLevel(warningLeveMap,ratioTemplate.getTemperatureAsphalt(), ratioTemplate.getTemperatureAsphaltUp(), temperatureAsphalt, id, "沥青温度"));
                warningDataList.add(QualityWarningUtil.temperatureWarningLevel(warningLeveMap,ratioTemplate.getTemperatureMixture(), ratioTemplate.getTemperatureMixtureUp(), mixture, id, "混合料温度"));
                warningDataList.add(QualityWarningUtil.temperatureWarningLevel(warningLeveMap,ratioTemplate.getTemperatureAggregate(), ratioTemplate.getTemperatureAggregateUp(), aggregate, id, "骨料温度"));
            }

            //处理材料温度差值
            warningDataList.addAll(QualityWarningUtil.avgThreeProductWarningLeve(id,threeList,warningLeveMap,ratioTemplate));

        }

        //插入数据库
         qualityWarningDao.insertQualityWarningData(warningDataList);
        int criticalWarning = 0;
        int upWarning = 0;
        for (int i = 0; i < warningDataList.size(); i++){
            String materialName = warningDataList.get(i).getMaterialName();
            String warningLevel = warningDataList.get(i).getWarningLevel();
            int tem = Integer.parseInt(warningLevel);
            //判断预警级别插入关键数据预警表
            if (materialName.equals("一仓温度") || materialName.equals("沥青") || materialName.equals("骨料1")){
                if (tem > 1){
                    criticalWarning = tem > criticalWarning ? tem:criticalWarning;
                }
            }
            //判断预警最高等级
            upWarning = tem > upWarning? tem:upWarning;
        }

        //更新预警表
        qualityWarningDao.updateQualityWarningData(id,upWarning,criticalWarning,ratioTemplate.getProName());
    }

    @Override
    public void receiveDataToDBSham(String messageData){
        if(StringUtils.isEmpty(messageData)){return;}

        //分解字符串同时替换日期
        String[] messageArray = QualityWarningUtil.splitDataToMap(messageData);

        if (0 == messageArray.length || null == messageArray) {return;}

        //沥青
        DecimalFormat format = new DecimalFormat("#0.0");

        //分析出配比号
        String proportioningNum = messageArray[3];

        //分解出机组号
        String crewNum = messageArray[messageArray.length - 1];
//
//        //查看机组
        crewNum =  "1".equals(crewNum)?  "crew1":"crew2";

        //分解出总重量
        String materialTotal = messageArray[26];

        //用于写入假预警数据表
        List<QualityWaringDataFalse> myWaringDataList = new ArrayList<>();

        //分析出日期
        String proDate = messageArray[0];

        //根据配比号获取配比信息
        QualityRatioTemplate templateRatio = qualityWarningDao.getQualityRatioTemplateById(Integer.parseInt(proportioningNum),crewNum,proDate);
        if (templateRatio == null ) return;
        crewNum = "crew1".equals(crewNum)? "1":"2";
        //根据模板随机比例(6-3仓 2%  2,1仓,矿粉仓 1%  沥青上下3kg  温度 上下5)
        double repertoryTenPercentage = positiveAndNegativeRandomDecimals(templateRatio.getRepertoryTen(), 2, 4);
        //添加预警表相关信息
        QualityWaringDataFalse ten = new QualityWaringDataFalse();
        ten.setActualRatio(Double.parseDouble(format.format(repertoryTenPercentage)));
        ten.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getRepertoryTen())));
        ten.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getRepertoryTen() - repertoryTenPercentage)));
        ten.setMaterialName("骨料10");
        myWaringDataList.add(ten);
        double repertoryNinePercentage = positiveAndNegativeRandomDecimals(templateRatio.getRepertoryNine(), 2, 4);
        //添加预警表相关信息
        QualityWaringDataFalse nine = new QualityWaringDataFalse();
        nine.setActualRatio(Double.parseDouble(format.format(repertoryNinePercentage)));
        nine.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getRepertoryNine())));
        nine.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getRepertoryNine() - repertoryNinePercentage)));
        nine.setMaterialName("骨料9");
        myWaringDataList.add(nine);
        double repertoryEightPercentage = positiveAndNegativeRandomDecimals(templateRatio.getRepertoryEight(), 2, 4);
        //添加预警表相关信息
        QualityWaringDataFalse eight = new QualityWaringDataFalse();
        eight.setActualRatio(Double.parseDouble(format.format(repertoryEightPercentage)));
        eight.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getRepertoryEight())));
        eight.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getRepertoryEight() - repertoryEightPercentage)));
        eight.setMaterialName("骨料8");
        myWaringDataList.add(eight);
        double repertorySevenPercentage = positiveAndNegativeRandomDecimals(templateRatio.getRepertorySeven(), 2, 4);
        //添加预警表相关信息
        QualityWaringDataFalse seven = new QualityWaringDataFalse();
        seven.setActualRatio(Double.parseDouble(format.format(repertorySevenPercentage)));
        seven.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getRepertorySeven())));
        seven.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getRepertorySeven() - repertorySevenPercentage)));
        seven.setMaterialName("骨料7");
        myWaringDataList.add(seven);
        double repertorySixPercentage = positiveAndNegativeRandomDecimals(templateRatio.getRepertorySix(), 2, 4);
        //添加预警表相关信息
        QualityWaringDataFalse six = new QualityWaringDataFalse();
        six.setActualRatio(Double.parseDouble(format.format(repertorySixPercentage)));
        six.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getRepertorySix())));
        six.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getRepertorySix() - repertorySixPercentage)));
        six.setMaterialName("骨料6");
        myWaringDataList.add(six);

        double repertoryFivePercentage = positiveAndNegativeRandomDecimals(templateRatio.getRepertoryFive(), 2, 4);
        //添加预警表相关信息
        QualityWaringDataFalse five = new QualityWaringDataFalse();
        five.setActualRatio(Double.parseDouble(format.format(repertoryFivePercentage)));
        five.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getRepertoryFive())));
        five.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getRepertoryFive() - repertoryFivePercentage)));
        five.setMaterialName("骨料5");
        myWaringDataList.add(five);

        double repertoryFourPercentage = positiveAndNegativeRandomDecimals(templateRatio.getRepertoryFour(), 2, 4);

        //添加预警表相关信息
        QualityWaringDataFalse four = new QualityWaringDataFalse();
        four.setActualRatio(Double.parseDouble(format.format(repertoryFourPercentage)));
        four.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getRepertoryFour())));
        four.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getRepertoryFour() - repertoryFourPercentage)));
        four.setMaterialName("骨料4");
        myWaringDataList.add(four);

        double repertoryThreePercentage = positiveAndNegativeRandomDecimals(templateRatio.getRepertoryThree(), 2, 4);

        //添加预警表相关信息
        QualityWaringDataFalse three = new QualityWaringDataFalse();
        three.setActualRatio(Double.parseDouble(format.format(repertoryThreePercentage)));
        three.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getRepertoryThree())));
        three.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getRepertoryThree() - repertoryThreePercentage)));
        three.setMaterialName("骨料3");
        myWaringDataList.add(three);

        double repertoryTwoPercentage = positiveAndNegativeRandomDecimals(templateRatio.getRepertoryTwo(), 1, 2);

        //添加预警表相关信息
        QualityWaringDataFalse two = new QualityWaringDataFalse();
        two.setActualRatio(Double.parseDouble(format.format(repertoryTwoPercentage)));
        two.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getRepertoryTwo())));
        two.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getRepertoryTwo() - repertoryTwoPercentage)));
        two.setMaterialName("骨料2");
        myWaringDataList.add(two);


        double repertoryOnePercentage = positiveAndNegativeRandomDecimals(templateRatio.getRepertoryOne(), 1, 2);

        //添加预警表相关信息
        QualityWaringDataFalse one = new QualityWaringDataFalse();
        one.setActualRatio(Double.parseDouble(format.format(repertoryOnePercentage)));
        one.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getRepertoryOne())));
        one.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getRepertoryOne() - repertoryOnePercentage)));
        one.setMaterialName("骨料1");
        myWaringDataList.add(one);


        //矿粉
        double breezePercentage = positiveAndNegativeRandomDecimals(templateRatio.getBreeze(), 1, 2);

        //添加预警表相关信息
        QualityWaringDataFalse breeze = new QualityWaringDataFalse();
        breeze.setActualRatio(Double.parseDouble(format.format(breezePercentage)));
        breeze.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getBreeze())));
        breeze.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getBreeze() - breezePercentage)));
        breeze.setMaterialName("石粉1");
        myWaringDataList.add(breeze);

        double breezeTwoPercentage = positiveAndNegativeRandomDecimals(templateRatio.getBreezeTwo(), 1, 2);

        //添加预警表相关信息
        QualityWaringDataFalse breezeTwo = new QualityWaringDataFalse();
        breezeTwo.setActualRatio(Double.parseDouble(format.format(breezeTwoPercentage)));
        breezeTwo.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getBreezeTwo())));
        breezeTwo.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getBreezeTwo() - breezeTwoPercentage)));
        breezeTwo.setMaterialName("石粉2");
        myWaringDataList.add(breezeTwo);

        //矿粉3
        double breezeThreePercentage = positiveAndNegativeRandomDecimals(templateRatio.getBreezeThree(), 1, 2);

        //添加预警表相关信息
        QualityWaringDataFalse breezeThree = new QualityWaringDataFalse();
        breezeThree.setActualRatio(Double.parseDouble(format.format(breezeThreePercentage)));
        breezeThree.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getBreezeThree())));
        breezeThree.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getBreezeThree() - breezeThreePercentage)));
        breezeThree.setMaterialName("石粉3");
        myWaringDataList.add(breezeThree);

        //矿粉
        double breezeFourPercentage = positiveAndNegativeRandomDecimals(templateRatio.getBreezeFour(), 1, 2);

        //添加预警表相关信息
        QualityWaringDataFalse breezeFour = new QualityWaringDataFalse();
        breezeFour.setActualRatio(Double.parseDouble(format.format(breezeFourPercentage)));
        breezeFour.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getBreezeFour())));
        breezeFour.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getBreezeFour() - breezeFourPercentage)));
        breezeFour.setMaterialName("石粉1");
        myWaringDataList.add(breezeFour);
        //沥青实际重量
        double asphaltActualWeight = Double.parseDouble(calculationWeightByPercentage(templateRatio.getRatioStone(),materialTotal,"#0.0"));
        //沥青数据美化
        double asphaltFalseWeight = positiveAndNegativeRandomDecimals(asphaltActualWeight, 1.5, 3);
        //计算美化后占比
        BigDecimal asphaltBeautifyAfter = new BigDecimal(asphaltFalseWeight);
        BigDecimal materialTotalNum = new BigDecimal(materialTotal);
        BigDecimal percentage = new BigDecimal(100);
        double ratioStonePercentage = Double.parseDouble(format.format(asphaltBeautifyAfter.divide(materialTotalNum, BigDecimal.ROUND_HALF_UP,3).multiply(percentage)));

        //添加预警表相关信息
        QualityWaringDataFalse asphalt = new QualityWaringDataFalse();
        asphalt.setActualRatio(Double.parseDouble(format.format(ratioStonePercentage)));
        asphalt.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getRatioStone())));
        asphalt.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getRatioStone() - ratioStonePercentage)));
        asphalt.setMaterialName("沥青");
        myWaringDataList.add(asphalt);

        //再生料
        BigDecimal ratioRegenerate1 = new BigDecimal(templateRatio.getRatioRegenerate1());
        BigDecimal ratioRegenerate2 = new BigDecimal(templateRatio.getRatioRegenerate2());
        BigDecimal ratioRegenerate3 = new BigDecimal(templateRatio.getRatioRegenerate3());
        double ratioRegeneratePercentage = positiveAndNegativeRandomDecimals(Double.parseDouble(format.format(getBigDecimalSum(ratioRegenerate1,ratioRegenerate2,ratioRegenerate3))),1,2);

        //添加预警表相关信息
        QualityWaringDataFalse regenerate = new QualityWaringDataFalse();
        regenerate.setActualRatio(Double.parseDouble(format.format(ratioRegeneratePercentage)));
        regenerate.setMoudleRatio(Double.parseDouble(format.format(getBigDecimalSum(ratioRegenerate1,ratioRegenerate2,ratioRegenerate3))));
        regenerate.setDeviationRatio(Double.parseDouble(format.format(Double.parseDouble(format.format(getBigDecimalSum(ratioRegenerate1,ratioRegenerate2,ratioRegenerate3))) - ratioRegeneratePercentage)));
        regenerate.setMaterialName("再生料");
        myWaringDataList.add(regenerate);

        //添加剂
        double ratioAdditivePercentage = positiveAndNegativeRandomDecimals(templateRatio.getRatioAdditive(), 1, 2);

        //添加预警表相关信息
        QualityWaringDataFalse dditive = new QualityWaringDataFalse();
        dditive.setActualRatio(Double.parseDouble(format.format(ratioAdditivePercentage)));
        dditive.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getRatioAdditive())));
        dditive.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getRatioAdditive() - ratioAdditivePercentage)));
        dditive.setMaterialName("添加剂");
        myWaringDataList.add(dditive);

        //添加剂2
        double ratioAdditiveTwoPercentage = positiveAndNegativeRandomDecimals(templateRatio.getRatioAdditiveTwo(), 1, 2);

        //添加预警表相关信息
        QualityWaringDataFalse dditiveTwo = new QualityWaringDataFalse();
        dditiveTwo.setActualRatio(Double.parseDouble(format.format(ratioAdditiveTwoPercentage)));
        dditiveTwo.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getRatioAdditiveTwo())));
        dditiveTwo.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getRatioAdditiveTwo() - ratioAdditiveTwoPercentage)));
        dditiveTwo.setMaterialName("添加剂2");
        myWaringDataList.add(dditiveTwo);

        //添加剂3
        double ratioAdditiveThreePercentage = positiveAndNegativeRandomDecimals(templateRatio.getRatioAdditiveThree(), 1, 2);

        //添加预警表相关信息
        QualityWaringDataFalse dditiveThree = new QualityWaringDataFalse();
        dditiveThree.setActualRatio(Double.parseDouble(format.format(ratioAdditiveThreePercentage)));
        dditiveThree.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getRatioAdditiveThree())));
        dditiveThree.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getRatioAdditiveThree() - ratioAdditiveThreePercentage)));
        dditiveThree.setMaterialName("添加剂3");
        myWaringDataList.add(dditiveThree);

        //添加剂3
        double ratioAdditiveFourPercentage = positiveAndNegativeRandomDecimals(templateRatio.getRatioAdditiveFour(), 1, 2);

        //添加预警表相关信息
        QualityWaringDataFalse dditiveFour = new QualityWaringDataFalse();
        dditiveFour.setActualRatio(Double.parseDouble(format.format(ratioAdditiveFourPercentage)));
        dditiveFour.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getRatioAdditiveFour())));
        dditiveFour.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getRatioAdditiveFour() - ratioAdditiveFourPercentage)));
        dditiveFour.setMaterialName("添加剂4");
        myWaringDataList.add(dditiveFour);
        //沥青温度
        int temperatureAsphalt = randomNegativeAndPositiveInteger(templateRatio.getTemperatureAsphalt(),5, -5);

        //添加预警表相关信息
        QualityWaringDataFalse temAsphalt = new QualityWaringDataFalse();
        temAsphalt.setActualRatio(Double.parseDouble(format.format(temperatureAsphalt)));
        temAsphalt.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getTemperatureAsphalt())));
        temAsphalt.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getTemperatureAsphalt() - temperatureAsphalt)));
        temAsphalt.setMaterialName("沥青温度");
        myWaringDataList.add(temAsphalt);

        //混合料温度
        int temperatureMixture = randomNegativeAndPositiveInteger(templateRatio.getTemperatureMixture(),5, -5);

        //添加预警表相关信息
        QualityWaringDataFalse temMixture = new QualityWaringDataFalse();
        temMixture.setActualRatio(Double.parseDouble(format.format(temperatureMixture)));
        temMixture.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getTemperatureMixture())));
        temMixture.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getTemperatureMixture() - temperatureMixture)));
        temMixture.setMaterialName("混合料温度");
        myWaringDataList.add(temMixture);


        //骨料温度
        int temperatureAggregate = randomNegativeAndPositiveInteger(templateRatio.getTemperatureAggregate(),5, -5);

        //添加预警表相关信息
        QualityWaringDataFalse temAggregate = new QualityWaringDataFalse();
        temAggregate.setActualRatio(Double.parseDouble(format.format(temperatureAggregate)));
        temAggregate.setMoudleRatio(Double.parseDouble(format.format(templateRatio.getTemperatureAggregate())));
        temAggregate.setDeviationRatio(Double.parseDouble(format.format(templateRatio.getTemperatureAggregate() - temperatureAggregate)));
        temAggregate.setMaterialName("骨料温度");
        myWaringDataList.add(temAggregate);

        /*-----------------------------------------------------------------------*/

        //计算实际值
        QualityTimelyDataFalse qualityTimelyDataFalse = new QualityTimelyDataFalse();

        try {
            qualityTimelyDataFalse.setProduceDate(new SimpleDateFormat("yyyy-MM-dd").parse(messageArray[0]) );
            qualityTimelyDataFalse.setProductTime(new SimpleDateFormat("HH:mm:ss").parse(messageArray[1]));
        }catch (Exception e){
            e.printStackTrace();
        }
        qualityTimelyDataFalse.setProduceDiscNum(messageArray[2]);
        qualityTimelyDataFalse.setProduceProportioningNum(messageArray[3]);
        qualityTimelyDataFalse.setProduceCarNum(messageArray[4]);
        qualityTimelyDataFalse.setProduceCustomNum(messageArray[5]);

        //骨料
        int materialAggregate10 = Integer.parseInt(calculationWeightByPercentage(repertoryTenPercentage,materialTotal,"#0"));

        int materialAggregate9 = Integer.parseInt(calculationWeightByPercentage(repertoryNinePercentage,materialTotal,"#0"));

        int materialAggregate8 = Integer.parseInt(calculationWeightByPercentage(repertoryEightPercentage,materialTotal,"#0"));

        int materialAggregate7 = Integer.parseInt(calculationWeightByPercentage(repertorySevenPercentage,materialTotal,"#0"));

        int materialAggregate6 = Integer.parseInt(calculationWeightByPercentage(repertorySixPercentage,materialTotal,"#0"));

        int materialAggregate5 = Integer.parseInt(calculationWeightByPercentage(repertoryFivePercentage,materialTotal,"#0"));

        int materialAggregate4 = Integer.parseInt(calculationWeightByPercentage(repertoryFourPercentage,materialTotal,"#0"));

        int materialAggregate3 = Integer.parseInt(calculationWeightByPercentage(repertoryThreePercentage,materialTotal,"#0"));

        int materialAggregate2 = Integer.parseInt(calculationWeightByPercentage(repertoryTwoPercentage,materialTotal,"#0"));

        int materialAggregate1 = Integer.parseInt(calculationWeightByPercentage(repertoryOnePercentage,materialTotal,"#0"));

        ArrayList<Integer> list = new ArrayList<>();
        list.add(materialAggregate10);
        list.add(materialAggregate9);
        list.add(materialAggregate8);
        list.add(materialAggregate7);
        list.add(materialAggregate6);
        list.add(materialAggregate5);
        list.add(materialAggregate4);
        list.add(materialAggregate3);
        list.add(materialAggregate2);
        list.add(materialAggregate1);

        List<Integer> integerList = increaseProgressively(list);

        //骨料
        qualityTimelyDataFalse.setMaterialAggregate10(integerList.get(0));
        qualityTimelyDataFalse.setMaterialAggregate9(integerList.get(1));
        qualityTimelyDataFalse.setMaterialAggregate8(integerList.get(2));
        qualityTimelyDataFalse.setMaterialAggregate7(integerList.get(3));
        qualityTimelyDataFalse.setMaterialAggregate6(integerList.get(4));
        qualityTimelyDataFalse.setMaterialAggregate5(integerList.get(5));
        qualityTimelyDataFalse.setMaterialAggregate4(integerList.get(6));
        qualityTimelyDataFalse.setMaterialAggregate3(integerList.get(7));
        qualityTimelyDataFalse.setMaterialAggregate2(integerList.get(8));
        qualityTimelyDataFalse.setMaterialAggregate1(integerList.get(9));

        //矿粉
        qualityTimelyDataFalse.setMaterialStone4(Double.parseDouble(calculationWeightByPercentage(breezeFourPercentage,materialTotal,"#0.0")));
        qualityTimelyDataFalse.setMaterialStone3(Double.parseDouble(calculationWeightByPercentage(breezeThreePercentage,materialTotal,"#0.0")));
        qualityTimelyDataFalse.setMaterialStone1(Double.parseDouble(calculationWeightByPercentage(breezePercentage,materialTotal,"#0.0")));
        qualityTimelyDataFalse.setMaterialStone2(Double.parseDouble(calculationWeightByPercentage(breezeTwoPercentage,materialTotal,"#0.0")));

        //沥青
        qualityTimelyDataFalse.setMaterialAsphalt(asphaltFalseWeight);
        //再生
        qualityTimelyDataFalse.setMaterialRegenerate(Double.parseDouble(calculationWeightByPercentage(ratioRegeneratePercentage,materialTotal,"#0.0")));
        //添加剂
        qualityTimelyDataFalse.setMaterialAdditive(Double.parseDouble(calculationWeightByPercentage(ratioAdditivePercentage,materialTotal,"#0.0")));
        qualityTimelyDataFalse.setMaterialAdditive1(Double.parseDouble(calculationWeightByPercentage(ratioAdditiveTwoPercentage,materialTotal,"#0.0")));
        qualityTimelyDataFalse.setMaterialAdditive2(Double.parseDouble(calculationWeightByPercentage(ratioAdditiveThreePercentage,materialTotal,"#0.0")));
        qualityTimelyDataFalse.setMaterialAdditive3(Double.parseDouble(calculationWeightByPercentage(ratioAdditiveFourPercentage,materialTotal,"#0.0")));

        //计算总量，写入数据库
        double myMaterialTotal = qualityTimelyDataFalse.getMaterialAggregate1()
                                    + qualityTimelyDataFalse.getMaterialAdditive()
                                    + qualityTimelyDataFalse.getMaterialAdditive1()
                                    + qualityTimelyDataFalse.getMaterialAdditive2()
                                    + qualityTimelyDataFalse.getMaterialAdditive3()
                                    + qualityTimelyDataFalse.getMaterialAsphalt()
                                    + qualityTimelyDataFalse.getMaterialRegenerate()
                                    + qualityTimelyDataFalse.getMaterialStone1()
                                    + qualityTimelyDataFalse.getMaterialStone2()
                                    + qualityTimelyDataFalse.getMaterialStone3()
                                    + qualityTimelyDataFalse.getMaterialStone4();
        qualityTimelyDataFalse.setMaterialTotal(myMaterialTotal);

        //温度
        qualityTimelyDataFalse.setTemperatureWarehouse1(Integer.parseInt(messageArray[27]));
        qualityTimelyDataFalse.setTemperatureMixture(temperatureMixture);
        qualityTimelyDataFalse.setTemperatureDuster(Integer.parseInt(messageArray[29]));
        qualityTimelyDataFalse.setTemperatureAsphalt(temperatureAsphalt);
        qualityTimelyDataFalse.setTemperatureAggregate(temperatureAggregate);
        qualityTimelyDataFalse.setCrewNum(Integer.parseInt(crewNum));
        //插入quality_timely_data_false 表 ，返回主键ID。用于插入quality_warning_promessage_crew表
        qualityTimelyDataFalseMapper.insertSelective(qualityTimelyDataFalse);
        int id = qualityTimelyDataFalse.getId();

        //多线程执行生产Excel同时写入指定Ip电脑
        //删除配比为0的元素 、为所有的预警数据对象添加id
        Iterator<QualityWaringDataFalse> it = myWaringDataList.iterator();
        while(it.hasNext()){
            QualityWaringDataFalse x = it.next();
            if(0 == x.getMoudleRatio()){
                it.remove();
            }else {
                x.setWarningLevel(0);
                x.setRealtimeDataShamId(id);
            }
        }

        qualityTimelyDataFalseMapper.insertWarningPromessage(myWaringDataList);


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
            BigDecimal result = randomModelPercentage.divide(percentage, BigDecimal.ROUND_HALF_UP,3).multiply(total);
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

    /**
     * 多个BigDecimal数相加和
     *
     * @param i
     * @param arg
     * @return
     */
    public static BigDecimal getBigDecimalSum(BigDecimal i, BigDecimal... arg) {
        BigDecimal sum = i;
        for (BigDecimal b : arg) {
            sum = sum.add(b);
        }
        return sum;
    }
}
