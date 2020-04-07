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
import com.jiake.utils.QualityGradingUtil;
import com.jiake.utils.QualityProsvg;
import com.jiaoke.quality.dao.QualityDataMontoringDao;
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
    @Resource
    QualityDataMontoringDao qualityDataMontoringDao;
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

        long startTime = System.currentTimeMillis();
        List<Map<String,String>> list = qualityRealTimeWarningDao.selectLastWarningData();

        List<Map<String,String>> avgList = qualityRealTimeWarningDao.selectThreeWarningData();
        if (!list.isEmpty() || !avgList.isEmpty()){
            for (int i = 0; i < list.size(); i++){
                for (int j = 0; j < avgList.size(); j++){
                    if (list.get(i).get("produce_crewNum") == avgList.get(j).get("produce_crewNum")){
                        if (list.get(i).get("material_name").equals(avgList.get(j).get("material_name"))){
                            list.get(i).putAll(avgList.get(j));
                            break;
                        }else {
                            continue;
                        }
                    }else {
                        continue;
                    }
                }
            }
        }


        String str = "";
        if (list != null){
             str = JSONArray.parseArray(JSONObject.toJSONString(list)).toString();
        }
        long endTime = System.currentTimeMillis();

        System.out.println("程序运行时间：" + (endTime - startTime) + "ms");

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

        List<Map<String,Object>> list = qualityRealTimeWarningDao.selectWarningEcharsData();

        String resoult ="";

        //分解出两个机组的数据
        List<Map<String,Object>> crew1List = new ArrayList<>();
        List<Map<String,Object>> crew2List = new ArrayList<>();

        if (list.isEmpty()){
            Map<String,String> map = new HashMap<>();
            map.put("message","fail");
            resoult = JSON.toJSONString(map);
        }else {
            for (int i = 0; i < list.size();i++){
                if ("crew1".equals(list.get(i).get("crewNum"))){
                    crew1List.add(list.get(i));
                }else {
                    crew2List.add(list.get(i));
                }
            }

            Map<String, String> crew1SvgList = QualityProsvg.getProsvgByProList(crew1List);
            Map<String, String> crew2SvgList = QualityProsvg.getProsvgByProList(crew2List);

            List<Map<String,String>> list1 = new ArrayList<>();
            list1.add(crew1SvgList);
            list1.add(crew2SvgList);

            //返回的结果集 一层Key为机组 二层为模板级配等 三层Key为筛孔
            List<Map<String,Map<String,List<Map<String,String>>>>> result = new ArrayList<>();

             resoult = QualityGradingUtil.getGradingResultJson(list1,qualityDataMontoringDao,result);
        }
        return  resoult ;
    }

    @Override
    public String getGlobalWarningData() {

        List<Map<String,Object>> list = qualityRealTimeWarningDao.selectGlobalWarningData();


        return JSON.toJSONString(list);
    }

    @Override
    public Map<String, Object> getWarningLevelData() {
        Map<String,Object> map = new HashMap<>();
        List<Map<String,String>> list = qualityRealTimeWarningDao.selectWarningLevelData();
        if (null == list || list.isEmpty()){
            map.put("code",0);
            map.put("msg","当前无预设预警级别");
            map.put("count",0);
            return map;
        }
        map.put("code",0);
        map.put("msg","查询成果");
        map.put("count",list.size());
        map.put("data",list);
        return map;
    }

    @Override
    public Map<String, Object> editWarningLevel(String warningData) {
        Map<String,Object> map = new HashMap<>();
        int tem = 0;

        try {
            List<Map<String,String>>  list = (List<Map<String,String>>) JSONArray.parse(warningData);

            for (int i = 0; i < list.size();i++){
                tem = qualityRealTimeWarningDao.updataWarningLevel(list.get(i));
            }

        }catch (Exception e){
            map.put("message","error");
            e.printStackTrace();
        }

        if (tem > 0){
            map.put("message","success");
        }else {
            map.put("message","fail");
        }

        return map;
    }
}
