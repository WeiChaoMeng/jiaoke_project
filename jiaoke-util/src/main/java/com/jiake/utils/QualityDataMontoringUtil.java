/**
 * FileName: QualityDataMontoringUtil
 * author:   Melone
 * Date:     2018/10/12 19:42
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiake.utils;

import org.apache.logging.log4j.util.Strings;

import java.text.DecimalFormat;

/**
 *  <一句话功能描述>
 *  计算百分比
 * @author: Melone
 * @create: 2018/10/12 19:42
 * @Description:
 */
public class QualityDataMontoringUtil {

    /**
     *
     * 功能描述: <br>
     *  <计算百分比>
     * @param [total, molecule]
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/12 20:36
     */
    public static String calculateRatio(String total , String  molecule){


        if (Strings.isBlank(total) || Double.parseDouble(total) == 0 || Double.parseDouble(molecule) == 0 || Strings.isBlank(molecule))  return "0";

        double reValue = Double.parseDouble(total)/Double.parseDouble(molecule);

        DecimalFormat df = new DecimalFormat("#.0");

        String f =  df.format(reValue);

        return f;

    }




}
