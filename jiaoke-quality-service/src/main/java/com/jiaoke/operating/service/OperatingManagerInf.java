/**
 * FileName: OperatingManagerInf
 * Author:   Melone
 * Date:     2019/8/8 10:49
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.operating.service;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/8/8 10:49
 * @Description:
 */
public interface OperatingManagerInf {
    /**
     *
     * 功能描述: <br>
     *  <查询本星期到目前为止产量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/8 10:58
     */
   String getThisWeekData();

   /**
    *
    * 功能描述: <br>
    *  <查询本月开始到目前为止产量>
    * @param
    * @return
    * @auther Melone
    * @date 2019/8/8 13:26
    */
    String getThisMonthData();

    /**
     *
     * 功能描述: <br>
     *  <查询本年到目前为止产量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/8 13:43
     */
    String getThisYearData();

    /**
     *
     * 功能描述: <br>
     *  <获取到目前为止所有产量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/8 14:01
     */
    String getAllData();

    /**
     *
     * 功能描述: <br>
     *  <获取上个月两个机组每日生产量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/8 18:21
     */
    String getLastMonthData();

    /**
     *
     * 功能描述: <br>
     *  <获取个月对比占比>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/9 10:47
     */
    String getMonthContrast();

    /**
     *
     * 功能描述: <br>
     *  <查询各月生产产量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/9 17:09
     */
    String getAllMonthPercent();

    /**
     *
     * 功能描述: <br>
     *  <查询各月生产天数>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/9 17:56
     */
    String getEveryMonthDays();

    /**
     *
     * 功能描述: <br>
     *  <添加年计划生产量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/9 20:30
     */
    String sendFromData(String dates, String total);

    /**
     *
     * 功能描述: <br>
     *  <查询本年产量与计划产量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/9 21:56
     */
    String getThisYearDataAndPlan();
}
