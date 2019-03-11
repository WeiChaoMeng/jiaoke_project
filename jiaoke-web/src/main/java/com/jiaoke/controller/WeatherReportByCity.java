package com.jiaoke.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

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
        String weatherUrl = "http://v.juhe.cn/weather/index?cityname=北京&key=0c6ea6e224f4d60cca9337736baeff9d";
        map.put("weather", PureNetUtil.get(weatherUrl));

        //空气指数-根据城市名称查询,city传入拼音
        String airUrl = "http://web.juhe.cn:8080/environment/air/pm?city=beijing&key=42f75fc8c7cbfc699c91b340a7fd6734";
        map.put("air", PureNetUtil.get(airUrl));
        //通过工具类获取返回数据
        return map;
    }

}
