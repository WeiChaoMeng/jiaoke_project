/**
 * FileName: QualityDataManagerImpl
 * author:   Melone
 * Date:     2018/10/15 11:47
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.bean.QualityDataManagerDay;
import com.jiaoke.quality.dao.QualityDataManagerDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/15 11:47
 * @Description:
 */
@Service
public class QualityDataManagerImpl implements QualityDataManagerInf {

    @Resource
    QualityDataManagerDao qualityDataManagerDao;

    @Override
    public PageBean<QualityDataManagerDay> selectHistoryDataToDay(int currentPageNum, String url) {

        if ( 0 == currentPageNum ) return null;

        int count = qualityDataManagerDao.selectHistoryDataToDayCount();

        PageBean<QualityDataManagerDay> pageBean = new PageBean<QualityDataManagerDay>();
        pageBean.setCurrentPageNum(currentPageNum);
        pageBean.setEachPageDataNum(15);
        pageBean.setDataCountNum(count);
        pageBean.setPageCount(pageBean.getEachPageDataNum(),pageBean.getDataCountNum());
        pageBean.setPageFirstNum(pageBean.getEachPageDataNum(),currentPageNum);
        pageBean.setPageData(qualityDataManagerDao.selectHistoryDataToDay(pageBean.getPageFirstNum(),pageBean.getEachPageDataNum()));
        pageBean.setUrl(url);

        return pageBean;

    }
}
