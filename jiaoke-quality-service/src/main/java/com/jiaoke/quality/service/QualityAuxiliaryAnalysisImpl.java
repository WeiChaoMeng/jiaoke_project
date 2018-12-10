/**
 * FileName: QualityAuxiliaryAnalysisImpl
 * author:   Melone
 * Date:     2018/10/15 15:01
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.dao.QualityAuxiliaryAnalysisDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/15 15:01
 * @Description:
 */
@Service
public class QualityAuxiliaryAnalysisImpl implements QualityAuxiliaryAnalysisInf {

    @Resource
    private  QualityAuxiliaryAnalysisDao qualityAuxiliaryAnalysisDao;

    @Override
    public PageBean<Map<String,String>> selelectWarningLiveData(int currentPageNum, String url, String warningLive) {

        if ( 0 == currentPageNum || null == String.valueOf(currentPageNum) ) currentPageNum =  1;

        int count = qualityAuxiliaryAnalysisDao.selelectCountWarningLive(Integer.parseInt(warningLive));


        PageBean<Map<String,String>> pageBean = new PageBean<Map<String,String>>();
        pageBean.setCurrentPageNum(currentPageNum);
        pageBean.setEachPageDataNum(15);
        pageBean.setDataCountNum(count);
        pageBean.setPageCount(pageBean.getEachPageDataNum(),pageBean.getDataCountNum());
        pageBean.setPageFirstNum(pageBean.getEachPageDataNum(),currentPageNum);
        List<Map<String,String>> list = qualityAuxiliaryAnalysisDao.selelectWarningLiveDataToList(pageBean.getPageFirstNum(),pageBean.getEachPageDataNum(),Integer.parseInt(warningLive));
        pageBean.setPageData(list);
        pageBean.setUrl(url);
        return pageBean;
    }

    @Override
    public List<Map<String, String>> selectWaringData(PageBean<Map<String, String>> pageBean) {
        if ( null == pageBean){return null;}

        List<Map<String, String>> pageData = pageBean.getPageData();

        List<String> idList = new ArrayList<>();
        for (int i = 0; i < pageData.size(); i++){
            String id = String.valueOf(pageData.get(i).get("id"));
            idList.add(id);
        }

        List<Map<String,String>> dataList = qualityAuxiliaryAnalysisDao.selectWaringData(idList);


        return dataList;
    }
}
