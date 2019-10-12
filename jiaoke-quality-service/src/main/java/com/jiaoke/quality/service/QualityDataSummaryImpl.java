/**
 * FileName: QualityDataSummaryImpl
 * author:   Melone
 * Date:     2019/4/29 11:19
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.QualityGradingUtil;
import com.jiake.utils.QualityProsvg;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.dao.QualityDataMontoringDao;
import com.jiaoke.quality.dao.QualityDataSummaryDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/4/29 11:19
 * @Description:
 */
@Service
public class QualityDataSummaryImpl implements QualityDataSummaryInf {

    @Resource
    private QualityDataSummaryDao qualityDataSummaryDao;
    @Resource
    private QualityDataMontoringDao qualityDataMontoringDao;

    @Override
    public String getThreeDayData() {

        List<Map<String,Object>> list  = qualityDataSummaryDao.selectThreeDayData();
        String res = JSON.toJSONString(list);
        return res;
    }

    @Override
    public List<Map<String, Object>> getRatioListByDateTimeAndCrew(String startDate, String endDate, String crew) {

        return qualityDataSummaryDao.selectRatioListByDateTimeAndCrew(startDate,endDate,crew);
    }

    @Override
    public List<Map<String,Object>> getPromessageByRaionModel(String startDate, String endDate, String crew, String rationId) {
        List<Map<String,Object>> proList = qualityDataSummaryDao.selectPromessageByRaionModel(startDate,endDate,crew,rationId);
        return proList;
    }

    /**
     *
     * 功能描述: <br>
     *  <返回平均值，级配信息等数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/5/5 13:56
     */
    @Override
    public void getProSvgmessage(String startDate, String endDate, String crew, String rationId, HttpServletRequest request) {
        //获取条件下所有生产数据
        List<Map<String,Object>> proList = qualityDataSummaryDao.selectPromessageByRaionModel(startDate,endDate,crew,rationId);

        //获取平均值
        Map<String, String> svgMap = QualityProsvg.getProsvgByProList(proList);


        //添加相关信息方便调用公用方法
        String crewNum = "data1".equals(crew)? "crew1":"crew2";
        svgMap.put("crewNum",crewNum);

        //获取配比占比信息
        Map<String,String> modelRationMap = qualityDataSummaryDao.selectRaionModelById(crewNum, svgMap.get("produce_proportioning_num"));

        //创建新得map合并平均值map与模板Map用于调用getGradingResultJson 方法
        List<Map<String,String>> list = new ArrayList<>();
        Map<String,String> temMap = new HashMap<>();
        temMap.putAll(modelRationMap);
        temMap.putAll(svgMap);
        list.add(temMap);


        //返回的结果集 一层Key为机组 二层为模板级配等 三层Key为筛孔
        List<Map<String,Map<String,List<Map<String,String>>>>> result = new ArrayList<>();

        //获取级配信息
        String gradingStr = QualityGradingUtil.getGradingResultJson(list,qualityDataMontoringDao,result);




        Map<String, String> realRationMap = QualityProsvg.getProportionBySvgMessage(svgMap);
        Double stone1 =  Double.parseDouble(realRationMap.get("material_stone_1").toString());
        Double stone2 =  Double.parseDouble(realRationMap.get("material_stone_2").toString());

        if (stone2 > stone1) {
            realRationMap.put("breezeReal", String.valueOf(stone2));
        } else {
            realRationMap.put("breezeReal", String.valueOf(stone1));
        }

        request.setAttribute("productSVG",svgMap);
        request.setAttribute("productGrading",gradingStr);
        request.setAttribute("productRationSVG",realRationMap);
        request.setAttribute("productModelRationSVG",modelRationMap);

    }

    @Override
    public String getAllCriticalWarning() {
        List<Map<String,String>> list = qualityDataSummaryDao.selectAllCriticalWarning();

        String tem = "";
        Set<String> crewIdSet = new HashSet<>();
        //取出相同crew_id，以确定数据数量
        for (int i = 0; i < list.size();i++){
            crewIdSet.add(String.valueOf(list.get(i).get("crew_id")));
        }
        //填充返回值集合
        List<Map<String,String>> res = new ArrayList<>();
        for(String crewId:crewIdSet){
            Map<String,String> map = new HashMap<>();
            String materialName = "";
            String warningLive = "";
            String deviation = "";
            for (Map<String,String> temMap : list){
                if (String.valueOf(temMap.get("crew_id")).equals(crewId)){
                    materialName = String.valueOf(temMap.get("material_name"));
                    warningLive = String.valueOf(temMap.get("warning_level"));
                    deviation = String.valueOf(temMap.get("deviation_ratio"));
                    map.putAll(temMap);
                }else {
                    continue;
                }
                map.put(materialName,warningLive);
                map.put(materialName + "deviation" ,deviation);
            }
            res.add(map);
        }


        return JSON.toJSONString(res);
    }

    @Override
    public Map<String, Object> getCeiticalWarning(String proDate, String produceDisc,String crewNum) {

        Map<String,Object> modelMap = new HashMap<>();
        //根据id与机组查询基本信息
        String crewStr;
        switch (crewNum){
            case "1":
                crewStr = "data1";
                break;
            case "2":
                crewStr = "data2";
                break;
            default:
                crewStr = "data1";
        }
        Map<String,String> map =  qualityDataSummaryDao.selectProductMessageById(proDate,produceDisc,crewStr);

        //根据日期与盘号查询各材料百分比、预警信息
        Object date =  map.get("produce_date");
        String discNum =  map.get("produce_disc_num");

        List<Map<String,String>>  waringData =  qualityDataSummaryDao.selectProduceByDateAndDiscNum(String.valueOf(date),discNum,crewNum);

        QualityRatioTemplate ratioMap = qualityDataSummaryDao.selectRationById(map.get("produce_proportioning_num"),crewNum);

        modelMap.put("proBase",map);
        modelMap.put("proMessage",waringData);
        modelMap.put("modelMessage",ratioMap);

        return modelMap;
    }

    @Override
    public List<Map<String, Object>> mobileGetRatioListByDate(String startDate, String crew) {

        return qualityDataSummaryDao.mobileGetRatioListByDate(startDate,crew);

    }

    @Override
    public List<Map<String, Object>> getMobilePromessageByRaionModel(String startDate, String crew, String rationId) {

        List<Map<String,Object>> proList = qualityDataSummaryDao.selectMobilePromessageByRaionModel(startDate,crew,rationId);
        return proList;
    }

    @Override
    public List<Map<String, Object>> mobileGetYesterdayProduct() {
        List<Map<String,Object>> proList = qualityDataSummaryDao.selectmobileGetYesterdayProduct();
        return proList;
    }

    @Override
    public String getWarningDataByDate(String crew, String startDate) {

        String crewNum = "data1".equals(crew) ? "1":"2";

        List<Map<String,String>> list = qualityDataSummaryDao.selectMobileWarningDataByDate(crewNum,startDate);

        String tem = "";
        Set<String> crewIdSet = new HashSet<>();
        //取出相同crew_id，以确定数据数量
        for (int i = 0; i < list.size();i++){
            crewIdSet.add(String.valueOf(list.get(i).get("crew_id")));
        }
        //填充返回值集合
        List<Map<String,String>> res = new ArrayList<>();
        for(String crewId:crewIdSet){
            Map<String,String> map = new HashMap<>();
            String materialName = "";
            String warningLive = "";
            String deviation = "";
            for (Map<String,String> temMap : list){
                if (String.valueOf(temMap.get("crew_id")).equals(crewId)){
                    materialName = String.valueOf(temMap.get("material_name"));
                    warningLive = String.valueOf(temMap.get("warning_level"));
                    deviation = String.valueOf(temMap.get("deviation_ratio"));
                    map.putAll(temMap);
                }else {
                    continue;
                }
                map.put(materialName,warningLive);
                map.put(materialName + "deviation" ,deviation);
            }
            res.add(map);
        }


        return JSON.toJSONString(res);
    }
}
