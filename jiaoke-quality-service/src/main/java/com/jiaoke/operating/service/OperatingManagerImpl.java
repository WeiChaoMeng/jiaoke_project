/**
 * FileName: OperatingManagerImpl
 * author:   Melone
 * Date:     2019/8/8 10:49
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.operating.service;


import com.alibaba.fastjson.JSON;
import com.jiaoke.operating.dao.OperatingManagerDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/8/8 10:49
 * @Description:
 */
@Service
public class OperatingManagerImpl implements OperatingManagerInf {

    @Resource
    private OperatingManagerDao operatingManagerDao;

    @Override
    public String getThisWeekData() {
        List<Map<String,Object>> list =  operatingManagerDao.selectThisWeekData();
        return eachList(list);
    }


    @Override
    public String getThisMonthData() {
        List<Map<String,Object>> list =  operatingManagerDao.selectThisMonthData();
        return eachList(list);
    }

    @Override
    public String getThisYearData() {
        List<Map<String,Object>> list =  operatingManagerDao.selectThisYearData();
        return eachList(list);
    }

    @Override
    public String getAllData() {

        //获取截至目前为止1、2机组生产总量
        List<Map<String,Object>> list =  operatingManagerDao.selectAllData();
        String totalMap = eachList(list);
        Map<String,String> map = JSON.parseObject(totalMap,Map.class);
        //获取第一次生产日期
        Map<String,String> dateMap = operatingManagerDao.selectFirstProductDate();
        dateMap.putAll(map);
        return JSON.toJSONString(dateMap);
    }

    private String eachList(List<Map<String,Object>> list){

        Map<String,Object> map = new HashMap<>();
        float resTotal = 0;

        if (list.isEmpty()){
            map.put("total",resTotal);
            return JSON.toJSONString(map);
        }else {
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i) != null) {
                    Object total = list.get(i).get("total");
                    if (total == null) {
                        continue;
                    } else {
                        resTotal += Float.parseFloat(total.toString());
                    }
                }
            }
        }

        map.put("total",resTotal);

        return JSON.toJSONString(map);
    }

    @Override
    public String getLastMonthData() {
       List<Map<String,String>> list  = operatingManagerDao.selectLastMonthData();
        return JSON.toJSONString(list);
    }

    @Override
    public String getMonthContrast() {

        Map<String,String>  map = new HashMap<>();

        Map<String,Object> lastMonth =  operatingManagerDao.selectMonthContrast();
        Map<String,Object> monthBeforeLat = operatingManagerDao.selectmonthBeforeLatContrast();

        if (Integer.parseInt(lastMonth.get("counts").toString()) == 0){
            map.put("lastMonthPercent","0");
            map.put("lastMonthCountPercent","0");
            return JSON.toJSONString(map);
        }
        if (Integer.parseInt(monthBeforeLat.get("counts").toString()) == 0){
            map.put("lastMonthPercent","100");
            map.put("lastMonthCountPercent","100");
            return JSON.toJSONString(map);
        }

        float lastMonthTotal = Float.parseFloat(lastMonth.get("totals").toString());
        int lastMonthCount =  Integer.parseInt(lastMonth.get("counts").toString());

        float monthBeforeLatTotal = Float.parseFloat(monthBeforeLat.get("totals").toString());
        int monthBeforeLatCount =  Integer.parseInt(monthBeforeLat.get("counts").toString());

        double lastMonthPercent =Math.ceil((lastMonthTotal - monthBeforeLatTotal)/monthBeforeLatTotal * 100);
        float tem = lastMonthCount - monthBeforeLatCount;
        int lastMonthCountPercent = Math.round(tem/monthBeforeLatCount * 100);

        map.put("lastMonthPercent",String.valueOf(lastMonthPercent));
        map.put("lastMonthCountPercent",String.valueOf(lastMonthCountPercent));
        return JSON.toJSONString(map);
    }

    @Override
    public String getAllMonthPercent() {
        List<Map<String,Object>> res =  operatingManagerDao.selectAllMonthPercent();
        return JSON.toJSONString(res);
    }

    @Override
    public String getEveryMonthDays() {
        List<Map<String,Object>> res =  operatingManagerDao.selectEveryMonthDays();
        return JSON.toJSONString(res);
    }

    @Override
    public String sendFromData(String dates, String total) {
        Map<String,String> res = new HashMap<>();

        Map<String,String> map = operatingManagerDao.selectDataByDate(dates);

        if (!(map == null)){
            res.put("message","error");
            return JSON.toJSONString(res);
        }

        int  result = operatingManagerDao.insetFromData(dates,total);

        if (result > 0){
            res.put("message","success");
        }else {
            res.put("message","error");
        }

        return JSON.toJSONString(res);
    }

    @Override
    public String getThisYearDataAndPlan() {
        Map<String,Object> res = new HashMap<>();

        Map<String,Object> map1 = operatingManagerDao.selectThisYearPlan();
        if (map1 == null){
            res.put("message","error");
            return JSON.toJSONString(res);
        }
        Map<String,Object> map = operatingManagerDao.selectThisYearTwoCrewData();

        res.putAll(map1);
        if (map != null){
            res.putAll(map);
        }else {
            Map<String,Object> temp = new HashMap<>();
            temp.put("total",0);
            res.putAll(temp);
        };


        return JSON.toJSONString(res);
    }
}
