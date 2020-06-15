/**
 * FileName: LeadCockpitServiceInf
 * author:   Melone
 * Date:     2020/5/10 16:12
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.leadCockpit.service;

import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/5/10 16:12
 * @Description:
 */
public interface LeadCockpitServiceInf {
    /**
     * 查询前十工程
     * @return
     */
    Map<String, Object> getTopTenProject();
    /**
     *
     * 功能描述: <br>
     *  <查询本月产量及前十产品类型>
     * @param
     * @return
     * @auther Melone
     * @date 2020/5/13 9:09
     */
    Map<String, Object> getThisMonthYield();

    /**
     *
     * 功能描述: <br>
     *  <获取三日内油石比>
     * @param
     * @return
     * @auther Melone
     * @date 2020/5/14 16:05
     */
    Map<String, Object> getAsphaltAggregateRatio();

    /**
     *
     * 功能描述: <br>
     *  <查询本日生产记录>
     * @param
     * @return
     * @auther Melone
     * @date 2020/5/18 19:46
     */
    Map<String, Object> getTodayProductList();

    /**
     *
     * 功能描述: <br>
     *  <查询本日两个机组生产的产品>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/9 17:35
     */
    Map<String, Object> getThisDayProduct();

    /**
     *
     * 功能描述: <br>
     *  <查询本日两个机组产量最多产品温度曲线>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/9 17:35
     */
    Map<String, Object> getThisDayMaxProductTemperature();

    /**
     *
     * 功能描述: <br>
     *  <查询本日各材料预警占比>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/10 15:05
     */
    Map<String, Object> getWarningProportion();

    /**
     *
     * 功能描述: <br>
     *  <查询本日产量最高的产品的平均级配曲线>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/10 16:18
     */
    Map<String, Object> getProductSvgGrading();

    /**
     *
     * 功能描述: <br>
     *  <查询基本信息>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/10 20:22
     */
    Map<String, Object> getProductBasicMsg();

    /**
     *
     * 功能描述: <br>
     *  <根据日期范围、配比号查询温度曲线>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/11 10:01
     */
    Map<String, Object> getMaxProductTemperatureByRationAndDate(String startDate, String endDate, String ration);

    /**
     *
     * 功能描述: <br>
     *  <根据日期范围、配比号查询预警占比>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/11 10:21
     */
    Map<String, Object> getWarningProportionByRationAndDate(String startDate, String endDate, String ration);

    /**
     *
     * 功能描述: <br>
     *  <根据日期范围、配比号查询平均级配>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/11 11:00
     */
    Map<String, Object> getProductSvgGradingByRationAndDate(String startDate, String endDate, String ration);

    /**
     *
     * 功能描述: <br>
     *  <根据日期范围、配比号查询基本信息>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/11 11:11
     */
    Map<String, Object> getProductBasicMsgByRationAndDate(String startDate, String endDate, String ration);

    /**
     *
     * 功能描述: <br>
     *  <根据日期范围查询日期范围内生产的产品类型>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/11 13:43
     */
    Map<String, Object> getProductToEchars(String startDate, String endDate);
}
