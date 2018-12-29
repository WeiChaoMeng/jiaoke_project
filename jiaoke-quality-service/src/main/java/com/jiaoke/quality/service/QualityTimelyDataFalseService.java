package com.jiaoke.quality.service;

import java.util.List;
import java.util.Map;

public interface QualityTimelyDataFalseService {

    List<Map<String,String>> getTimeSurveillanceFalseData();

    String selectFalseDataToChars();
}
