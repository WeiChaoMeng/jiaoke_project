package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.AirQuality;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 环保监控
 *
 * @author lihui
 * @version 1.0
 * @date 2019-8-21 16:14
 */
@Repository
public interface WeatherReportByCityMapper extends Mapper<AirQuality> {


    /**
     * 查询过去一周数据
     *
     * @return list
     */
    List<AirQuality> selectLastWeekData();
}
