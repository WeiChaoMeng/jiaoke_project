/**
 * FileName: QualityDataManagerImpl
 * author:   Melone
 * Date:     2018/10/15 11:47
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.jiake.utils.QualityDataMontoringUtil;
import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.bean.QualityDataManagerDay;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.dao.QualityDataManagerDao;
import org.apache.logging.log4j.util.Strings;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

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

    /**
     *
     * 功能描述: <br>
     *  <返回数据管理首页相关信息>
     * @param [currentPageNum, url]
     * @return com.jiaoke.common.bean.PageBean<com.jiaoke.quality.bean.QualityDataManagerDay>
     * @auther Melone
     * @date 2018/10/26 16:03
     */
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

    /**
     *
     * 功能描述: <br>
     *  <查询所选日期各模板生产情况>
     * @param [producedDate, crewNum]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @auther Melone
     * @date 2018/10/26 16:03
     */
    @Override
    public Map<String, Object> selectProducttionByDate(String producedDate, String crewNum) {

        if (Strings.isBlank(producedDate) || Strings.isBlank(crewNum) ) return null;

        String crew=  "crew1".equals(crewNum) ? "data1":"data2";
        String date = "'" + producedDate + "'";

        //待返回集合
        Map<String,Object> map = new HashMap<>();
        //当天使用的模板集合
        List<String> ratioNumList  = qualityDataManagerDao.selectRatioNumListByDate(date,crew);
        //获取当天使用模板的模板数据
        List<QualityRatioTemplate> rationMessageList =  qualityDataManagerDao.selectRatioMessageById(crewNum,ratioNumList);
        //当天每种模板产品各材料总和
        List<Map<String,String>> list =  qualityDataManagerDao.selectProducedSVG(date,crew);
        //获取当天所有产品
        List<Map<String,String>> producedList = qualityDataManagerDao.selectProduceByDate(date,crew);
        //获取每种模板下所有产品平均的实际百分比
        List<Map<String,String>> SVGList = new ArrayList<Map<String, String>>();

        //获取客户指定日期内产品的基本信息
        List<Map<String,String>> userProList = qualityDataManagerDao.selectProduceMessageByDate(date,crew);
        //根据日期获取客户各客户生产总量
        List<Map<String,String>> userProTotal =qualityDataManagerDao.selectUserProTotalByDate(date,crew);


        //计算平均值
        String[] array1 = {"rationNum","procount"};
        String[] array2 = {"total","warehouse_1","mixture","duster","temAsphalt","aggregate"};

        for (int i = 0; i < list.size();i++){

            SVGList.add(new HashMap<>());
            String total = String.valueOf(list.get(i).get("total"));
            String count = String.valueOf(list.get(i).get("procount"));

            Iterator<Map.Entry<String, String>> entries = list.get(i).entrySet().iterator();
            while (entries.hasNext()){
                Map.Entry entry = (Map.Entry) entries.next();
                String key = String.valueOf(entry.getKey());
                String value = String.valueOf(entry.getValue());

                if (QualityDataMontoringUtil.judgeKeyInArray(key,array1)) {
                    SVGList.get(i).put(key,value);
                    continue;
                };

                //温度、总量不需要百分比
                if (QualityDataMontoringUtil.judgeKeyInArray(key,array2)){
                    String  temSVG =  QualityDataMontoringUtil.calculateSVG(count,value);
                    SVGList.get(i).put(key,temSVG);
                }else {
                    //获取平均值后计算百分比
                    String  materialsSVG =  QualityDataMontoringUtil.calculateSVG(count,total,value);
                    SVGList.get(i).put(key,materialsSVG);
                }

            }

        }


        map.put("ratioNumList",ratioNumList);
        map.put("rationMessageList",rationMessageList);
        map.put("producedList",producedList);
        map.put("produceTotal",list);
        map.put("rationProSVG",SVGList);

        //客户相关展示
        map.put("userProList",userProList);
        map.put("userProTotal",userProTotal);

        return map;
    }
}
