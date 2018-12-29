/**
 * FileName: QualityRealTimeWarningImpl
 * author:   Melone
 * Date:     2018/10/15 19:57
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.quality.dao.QualityRealTimeWarningDao;
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
 * @create: 2018/10/15 19:57
 * @Description:
 */
@Service
public class QualityRealTimeWarningImpl implements  QualityRealTimeWarningInf {

    @Resource
    QualityRealTimeWarningDao qualityRealTimeWarningDao;

    /**
     *
     * 功能描述: <br>
     *  <返回最新的预警数据>
     * @param []
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/30 18:09
     */
    @Override
    public String selectLastWarningData() {

        List<Map<String,String>> list = qualityRealTimeWarningDao.selectLastWarningData();
        String str = "";
        if (list != null){
             str = JSONArray.parseArray(JSONObject.toJSONString(list)).toString();
        }

        return str;
    }

    /**
     *
     * 功能描述: <br>
     *  <返回echars图标需要的值>
     * @param
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/16 13:01
     */
    @Override
    public String getWarningEcharsData() {

        List<Map<String,String>> list = qualityRealTimeWarningDao.selectWarningEcharsData();


        List<Float> crew1topList = new ArrayList<Float>();
        List<Float> crew1realList = new ArrayList<Float>();
        List<Float> crew1downList = new ArrayList<Float>();
        List<String> crew1nameList = new ArrayList<String>();

        List<Float> crew2topList = new ArrayList<Float>();
        List<Float> crew2realList = new ArrayList<Float>();
        List<Float> crew2downList = new ArrayList<Float>();
        List<String> crew2nameList = new ArrayList<String>();

        Map<String,Object> map = new HashMap<String,Object>(16);

        float upRatio = 0;
        float downRatio = 0;


        for(int i = 0; i < list.size(); i++){
            String  crewNum = String.valueOf(list.get(i).get("produce_crewNum")) ;
            String moudle = list.get(i).get("moudle_ratio");
            String name = list.get(i).get("material_name");
            float total = 0 ;

            switch (name){
                case "骨料6":
                    total = Float.parseFloat(moudle);
                    upRatio = total == 0? 0: total + 5;
                     downRatio = total == 0? 0: total - 5;
                    break;
                case "骨料5":
                    total = Float.parseFloat(moudle);
                    upRatio = total == 0? 0: total + 5;
                    downRatio = total == 0? 0: total - 5;
                    break;
                case "骨料4":
                    total = Float.parseFloat(moudle);
                    upRatio = total == 0? 0: total + 5;
                    downRatio = total == 0? 0: total - 5;
                    break;
                case "骨料3":
                    total = Float.parseFloat(moudle);
                    upRatio = total == 0? 0: total + 5;
                    downRatio = total == 0? 0: total - 5;
                    break;
                case "骨料2":
                    total = Float.parseFloat(moudle);
                    upRatio = total == 0? 0: total + 2;
                    downRatio = total == 0? 0: total - 2;
                    break;
                case "骨料1":
                    total = Float.parseFloat(moudle);
                    upRatio = total == 0? 0: total + 2;
                    downRatio = total == 0? 0: total - 2;
                    break;
                case "矿粉":
                    total = Float.parseFloat(moudle);
                    upRatio = total == 0? 0: total + 1;
                    downRatio = total == 0? 0: total - 2;
                    break;
                case "沥青":
                    total = Float.parseFloat(moudle);
                    upRatio = total == 0? 0: total + 2;
                    downRatio = total == 0? 0: total - 2;
                    break;
                case "再生料":
                    total = Float.parseFloat(moudle);
                    upRatio = total == 0? 0: total + 2;
                    downRatio = total == 0? 0: total - 2;
                    break;
            }

            if ("沥青温度".equals(name) || "混合料温度".equals(name) || "骨料温度".equals(name)){
                continue;
            }else {

                if ( "1".equals(crewNum) ){

                    crew1nameList.add(list.get(i).get("material_name") );
                    crew1topList.add(upRatio);
                    crew1realList.add(Float.parseFloat(list.get(i).get("actual_ratio")));
                    crew1downList.add(downRatio);

                }else {
                    crew2nameList.add(list.get(i).get("material_name") );
                    crew2topList.add(upRatio);
                    crew2realList.add(Float.parseFloat(list.get(i).get("actual_ratio")));
                    crew2downList.add(downRatio);
                }

            }

        }

        map.put("crew1topList",crew1topList);
        map.put("crew1realList",crew1realList);
        map.put("crew1downList",crew1downList);
        map.put("crew1nameList",crew1nameList);

        map.put("crew2topList",crew2topList);
        map.put("crew2realList",crew2realList);
        map.put("crew2downList",crew2downList);
        map.put("crew2nameList",crew2nameList);

        String  jsonStr = JSON.toJSONString(map);

        return jsonStr ;

    }
}
