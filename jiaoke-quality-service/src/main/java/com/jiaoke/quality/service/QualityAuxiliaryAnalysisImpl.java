/**
 * FileName: QualityAuxiliaryAnalysisImpl
 * author:   Melone
 * Date:     2018/10/15 15:01
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.jiake.utils.QualityGradingUtil;
import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.dao.QualityAuxiliaryAnalysisDao;
import com.jiaoke.quality.dao.QualityDataMontoringDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
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
    @Resource
    private QualityDataMontoringDao qualityDataMontoringDao;

    @Override
    public PageBean<Map<String,String>> selelectWarningLiveData(int currentPageNum, String url, String warningLive,String proData,String crew,String rationId) {

        if ( 0 == currentPageNum || null == String.valueOf(currentPageNum) ) currentPageNum =  1;

        int count = 0;
        String startDate = "";
        String endDate = "";

        if (proData != null){
            String[] temDate = proData.split("to");
            startDate = temDate[0];
            endDate = temDate[1];
        }

        count  = qualityAuxiliaryAnalysisDao.selelectCountWarningLive(Integer.parseInt(warningLive),startDate,endDate,crew,rationId);


        PageBean<Map<String,String>> pageBean = new PageBean<Map<String,String>>();
        pageBean.setCurrentPageNum(currentPageNum);
        pageBean.setEachPageDataNum(15);
        pageBean.setDataCountNum(count);
        pageBean.setPageCount(pageBean.getEachPageDataNum(),pageBean.getDataCountNum());
        pageBean.setPageFirstNum(pageBean.getEachPageDataNum(),currentPageNum);
        List<Map<String,String>> list = qualityAuxiliaryAnalysisDao.selelectWarningLiveDataToList(pageBean.getPageFirstNum(),pageBean.getEachPageDataNum(),Integer.parseInt(warningLive),startDate,endDate,crew,rationId);
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


    @Override
    public void getPageByProductIdAndProdate(String producedId, String prodate, String discNum, String crew, HttpServletRequest request) {

        String crewNum;
        switch (crew){
            case "1":
                crewNum = "data1";
                break;
            case "2":
                crewNum = "data2";
                break;
                default:
                    crewNum = "data1";
        }

        Map<String,String> map = qualityAuxiliaryAnalysisDao.getProMessageByDate(prodate,discNum,crewNum);

        List<Map<String,String>> list = qualityAuxiliaryAnalysisDao.getWaringList(producedId);

        request.setAttribute("proBase",map);
        request.setAttribute("proMessage",list);
        request.setAttribute("crewNum",crewNum);
    }


    @Override
    public String getRealTimeDataEcharsMaterial(String id, String crewNum) {

        List<Map<String, String>> list = qualityAuxiliaryAnalysisDao.selectRealTimeDataEcharsMaterial(id,crewNum);
        //获取所有级配
        Map<String,List<Map<String,String>>> gradingMap = new HashMap<>();
        //返回的结果集 一层Key为机组 二层为模板级配等 三层Key为筛孔
        List<Map<String,Map<String,List<Map<String,String>>>>> result = new ArrayList<>();


        String resoult = QualityGradingUtil.getGradingResultJson(list,qualityDataMontoringDao,result);

        return resoult;
    }
}
