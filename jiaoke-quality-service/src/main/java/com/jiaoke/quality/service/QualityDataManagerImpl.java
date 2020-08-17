/**
 * FileName: QualityDataManagerImpl
 * author:   Melone
 * Date:     2018/10/15 11:47
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jiake.utils.QualityDataMontoringUtil;
import com.jiake.utils.QualityGradingUtil;
import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.bean.QualityDataManagerDay;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.dao.QualityDataManagerDao;
import com.jiaoke.quality.dao.QualityDataMontoringDao;
import com.jiaoke.quality.dao.QualityDataSummaryDao;
import org.apache.logging.log4j.util.Strings;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.util.*;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/15 11:47
 * @Description:
 * @Description:
 */
@Service
public class QualityDataManagerImpl implements QualityDataManagerInf {

    @Resource
    QualityDataManagerDao qualityDataManagerDao;

    @Resource
    QualityDataSummaryDao qualityDataSummaryDao;

    @Resource
    QualityDataMontoringDao qualityDataMontoringDao;
    /**
     *
     * 功能描述: <br>
     *  <返回数据管理首页相关信息>
     * @param currentPageNum, url]
     * @return com.jiaoke.common.bean.PageBean<com.jiaoke.quality.bean.QualityDataManagerDay>
     * @auther Melone
     * @date 2018/10/26 16:03
     */
    @Override
    public PageBean<QualityDataManagerDay> selectHistoryDataToDay(int currentPageNum, String url) {


        if ( 0 == currentPageNum ) {return null;}

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
     * @param producedDate, crewNum]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @auther Melone
     * @date 2018/10/26 16:03
     */
    @Override
    public Map<String, Object> selectProducttionByDate(String producedDate, String crewNum, HttpServletRequest request) {


        if (Strings.isBlank(producedDate) || Strings.isBlank(crewNum) ) {return null;}

        String crew=  "crew1".equals(crewNum) ? "data1":"data2";
        String date = producedDate;

        //待返回集合
        Map<String,Object> map = new HashMap<>();

        //当天使用的模板集合
        List<Map<String,String>> ratioNumList  = qualityDataManagerDao.selectRatioNumListByDate(date,crew);

        //获取当天使用模板的模板数据
        List<QualityRatioTemplate> rationMessageList =  qualityDataManagerDao.selectRatioMessageById(crewNum,ratioNumList,date);
        //当天每种模板产品各材料总和
        List<Map<String,String>> list =  new ArrayList<>();
        //获取当天每种产品七条产品
        List<Map<String,String>> producedList = qualityDataManagerDao.selectProduceByDate(date,crew);
        //获取每种模板下所有产品平均的实际百分比
        List<Map<String,String>> SVGList = new ArrayList<Map<String, String>>();
        //获取客户指定日期内产品的基本信息
        List<Map<String,String>> userProList = qualityDataManagerDao.selectProduceMessageByDate(date,crew);
        //根据日期获取客户各客户生产总量
        List<Map<String,String>> userProTotal =qualityDataManagerDao.selectUserProTotalByDate(date,crew);
        //查询当天每种数据平均值(高改为 矿粉 每盘计算)
        List<Map<String,String>> avgList =  new ArrayList<>();
        //查询当日所有生产数据
        List<Map<String,String>> proList = qualityDataManagerDao.selectAllProduceByDate(date,crew);
        List<Map<String,String>> totalList = QualityGradingUtil.returnGradingTotalList(proList);


        for (int i = 0; i < ratioNumList.size();i++){
           String rationNum = String.valueOf(ratioNumList.get(i).get("produce_proportioning_num"));
           //取出各材料总量
            double aggregate10 = 0.00;
            double aggregate9 = 0.00;
            double aggregate8 = 0.00;
            double aggregate7 = 0.00;
            double aggregate6 = 0.00;
            double aggregate5 = 0.00;
            double aggregate4 = 0.00;
            double aggregate3 = 0.00;
            double aggregate2 = 0.00;
            double aggregate1 = 0.00;
            double stone1 = 0.00;
            double stone2 = 0.00;
            double stone3 = 0.00;
            double stone4 = 0.00;
            double asphalt = 0.00;
            double regenerate = 0.00;
            double additive = 0.00;
            double additive1 = 0.00;
            double additive2 = 0.00;
            double additive3 = 0.00;
            double total = 0.00;
            double warehouse1Tem = 0.00;
            double mixtureTem = 0.00;
            double dusterTem = 0.00;
            double asphaltTem = 0.00;
            double aggregateTem = 0.00;
            int count = 0;

            //获取数据
            for (int j = 0; j < totalList.size();j++ ){
                String proRation = totalList.get(j).get("produce_proportioning_num");
                if (rationNum.equals(proRation)){
                    count = Integer.parseInt(totalList.get(j).get("count"));
                    aggregate10 = Double.parseDouble(totalList.get(j).get("material_aggregate_10"));
                    aggregate9 = Double.parseDouble(totalList.get(j).get("material_aggregate_9"));
                    aggregate8 = Double.parseDouble(totalList.get(j).get("material_aggregate_8"));
                    aggregate7 = Double.parseDouble(totalList.get(j).get("material_aggregate_7"));
                    aggregate6 = Double.parseDouble(totalList.get(j).get("material_aggregate_6"));
                    aggregate5 = Double.parseDouble(totalList.get(j).get("material_aggregate_5"));
                    aggregate4 = Double.parseDouble(totalList.get(j).get("material_aggregate_4"));
                    aggregate3 = Double.parseDouble(totalList.get(j).get("material_aggregate_3"));
                    aggregate2 = Double.parseDouble(totalList.get(j).get("material_aggregate_2"));
                    aggregate1 = Double.parseDouble(totalList.get(j).get("material_aggregate_1"));
                    stone1 = Double.parseDouble(totalList.get(j).get("material_stone_1"));
                    stone2 = Double.parseDouble(totalList.get(j).get("material_stone_2"));
                    stone3 = Double.parseDouble(totalList.get(j).get("material_stone_3"));
                    stone4 = Double.parseDouble(totalList.get(j).get("material_stone_4"));
                    asphalt = Double.parseDouble(totalList.get(j).get("material_asphalt"));
                    regenerate = Double.parseDouble(totalList.get(j).get("material_regenerate"));
                    additive = Double.parseDouble(totalList.get(j).get("material_additive"));
                    additive1 = Double.parseDouble(totalList.get(j).get("material_additive_1"));
                    additive2 = Double.parseDouble(totalList.get(j).get("material_additive_2"));
                    additive3 = Double.parseDouble(totalList.get(j).get("material_additive_3"));
                    total = Double.parseDouble(totalList.get(j).get("material_total"));
                    warehouse1Tem = Double.parseDouble(totalList.get(j).get("temperature_warehouse_1"));
                    mixtureTem = Double.parseDouble(totalList.get(j).get("temperature_mixture"));
                    dusterTem = Double.parseDouble(totalList.get(j).get("temperature_duster"));
                    asphaltTem = Double.parseDouble(totalList.get(j).get("temperature_asphalt"));
                    aggregateTem = Double.parseDouble(totalList.get(j).get("temperature_aggregate"));
                }
            }

            //平均占比修改
            Map<String,String> svgRationMap = new HashMap<>();
            svgRationMap.put("rationNum",rationNum);
            svgRationMap.put("aggregate_1",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate1)));
            svgRationMap.put("aggregate_2",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate2)));
            svgRationMap.put("aggregate_3",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate3)));
            svgRationMap.put("aggregate_4",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate4)));
            svgRationMap.put("aggregate_5",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate5)));
            svgRationMap.put("aggregate_6",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate6)));
            svgRationMap.put("aggregate_7",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate7)));
            svgRationMap.put("aggregate_8",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate8)));
            svgRationMap.put("aggregate_9",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate9)));
            svgRationMap.put("aggregate_10",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(aggregate10)));
            svgRationMap.put("stone_1",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(stone1)));
            svgRationMap.put("stone_2",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(stone2)));
            svgRationMap.put("stone_3",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(stone3)));
            svgRationMap.put("stone_4",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(stone4)));
            svgRationMap.put("asphalt",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(asphalt)));
            svgRationMap.put("regenerate",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(regenerate)));
            svgRationMap.put("additive",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(additive)));
            svgRationMap.put("additive1",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(additive1)));
            svgRationMap.put("additive2",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(additive2)));
            svgRationMap.put("additive3",QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(total),String.valueOf(additive3)));
            svgRationMap.put("mixture",String.valueOf(QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(mixtureTem))));
            svgRationMap.put("duster",String.valueOf(QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(dusterTem))));
            svgRationMap.put("temAsphalt",String.valueOf(QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(asphaltTem))));
            svgRationMap.put("aggregate",String.valueOf(QualityDataMontoringUtil.calculateSVG(String.valueOf(count),String.valueOf(aggregateTem))));
            SVGList.add(svgRationMap);
            //总量修改
            Map<String,String> totalMap = new HashMap<>();
            totalMap.put("procount",String.valueOf(count));
            totalMap.put("total",String.valueOf(total));
            totalMap.put("rationNum",rationNum);
            totalMap.put("aggregate_10",String.valueOf(aggregate10));
            totalMap.put("aggregate_9",String.valueOf(aggregate9));
            totalMap.put("aggregate_8",String.valueOf(aggregate8));
            totalMap.put("aggregate_7",String.valueOf(aggregate7));
            totalMap.put("aggregate_6",String.valueOf(aggregate6));
            totalMap.put("aggregate_5",String.valueOf(aggregate5));
            totalMap.put("aggregate_4",String.valueOf(aggregate4));
            totalMap.put("aggregate_3",String.valueOf(aggregate3));
            totalMap.put("aggregate_2",String.valueOf(aggregate2));
            totalMap.put("aggregate_1",String.valueOf(aggregate1));
            totalMap.put("stone_1",String.valueOf(stone1));
            totalMap.put("stone_2",String.valueOf(stone2));
            totalMap.put("stone_3",String.valueOf(stone3));
            totalMap.put("stone_4",String.valueOf(stone4));
            totalMap.put("asphalt",String.valueOf(asphalt));
            totalMap.put("regenerate",String.valueOf(regenerate));
            totalMap.put("additive",String.valueOf(additive));
            totalMap.put("additive1",String.valueOf(additive1));
            totalMap.put("additive2",String.valueOf(additive2));
            totalMap.put("additive3",String.valueOf(additive3));

            list.add(totalMap);

            //平均值修改
            Map<String,String> svgMap = new HashMap<>();
            svgMap.put("produce_date",date);
            svgMap.put("crewNum",crewNum);
            svgMap.put("produce_proportioning_num",rationNum);
            svgMap.put("material_aggregate_10",String.valueOf(aggregate10/count));
            svgMap.put("material_aggregate_9",String.valueOf(aggregate9/count));
            svgMap.put("material_aggregate_8",String.valueOf(aggregate8/count));
            svgMap.put("material_aggregate_7",String.valueOf(aggregate7/count));
            svgMap.put("material_aggregate_6",String.valueOf(aggregate6/count));
            svgMap.put("material_aggregate_5",String.valueOf(aggregate5/count));
            svgMap.put("material_aggregate_4",String.valueOf(aggregate4/count));
            svgMap.put("material_aggregate_3",String.valueOf(aggregate3/count));
            svgMap.put("material_aggregate_2",String.valueOf(aggregate2/count));
            svgMap.put("material_aggregate_1",String.valueOf(aggregate1/count));
            svgMap.put("material_stone_1",String.valueOf(stone1/count));
            svgMap.put("material_stone_2",String.valueOf(stone2/count));
            svgMap.put("material_stone_3",String.valueOf(stone3/count));
            svgMap.put("material_stone_4",String.valueOf(stone4/count));
            svgMap.put("material_asphalt",String.valueOf(asphalt/count));
            svgMap.put("material_regenerate",String.valueOf(regenerate/count));
            svgMap.put("material_additive",String.valueOf(additive/count));
            svgMap.put("material_additive_1",String.valueOf(additive1/count));
            svgMap.put("material_additive_2",String.valueOf(additive2/count));
            svgMap.put("material_additive_3",String.valueOf(additive3/count));
            svgMap.put("material_total",String.valueOf(total/count));
            svgMap.putAll(ratioNumList.get(i));
            avgList.add(svgMap);
        }



        //返回的结果集 一层Key为机组 二层为模板级配等 三层Key为筛孔
        List<Map<String,Map<String,List<Map<String,String>>>>> result = new ArrayList<>();
        String grading = QualityGradingUtil.getModelGradingResultJson(avgList,qualityDataMontoringDao,result);

        String total = JSON.toJSONString(list);
        String SVG = JSON.toJSONString(SVGList);
        String model = JSON.toJSONString(rationMessageList);

        request.setAttribute("ratioNumList",ratioNumList);
        request.setAttribute("rationMessageList",rationMessageList);
        request.setAttribute("produceTotal",total);
        request.setAttribute("rationProSVG",SVGList);
        request.setAttribute("producedList",producedList);
        //js用
        request.setAttribute("ProSVG",SVG);
        request.setAttribute("model",model);
        request.setAttribute("gradingMap",grading);
        //客户相关展示
        request.setAttribute("userProList",userProList);
        request.setAttribute("userProTotal",userProTotal);
        //保存日期，点击更多时查询用
        request.setAttribute("date",producedDate);
        request.setAttribute("crewNum",crewNum);


        return map;
    }

    /**
     * 点击查看按钮后根据传来的id查询基本信息与报警详细信息
     * @param id
     * @return
     */
    @Override
    public Map<String, Object> selectProductMessageById( String id, String crewNum,String proDate) {

        Map<String,Object> modelMap = new HashMap<>();
        //根据id与机组查询基本信息
        String crewStr;
        switch (crewNum){
            case "crew1":
                crewStr = "data1";
                break;
            case "crew2":
                crewStr = "data2";
                break;
                default:
                    crewStr = "data1";
        }
            Map<String,String> map =  qualityDataManagerDao.selectProductMessageById(id,crewStr);

        //根据日期与盘号查询各材料百分比、预警信息
        Object date =  map.get("produce_date");
        String discNum =  map.get("produce_disc_num");
        String crew ;
        switch (crewNum){
            case "crew1":
                crew = "1";
                break;
            case "crew2":
                crew = "2";
                break;
                default:
                    crew = "1";
        }
       List<Map<String,String>>  waringData =  qualityDataManagerDao.selectProduceByDateAndDiscNum(String.valueOf(date),discNum,crew);

        QualityRatioTemplate ratioMap = qualityDataManagerDao.selectRationById(map.get("produce_proportioning_num"),crewNum,proDate);

        modelMap.put("proBase",map);
        modelMap.put("proMessage",waringData);
        modelMap.put("modelMessage",ratioMap);

        return modelMap;
    }


    /**
     * 根据配比号、日期、机组查询所有产品
     * @param ratioNum
     * @param crewNum
     * @param date
     * @return
     */
    @Override
    public Map<String,Object> selectProListByRatioNumAndDate(String ratioNum, String crewNum, String date) {

        Map<String,Object> map = new HashMap<>();
        List<Integer> aggregate = new ArrayList<>();
        List<Integer> mixture = new ArrayList<>();
        List<Integer> asphalt = new ArrayList<>();
        List<Integer> warehouse1 = new ArrayList<>();
        List<String> dateList = new ArrayList<>();
        List<String> asphaltRatio = new ArrayList<>();

        QualityRatioTemplate template = qualityDataManagerDao.selectRationById(ratioNum,crewNum,date);

        String crew = "data1";
        switch (crewNum){
            case "crew1":
                crew = "data1";
                break;
            case "crew2":
                crew = "data2";
                break;
        }
        date = "'" + date + "'";
        List<Map<String, Object>> list = qualityDataManagerDao.selectProListByRatioNumAndDate(ratioNum,crew,date);

        for (int i = 0 ; i < list.size();i++){
            warehouse1.add(Integer.parseInt(list.get(i).get("temperature_warehouse_1").toString()));
            aggregate.add(Integer.parseInt(list.get(i).get("temperature_aggregate").toString()));
            mixture.add(Integer.parseInt(list.get(i).get("temperature_mixture").toString()));
            asphalt.add(Integer.parseInt(list.get(i).get("temperature_asphalt").toString()));
            dateList.add("'" + list.get(i).get("produce_time").toString() + "'");

            float material_asphalt = Float.parseFloat(list.get(i).get("material_asphalt").toString());
            float total = Float.parseFloat(list.get(i).get("material_total").toString());
            DecimalFormat decimalFormat=new DecimalFormat("#.#");
            String asphaltRation = decimalFormat.format(material_asphalt/total * 100);

            asphaltRatio.add(asphaltRation);
        }


        map.put("aggregate",aggregate);
        map.put("mixture",mixture);
        map.put("asphalt",asphalt);
        map.put("warehouse1",warehouse1);
        map.put("dateList",dateList);
        map.put("prolist",list);
        map.put("proListJson",JSON.toJSONString(list));
        map.put("template",template);
        map.put("asphaltRatio",asphaltRatio);
        map.put("aggregateMax",Collections.max(aggregate));
        map.put("aggregateMin",Collections.min(aggregate));
        map.put("mixtureMax",Collections.max(mixture));
        map.put("mixtureMin",Collections.min(mixture));
        map.put("asphaltMax",Collections.max(asphalt));
        map.put("asphaltMin",Collections.min(asphalt));
        map.put("warehouse1Max",Collections.max(warehouse1));
        map.put("warehouse1Min",Collections.min(warehouse1));
        map.put("proDate",date);
        map.put("crewNum",crewNum);
        return map;
    }

    @Override
    public String getProSVGRationAndModelRation(String productSVG) {

        JSONObject jsStr = JSONObject.parseObject(productSVG);

        Map<String, Object> itemMap = JSONObject.toJavaObject(jsStr, Map.class);

        String crew = itemMap.get("crewNum").toString();

        String crewNum = "data1".equals(crew)? "crew1":"crew2";
        //获取配比占比信息
        Map<String,String> modelRationMap = qualityDataSummaryDao.selectRaionModelById(crewNum, itemMap.get("produce_proportioning_num").toString(),itemMap.get("proDate").toString());

        return JSON.toJSONString(modelRationMap);
    }

    @Override
    public String getProductSvgGrading(String productSVG) {

        JSONObject jsStr = JSONObject.parseObject(productSVG);

        Map<String, String> itemMap = JSONObject.toJavaObject(jsStr, Map.class);
        //放入日期查询级配用 product_date 键需要与getGradingResultJson 方法内部对应
        itemMap.put("produce_date",itemMap.get("proDate"));
        String crew = itemMap.get("crewNum").toString();

        String crewNum = "data1".equals(crew)? "crew1":"crew2";
        //获取配比占比信息
        Map<String,String> modelRationMap = qualityDataSummaryDao.selectRaionModelById(crewNum, itemMap.get("produce_proportioning_num"),itemMap.get("proDate"));
        Map<String,String> map = new HashMap<>();
        map.putAll(modelRationMap);
        map.putAll(itemMap);
        List<Map<String,String>> list = new ArrayList<>();
        list.add(map);


        //返回的结果集 一层Key为机组 二层为模板级配等 三层Key为筛孔
        List<Map<String,Map<String,List<Map<String,String>>>>> result = new ArrayList<>();

        //获取级配信息
        String gradingStr = QualityGradingUtil.getGradingResultJson(list,qualityDataMontoringDao,result);

        return gradingStr;
    }

    @Override
    public String selectEchartsDataById(String id, String crewNum) {

        List<Map<String, String>> list = qualityDataSummaryDao.selectEchartsDataById(id,crewNum);
        //获取所有级配
        Map<String,List<Map<String,String>>> gradingMap = new HashMap<>();
        //返回的结果集 一层Key为机组 二层为模板级配等 三层Key为筛孔
        List<Map<String,Map<String,List<Map<String,String>>>>> result = new ArrayList<>();

        String resoult = QualityGradingUtil.getGradingResultJson(list,qualityDataMontoringDao,result);

        return resoult;
    }

    @Override
    public Map<String, Object> selectWarningMessageById(String crewNum, String produceDate, String produceTime) {
        Map<String,Object> modelMap = new HashMap<>();
        //根据id与机组查询基本信息
        String crewStr;
        switch (crewNum){
            case "crew1":
                crewStr = "data1";
                break;
            case "crew2":
                crewStr = "data2";
                break;
            default:
                crewStr = "data1";
        }
        Map<String,String> map =  qualityDataSummaryDao.selectWarningMessageById(crewNum,produceDate,produceTime);

        //根据日期与盘号查询各材料百分比、预警信息
        Object date =  map.get("produce_date");
        String discNum =  map.get("produce_disc_num");
        String crew ;
        switch (crewNum){
            case "crew1":
                crew = "1";
                break;
            case "crew2":
                crew = "2";
                break;
            default:
                crew = "1";
        }
        List<Map<String,String>>  waringData =  qualityDataManagerDao.selectProduceByDateAndDiscNum(String.valueOf(date),discNum,crew);

        QualityRatioTemplate ratioMap = qualityDataManagerDao.selectRationById(map.get("produce_proportioning_num"),crewNum,produceDate);

        modelMap.put("proBase",map);
        modelMap.put("proMessage",waringData);
        modelMap.put("modelMessage",ratioMap);

        return modelMap;
    }


    @Override
    public String getMsgByUserAndDate(String userNum, String proDate) {
        Map<String,Object> map = new HashMap<>();
        try{
            List<Map<String,Object>> list = qualityDataManagerDao.selectMsgByUserAndDate(userNum,proDate);
            if (list.isEmpty()){
                map.put("message","fail");
            }else {
                map.put("message","success");
                map.put("list",list);
            }
        }catch (Exception e){
            e.fillInStackTrace();
            map.put("message","exception");
        }
        return JSON.toJSONString(map);
    }


}
