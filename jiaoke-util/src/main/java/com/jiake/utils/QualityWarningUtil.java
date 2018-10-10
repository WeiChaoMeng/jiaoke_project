/**
 * FileName: QualityWarningUtil
 * author:   Melone
 * Date:     2018/10/8 11:02
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiake.utils;

import com.alibaba.druid.util.StringUtils;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.bean.QualityWarningData;
import org.apache.logging.log4j.core.util.ArrayUtils;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 *  <一句话功能描述>
 *  公共工具类
 * @author: Melone
 * @create: 2018/10/8 11:02
 * @Description:
 */
public class QualityWarningUtil {


    /**
     *
     * 功能描述: <br>
     *  < 分解后台发送来的数据字符串，返回map，>
     * @param: [messageData]
     * @return: String[]
     * @auther:Melone
     * @date: 2018/10/8 11:05
     */
    public static String[] splitDataToMap( String messageData ){

        if(StringUtils.isEmpty(messageData)) return null;

        String[] dataArray = messageData.split(",");


        //获取生产时间
        String[] temDate = dataArray[0].split("/");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");

        Date date = new Date();

        String messageDate = sdf.format(date) + "-" + temDate[0] + "-" + temDate[1];

        Arrays.fill(dataArray,0,1,messageDate);

        return dataArray;

    }


    /**
     *
     * 功能描述: <br>
     *  <计算百分比>
     * @param: [total, individual]
     * @return: java.lang.String
     * @auther:
     * @date: 2018/10/8 19:18
     */

    public  static String calculateRatio(double total , double individual){


        if (total == 0 || individual == 0) return "0";

        DecimalFormat df=new DecimalFormat("##");

        String result = df.format((float)total/(float)individual);

        return result;

    }

    /**
     *
     * 功能描述: <br>
     *  <填充并返回预警对象>
     * @param: [str, obj]
     * @return: java.util.Map<java.lang.String,java.lang.Object>
     * @auther:
     * @date: 2018/10/8 19:25
     */
    public static QualityWarningData pushMapByParam(Object...obj){

        if (null == obj) return null;

        QualityWarningData qualityWarningData = new QualityWarningData();

        qualityWarningData.setCrewId(obj[0].toString());
        qualityWarningData.setMaterialName(obj[1].toString());
        qualityWarningData.setActualRatio(obj[2].toString());
        qualityWarningData.setMoudleRatio(obj[3].toString());
        qualityWarningData.setDeviationRatio(obj[4].toString());
        qualityWarningData.setWarningLevel(obj[5].toString());

        return qualityWarningData;
    }

    /**
     *
     * 功能描述: <br>
     *  <传入温度进行对比后返回map>
     * @param: [temperatureMoudel, temperatureReal, id, name, strings]
     * @return: java.util.Map<java.lang.String,java.lang.Object>
     * @auther:
     * @date: 2018/10/8 20:04
     */
    public static  QualityWarningData temperatureWarningLevel(int temperatureMoudel ,int temperatureReal,int id, String name){

        QualityWarningData qualityWarningData = new QualityWarningData();
        //温度对比
        int diffTemperature = temperatureMoudel - temperatureReal;

        if (diffTemperature < -30 || diffTemperature > 30) {
            qualityWarningData = QualityWarningUtil.pushMapByParam(id, name, temperatureReal, temperatureMoudel, diffTemperature, "三级预警");
        }else if (diffTemperature > 20 || diffTemperature < -20){
            qualityWarningData = QualityWarningUtil.pushMapByParam( id, name, temperatureReal, temperatureMoudel, diffTemperature, "二级预警");
        }else {
            qualityWarningData = QualityWarningUtil.pushMapByParam( id, name, temperatureReal, temperatureMoudel, diffTemperature, "一级预警");
        }

        return qualityWarningData;
    }

    /**
     *
     * 功能描述: <br>
     *  <返回材料预警级别对象>
     * @param: [materialRationMoudel, materialRationReal, id, name]
     * @return: com.jiaoke.quality.bean.QualityWarningData
     * @auther:
     * @date: 2018/10/9 11:21
     */

    public static QualityWarningData materialWarningLevel(float materialRationMoudel,int materialRationReal,int id, String name){

        if (0 == materialRationReal) return null;

        QualityWarningData qualityWarningData = new QualityWarningData();

        float diffMaterialRation = materialRationMoudel - materialRationReal;

        if (diffMaterialRation < -15 || diffMaterialRation > 15) {
            qualityWarningData = QualityWarningUtil.pushMapByParam(id, name, materialRationReal, materialRationMoudel, diffMaterialRation, "三级预警");
        }else if (diffMaterialRation > 10 || diffMaterialRation < -10){
            qualityWarningData = QualityWarningUtil.pushMapByParam( id, name, materialRationReal, materialRationMoudel, diffMaterialRation, "二级预警");
        }else {
            qualityWarningData = QualityWarningUtil.pushMapByParam( id, name, materialRationReal, materialRationMoudel, diffMaterialRation, "一级预警");
        }

        return qualityWarningData;

    }
    /**
     *
     * 功能描述: <br>
     *  <根据材料，返回预警对象集合>
     * @param: [temArray, ratioTemplate]
     * @return: java.util.List<com.jiaoke.quality.bean.QualityWarningData>
     * @auther:
     * @date: 2018/10/9 11:14
     */
    public  static List<QualityWarningData> materialWarningObj( int id, String[] temArray, QualityRatioTemplate ratioTemplate){

        if ( 0 == temArray.length || null == ratioTemplate ) return null;

        List<QualityWarningData> list = new ArrayList<QualityWarningData>();

        float total = Float.parseFloat(temArray[temArray.length - 1]);

        String[] temarry1 = ArrayUtils.remove(temArray, temArray.length - 1);

        String[] array = Float.parseFloat(temarry1[6]) > Float.parseFloat(temarry1[7])?  ArrayUtils.remove(temarry1, 7):ArrayUtils.remove(temarry1,6);

        String[] materialName = {"骨料6","骨料5","骨料4","骨料3","骨料2","骨料1","矿粉","沥青","再生料","添加剂"};

        float[] ratioMoudel ={ratioTemplate.getRepertorySix(),
                                 ratioTemplate.getRepertoryFive(),
                                ratioTemplate.getRepertoryFour(),
                                ratioTemplate.getRepertoryThree(),
                                ratioTemplate.getRepertoryTwo(),
                                ratioTemplate.getRepertoryOne(),
                                ratioTemplate.getBreeze(),
                                ratioTemplate.getRatioStone(),
                                ratioTemplate.getRatioRegenerate1() + ratioTemplate.getRatioRegenerate2(),
                                ratioTemplate.getAdditive()};



        for (int i = 0;i < array.length - 1 ; i++){

            if (0 == Float.parseFloat(array[i])) continue;

            String realRatio = QualityWarningUtil.calculateRatio(total, Float.parseFloat(array[i]));

            list.add(QualityWarningUtil.materialWarningLevel(ratioMoudel[i], Integer.parseInt(realRatio), id, materialName[i]));
        }

        return list;
    }

}
