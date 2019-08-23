package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.AirQuality;

import java.util.List;

/**
 * 环保监控
 *
 * @author lihui
 * @version 1.0
 * @date 2019-8-21 16:14
 */
public interface WeatherReportByCityService {

    /**
     * 增加空气质量
     *
     * @param airQuality a
     * @return i
     */
    int addAirQuality(AirQuality airQuality);

    /**
     * 查询过去一周数据
     *
     * @return list
     */
    List<AirQuality> selectLastWeekData();
}
