/**
 * FileName: QualityIndexDao
 * author:   Melone
 * Date:     2018/10/9 17:53
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/9 17:53
 * @Description:
 */
public interface QualityIndexDao {

    /**
     * 返回上个星期各机组产量
     * @return
     */
    List<Map<String,String>> getLastWeekCrewData();

    /**
     * 返回最后生产的八条数据展示在首页
     * @return
     */
    List<Map<String,String>> getLastProductData();

    /**
     * 返回本年每月中每日数据
     * @return
     */
    List<Map<String, String>> selectLastYearEverMonthTotalToEchart();
    /**
     * 返回两个机组各五条最新预警数据
     * @return
     */
    List<Map<String, String>> selectLastTenWarning();
    /**
     * 返回两个机组七日内温度数据
     * @return
     */
    List<Map<String, String>> selectLastSevenDayTemperaturesDataToChart();
    /**
     * 根据条件返回温度数据
     * @return
     */
    List<Map<String, String>> selectTemperaturesDataByConditions(@Param("crew") String crew,@Param("ratioNum") String ratioNum);
}
