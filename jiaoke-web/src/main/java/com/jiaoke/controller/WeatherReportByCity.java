package com.jiaoke.controller;


import com.alibaba.fastjson.JSONArray;
import com.jiaoke.oa.bean.AirQuality;
import com.jiaoke.oa.service.WeatherReportByCityService;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.*;

/**
 * 环保监控
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/8 14:30
 */
@Controller
@RequestMapping(value = "/weatherReportByCity")
public class WeatherReportByCity {

    @Resource
    private WeatherReportByCityService weatherReportByCityService;

    /**
     * 根据城市名获取
     *
     * @return json
     */
    @RequestMapping(value = "/weatherReport")
    @ResponseBody
    public Map<String, Object> excute() {
        Map<String, Object> map = new HashMap<>();

        //天气预报-根据城市名称查询,cityName传入中文
        String weatherUrl = "http://v.juhe.cn/weather/index?cityname=北京&key=28b89a8a0686458a44c5c87017629486";
        map.put("weather", PureNetUtil.get(weatherUrl));

        //空气指数-根据城市名称查询,city传入拼音
        String airUrl = "http://web.juhe.cn:8080/environment/air/pm?city=beijing&key=42f75fc8c7cbfc699c91b340a7fd6734";
        map.put("air", PureNetUtil.get(airUrl));

        List<AirQuality> airQualityList = weatherReportByCityService.selectLastWeekData();
        Collections.reverse(airQualityList);
        map.put("airQualityList", airQualityList);
        //通过工具类获取返回数据
        return map;
    }

    /**
     * 定时任务
     */
    @Scheduled(cron = "0 0 8 * * ?")
    public void timingTask() {
        //空气指数-根据城市名称查询,city传入拼音
        String airUrl = "http://web.juhe.cn:8080/environment/air/pm?city=beijing&key=7d5601fe3fafa32a4e2cfab478b44c81";

        AirQuality airQuality = new AirQuality();
        List<Map> meterList = JSONArray.parseArray("[" + PureNetUtil.get(airUrl) + "]", Map.class);
        for (Map map : meterList) {
            List<Map> ss = JSONArray.parseArray(map.get("result").toString(), Map.class);
            for (Map s1 : ss) {
                airQuality.setFineParticle(s1.get("PM2.5").toString());
                airQuality.setPmio(s1.get("PM10").toString());
            }
        }

        airQuality.setUpdateDate(new Date());
        weatherReportByCityService.addAirQuality(airQuality);
    }
}
