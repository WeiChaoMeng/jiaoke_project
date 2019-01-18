package com.jiaoke.quality.service;

import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.bean.QualityDataManagerDay;

import java.util.List;
import java.util.Map;

public interface QualityHistoricalDataService {

    PageBean<QualityDataManagerDay> selectHistoryDataToDay(int currentPageNum, String url);

    List<Map<String, String>> selectHistoryByDateAndcrewNum(String producedDate,String crewNum);
}
