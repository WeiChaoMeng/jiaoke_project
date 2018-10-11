/**
 * FileName: QualityMatchingImpl
 * author:   Melone
 * Date:     2018/10/11 12:34
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.bean.QualityRatioModel;
import com.jiaoke.quality.dao.QualityMatchingDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/11 12:34
 * @Description:
 */
@Service
public class QualityMatchingImpl implements QualityMatchingInf{

    @Autowired
    QualityMatchingDao qualityMatchingDao;

    public PageBean<QualityRatioModel> selectMatchingMoudelByLimte(int currentPageNum,String url) {

        if ( 0 == currentPageNum ) return null;

        int count = qualityMatchingDao.selectMatchingMoudelDataCount();

        PageBean<QualityRatioModel> pageBean = new PageBean<QualityRatioModel>();
        pageBean.setCurrentPageNum(currentPageNum);
        pageBean.setEachPageDataNum(15);
        pageBean.setDataCountNum(count);
        pageBean.setPageCount(pageBean.getEachPageDataNum(),pageBean.getDataCountNum());
        pageBean.setPageFirstNum(pageBean.getEachPageDataNum(),currentPageNum);
        pageBean.setPageData(qualityMatchingDao.selectMatchingMoudelByLimte(pageBean.getPageFirstNum(),pageBean.getEachPageDataNum()));
        pageBean.setUrl(url);

        return pageBean;
    }

    public List<Map<String, String>> selectAdditiveTypeList() {
        List<Map<String, String>> list = qualityMatchingDao.selectAdditiveTypeList();
        return list;
    }

    public List<Map<String, String>> selectRegenerateTypeList() {
        List<Map<String, String>> list = qualityMatchingDao.selectRegenerateTypeList();
        return list;
    }
}
