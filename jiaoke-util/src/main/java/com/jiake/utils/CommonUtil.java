/**
 * FileName: CommonUtil
 * author:   Melone
 * Date:     2018/10/8 11:02
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiake.utils;

import com.alibaba.druid.util.StringUtils;
import com.jiaoke.quality.bean.QualityWarningData;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;

/**
 *  <一句话功能描述>
 *  公共工具类
 * @author: Melone
 * @create: 2018/10/8 11:02
 * @Description:
 */
public class CommonUtil {


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

        NumberFormat numberFormat = NumberFormat.getInstance();

        numberFormat.setMaximumFractionDigits(1);

        String result = numberFormat.format((float)total/(float)individual*100);

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

        if (str.length != obj.length) return null;

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
            qualityWarningData = CommonUtil.pushMapByParam(id, name, temperatureReal, temperatureMoudel, diffTemperature, "三级预警");
        }else if (diffTemperature > 20 || diffTemperature < -20){
            qualityWarningData = CommonUtil.pushMapByParam( id, name, temperatureReal, temperatureMoudel, diffTemperature, "二级预警");
        }else {
            qualityWarningData = CommonUtil.pushMapByParam( id, name, temperatureReal, temperatureMoudel, diffTemperature, "一级预警");
        }

        return qualityWarningData;
    }

    public  static QualityWarningData materialWarningLevel(double total,float material,float moudelRatio,int id,String name){
        if (total == 0 || material == 0 || null ==name ) return null;

        QualityWarningData qualityWarningData = new QualityWarningData();
        //获取实际配比
        String realRatio = CommonUtil.calculateRatio(total, material);


        return qualityWarningData;
    }

}
