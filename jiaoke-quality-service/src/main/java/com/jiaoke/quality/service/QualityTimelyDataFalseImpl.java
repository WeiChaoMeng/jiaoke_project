package com.jiaoke.quality.service;

import com.jiaoke.quality.bean.QualityTimelyDataFalse;
import com.jiaoke.quality.dao.QualityTimelyDataFalseMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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
    public QualityTimelyDataFalse getTimeSurveillanceFalseData() {
        return qualityTimelyDataFalseMapper.getTimeSurveillanceFalseData();
    }
}
