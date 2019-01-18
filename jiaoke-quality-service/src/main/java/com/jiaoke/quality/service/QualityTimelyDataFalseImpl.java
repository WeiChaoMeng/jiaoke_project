package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.quality.dao.QualityTimelyDataFalseMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author lihui
 * @version 1.0
 * @date 2018/12/26 5:42
 */
@Service
public class QualityTimelyDataFalseImpl implements QualityTimelyDataFalseService{

    @Resource
    private QualityTimelyDataFalseMapper qualityTimelyDataFalseMapper;

    @Override
    public List<Map<String,String>> getTimeSurveillanceFalseData() {
        return qualityTimelyDataFalseMapper.getTimeSurveillanceFalseData();
    }

    @Override
    public String selectFalseDataToChars() {

        List<Map<String,String>> list = qualityTimelyDataFalseMapper.selectFalseDataToChars();


        if (null == list) {return null;}

        String jsonStr = JSONArray.parseArray(JSONObject.toJSONString(list)).toString();

        return jsonStr;

    }

    @Override
    public String selectFalseDataEcharsTemp() {

        List<Map<String, String>> list = qualityTimelyDataFalseMapper.selectFalseDataEcharsTemp();

        if (null == list) {return null;}

        String jsonStr = JSONArray.parseArray(JSONObject.toJSONString(list)).toString();

        return jsonStr;
    }
}
