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
     * @param []
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/16 13:01
     */
    @Override
    public String getWarningEcharsData() {

        List<Map<String,String>> list = qualityRealTimeWarningDao.selectWarningEcharsData();


        List<Long> crew1topList = new ArrayList<Long>();
        List<Integer> crew1realList = new ArrayList<>();
        List<Long> crew1downList = new ArrayList<>();
        List<String> crew1nameList = new ArrayList<>();

        List<Long> crew2topList = new ArrayList<Long>();
        List<Integer> crew2realList = new ArrayList<>();
        List<Long> crew2downList = new ArrayList<>();
        List<String> crew2nameList = new ArrayList<>();

        Map<String,Object> map = new HashMap<>();


        for(int i = 0; i < list.size(); i++){

            int total = Math.round(Float.parseFloat(list.get(i).get("moudle_ratio"))) ;
            long upRatio = Math.round(total + (total*0.15));
            long downRatio = Math.round(total - (total*0.15));
            String  crewNum = String.valueOf(list.get(i).get("produce_crewNum")) ;

            if ( crewNum.equals("1") ){

                crew1nameList.add(list.get(i).get("material_name") );
                crew1topList.add(upRatio);
                crew1realList.add(Integer.parseInt(list.get(i).get("actual_ratio")));
                crew1downList.add(downRatio);

            }else {
                crew2nameList.add(list.get(i).get("material_name") );
                crew2topList.add(upRatio);
                crew2realList.add(Integer.parseInt(list.get(i).get("actual_ratio")));
                crew2downList.add(downRatio);
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
