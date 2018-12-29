package com.jiaoke.quality.service;

import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.bean.QualityDataManagerDay;
import com.jiaoke.quality.dao.QualityTimelyDataFalseMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author lihui
 * @version 1.0
 * @date 2018/12/26 7:31
 */
@Service
public class QualityHistoricalDataServiceImpl implements QualityHistoricalDataService{

    @Resource
    private QualityTimelyDataFalseMapper qualityTimelyDataFalseMapper;

    @Override
    public PageBean<QualityDataManagerDay> selectHistoryDataToDay(int currentPageNum, String url) {

        int count = qualityTimelyDataFalseMapper.selectHistoryDataToDayCount();

        PageBean<QualityDataManagerDay> pageBean = new PageBean<QualityDataManagerDay>();
        pageBean.setCurrentPageNum(currentPageNum);
        pageBean.setEachPageDataNum(15);
        pageBean.setDataCountNum(count);
        pageBean.setPageCount(pageBean.getEachPageDataNum(),pageBean.getDataCountNum());
        pageBean.setPageFirstNum(pageBean.getEachPageDataNum(),currentPageNum);
        pageBean.setPageData(qualityTimelyDataFalseMapper.selectHistoryDataToDay(pageBean.getPageFirstNum(),pageBean.getEachPageDataNum()));
        pageBean.setUrl(url);

        return pageBean;
    }
}
