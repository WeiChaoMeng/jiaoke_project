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
import com.jiake.utils.CommonUtil;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.bean.QualityWarningData;
import com.jiaoke.quality.dao.QualityWarningDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 *  <一句话功能描述>
 *  接受并处理生产本地发送过来的数据
 * @author: Melone
 * @create: 2018/10/8 10:40
 * @Description:
 */
@Service
public class ReceiveDataImpl implements ReceiveDataInf {

    @Autowired
    QualityWarningDao qualityWarningDao;


    /**
     *
     * 功能描述: <br>
     *  <后台获取数据的字符串后解析放入表quality_warning中>
     * @param: [messageData]
     * @return: void
     * @auther:
     * @date: 2018/10/8 10:47
     */
    public void receiveDataToDB(String messageData) {

        Map<String,String> map = new HashMap<String, String>();

        if(StringUtils.isEmpty(messageData)) return;

        //分解字符串同时替换日期
        String[] messageArray = CommonUtil.splitDataToMap(messageData);

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
        int id = qualityWarningDao.insertQualityWarningCrew(map);


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

        int aggregate6 = Integer.parseInt(messageArray[6]);
        int aggregate5 = Integer.parseInt(messageArray[7]);
        int aggregate4 = Integer.parseInt(messageArray[8]);
        int aggregate3 = Integer.parseInt(messageArray[9]);
        int aggregate2 = Integer.parseInt(messageArray[10]);
        int aggregate1 = Integer.parseInt(messageArray[11]);
        //石粉
        float stone1 = Float.parseFloat(messageArray[12]);
        float stone2 = Float.parseFloat(messageArray[13]);
        //沥青
        float asphalt = Float.parseFloat(messageArray[14]);
        //再生料
        int regenerate = Integer.parseInt(messageArray[15]);
        //添加剂
        int additive = Integer.parseInt(messageArray[16]);
        //总计
        float total = Float.parseFloat(messageArray[17]);
        //一仓温度
        int warehouse1 = Integer.parseInt(messageArray[18]);
        //混合料温度
        int mixture = Integer.parseInt(messageArray[19]);
        //除尘器温度
        int duster = Integer.parseInt(messageArray[20]);
        //沥青温度
        int temperatureAsphalt = Integer.parseInt(messageArray[21]);
        //骨料温度
        int aggregate = Integer.parseInt(messageArray[22]);


        //获取实际配比
        //骨料实际配比
        String aggregate1Ratio = CommonUtil.calculateRatio(total, aggregate1);
        String aggregate2Ratio = CommonUtil.calculateRatio(total, aggregate2);
        String aggregate3Ratio = CommonUtil.calculateRatio(total, aggregate3);
        String aggregate4Ratio = CommonUtil.calculateRatio(total, aggregate4);
        String aggregate5Ratio = CommonUtil.calculateRatio(total, aggregate5);
        String aggregate6Ratio = CommonUtil.calculateRatio(total, aggregate6);

        //石粉实际配比
        String stone1Ratio = CommonUtil.calculateRatio(total, stone1);
        String stone2Ratio = CommonUtil.calculateRatio(total, stone2);

        //沥青实际配比
        String asphaltRatio = CommonUtil.calculateRatio(total, asphalt);
        //再生料实际配比
        String regenerateRatio = CommonUtil.calculateRatio(total, regenerate);
        //添加剂实际配比
        String additiveRatio = CommonUtil.calculateRatio(total, additive);

        float[] f = new float[2];
        f[1] = ratioTemplate.getRepertoryOne();
        f[2] = aggregate1;
        //获取温度差值判断后插入
        QualityWarningData asphaltObj = CommonUtil.temperatureWarningLevel(ratioTemplate.getTemperatureAsphalt(), temperatureAsphalt, id, "沥青");
        QualityWarningData mixtureObj = CommonUtil.temperatureWarningLevel(ratioTemplate.getTemperatureMixture(), mixture, id, "混合料");
        QualityWarningData aggregateObj = CommonUtil.temperatureWarningLevel(ratioTemplate.getTemperatureAggregate(), aggregate, id, "骨料");

        //判断材料百分比差值后插入
        QualityWarningData aggregate1 = CommonUtil.materialWarningLevel(total, aggregate1, ratioTemplate.getRepertoryOne(), id, "骨料1");
    }
}
