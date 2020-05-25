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
import java.util.List;
import java.util.Map;

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

        double reValue = Double.parseDouble(molecule)/Double.parseDouble(total)*100;

        DecimalFormat df = new DecimalFormat("0.0");

        String f =  df.format(reValue);

        return f;

    }

    /**
     *
     * 功能描述: <br>
     *  <计算平均值，返回每日平均占比>
     * @param [count, Total, molecule]
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/27 12:12
     */
    public static String calculateSVG( String count ,String total , String molecule ){

        if (Strings.isBlank(count) || Strings.isBlank(total) ||Strings.isBlank(molecule) ) return "0";

        double svgTotal = Double.parseDouble(total) / Double.parseDouble(count);
        double svgMolecule = Double.parseDouble(molecule) / Double.parseDouble(count);

        DecimalFormat dFormat = new DecimalFormat("#.#");

        String totalStr = dFormat.format(svgTotal);

        String moleculeStr = dFormat.format(svgMolecule);

        String calculateSVG = calculateRatio(String.valueOf(totalStr),String.valueOf(moleculeStr));

        return calculateSVG;

    }

    /**
     *
     * 功能描述: <br>
     *  <计算平均值，返回每日平均占比>
     * @param [count, Total, molecule]
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/27 12:12
     */
    public static String calculateSVG( String count , String molecule ){

        if (Strings.isBlank(count) || Strings.isBlank(molecule) ) return "0";


        double svgMolecule = Double.parseDouble(molecule) / Double.parseDouble(count);

        DecimalFormat dFormat = new DecimalFormat("#.#");

        String svg = dFormat.format(svgMolecule);

        return svg;

    }

    /**
     *
     * 功能描述: <br>
     *  <判断key是否在数组内>
     * @param [Key, strings]
     * @return boolean
     * @auther Melone
     * @date 2018/10/27 13:04
     */
    public static boolean judgeKeyInArray(String key,String[] strings){

        if (Strings.isBlank(key) || 0 == strings.length  ) return false;

        boolean bo = false;

        for (int i = 0; i < strings.length; i++) {

            if (strings[i].equals(key)) {
                bo = true;
                break;
            }
        }

        return bo;

    }


}
