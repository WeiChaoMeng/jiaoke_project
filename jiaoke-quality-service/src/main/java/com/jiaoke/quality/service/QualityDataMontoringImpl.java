/**
 * FileName: QualityDataMontoringImpl
 * author:   Melone
 * Date:     2018/10/12 16:23
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiake.utils.QualityDataMontoringUtil;
import com.jiake.utils.QualityGradingUtil;
import com.jiaoke.quality.dao.QualityDataMontoringDao;
import org.apache.logging.log4j.util.Strings;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/12 16:23
 * @Description:
 */
@Service
public class QualityDataMontoringImpl implements QualityDataMontoringInf {

    @Resource
    private QualityDataMontoringDao qualityDataMontoringDao;

    /**
     * 功能描述: <br>
     * <返回机组实时数据>
     *
     * @param
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/16 14:52
     */
    @Override
    public String selectProductionData() {

        List<Map<String, Object>> list = qualityDataMontoringDao.selectProductionData();
        //专门用来放骨料百分比
        List<Map<String, Object>> reList = new ArrayList<>();
        String str = "";

        String[] cloumName = {
                "material_stone_1",
                "material_stone_2",
                "material_asphalt",
                "material_regenerate",
                "material_additive"
        };

        if (null != list) {

            for(int i = 0; i < list.size(); i++) {

                Map<String,Object> m = list.get(i);
                reList.add(new HashMap<>());

               f1: for (String k : m.keySet()) {

                    //普通材料计算占比
                    for (int y = 0; y < cloumName.length;y++) {
                        if (k.equals(cloumName[y])) {
                            String date = String.valueOf(m.get(k));
                            if (Strings.isBlank(date) || "0".equals(date)) {
                                m.put(k, "0");
                            } else {
                                m.put(k, QualityDataMontoringUtil.calculateRatio(String.valueOf(m.get("material_total")), date));
                                continue f1;
                            }
                        }

                    }

                    //骨料为递增数，所以需要先减前面的总数，然后计算返回百分比
                    switch (k) {
                        case "material_aggregate_1":
                            Double material_aggregate_1_total = Double.parseDouble(String.valueOf(m.get(k)));
                            Double material_aggregate_1 = 0.0;
                            if (0.0 != material_aggregate_1_total) {
                                Double prev = Double.parseDouble(String.valueOf(m.get("material_aggregate_2")));
                                material_aggregate_1 = material_aggregate_1_total - prev;
                            }
                            String day = QualityDataMontoringUtil.calculateRatio(String.valueOf(m.get("material_total")), String.valueOf(material_aggregate_1));
                            reList.get(i).put(k, QualityDataMontoringUtil.calculateRatio(String.valueOf(m.get("material_total")), String.valueOf(material_aggregate_1)));
                            break;
                        case "material_aggregate_2":
                            Double data = Double.parseDouble(String.valueOf(m.get(k)));
                            Double material_aggregate_2 = 0.0;
                            if (0.0 != data) {
                                Double prev = Double.parseDouble(String.valueOf(m.get("material_aggregate_3")));
                                material_aggregate_2 = data - prev;
                            }
                            reList.get(i).put(k, QualityDataMontoringUtil.calculateRatio(String.valueOf(m.get("material_total")), String.valueOf(material_aggregate_2)));
                            break;
                        case "material_aggregate_3":
                            Double material_aggregate_3_total = Double.parseDouble(String.valueOf(m.get(k)));
                            Double material_aggregate_3 = 0.0;
                            if (0.0 != material_aggregate_3_total) {
                                Double prev = Double.parseDouble(String.valueOf(m.get("material_aggregate_4")));
                                material_aggregate_3 = material_aggregate_3_total - prev;
                            }
                            reList.get(i).put(k, QualityDataMontoringUtil.calculateRatio(String.valueOf(m.get("material_total")), String.valueOf(material_aggregate_3)));
                            break;
                        case "material_aggregate_4":
                            Double material_aggregate_4_total = Double.parseDouble(String.valueOf(m.get(k)));
                            Double material_aggregate_4 = 0.0;
                            if (0.0 != material_aggregate_4_total) {
                                Double prev = Double.parseDouble(String.valueOf(m.get("material_aggregate_5")));
                                material_aggregate_4 = material_aggregate_4_total - prev;
                            }
                            reList.get(i).put(k, QualityDataMontoringUtil.calculateRatio(String.valueOf(m.get("material_total")), String.valueOf(material_aggregate_4)));
                            break;
                        case "material_aggregate_5":
                            Double material_aggregate_5_total = Double.parseDouble(String.valueOf(m.get(k)));
                            Double material_aggregate_5 = 0.0;
                            if (0.0 != material_aggregate_5_total) {
                                Double prev = Double.parseDouble(String.valueOf(m.get("material_aggregate_6")));
                                material_aggregate_5 = material_aggregate_5_total - prev;
                            }
                            reList.get(i).put(k, QualityDataMontoringUtil.calculateRatio(String.valueOf(m.get("material_total")), String.valueOf(material_aggregate_5)));
                            break;
                        case "material_aggregate_6":
                            Double material_aggregate_6_total = Double.parseDouble(String.valueOf(m.get(k)));
                            reList.get(i).put(k, QualityDataMontoringUtil.calculateRatio(String.valueOf(m.get("material_total")), String.valueOf(material_aggregate_6_total)));
                            break;
                    }

                }
            }

            //遍历骨料百分比集合后替换到原来的集合
            for (int i = 0 ; i < reList.size();i++){
                for (String k : reList.get(i).keySet()){
                    list.get(i).put(k,reList.get(i).get(k));
                }
            }

            str = JSONArray.parseArray(JSONObject.toJSONString(list)).toString();
        }
        return str;
    }


    /**
     * 功能描述: <br>
     * <返回echars图表温度>
     *
     * @param
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/16 14:52
     */
    @Override
    public String getRealTimeDataEcharsTemp() {

        List<Map<String, String>> list = qualityDataMontoringDao.selectRealTimeDataEcharsTemp();

        if (null == list) {return null;}

        String jsonStr = JSONArray.parseArray(JSONObject.toJSONString(list)).toString();

        return jsonStr;

    }


    /**
     * 功能描述: <br>
     * <返回最新产品的材料数据，用于质量实时监控echars>
     *
     * @param
     * @return java.lang.String
     * @auther Melone
     * @date 2018/10/16 17:48
     */
    @Override
    public String getRealTimeDataEcharsMaterial() {

        List<Map<String, String>> list = qualityDataMontoringDao.selectRealTimeDataEcharsMaterial();
        //获取所有级配
        //返回的结果集 一层Key为机组 二层为模板级配等 三层Key为筛孔
        List<Map<String,Map<String,List<Map<String,String>>>>> result = new ArrayList<>();

        String resoult = QualityGradingUtil.getGradingResultJson(list,qualityDataMontoringDao,result);

        return resoult;

    }

    @Override
    public String getRealTimeThreeProductSVG() {

        List<Map<String,Object>> list =  qualityDataMontoringDao.selectRealTimeThreeProductSVG();

        return JSON.toJSONString(list);
    }
}
