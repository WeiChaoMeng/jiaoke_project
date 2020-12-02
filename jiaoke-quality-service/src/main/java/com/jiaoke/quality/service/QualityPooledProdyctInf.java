/**
 * FileName: QualityPooledProdyctInf
 * Author:   Melone
 * Date:     2020/10/23 10:15
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/10/23 10:15
 * @Description:
 */
public interface QualityPooledProdyctInf {

    /**
     *
     * 功能描述: <br>
     *  <查询指定时间段内产品总量>
     * @param
     * @return
     * @auther Melone
     * @date 2020/10/23 10:24
     */
    List<Map<String,String>> getProdycyTotalByDate(String startDate, String lastDate);

    /**
     *
     * 功能描述: <br>
     *  <<查询日期范围内每日产量信息>>
     * @param
     * @return
     * @auther Melone
     * @date 2020/10/26 8:44
     */
    List<Map<String, String>> getEverDayProdacuByDate(String startDate, String lastDate);

    /**
     *
     * 功能描述: <br>
     *  <查询日期范围内各产品类型产量>
     * @param
     * @return
     * @auther Melone
     * @date 2020/10/26 14:39
     */
    List<Map<String, String>> getAllProductTypeTotal(String startDate, String lastDate);

    /**
     *
     * 功能描述: <br>
     *  <查询两个机组每种产品时间范围内产量>
     * @param
     * @return
     * @auther Melone
     * @date 2020/10/26 16:50
     */
    List<Map<String, String>> getTwoCrewProduct(String startDate, String lastDate);

    /**
     *
     * 功能描述: <br>
     *  <查询两个机组生产总量以及再生使用情况>
     * @param
     * @return
     * @auther Melone
     * @date 2020/11/1 10:41
     */
    List<Map<String, String>> getProductTotalAndReagenerateTotal(String startDate, String lastDate);

    /**
     *
     * 功能描述: <br>
     *  <两台机组满100吨可添加未添加情况>
     * @param
     * @return 
     * @auther Melone
     * @date 2020/11/1 12:47
     */
    List<Map<String, String>> getTwoCrewMoreThan100Regenerate(String startDate, String lastDate);
    /**
     *
     * 功能描述: <br>
     *  <两台机组满100吨可添加未添加所有产品>
     * @param
     * @return
     * @auther Melone
     * @date 2020/11/1 17:06
     */
    List<Map<String, String>> getwoCrewMoreThan100Product(String startDate, String lastDate);

    /**
     *
     * 功能描述: <br>
     *  <两台机组满100吨可添加未添加情况两个机组分别产品>
     * @param
     * @return
     * @auther Melone
     * @date 2020/11/1 18:06
     */
    List<Map<String, String>> getTwoCrewMoreThan100RegenerateProduct(String startDate, String lastDate);

    /**
     *
     * 功能描述: <br>
     *  <查询所有小组生产总量>
     * @param
     * @return
     * @auther Melone
     * @date 2020/11/2 13:56
     */
    List<Map<String, String>> getAllSquadTotal(String startDate, String lastDate);

    /**
     *
     * 功能描述: <br>
     *  <查询两个小组可添加类型生产总量>
     * @param
     * @return
     * @auther Melone
     * @date 2020/11/2 20:01
     */
    List<Map<String, String>> getAllSquadRegenerate(String startDate, String lastDate);

    /**
     *
     * 功能描述: <br>
     *  <查询各小组总产量与使用再生总量>
     * @param
     * @return
     * @auther Melone
     * @date 2020/11/3 9:24
     */
    List<Map<String, String>> geAllSquadProduct(String startDate, String lastDate);

    /**
     *
     * 功能描述: <br>
     *  <查询每个小组各产品类型产量>
     * @param
     * @return
     * @auther Melone
     * @date 2020/11/3 10:10
     */
    List<Map<String, String>> getAllSquadProductMakeUp(String startDate, String lastDate);

    /**
     *
     * 功能描述: <br>
     *  <查询出厂总量、生产总量、再生用量>
     * @param
     * @return
     * @auther Melone
     * @date 2020/11/4 9:04
     */
    List<Map<String, String>> getProjectTotal(String startDate, String lastDate);

    /**
     *
     * 功能描述: <br>
     *  <查询日期范围内工程总量>
     * @param
     * @return
     * @auther Melone
     * @date 2020/11/4 9:45
     */
    List<Map<String, String>> getProjectTotalByDate(String startDate, String lastDate);


    /**
     *
     * 功能描述: <br>
     *  <查询除去不可添加后产品总量>
     * @param
     * @return
     * @auther Melone
     * @date 2020/11/11 9:41
     */
    List<Map<String, String>> getRegenerateTypeTotal(String startDate, String lastDate);

    /**
     *
     * 功能描述: <br>
     *  <查询两个机组每日连续生产100吨以上可添加未添加产品>
     * @param
     * @return
     * @auther Melone
     * @date 2020/11/11 21:31
     */
    Map<String,Map<String,List<Map<String,Double>>>> getTwoCrewContinuousThanProduct(String startDate, String lastDate) throws ParseException;

    /**
     *
     * 功能描述: <br>
     *  <查询每个时间段对应出厂数据盘数>
     * @param
     * @return
     * @auther Melone
     * @date 2020/11/24 9:46
     */
    List<Map<String, String>> getPlateNumberByDate(String startDate, String lastDate) throws ParseException;
}
