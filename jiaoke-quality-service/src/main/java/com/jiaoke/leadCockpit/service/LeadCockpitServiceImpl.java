/**
 * FileName: LeadCockpitServiceImpl
 * author:   Melone
 * Date:     2020/5/10 16:14
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.leadCockpit.service;

import com.jiake.utils.QualityGradingUtil;
import com.jiaoke.LeadCockpit.dao.LeadCockpitServiceDao;
import com.jiaoke.quality.dao.QualityDataMontoringDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/5/10 16:14
 * @Description:
 */
@Service
public class LeadCockpitServiceImpl implements LeadCockpitServiceInf {

    @Resource
    private LeadCockpitServiceDao leadCockpitServiceDao;
    @Resource
    QualityDataMontoringDao qualityDataMontoringDao;
    @Override
    public Map<String, Object> getTopTenProject() {
        Map<String,Object> map = new HashMap<>();
        List<Map<String,String>> list = leadCockpitServiceDao.selectTopTenProject();
        map.put("dataBody",list);
        map.put("message","success");
        if (list == null || list.isEmpty()){
            map.put("message","empty");
        }
        return map ;
    }

    @Override
    public Map<String, Object> getThisMonthYield() {
        Map<String,Object> map = new HashMap<>();
        //查询本月产量
        List<Map<String,String>> list = leadCockpitServiceDao.selectThisMonthYield();
        //查询本月两个机组前十名产品
        List<Map<String,String>> proList = leadCockpitServiceDao.selectThisMonthProduct();

        map.put("thisMonthYield",list);
        map.put("thisMonthProduct",proList);
        map.put("message","success");

        if (list == null || list.isEmpty()){
            map.put("message","empty");
            return map;
        }
        if (proList == null || proList.isEmpty()){
            map.put("message","empty");
            return map;
        }

        return map ;
    }

    @Override
    public Map<String, Object> getAsphaltAggregateRatio() {
        Map<String,Object> res = new HashMap<>();
        //查询当前最后一条数据三日内相同产品信息及配比信息
        List<Map<String,String>> list = leadCockpitServiceDao.selectAsphaltAggregateRatio();
        //计算油石比
        DecimalFormat df = new DecimalFormat("0.00");
        df.setRoundingMode(RoundingMode.HALF_UP);
        if (list == null || list.size() < 2){
            res.put("message","empty");
            return res;
        }
        //定义返回内容
        Map<String,Object> body = new HashMap<>();
        //返回X轴使用的盘号坐标
        Map<String,List<String>> xMap = new HashMap<>();
        List<String> crew1Xlist = new ArrayList<>();
        List<String> crew2Xlist = new ArrayList<>();
        //返回data数据
        Map<String,List<String>> dataList = new HashMap<>();
        List<String> crew1data = new ArrayList<>();
        List<String> crew2data = new ArrayList<>();
        //返回配比值
        Map<String,Object> ration = new HashMap<>();

        for(int i = 0; i < list.size();i++){

            String crew =  list.get(i).get("crew");
            String discNum = list.get(i).get("produce_disc_num");
            String produceTime = String.valueOf(list.get(i).get("produce_time"));
            String ratioStone = String.valueOf(list.get(i).get("ratio_stone"));
            Float total = Float.parseFloat(String.valueOf(list.get(i).get("material_total")));
            Float asphalt = Float.parseFloat(String.valueOf(list.get(i).get("material_asphalt")));
            //计算油石比
//            String aar = df.format(asphalt /(total - asphalt) * 100);
            //计算含量
            String aar = df.format(asphalt /total * 100);
            if ("crew1".equals(crew)){
                //盘号X轴
//                crew1Xlist.add(discNum);
                //日期X轴
                crew1Xlist.add(produceTime);
                crew1data.add(aar);
                ration.put("crew1Ration",ratioStone);
            }else {
                //盘号X轴
//                crew2Xlist.add(discNum);
                //日期X轴
                crew2Xlist.add(produceTime);
                crew2data.add(aar);
                ration.put("crew2Ration",ratioStone);
            }
        }

        //装载数据
        xMap.put("crew1XList",crew1Xlist);
        xMap.put("crew2XList",crew2Xlist);
        dataList.put("crew1data",crew1data);
        dataList.put("crew2data",crew2data);

        body.put("xList",xMap);
        body.put("dataList",dataList);
        body.put("ration",ration);

        res.put("body",body);
        res.put("message","success");
        //装填数据返回
        return res;
    }

    @Override
    public Map<String, Object> getTodayProductList() {
        Map<String,Object> res = new HashMap<>();
        //查询当前最后一条数据三日内相同产品信息及配比信息
        List<Map<String,String>> list = leadCockpitServiceDao.selectTodayProductList();
        res.put("dataList",list);
        res.put("message","success");
        if (list == null || list.size() == 0){
            res.put("message","empty");
        }
        return res;
    }

    @Override
    public Map<String, Object> getThisDayProduct() {
        Map<String,Object> res = new HashMap<>();
        //查询当前最后一条数据三日内相同产品信息及配比信息
        List<Map<String,String>> list = leadCockpitServiceDao.getThisDayProduct();
        res.put("dataList",list);
        res.put("message","success");
        if (list == null || list.size() == 0){
            res.put("message","empty");
        }
        return res;
    }

    @Override
    public Map<String, Object> getThisDayMaxProductTemperature() {
        Map<String,Object> res = new HashMap<>();
        //查询当前最后一条数据三日内相同产品信息及配比信息
        Map<String,String> proportioningNum = leadCockpitServiceDao.getThisDayMaxProportioningNum();
        //查询当前最后一条数据三日内相同产品信息及配比信息
        List<Map<String,String>> list = leadCockpitServiceDao.getThisDayMaxProductTemperature(proportioningNum.get("produce_proportioning_num"));
        res.put("dataList",list);
        res.put("message","success");
        if (list == null || list.size() == 0){
            res.put("message","empty");
        }
        return res;
    }

    @Override
    public Map<String, Object> getWarningProportion() {
        Map<String,Object> res = new HashMap<>();
        //查询当日最高生产的最高产品
        Map<String,String> proportioningNum = leadCockpitServiceDao.getThisDayMaxProportioningNum();
        //查询今日生产最多的产品盘数
        Map<String,String> productNumMap = leadCockpitServiceDao.getThisDayMaxproductNumMap(proportioningNum.get("produce_proportioning_num"));
        //查询当日最高产量配比的各材料三级预警盘数
        List<Map<String,String>> list = leadCockpitServiceDao.getWarningProportion(proportioningNum.get("produce_proportioning_num"));

        int productCount = Integer.parseInt(String.valueOf(productNumMap.get("countSum")));
        List<Map<String,String>> resList = new ArrayList<>();
        for (int i = 0; i < list.size();i++){
            Map<String,String> temMap = new HashMap<>();
            double temCount = Double.parseDouble(String.valueOf(list.get(i).get("countSum")));
           String materialName = list.get(i).get("material_name");
           double  proportion = (temCount/productCount) * 100;
           temMap.put("proDuctName",materialName);
           temMap.put("proportion",String.format("%.2f", proportion));
            resList.add(temMap);
        }

        res.put("dataList",resList);
        res.put("message","success");
        if (resList == null || resList.size() == 0){
            res.put("message","empty");
        }
        return res;
    }

    @Override
    public Map<String, Object> getProductSvgGrading() {
        Map<String,Object> res = new HashMap<>();
        //查询当日最高生产的最高产品
        Map<String,String> proportioningNum = leadCockpitServiceDao.getThisDayMaxProportioningNum();
        //查询今日产量最高产品平均信息
        List<Map<String,String>> avgList = leadCockpitServiceDao.getProductSvg(proportioningNum.get("produce_proportioning_num"));

        //返回的结果集 一层Key为机组 二层为模板级配等 三层Key为筛孔
        List<Map<String,Map<String,List<Map<String,String>>>>> result = new ArrayList<>();
        String grading = QualityGradingUtil.getModelGradingResultJson(avgList,qualityDataMontoringDao,result);

        res.put("dataList",grading);
        res.put("ration",proportioningNum.get("produce_proportioning_num"));
        res.put("message","success");
        if (grading == null || "".equals(grading)){
            res.put("message","empty");
        }
        return res;
    }

    @Override
    public Map<String, Object> getProductBasicMsg() {
        Map<String,Object> res = new HashMap<>();
        //查询当日最高生产的最高产品
        Map<String,String> proportioningNum = leadCockpitServiceDao.getThisDayMaxProportioningNum();
        //查询基本信息
        List<Map<String,String>> list = leadCockpitServiceDao.getProductBasicMsg(proportioningNum.get("produce_proportioning_num"));
        res.put("dataList",list);
        res.put("message","success");
        if (list == null || list.size() == 0){
            res.put("message","empty");
        }
        return res;
    }
}
