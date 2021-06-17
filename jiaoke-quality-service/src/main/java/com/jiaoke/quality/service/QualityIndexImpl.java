/**
 * FileName: QualityIndexImpl
 * author:   Melone
 * Date:     2018/10/9 17:52
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.quality.dao.QualityIndexDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/9 17:52
 * @Description:
 */
@Service
public class QualityIndexImpl implements QualityIndexInf {

    @Resource
    QualityIndexDao qualityIndexDao;

    @Override
    public String getLastWeekCrewData() {

        List<Map<String, String>> lastWeekCrewData = qualityIndexDao.getLastWeekCrewData();

        if (null == lastWeekCrewData) return null;

        String lastWeekCrewDataJson = JSONArray.parseArray(JSONObject.toJSONString(lastWeekCrewData)).toJSONString();

        return lastWeekCrewDataJson;
    }

    @Override
    public String getLastYearEverMonthTotalToEchart() {

        List<Map<String,String>> list = qualityIndexDao.selectLastYearEverMonthTotalToEchart();
        Map<String,Map<String,List<String>>> data = new HashMap<>();
        Map<String,List<String>> crew1Map = new HashMap<>();
        Map<String,List<String>> crew2Map = new HashMap<>();
        data.put("crew1",crew1Map);
        data.put("crew2",crew2Map);
        //处理一二号机组月份
        for (int i = 1;i < 13;i++){
            //准备好装数据的容器
            Map<String, List<String>> crew1 = data.get("crew1");
            Map<String, List<String>> crew2 = data.get("crew2");
            crew1.put(String.valueOf(i),new ArrayList<>());
            crew2.put(String.valueOf(i),new ArrayList<>());

            for (int j = 1;j < 32;j++){
                String crew1Total = "";
                String crew2Total = "";
                boolean crew1IsExist = false;
                boolean crew2IsExist = false;
                for (int d = 0;d < list.size();d++){
                        String crewTmp = list.get(d).get("crew");
                        String monthNumTmp = String.valueOf(list.get(d).get("month_date"));
                        String dayNumTmp = String.valueOf(list.get(d).get("day_date"));
                        String totalTmp = String.valueOf(list.get(d).get("total"));
                        //处理日期内有生产
                        if (Integer.parseInt(monthNumTmp) == i && Integer.parseInt(dayNumTmp)  == j && "crew1".equals(crewTmp)){
                            crew1Total = totalTmp;
                            crew1IsExist = true;
                        }
                        if (Integer.parseInt(monthNumTmp) == i && Integer.parseInt(dayNumTmp)  == j && "crew2".equals(crewTmp)){
                            crew2Total = totalTmp;
                            crew2IsExist = true;
                        }
                }

                if (crew1IsExist){
                    data.get("crew1").get(String.valueOf(i)).add(crew1Total);
                }else {
                    data.get("crew1").get(String.valueOf(i)).add("0");
                }

                if (crew2IsExist){
                    data.get("crew2").get(String.valueOf(i)).add(crew2Total);
                }else {
                    data.get("crew2").get(String.valueOf(i)).add("0");
                }
            }
        }
        return JSONObject.toJSONString(data);
    }

    @Override
    public String getLastTenWarning() {
        List<Map<String,String>> list = qualityIndexDao.selectLastTenWarning();
        if(null == list) return null;
        return JSONObject.toJSONString(list);
    }

    @Override
    public  List<Map<String,String>> getLastProductData() {

        List<Map<String,String>> list = qualityIndexDao.getLastProductData();

        if(null == list) return null;

        return list;
    }
}
