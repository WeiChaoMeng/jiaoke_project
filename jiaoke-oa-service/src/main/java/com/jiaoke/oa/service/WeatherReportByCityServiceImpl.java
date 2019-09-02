package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.AirQuality;
import com.jiaoke.oa.dao.WeatherReportByCityMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 环保监控
 *
 * @author lihui
 * @version 1.0
 * @date 2019-8-21 16:14
 */
@Service
public class WeatherReportByCityServiceImpl implements WeatherReportByCityService{

    @Resource
    private WeatherReportByCityMapper weatherReportByCityMapper;

    @Override
    public int addAirQuality(AirQuality airQuality) {
        return weatherReportByCityMapper.insert(airQuality);
    }

    @Override
    public List<AirQuality> selectLastWeekData() {
        List<AirQuality> airQualityList = weatherReportByCityMapper.selectLastWeekData();
        for (AirQuality airQuality : airQualityList) {
            airQuality.setUpdateDateStr(DateUtil.dateConvertMMDD2(airQuality.getUpdateDate()));
        }
        return airQualityList;
    }
}
