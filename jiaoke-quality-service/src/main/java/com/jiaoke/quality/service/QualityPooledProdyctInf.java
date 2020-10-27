/**
 * FileName: QualityPooledProdyctInf
 * Author:   Melone
 * Date:     2020/10/23 10:15
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

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
}
