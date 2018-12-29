package com.jiaoke.quality.service;

import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.bean.QualityDataManagerDay;

public interface QualityHistoricalDataService {

    PageBean<QualityDataManagerDay> selectHistoryDataToDay(int currentPageNum, String url);
}
