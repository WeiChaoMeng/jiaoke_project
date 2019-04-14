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
import com.jiake.utils.QualityDataMontoringUtil;
import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.bean.QualityDataManagerDay;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.dao.QualityDataManagerDao;
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
     *当前模块有错误（总量计算未累减）
     * 功能描述: <br>
     *  <查询所选日期各模板生产情况>
     * @param [producedDate, crewNum]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @auther Melone
     * @date 2018/10/26 16:03
     */
    @Override
    public Map<String, Object> selectProducttionByDate(String producedDate, String crewNum, HttpServletRequest request) {

        if (Strings.isBlank(producedDate) || Strings.isBlank(crewNum) ) {return null;}

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

                    switch (key){
                        case "aggregate_1":
                            Object obj1 = list.get(i).get("aggregate_2");
                            double  temp1 = Double.parseDouble(value) - Double.parseDouble(obj1.toString());
                            materialsSVG =  QualityDataMontoringUtil.calculateSVG(count,total,String.valueOf(temp1));
                            SVGList.get(i).put(key,materialsSVG);
                            break;
                        case "aggregate_2":
                            Object obj2 = list.get(i).get("aggregate_3");
                            double  temp2 = Double.parseDouble(value) - Double.parseDouble(obj2.toString());
                            materialsSVG =  QualityDataMontoringUtil.calculateSVG(count,total,String.valueOf(temp2));
                            SVGList.get(i).put(key,materialsSVG);
                            break;
                        case "aggregate_3":
                            Object obj3 = list.get(i).get("aggregate_4");
                            double  temp3 = Double.parseDouble(value) - Double.parseDouble(obj3.toString());
                            materialsSVG =  QualityDataMontoringUtil.calculateSVG(count,total,String.valueOf(temp3));
                            SVGList.get(i).put(key,materialsSVG);
                            break;
                        case "aggregate_4":
                            Object obj4 = list.get(i).get("aggregate_5");
                            double  temp4 = Double.parseDouble(value) - Double.parseDouble(obj4.toString());
                            materialsSVG =  QualityDataMontoringUtil.calculateSVG(count,total,String.valueOf(temp4));
                            SVGList.get(i).put(key,materialsSVG);
                            break;
                        case "aggregate_5":
                            Object obj5 = list.get(i).get("aggregate_6");
                            double  temp5 = Double.parseDouble(value) - Double.parseDouble(obj5.toString());
                            materialsSVG =  QualityDataMontoringUtil.calculateSVG(count,total,String.valueOf(temp5));
                            SVGList.get(i).put(key,materialsSVG);
                            break;
                    }


                }

            }

        }

        //修改总量数据累减
        for (int i = 0; i < list.size();i++){
            Object arrg1 =  list.get(i).get("aggregate_1");
            Object arrg2 =  list.get(i).get("aggregate_2");
            Object arrg3 =  list.get(i).get("aggregate_3");
            Object arrg4 =  list.get(i).get("aggregate_4");
            Object arrg5 =  list.get(i).get("aggregate_5");
            Object arrg6 =  list.get(i).get("aggregate_6");

           double aggregate_1 =  Double.parseDouble(arrg1.toString()) - Double.parseDouble(arrg2.toString());
            double aggregate_2 =  Double.parseDouble(arrg2.toString()) - Double.parseDouble(arrg3.toString());
            double aggregate_3 =  Double.parseDouble(arrg3.toString()) - Double.parseDouble(arrg4.toString());
            double aggregate_4 =  Double.parseDouble(arrg4.toString()) - Double.parseDouble(arrg5.toString());
            double aggregate_5 =  Double.parseDouble(arrg5.toString()) - Double.parseDouble(arrg6.toString());

            list.get(i).put("aggregate_1",String.valueOf(aggregate_1));
            list.get(i).put("aggregate_2",String.valueOf(aggregate_2));
            list.get(i).put("aggregate_3",String.valueOf(aggregate_3));
            list.get(i).put("aggregate_4",String.valueOf(aggregate_4));
            list.get(i).put("aggregate_5",String.valueOf(aggregate_5));

        }


        String total = JSON.toJSONString(list);
        String SVG = JSON.toJSONString(SVGList);


        request.setAttribute("ratioNumList",ratioNumList);
        request.setAttribute("rationMessageList",rationMessageList);
        request.setAttribute("produceTotal",total);
        request.setAttribute("rationProSVG",SVGList);
        request.setAttribute("producedList",producedList);
        //js用
        request.setAttribute("ProSVG",SVG);
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
    public Map<String, Object> selectProductMessageById( String id, String crewNum) {

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

        QualityRatioTemplate ratioMap = qualityDataManagerDao.selectRationById(map.get("produce_proportioning_num"),crewNum);

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

        QualityRatioTemplate template = qualityDataManagerDao.selectRationById(ratioNum,crewNum);

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
        map.put("template",template);
        map.put("asphaltRatio",asphaltRatio);

        return map;
    }
}
