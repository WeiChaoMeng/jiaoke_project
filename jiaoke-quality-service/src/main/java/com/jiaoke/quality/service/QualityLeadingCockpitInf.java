/**
 * FileName: QualityLeadingCockpitInf
 * Author:   Melone
 * Date:     2020/4/27 18:56
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/4/27 18:56
 * @Description:
 */
public interface QualityLeadingCockpitInf {

    /**
     *
     * 功能描述: <br>
     *  <查询当月两个机组的生产情况>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/27 19:36
     */
    Map<String,Object> getThisMonthTwoCrewData();

    /**
     *
     * 功能描述: <br>
     *  <查询本年两个机组生产情况>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/27 22:11
     */
    Map<String, Object> getThisYearTwoCrewData();

    /**
     *
     * 功能描述: <br>
     *  <查询本年开工时间>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/28 10:58
     */
    Map<String, Object> getProductionDays();

    /**
     *
     * 功能描述: <br>
     *  <查询再生料使用总量>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/28 12:41
     */
    Map<String, Object> getMaterialRegenerate();

    /**
     *
     * 功能描述: <br>
     *  <查询本月再生料使用总量>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/28 12:41
     */
    Map<String, Object> getThisMonthRegenerate();
}
