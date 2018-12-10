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

        DecimalFormat df=new DecimalFormat("##.#");

        String result = df.format((float)individual/(float)total*100);

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

        if (obj[1].toString().equals("沥青温度") || obj[1].toString().equals("混合料温度") || obj[1].toString().equals("骨料温度")){
            qualityWarningData.setCrewId(obj[0].toString());
            qualityWarningData.setMaterialName(obj[1].toString());
            qualityWarningData.setActualRatio(obj[2].toString());
            qualityWarningData.setMoudleRatio(obj[3].toString() + "-" + obj[4].toString());
            qualityWarningData.setDeviationRatio(obj[5].toString());
            qualityWarningData.setWarningLevel(obj[6].toString());
        }else {
            qualityWarningData.setCrewId(obj[0].toString());
            qualityWarningData.setMaterialName(obj[1].toString());
            qualityWarningData.setActualRatio(obj[2].toString());
            qualityWarningData.setMoudleRatio(obj[3].toString() );
            qualityWarningData.setDeviationRatio(obj[4].toString());
            qualityWarningData.setWarningLevel(obj[5].toString());
        }


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
    public static  QualityWarningData temperatureWarningLevel(int temperatureMoudel , int temperatureMoudelUp ,int temperatureReal,int id, String name){

        QualityWarningData qualityWarningData = new QualityWarningData();
        //温度对比
        int diffTemperature =   temperatureReal - temperatureMoudel;

        if (temperatureReal > temperatureMoudelUp + 30  || temperatureReal < temperatureMoudel - 30){
            qualityWarningData = QualityWarningUtil.pushMapByParam(id, name, temperatureReal, temperatureMoudel,temperatureMoudelUp, diffTemperature, "3");
        }else

        if (temperatureReal > temperatureMoudelUp + 15  || temperatureReal < temperatureMoudel - 15){
            qualityWarningData = QualityWarningUtil.pushMapByParam(id, name, temperatureReal, temperatureMoudel,temperatureMoudelUp, diffTemperature, "2");
        }else

        if (temperatureReal > temperatureMoudelUp  || temperatureReal < temperatureMoudel){
            qualityWarningData = QualityWarningUtil.pushMapByParam(id, name, temperatureReal, temperatureMoudel,temperatureMoudelUp, diffTemperature, "1");

        }else if (temperatureReal < temperatureMoudelUp && temperatureReal > temperatureMoudel){
            qualityWarningData = QualityWarningUtil.pushMapByParam(id, name, temperatureReal, temperatureMoudel,temperatureMoudelUp, diffTemperature, "0");
        }

        return qualityWarningData;
    }

    /**
     *
     * 功能描述: <br>
     *  <根据各材料返回返回材料预警级别对象>
     * @param: [materialRationMoudel, materialRationReal, id, name]
     * @return: com.jiaoke.quality.bean.QualityWarningData
     * @auther:
     * @date: 2018/10/9 11:21
     */

    public static QualityWarningData  materialWarningLevel(float materialRationMoudel,float materialRationReal,int id, String name){

        if (0 == materialRationReal) return null;

        QualityWarningData qualityWarningData = new QualityWarningData();



        switch (name){
            case "骨料6":
                qualityWarningData = compareDifference(5,7,9,materialRationReal,materialRationMoudel,id,name);
                break;
            case "骨料5":
                qualityWarningData = compareDifference(5,7,9,materialRationReal,materialRationMoudel,id,name);
                break;
            case "骨料4":
                qualityWarningData = compareDifference(5,7,9,materialRationReal,materialRationMoudel,id,name);
                break;
            case "骨料3":
                qualityWarningData = compareDifference(5,7,9,materialRationReal,materialRationMoudel,id,name);
                break;
            case "骨料2":
                qualityWarningData = compareDifference(4,5,6,materialRationReal,materialRationMoudel,id,name);
                break;
            case "骨料1":
                qualityWarningData = compareDifference(4,5,6,materialRationReal,materialRationMoudel,id,name);
                break;
            case "矿粉":
                qualityWarningData = compareDifference(2,4,6,materialRationReal,materialRationMoudel,id,name);
                break;
            case "沥青":
                qualityWarningData = compareDifference(2,4,6,materialRationReal,materialRationMoudel,id,name);
                break;
            case "再生料":
                qualityWarningData = compareDifference(2,4,6,materialRationReal,materialRationMoudel,id,name);
                break;
            case "岩沥青":
                qualityWarningData = compareDifference(2,4,6,materialRationReal,materialRationMoudel,id,name);
                break;

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

        if ( 0 == temArray.length || null == ratioTemplate ) {return null;}

        List<QualityWarningData> list = new ArrayList<QualityWarningData>();

        //从模板中获取总数
        float total = Float.parseFloat(temArray[temArray.length - 1]);
        //在数组中删除最后一位
        String[] temarry1 = ArrayUtils.remove(temArray, temArray.length - 1);

        String[] array = Float.parseFloat(temarry1[6]) > Float.parseFloat(temarry1[7])?  ArrayUtils.remove(temarry1, 7):ArrayUtils.remove(temarry1,6);

        String[] materialName = {"骨料6","骨料5","骨料4","骨料3","骨料2","骨料1","矿粉","沥青","再生料","岩沥青"};

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



        for (int i = 0;i < array.length; i++){

            if (0 == Float.parseFloat(array[i])) continue;
            if ( i != 0 && i < 6){
                //处理骨料递增百分比
                float materialsValue = Float.parseFloat(array[i]) - Float.parseFloat(array[i-1] );

                String realRatio = QualityWarningUtil.calculateRatio(total, materialsValue);

                list.add(QualityWarningUtil.materialWarningLevel(ratioMoudel[i], Float.parseFloat(realRatio), id, materialName[i]));

            }else {
                //处理正常材料百分比
                String realRatio = QualityWarningUtil.calculateRatio(total, Float.parseFloat(array[i]));

                list.add(QualityWarningUtil.materialWarningLevel(ratioMoudel[i], Float.parseFloat(realRatio), id, materialName[i]));
            }

        }

        return list;
    }



    public static QualityWarningData compareDifference(float leve1 , float leve2 , float leve3,float materialRationReal,float materialRationMoudel,int id, String name){

        float diffMaterialRation =   materialRationReal - materialRationMoudel;
        DecimalFormat decimalFormat=new DecimalFormat("##.##");
        String diffStr = decimalFormat.format(diffMaterialRation);

        QualityWarningData qualityWarningData = new QualityWarningData();

        if (diffMaterialRation < -(leve3) || diffMaterialRation > leve3) {
            qualityWarningData = QualityWarningUtil.pushMapByParam(id, name, materialRationReal, materialRationMoudel, diffStr, "3");
        }else if (diffMaterialRation < -(leve2) || diffMaterialRation > leve2){
            qualityWarningData = QualityWarningUtil.pushMapByParam( id, name, materialRationReal, materialRationMoudel, diffStr, "2");
        }else if (diffMaterialRation < -( leve1) || diffMaterialRation > leve1){
            qualityWarningData = QualityWarningUtil.pushMapByParam( id, name, materialRationReal, materialRationMoudel, diffStr, "1");
        }else {
            qualityWarningData = QualityWarningUtil.pushMapByParam( id, name, materialRationReal, materialRationMoudel, diffStr, "0");
        }

        return qualityWarningData;
    }

}
