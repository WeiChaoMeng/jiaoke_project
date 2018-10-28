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
import com.jiaoke.quality.bean.QualityWarningData;
import com.jiaoke.quality.dao.QualityWarningDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
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

    @Resource
    private  QualityWarningDao qualityWarningDao;


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
        //截取材料实际数值
        String[] temArray;
        temArray = Arrays.copyOfRange(messageArray,6,18);

        //判断材料百分比差值后插入
        List<QualityWarningData>  warningDataList = QualityWarningUtil.materialWarningObj(id,temArray,ratioTemplate);

        //获取温度差值判断后插入
        warningDataList.add(QualityWarningUtil.temperatureWarningLevel(ratioTemplate.getTemperatureAsphalt(), temperatureAsphalt, id, "沥青温度"));
        warningDataList.add(QualityWarningUtil.temperatureWarningLevel(ratioTemplate.getTemperatureMixture(), mixture, id, "混合料温度"));
        warningDataList.add(QualityWarningUtil.temperatureWarningLevel(ratioTemplate.getTemperatureAggregate(), aggregate, id, "骨料温度"));

        //插入数据库
        qualityWarningDao.insertQualityWarningData(warningDataList);

    }
}
