/**
 * FileName: QualityGradingUtil
 * author:   Melone
 * Date:     2019/1/18 14:37
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiake.utils;

import com.alibaba.fastjson.JSON;
import com.jiaoke.quality.dao.QualityDataMontoringDao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/1/18 14:37
 * @Description:
 */
public class QualityGradingUtil {

    public synchronized static  String  getGradingResultJson(List<Map<String, String>> list , QualityDataMontoringDao qualityDataMontoringDao, List<Map<String,Map<String,List<Map<String,String>>>>> result){

        for (int i = 0; i < list.size();i++){
            //创建相关map存放数据
            Map<String,Map<String, List<Map<String,String>>>> crewMap = new HashMap<>();
            Map<String,List<Map<String,String>>> moudelMap = new HashMap<>();
            List<Map<String,String>> moudleList  = new ArrayList<>();
            List<Map<String,String>> upList  = new ArrayList<>();
            List<Map<String,String>> downList  = new ArrayList<>();
            List<Map<String,String>> midList  = new ArrayList<>();
            List<Map<String,String>> realList  = new ArrayList<>();
            String crewNum = list.get(i).get("crewNum");

            crewMap.put(crewNum,moudelMap);

            crewMap.get(crewNum).put("moudleList",moudleList);
            crewMap.get(crewNum).put("upList",upList);
            crewMap.get(crewNum).put("downList",downList);
            crewMap.get(crewNum).put("midList",midList);
            crewMap.get(crewNum).put("realList",realList);


            String rationNum = String.valueOf(list.get(i).get("produce_proportioning_num"));
            String aggregate10 = String.valueOf(list.get(i).get("material_aggregate_10"));
            String aggregate9 = String.valueOf(list.get(i).get("material_aggregate_9"));
            String aggregate8 = String.valueOf(list.get(i).get("material_aggregate_8"));
            String aggregate7 = String.valueOf(list.get(i).get("material_aggregate_7"));
            String aggregate6 = String.valueOf(list.get(i).get("material_aggregate_6"));
            String aggregate5 = String.valueOf(list.get(i).get("material_aggregate_5"));
            String aggregate4 = String.valueOf(list.get(i).get("material_aggregate_4"));
            String aggregate3 = String.valueOf(list.get(i).get("material_aggregate_3"));
            String aggregate2 = String.valueOf(list.get(i).get("material_aggregate_2"));
            String aggregate1 = String.valueOf(list.get(i).get("material_aggregate_1"));
            String stone1 = String.valueOf(list.get(i).get("material_stone_1"));
            String stone2 = String.valueOf(list.get(i).get("material_stone_2"));
            String stone3 = String.valueOf(list.get(i).get("material_stone_3"));
            String stone4 = String.valueOf(list.get(i).get("material_stone_4"));
            String stone = Float.parseFloat(stone1) > Float.parseFloat(stone2)? stone1:stone2;
            String regenerate = String.valueOf(list.get(i).get("material_regenerate"));
            String additive = String.valueOf(list.get(i).get("material_additive"));
            String additive1 = String.valueOf(list.get(i).get("material_additive_1"));
            String additive2 = String.valueOf(list.get(i).get("material_additive_2"));
            String additive3 = String.valueOf(list.get(i).get("material_additive_3"));


            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String proDate;
            try{
                proDate = sdf.format(list.get(i).get("produce_date"));
            }catch (Exception e){
                proDate = list.get(i).get("produce_date");
            }


            //获取 级配比
            List<Map<String,String>> gradingList =  qualityDataMontoringDao.selectGradingBycrewNumAndRationNum(crewNum,rationNum,proDate);


            //取出粗的再生，中的再生、细的再生，添加剂 通知单配比
            String regenerateRoughRation = String.valueOf(list.get(i).get("ratio_regenerate1"));
            String regenerateMiddleRation = String.valueOf(list.get(i).get("ratio_regenerate3"));
            String regenerateThinRation = String.valueOf(list.get(i).get("ratio_regenerate2"));
            String additiveRation = String.valueOf(list.get(i).get("ratio_additive"));


            //计算矿料总量
            float breezeTotal;
            float regenerateRough = 0;
            float regenerateMiddle = 0;
            float regenerateThin = 0;
            float regenerateRationCondition = Float.parseFloat(regenerateRoughRation) + Float.parseFloat(regenerateMiddleRation) + Float.parseFloat(regenerateThinRation);
            if (regenerateRationCondition > 0){
               regenerateRough = Float.parseFloat(regenerate)/regenerateRationCondition*Float.parseFloat(regenerateRoughRation);
               regenerateMiddle = Float.parseFloat(regenerate)/regenerateRationCondition*Float.parseFloat(regenerateMiddleRation);
               regenerateThin = Float.parseFloat(regenerate)/regenerateRationCondition * Float.parseFloat(regenerateThinRation);
            }

            float additiveGrading = Float.parseFloat(additive);
            float additive1Grading = Float.parseFloat(additive1);
            float additive2Grading = Float.parseFloat(additive2);
            float additive3Grading = Float.parseFloat(additive3);

            breezeTotal = Float.parseFloat(aggregate1) + Float.parseFloat(stone) + regenerateRough + regenerateMiddle + regenerateThin + Float.parseFloat(additive) + Float.parseFloat(additive1) + Float.parseFloat(additive2) + Float.parseFloat(additive3);

            //计算实际配合比
            float aggregate10Real = Float.parseFloat(aggregate10)/breezeTotal;
            float aggregate9Real = (Float.parseFloat(aggregate9) - Float.parseFloat(aggregate10))/breezeTotal;
            float aggregate8Real = (Float.parseFloat(aggregate8) - Float.parseFloat(aggregate9))/breezeTotal;
            float aggregate7Real = (Float.parseFloat(aggregate7) - Float.parseFloat(aggregate8))/breezeTotal;
            float aggregate6Real = (Float.parseFloat(aggregate6) - Float.parseFloat(aggregate7))/breezeTotal;
            float aggregate5Real = (Float.parseFloat(aggregate5) - Float.parseFloat(aggregate6))/breezeTotal;
            float aggregate4Real = (Float.parseFloat(aggregate4) - Float.parseFloat(aggregate5))/breezeTotal;
            float aggregate3Real = (Float.parseFloat(aggregate3) - Float.parseFloat(aggregate4))/breezeTotal;
            float aggregate2Real = (Float.parseFloat(aggregate2) - Float.parseFloat(aggregate3))/breezeTotal;
            float aggregate1Real = (Float.parseFloat(aggregate1) - Float.parseFloat(aggregate2))/breezeTotal;
            float stone1Real =  Float.parseFloat(stone1)/breezeTotal;
            float stone2Real =  Float.parseFloat(stone2)/breezeTotal;
            float stone3Real =  Float.parseFloat(stone3)/breezeTotal;
            float stone4Real =  Float.parseFloat(stone4)/breezeTotal;
            float stoneReal =  Float.parseFloat(stone)/breezeTotal;
            float regenerateRoughReal = regenerateRough/breezeTotal;
            float regenerateMiddleReal = regenerateMiddle/breezeTotal;
            float regenerateThinReal = regenerateThin/breezeTotal;
            float additiveReal = additiveGrading/breezeTotal;
            float additive1Real = additive1Grading/breezeTotal;
            float additive2Real = additive2Grading/breezeTotal;
            float additive3Real = additive3Grading/breezeTotal;

            //取出各筛孔及材料的比计算合成级配
            for (int j = 0; j < gradingList.size();j++){

                String sieveDiameter = String.valueOf(gradingList.get(j).get("sieve_diameter_grading"));
                String repertoryTen = String.valueOf(gradingList.get(j).get("repertory_Ten_grading"));
                String repertoryNine = String.valueOf(gradingList.get(j).get("repertory_nine_grading"));
                String repertoryEight = String.valueOf(gradingList.get(j).get("repertory_eight_grading"));
                String repertorySeven = String.valueOf(gradingList.get(j).get("repertory_seven_grading"));
                String repertorySix = String.valueOf(gradingList.get(j).get("repertory_six_grading"));
                String repertoryFive = String.valueOf(gradingList.get(j).get("repertory_five_grading"));
                String repertoryFour = String.valueOf(gradingList.get(j).get("repertory_four_grading"));
                String repertoryThree = String.valueOf(gradingList.get(j).get("repertory_three_grading"));
                String repertoryTwo = String.valueOf(gradingList.get(j).get("repertory_two_grading"));
                String repertoryOne = String.valueOf(gradingList.get(j).get("repertory_one_grading"));
                String breeze1Grading = String.valueOf(gradingList.get(j).get("breeze1_grading"));
                String breeze2Grading = String.valueOf(gradingList.get(j).get("breeze2_grading"));
                String breeze3Grading = String.valueOf(gradingList.get(j).get("breeze3_grading"));
                String breeze4Grading = String.valueOf(gradingList.get(j).get("breeze4_grading"));
                String roughRegenerate = String.valueOf(gradingList.get(j).get("rough_regenerate_grading"));
                String middleRegenerate = String.valueOf(gradingList.get(j).get("middle_regenerate_grading"));
                String thinRegenerate = String.valueOf(gradingList.get(j).get("thin_regenerate_grading"));
                String additive1G = String.valueOf(gradingList.get(j).get("additive1_grading"));
                String additive2G = String.valueOf(gradingList.get(j).get("additive2_grading"));
                String additive3G = String.valueOf(gradingList.get(j).get("additive3_grading"));
                String additive4G = String.valueOf(gradingList.get(j).get("additive4_grading"));

                //取出模板级配、上限、下限、中值等
                String moudleGrading = String.valueOf(gradingList.get(j).get("synthesis_grading"));
                String upGrading = String.valueOf(gradingList.get(j).get("up_value"));
                String downGrading = String.valueOf(gradingList.get(j).get("down_value"));
                String midGrading = String.valueOf(gradingList.get(j).get("mid_value"));


                //计算实际级配
                float repertory10 =  aggregate10Real*Float.parseFloat(repertoryTen);
                float repertory9 =  aggregate9Real*Float.parseFloat(repertoryNine);
                float repertory8 =  aggregate8Real*Float.parseFloat(repertoryEight);
                float repertory7 =  aggregate7Real*Float.parseFloat(repertorySeven);
                float repertory6 =  aggregate6Real*Float.parseFloat(repertorySix);
                float repertory5 =  aggregate5Real*Float.parseFloat(repertoryFive);
                float repertory4 =  aggregate4Real*Float.parseFloat(repertoryFour);
                float repertory3 =  aggregate3Real*Float.parseFloat(repertoryThree);
                float repertory2 =  aggregate2Real*Float.parseFloat(repertoryTwo);
                float repertory1 =  aggregate1Real*Float.parseFloat(repertoryOne);
                float breeze1 =  stone1Real*Float.parseFloat(breeze1Grading);
                float breeze2 =  stone2Real*Float.parseFloat(breeze2Grading);
                float breeze3 =  stone3Real*Float.parseFloat(breeze3Grading);
                float breeze4 =  stone4Real*Float.parseFloat(breeze4Grading);
                float roughRegenerate1 =  regenerateRoughReal*Float.parseFloat(roughRegenerate);
                float midRegenerate1 =  regenerateMiddleReal*Float.parseFloat(middleRegenerate);
                float thinRegenerate1 =  regenerateThinReal*Float.parseFloat(thinRegenerate);
                float additiveG1 =  additiveReal*Float.parseFloat(additive1G);
                float additiveG2 =  additive1Real*Float.parseFloat(additive2G);
                float additiveG3 =  additive2Real*Float.parseFloat(additive3G);
                float additiveG4 =  additive3Real*Float.parseFloat(additive4G);

                Float realGrading = repertory10 + repertory9 + repertory8 + repertory7 + repertory6 + repertory5 + repertory4 + repertory3 + repertory2 + repertory1 + breeze1 + breeze2 + breeze3 + breeze4  + roughRegenerate1 + midRegenerate1 +  thinRegenerate1 + additiveG1 + additiveG2 + additiveG3 + additiveG4;

                //添加真实级配
                Map<String,String> map = new HashMap<>();
                map.put(sieveDiameter,String.valueOf(realGrading));
                //添加模板级配
                Map<String,String> moudel = new HashMap<>();
                moudel.put(sieveDiameter,moudleGrading);
                //添加上限级配
                Map<String,String> up = new HashMap<>();
                up.put(sieveDiameter,upGrading);
                //添加模板级配
                Map<String,String> down = new HashMap<>();
                down.put(sieveDiameter,downGrading);
                //添加模板级配
                Map<String,String> sid = new HashMap<>();
                sid.put(sieveDiameter,midGrading);

                crewMap.get(crewNum).get("realList").add(map);
                crewMap.get(crewNum).get("upList").add(up);
                crewMap.get(crewNum).get("downList").add(down);
                crewMap.get(crewNum).get("midList").add(sid);
                crewMap.get(crewNum).get("moudleList").add(moudel);

            }

            result.add(crewMap);
        }

        return JSON.toJSONString(result);
    }

    public synchronized static  String  getModelGradingResultJson(List<Map<String, String>> list , QualityDataMontoringDao qualityDataMontoringDao, List<Map<String,Map<String,List<Map<String,String>>>>> result){

        for (int i = 0; i < list.size();i++){
            //创建相关map存放数据
            Map<String,Map<String, List<Map<String,String>>>> crewMap = new HashMap<>();
            Map<String,List<Map<String,String>>> moudelMap = new HashMap<>();
            List<Map<String,String>> moudleList  = new ArrayList<>();
            List<Map<String,String>> upList  = new ArrayList<>();
            List<Map<String,String>> downList  = new ArrayList<>();
            List<Map<String,String>> midList  = new ArrayList<>();
            List<Map<String,String>> realList  = new ArrayList<>();
            String crewNum = list.get(i).get("crewNum");

            String rationNum = String.valueOf(list.get(i).get("produce_proportioning_num"));
            String aggregate10 = String.valueOf(list.get(i).get("material_aggregate_10"));
            String aggregate9 = String.valueOf(list.get(i).get("material_aggregate_9"));
            String aggregate8 = String.valueOf(list.get(i).get("material_aggregate_8"));
            String aggregate7 = String.valueOf(list.get(i).get("material_aggregate_7"));
            String aggregate6 = String.valueOf(list.get(i).get("material_aggregate_6"));
            String aggregate5 = String.valueOf(list.get(i).get("material_aggregate_5"));
            String aggregate4 = String.valueOf(list.get(i).get("material_aggregate_4"));
            String aggregate3 = String.valueOf(list.get(i).get("material_aggregate_3"));
            String aggregate2 = String.valueOf(list.get(i).get("material_aggregate_2"));
            String aggregate1 = String.valueOf(list.get(i).get("material_aggregate_1"));
            String stone1 = String.valueOf(list.get(i).get("material_stone_1"));
            String stone2 = String.valueOf(list.get(i).get("material_stone_2"));
            String stone3 = String.valueOf(list.get(i).get("material_stone_3"));
            String stone4 = String.valueOf(list.get(i).get("material_stone_4"));
            String stone = Float.parseFloat(stone1) > Float.parseFloat(stone2)? stone1:stone2;
            String regenerate = String.valueOf(list.get(i).get("material_regenerate"));
            String additive = String.valueOf(list.get(i).get("material_additive"));
            String additive1 = String.valueOf(list.get(i).get("material_additive_1"));
            String additive2 = String.valueOf(list.get(i).get("material_additive_2"));
            String additive3 = String.valueOf(list.get(i).get("material_additive_3"));


            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String proDate;
            try{
                proDate = sdf.format(list.get(i).get("produce_date"));
            }catch (Exception e){
                proDate = list.get(i).get("produce_date");
            }


            crewMap.put(rationNum,moudelMap);

            crewMap.get(rationNum).put("moudleList",moudleList);
            crewMap.get(rationNum).put("upList",upList);
            crewMap.get(rationNum).put("downList",downList);
            crewMap.get(rationNum).put("midList",midList);
            crewMap.get(rationNum).put("realList",realList);


            //获取 级配比
            List<Map<String,String>> gradingList =  qualityDataMontoringDao.selectGradingBycrewNumAndRationNum(crewNum,rationNum,proDate);


            //取出粗的再生regenerate1，细的再生regenerate2，中是regenerate1 添加剂 通知单配比
            String regenerateRoughRation = String.valueOf(list.get(i).get("ratio_regenerate1"));
            String regenerateMiddleRation = String.valueOf(list.get(i).get("ratio_regenerate3"));
            String regenerateThinRation = String.valueOf(list.get(i).get("ratio_regenerate2"));
            String additiveRation = String.valueOf(list.get(i).get("ratio_additive"));


            //计算矿料总量
            float breezeTotal;
            float regenerateRough = 0;
            float regenerateMiddle = 0;
            float regenerateThin = 0;
            float regenerateRationCondition = Float.parseFloat(regenerateRoughRation) + Float.parseFloat(regenerateThinRation)+ Float.parseFloat(regenerateMiddleRation);
            if (regenerateRationCondition > 0){
                regenerateRough = Float.parseFloat(regenerate)/regenerateRationCondition*Float.parseFloat(regenerateRoughRation);
                regenerateMiddle = Float.parseFloat(regenerate)/regenerateRationCondition*Float.parseFloat(regenerateMiddleRation);
                regenerateThin = Float.parseFloat(regenerate)/regenerateRationCondition * Float.parseFloat(regenerateThinRation);
            }

            float additiveGrading = Float.parseFloat(additive);
            float additive1Grading = Float.parseFloat(additive1);
            float additive2Grading = Float.parseFloat(additive2);
            float additive3Grading = Float.parseFloat(additive3);

            breezeTotal = Float.parseFloat(aggregate1) + Float.parseFloat(stone) + regenerateRough + regenerateMiddle + regenerateThin + Float.parseFloat(additive) + Float.parseFloat(additive1) + Float.parseFloat(additive2) + Float.parseFloat(additive3);

            //计算实际配合比
            float aggregate10Real = Float.parseFloat(aggregate10)/breezeTotal;
            float aggregate9Real = (Float.parseFloat(aggregate9) - Float.parseFloat(aggregate10))/breezeTotal;
            float aggregate8Real = (Float.parseFloat(aggregate8) - Float.parseFloat(aggregate9))/breezeTotal;
            float aggregate7Real = (Float.parseFloat(aggregate7) - Float.parseFloat(aggregate8))/breezeTotal;
            float aggregate6Real = (Float.parseFloat(aggregate6) - Float.parseFloat(aggregate7))/breezeTotal;
            float aggregate5Real = (Float.parseFloat(aggregate5) - Float.parseFloat(aggregate6))/breezeTotal;
            float aggregate4Real = (Float.parseFloat(aggregate4) - Float.parseFloat(aggregate5))/breezeTotal;
            float aggregate3Real = (Float.parseFloat(aggregate3) - Float.parseFloat(aggregate4))/breezeTotal;
            float aggregate2Real = (Float.parseFloat(aggregate2) - Float.parseFloat(aggregate3))/breezeTotal;
            float aggregate1Real = (Float.parseFloat(aggregate1) - Float.parseFloat(aggregate2))/breezeTotal;
            float stone1Real =  Float.parseFloat(stone1)/breezeTotal;
            float stone2Real =  Float.parseFloat(stone2)/breezeTotal;
            float stone3Real =  Float.parseFloat(stone3)/breezeTotal;
            float stone4Real =  Float.parseFloat(stone4)/breezeTotal;
            float stoneReal =  Float.parseFloat(stone)/breezeTotal;
            float regenerateRoughReal = regenerateRough/breezeTotal;
            float regenerateMiddleReal = regenerateMiddle/breezeTotal;
            float regenerateThinReal = regenerateThin/breezeTotal;
            float additiveReal = additiveGrading/breezeTotal;
            float additive1Real = additive1Grading/breezeTotal;
            float additive2Real = additive2Grading/breezeTotal;
            float additive3Real = additive3Grading/breezeTotal;

            //取出各筛孔及材料的比计算合成级配
            for (int j = 0; j < gradingList.size();j++){

                String sieveDiameter = String.valueOf(gradingList.get(j).get("sieve_diameter_grading"));
                String repertoryTen = String.valueOf(gradingList.get(j).get("repertory_Ten_grading"));
                String repertoryNine = String.valueOf(gradingList.get(j).get("repertory_nine_grading"));
                String repertoryEight = String.valueOf(gradingList.get(j).get("repertory_eight_grading"));
                String repertorySeven = String.valueOf(gradingList.get(j).get("repertory_seven_grading"));
                String repertorySix = String.valueOf(gradingList.get(j).get("repertory_six_grading"));
                String repertoryFive = String.valueOf(gradingList.get(j).get("repertory_five_grading"));
                String repertoryFour = String.valueOf(gradingList.get(j).get("repertory_four_grading"));
                String repertoryThree = String.valueOf(gradingList.get(j).get("repertory_three_grading"));
                String repertoryTwo = String.valueOf(gradingList.get(j).get("repertory_two_grading"));
                String repertoryOne = String.valueOf(gradingList.get(j).get("repertory_one_grading"));
                String breeze1Grading = String.valueOf(gradingList.get(j).get("breeze1_grading"));
                String breeze2Grading = String.valueOf(gradingList.get(j).get("breeze2_grading"));
                String breeze3Grading = String.valueOf(gradingList.get(j).get("breeze3_grading"));
                String breeze4Grading = String.valueOf(gradingList.get(j).get("breeze4_grading"));
                String roughRegenerate = String.valueOf(gradingList.get(j).get("rough_regenerate_grading"));
                String middleRegenerate = String.valueOf(gradingList.get(j).get("middle_regenerate_grading"));
                String thinRegenerate = String.valueOf(gradingList.get(j).get("thin_regenerate_grading"));
                String additive1G = String.valueOf(gradingList.get(j).get("additive1_grading"));
                String additive2G = String.valueOf(gradingList.get(j).get("additive2_grading"));
                String additive3G = String.valueOf(gradingList.get(j).get("additive3_grading"));
                String additive4G = String.valueOf(gradingList.get(j).get("additive4_grading"));

                //取出模板级配、上限、下限、中值等
                String moudleGrading = String.valueOf(gradingList.get(j).get("synthesis_grading"));
                String upGrading = String.valueOf(gradingList.get(j).get("up_value"));
                String downGrading = String.valueOf(gradingList.get(j).get("down_value"));
                String midGrading = String.valueOf(gradingList.get(j).get("mid_value"));


                //计算实际级配
                float repertory10 =  aggregate10Real*Float.parseFloat(repertoryTen);
                float repertory9 =  aggregate9Real*Float.parseFloat(repertoryNine);
                float repertory8 =  aggregate8Real*Float.parseFloat(repertoryEight);
                float repertory7 =  aggregate7Real*Float.parseFloat(repertorySeven);
                float repertory6 =  aggregate6Real*Float.parseFloat(repertorySix);
                float repertory5 =  aggregate5Real*Float.parseFloat(repertoryFive);
                float repertory4 =  aggregate4Real*Float.parseFloat(repertoryFour);
                float repertory3 =  aggregate3Real*Float.parseFloat(repertoryThree);
                float repertory2 =  aggregate2Real*Float.parseFloat(repertoryTwo);
                float repertory1 =  aggregate1Real*Float.parseFloat(repertoryOne);
                float breeze1 =  stone1Real*Float.parseFloat(breeze1Grading);
                float breeze2 =  stone2Real*Float.parseFloat(breeze2Grading);
                float breeze3 =  stone3Real*Float.parseFloat(breeze3Grading);
                float breeze4 =  stone4Real*Float.parseFloat(breeze4Grading);
                float roughRegenerate1 =  regenerateRoughReal*Float.parseFloat(roughRegenerate);
                float midRegenerate1 =  regenerateMiddleReal*Float.parseFloat(middleRegenerate);
                float thinRegenerate1 =  regenerateThinReal*Float.parseFloat(thinRegenerate);
                float additiveG1 =  additiveReal*Float.parseFloat(additive1G);
                float additiveG2 =  additive1Real*Float.parseFloat(additive2G);
                float additiveG3 =  additive2Real*Float.parseFloat(additive3G);
                float additiveG4 =  additive3Real*Float.parseFloat(additive4G);

                Float realGrading = repertory10 + repertory9 + repertory8 + repertory7 + repertory6 + repertory5 + repertory4 + repertory3 + repertory2 + repertory1 + breeze1 + breeze2 + breeze3 + breeze4  + roughRegenerate1 + midRegenerate1 +  thinRegenerate1 + additiveG1 + additiveG2 + additiveG3 + additiveG4;

                //添加真实级配
                Map<String,String> map = new HashMap<>();
                map.put(sieveDiameter,String.valueOf(realGrading));
                //添加模板级配
                Map<String,String> moudel = new HashMap<>();
                moudel.put(sieveDiameter,moudleGrading);
                //添加上限级配
                Map<String,String> up = new HashMap<>();
                up.put(sieveDiameter,upGrading);
                //添加模板级配
                Map<String,String> down = new HashMap<>();
                down.put(sieveDiameter,downGrading);
                //添加模板级配
                Map<String,String> sid = new HashMap<>();
                sid.put(sieveDiameter,midGrading);

                crewMap.get(rationNum).get("realList").add(map);
                crewMap.get(rationNum).get("upList").add(up);
                crewMap.get(rationNum).get("downList").add(down);
                crewMap.get(rationNum).get("midList").add(sid);
                crewMap.get(rationNum).get("moudleList").add(moudel);

            }

            result.add(crewMap);
        }

        return JSON.toJSONString(result);
    }

}
