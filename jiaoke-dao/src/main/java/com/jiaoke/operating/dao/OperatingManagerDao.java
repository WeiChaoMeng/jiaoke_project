/**
 * FileName: OperatingManagerDao
 * Author:   Melone
 * Date:     2019/8/8 10:51
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.operating.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/8/8 10:51
 * @Description:
 */
public interface OperatingManagerDao {

    /**
     *
     * 功能描述: <br>
     *  <查询本星期到目前位置1、2机组生产总量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/8 11:01
     */
    List<Map<String, Object>> selectThisWeekData();

    /**
     *
     * 功能描述: <br>
     *  <查询本月到目前为止1、2机组生产产量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/8 13:28
     */
    List<Map<String, Object>> selectThisMonthData();

    /**
     *
     * 功能描述: <br>
     *  <查询本年到目前为止产量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/8 13:44
     */
    List<Map<String, Object>> selectThisYearData();

    /**
     *
     * 功能描述: <br>
     *  <查询从生产到现在所有产量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/8 14:07
     */
    List<Map<String, Object>> selectAllData();

    /**
     *
     * 功能描述: <br>
     *  <获取机组1第一次生产时间>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/8 14:13
     */
    Map<String, String> selectFirstProductDate();


    /**
     *
     * 功能描述: <br>
     *  <查询上个月每日生产量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/8 18:24
     */
    List<Map<String, String>> selectLastMonthData();

    /**
     *
     * 功能描述: <br>
     *  <查询上个月总生产吨数与盘数>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/9 11:57
     */
    Map<String, Object> selectMonthContrast();

    /**
     *
     * 功能描述: <br>
     *  <查询上上个月生产吨数与盘数>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/9 11:58
     */
    Map<String, Object> selectmonthBeforeLatContrast();

    /**
     *
     * 功能描述: <br>
     *  <查询各月生产量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/9 17:15
     */
    List<Map<String, Object>> selectAllMonthPercent();

    /**
     *
     * 功能描述: <br>
     *  <查询各月生产天数>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/9 17:57
     */
    List<Map<String, Object>> selectEveryMonthDays();

    /**
     *
     * 功能描述: <br>
     *  <插入年生产任务值>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/9 20:36
     */
    int insetFromData(@Param("dates") String dates,@Param("total")  String total);

    /**
     *
     * 功能描述: <br>
     *  <根据日期查询是否已存在>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/9 21:10
     */
    Map<String, String> selectDataByDate(@Param("dates") String dates);

    /**
     *
     * 功能描述: <br>
     *  <查询本年一二机组生产总量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/9 21:59
     */
    Map<String, Object> selectThisYearTwoCrewData();

    /**
     *
     * 功能描述: <br>
     *  <查询计划产量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/9 22:05
     */
    Map<String, Object> selectThisYearPlan();
}
