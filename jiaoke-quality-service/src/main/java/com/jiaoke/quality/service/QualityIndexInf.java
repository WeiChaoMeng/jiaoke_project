/**
 * FileName: QualityIndexInf
 * Author:   Melone
 * Date:     2018/10/9 17:47
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
 * @create: 2018/10/9 17:47
 * @Description:
 */
public interface QualityIndexInf {

    /**
     * 返回上个星期每周各机组产量
     * @return
     */
    String getLastWeekCrewData();

    /**
     * 返回最近生产的八条数据展示在首页
     * @return
     */
    List<Map<String,String>> getLastProductData();
    /**
     * 返回本年每月中每日数据
     * @return
     */
    String getLastYearEverMonthTotalToEchart();
    /**
     * 返回两个机组各五条最新预警数据
     * @return
     */
    String getLastTenWarning();
    /**
     * 返回两个机组七日内温度数据
     * @return
     */
    String getLastSevenDayTemperaturesDataToChart();
    /**
     * 根据条件返回温度数据
     * @return
     */
    String getTemperaturesDataByConditions(String crew, String ratioNum);
}
