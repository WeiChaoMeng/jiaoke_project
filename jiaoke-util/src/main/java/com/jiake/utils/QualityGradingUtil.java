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
import java.util.*;

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
            String stone1;
            double stoneOne = Double.parseDouble(String.valueOf(list.get(i).get("material_stone_1")));
            double stoneTwo = Double.parseDouble(String.valueOf(list.get(i).get("material_stone_2")));
            stone1 =  stoneOne > 0 ? String.valueOf(stoneOne - stoneTwo):"0";
            String stone2;
            double stoneThree = Double.parseDouble(String.valueOf(list.get(i).get("material_stone_3")));
            stone2 =  stoneTwo > 0 ? String.valueOf(stoneTwo - stoneThree):"0";
            String stone3;
            double stoneFour = Double.parseDouble(String.valueOf(list.get(i).get("material_stone_4")));
            stone3 =  stoneThree > 0 ? String.valueOf(stoneThree - stoneFour):"0";
            String stone4 = String.valueOf(list.get(i).get("material_stone_4"));
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

            breezeTotal = Float.parseFloat(aggregate1) + Float.parseFloat(stone1) + Float.parseFloat(stone2) + Float.parseFloat(stone3) + Float.parseFloat(stone4) + regenerateRough + regenerateMiddle + regenerateThin + Float.parseFloat(additive) + Float.parseFloat(additive1) + Float.parseFloat(additive2) + Float.parseFloat(additive3);

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
            float regenerateRoughReal = regenerateRough/breezeTotal;
            float regenerateMiddleReal = regenerateMiddle/breezeTotal;
            float regenerateThinReal = regenerateThin/breezeTotal;
            float additiveReal = additiveGrading/breezeTotal;
            float additive1Real = additive1Grading/breezeTotal;
            float additive2Real = additive2Grading/breezeTotal;
            float additive3Real = additive3Grading/breezeTotal;

            //取出各筛孔及材料的比计算合成级配
            for (int k = 0; k < gradingList.size();k++){

                String sieveDiameter = String.valueOf(gradingList.get(k).get("sieve_diameter_grading"));
                String repertoryTen = String.valueOf(gradingList.get(k).get("repertory_ten_grading"));
                String repertoryNine = String.valueOf(gradingList.get(k).get("repertory_nine_grading"));
                String repertoryEight = String.valueOf(gradingList.get(k).get("repertory_eight_grading"));
                String repertorySeven = String.valueOf(gradingList.get(k).get("repertory_seven_grading"));
                String repertorySix = String.valueOf(gradingList.get(k).get("repertory_six_grading"));
                String repertoryFive = String.valueOf(gradingList.get(k).get("repertory_five_grading"));
                String repertoryFour = String.valueOf(gradingList.get(k).get("repertory_four_grading"));
                String repertoryThree = String.valueOf(gradingList.get(k).get("repertory_three_grading"));
                String repertoryTwo = String.valueOf(gradingList.get(k).get("repertory_two_grading"));
                String repertoryOne = String.valueOf(gradingList.get(k).get("repertory_one_grading"));
                String breeze1Grading = String.valueOf(gradingList.get(k).get("breeze1_grading"));
                String breeze2Grading = String.valueOf(gradingList.get(k).get("breeze2_grading"));
                String breeze3Grading = String.valueOf(gradingList.get(k).get("breeze3_grading"));
                String breeze4Grading = String.valueOf(gradingList.get(k).get("breeze4_grading"));
                String roughRegenerate = String.valueOf(gradingList.get(k).get("rough_regenerate_grading"));
                String middleRegenerate = String.valueOf(gradingList.get(k).get("middle_regenerate_grading"));
                String thinRegenerate = String.valueOf(gradingList.get(k).get("thin_regenerate_grading"));
                String additive1G = String.valueOf(gradingList.get(k).get("additive1_grading"));
                String additive2G = String.valueOf(gradingList.get(k).get("additive2_grading"));
                String additive3G = String.valueOf(gradingList.get(k).get("additive3_grading"));
                String additive4G = String.valueOf(gradingList.get(k).get("additive4_grading"));

                //取出模板级配、上限、下限、中值等
                String moudleGrading = String.valueOf(gradingList.get(k).get("synthesis_grading"));
                String upGrading = String.valueOf(gradingList.get(k).get("up_value"));
                String downGrading = String.valueOf(gradingList.get(k).get("down_value"));
                String midGrading = String.valueOf(gradingList.get(k).get("mid_value"));


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
                float breeze1 = 0;
                float breeze2 = 0;
                float breeze3 = 0;
                float breeze4 = 0;
                //判断矿粉2、是否有值、如果矿粉2没有值，取矿粉总量除以矿粉1级配
                if (Float.parseFloat(breeze2Grading) <= 0){
                    float breeze = stone1Real  + stone2Real + stone3Real + stone4Real;
                    breeze1 = breeze*Float.parseFloat(breeze1Grading);
                }else {
                    breeze1 =  stone1Real*Float.parseFloat(breeze1Grading);
                    breeze2 =  stone2Real*Float.parseFloat(breeze2Grading);
                    breeze3 =  stone3Real*Float.parseFloat(breeze3Grading);
                    breeze4 =  stone4Real*Float.parseFloat(breeze4Grading);
                }
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

            breezeTotal = Float.parseFloat(aggregate1)
                    +Float.parseFloat(aggregate2)
                    +Float.parseFloat(aggregate3)
                    +Float.parseFloat(aggregate4)
                    +Float.parseFloat(aggregate5)
                    +Float.parseFloat(aggregate6)
                    +Float.parseFloat(aggregate7)
                    +Float.parseFloat(aggregate8)
                    +Float.parseFloat(aggregate9)
                    +Float.parseFloat(aggregate10)
                    + Float.parseFloat(stone1)
                    + Float.parseFloat(stone2)
                    + Float.parseFloat(stone3)
                    + Float.parseFloat(stone4)
                    + regenerateRough
                    + regenerateMiddle
                    + regenerateThin
                    + Float.parseFloat(additive)
                    + Float.parseFloat(additive1)
                    + Float.parseFloat(additive2)
                    + Float.parseFloat(additive3);

            //计算实际配合比
            float aggregate10Real = Float.parseFloat(aggregate10)/breezeTotal;
            float aggregate9Real = (Float.parseFloat(aggregate9))/breezeTotal;
            float aggregate8Real = (Float.parseFloat(aggregate8))/breezeTotal;
            float aggregate7Real = (Float.parseFloat(aggregate7))/breezeTotal;
            float aggregate6Real = (Float.parseFloat(aggregate6))/breezeTotal;
            float aggregate5Real = (Float.parseFloat(aggregate5))/breezeTotal;
            float aggregate4Real = (Float.parseFloat(aggregate4))/breezeTotal;
            float aggregate3Real = (Float.parseFloat(aggregate3))/breezeTotal;
            float aggregate2Real = (Float.parseFloat(aggregate2))/breezeTotal;
            float aggregate1Real = (Float.parseFloat(aggregate1))/breezeTotal;
            float stone1Real =  Float.parseFloat(stone1)/breezeTotal;
            float stone2Real =  Float.parseFloat(stone2)/breezeTotal;
            float stone3Real =  Float.parseFloat(stone3)/breezeTotal;
            float stone4Real =  Float.parseFloat(stone4)/breezeTotal;
            float regenerateRoughReal = regenerateRough/breezeTotal;
            float regenerateMiddleReal = regenerateMiddle/breezeTotal;
            float regenerateThinReal = regenerateThin/breezeTotal;
            float additiveReal = additiveGrading/breezeTotal;
            float additive1Real = additive1Grading/breezeTotal;
            float additive2Real = additive2Grading/breezeTotal;
            float additive3Real = additive3Grading/breezeTotal;

            //取出各筛孔及材料的比计算合成级配
            for (int k = 0; k < gradingList.size();k++){

                String sieveDiameter = String.valueOf(gradingList.get(k).get("sieve_diameter_grading"));
                String repertoryTen = String.valueOf(gradingList.get(k).get("repertory_ten_grading"));
                String repertoryNine = String.valueOf(gradingList.get(k).get("repertory_nine_grading"));
                String repertoryEight = String.valueOf(gradingList.get(k).get("repertory_eight_grading"));
                String repertorySeven = String.valueOf(gradingList.get(k).get("repertory_seven_grading"));
                String repertorySix = String.valueOf(gradingList.get(k).get("repertory_six_grading"));
                String repertoryFive = String.valueOf(gradingList.get(k).get("repertory_five_grading"));
                String repertoryFour = String.valueOf(gradingList.get(k).get("repertory_four_grading"));
                String repertoryThree = String.valueOf(gradingList.get(k).get("repertory_three_grading"));
                String repertoryTwo = String.valueOf(gradingList.get(k).get("repertory_two_grading"));
                String repertoryOne = String.valueOf(gradingList.get(k).get("repertory_one_grading"));
                String breeze1Grading = String.valueOf(gradingList.get(k).get("breeze1_grading"));
                String breeze2Grading = String.valueOf(gradingList.get(k).get("breeze2_grading"));
                String breeze3Grading = String.valueOf(gradingList.get(k).get("breeze3_grading"));
                String breeze4Grading = String.valueOf(gradingList.get(k).get("breeze4_grading"));
                String roughRegenerate = String.valueOf(gradingList.get(k).get("rough_regenerate_grading"));
                String middleRegenerate = String.valueOf(gradingList.get(k).get("middle_regenerate_grading"));
                String thinRegenerate = String.valueOf(gradingList.get(k).get("thin_regenerate_grading"));
                String additive1G = String.valueOf(gradingList.get(k).get("additive1_grading"));
                String additive2G = String.valueOf(gradingList.get(k).get("additive2_grading"));
                String additive3G = String.valueOf(gradingList.get(k).get("additive3_grading"));
                String additive4G = String.valueOf(gradingList.get(k).get("additive4_grading"));

                //取出模板级配、上限、下限、中值等
                String moudleGrading = String.valueOf(gradingList.get(k).get("synthesis_grading"));
                String upGrading = String.valueOf(gradingList.get(k).get("up_value"));
                String downGrading = String.valueOf(gradingList.get(k).get("down_value"));
                String midGrading = String.valueOf(gradingList.get(k).get("mid_value"));


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
                float breeze1 = 0;
                float breeze2 = 0;
                float breeze3 = 0;
                float breeze4 = 0;
                //判断矿粉2、是否有值、如果矿粉2没有值，取矿粉总量除以矿粉1级配
                if (Float.parseFloat(breeze2Grading) <= 0){
                    float breeze = stone1Real  + stone2Real + stone3Real + stone4Real;
                    breeze1 = breeze*Float.parseFloat(breeze1Grading);
                }else {
                     breeze1 =  stone1Real*Float.parseFloat(breeze1Grading);
                     breeze2 =  stone2Real*Float.parseFloat(breeze2Grading);
                     breeze3 =  stone3Real*Float.parseFloat(breeze3Grading);
                     breeze4 =  stone4Real*Float.parseFloat(breeze4Grading);
                }

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

    /**
     *
     * 功能描述: <br>
     *  <返回各仓总量集合>
     * @param
     * @return
     * @auther Melone
     * @date 2020/7/27 20:40
     */
    public static List<Map<String,String>> returnGradingTotalList(List<Map<String,String>> proList ){
        if (proList == null || proList.isEmpty()){
            return null;
        }
        List<Map<String,String>> totalList =  new ArrayList<>();
        Set<String> rationSet = new HashSet<>();
        for (int i = 0; i < proList.size();i++) {
            rationSet.add(String.valueOf(proList.get(i).get("produce_proportioning_num")));
        };
        for (String ration:rationSet){
            //取出各材料总量
            String proDate = "";
            String crew = "";
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
            for (int i = 0; i < proList.size();i++) {
                String rationNum = String.valueOf(proList.get(i).get("produce_proportioning_num"));
                proDate = String.valueOf(proList.get(i).get("produce_date"));
                crew = String.valueOf(proList.get(i).get("produce_date"));
                if (ration.equals(rationNum)){
                    count++;
                    double temaggregate10 = Double.valueOf(String.valueOf(proList.get(i).get("material_aggregate_10")));
                    double temaggregate9 = Double.valueOf(String.valueOf(proList.get(i).get("material_aggregate_9")));
                    double temaggregate8 = Double.valueOf(String.valueOf(proList.get(i).get("material_aggregate_8")));
                    double temaggregate7 = Double.valueOf(String.valueOf(proList.get(i).get("material_aggregate_7")));
                    double temaggregate6 = Double.valueOf(String.valueOf(proList.get(i).get("material_aggregate_6")));
                    double temaggregate5 = Double.valueOf(String.valueOf(proList.get(i).get("material_aggregate_5")));
                    double temaggregate4 = Double.valueOf(String.valueOf(proList.get(i).get("material_aggregate_4")));
                    double temaggregate3 = Double.valueOf(String.valueOf(proList.get(i).get("material_aggregate_3")));
                    double temaggregate2 = Double.valueOf(String.valueOf(proList.get(i).get("material_aggregate_2")));
                    double temaggregate1 = Double.valueOf(String.valueOf(proList.get(i).get("material_aggregate_1")));
                    double temstone1 = Double.valueOf(String.valueOf(proList.get(i).get("material_stone_1")));
                    double temstone2 = Double.valueOf(String.valueOf(proList.get(i).get("material_stone_2")));
                    double temstone3 = Double.valueOf(String.valueOf(proList.get(i).get("material_stone_3")));
                    double temstone4 = Double.valueOf(String.valueOf(proList.get(i).get("material_stone_4")));
                    asphalt += Double.valueOf(String.valueOf(proList.get(i).get("material_asphalt")));
                    regenerate += Double.valueOf(String.valueOf(proList.get(i).get("material_regenerate")));
                    additive += Double.valueOf(String.valueOf(proList.get(i).get("material_additive")));
                    additive1 += Double.valueOf(String.valueOf(proList.get(i).get("material_additive_1")));
                    additive2 += Double.valueOf(String.valueOf(proList.get(i).get("material_additive_2")));
                    additive3 += Double.valueOf(String.valueOf(proList.get(i).get("material_additive_3")));
                    total += Double.valueOf(String.valueOf(proList.get(i).get("material_total")));
                    warehouse1Tem += Double.valueOf(String.valueOf(proList.get(i).get("temperature_warehouse_1")));
                    mixtureTem += Double.valueOf(String.valueOf(proList.get(i).get("temperature_mixture")));
                    dusterTem += Double.valueOf(String.valueOf(proList.get(i).get("temperature_duster")));
                    asphaltTem += Double.valueOf(String.valueOf(proList.get(i).get("temperature_asphalt")));
                    aggregateTem += Double.valueOf(String.valueOf(proList.get(i).get("temperature_aggregate")));

                    aggregate10 += temaggregate10;
                    aggregate9 += temaggregate9 > temaggregate10 ? temaggregate9 - temaggregate10:0;
                    aggregate8 += temaggregate8 > temaggregate9 ? temaggregate8 - temaggregate9:0;
                    aggregate7 += temaggregate7 > temaggregate8 ? temaggregate7 - temaggregate8:0;
                    aggregate6 += temaggregate6 > temaggregate7 ? temaggregate6 - temaggregate7:0;
                    aggregate5 += temaggregate5 > temaggregate6 ? temaggregate5 - temaggregate6:0;
                    aggregate4 += temaggregate4 > temaggregate5 ? temaggregate4 - temaggregate5:0;
                    aggregate3 += temaggregate3 > temaggregate4 ? temaggregate3 - temaggregate4:0;
                    aggregate2 += temaggregate2 > temaggregate3 ? temaggregate2 - temaggregate3:0;
                    aggregate1 += temaggregate1 > temaggregate2 ? temaggregate1 - temaggregate2:0;

                    stone1 += temstone1 > temstone2 ? temstone1 - temstone2:0;
                    stone2 += temstone2 > temstone3 ? temstone2 - temstone3:0;
                    stone3 += temstone3 > temstone4 ? temstone3 - temstone4:0;
                    stone3 += temstone4;
                }
            }

            //总量修改
            Map<String,String> tiotalMap = new HashMap<>();
            tiotalMap.put("count",String.valueOf(count));
            tiotalMap.put("produce_proportioning_num",ration);
            tiotalMap.put("material_aggregate_10",String.valueOf(aggregate10));
            tiotalMap.put("material_aggregate_9",String.valueOf(aggregate9));
            tiotalMap.put("material_aggregate_8",String.valueOf(aggregate8));
            tiotalMap.put("material_aggregate_7",String.valueOf(aggregate7));
            tiotalMap.put("material_aggregate_6",String.valueOf(aggregate6));
            tiotalMap.put("material_aggregate_5",String.valueOf(aggregate5));
            tiotalMap.put("material_aggregate_4",String.valueOf(aggregate4));
            tiotalMap.put("material_aggregate_3",String.valueOf(aggregate3));
            tiotalMap.put("material_aggregate_2",String.valueOf(aggregate2));
            tiotalMap.put("material_aggregate_1",String.valueOf(aggregate1));
            tiotalMap.put("material_stone_1",String.valueOf(stone1));
            tiotalMap.put("material_stone_2",String.valueOf(stone2));
            tiotalMap.put("material_stone_3",String.valueOf(stone3));
            tiotalMap.put("material_stone_4",String.valueOf(stone4));
            tiotalMap.put("material_asphalt",String.valueOf(asphalt));
            tiotalMap.put("material_regenerate",String.valueOf(regenerate));
            tiotalMap.put("material_additive",String.valueOf(additive));
            tiotalMap.put("material_additive_1",String.valueOf(additive1));
            tiotalMap.put("material_additive_2",String.valueOf(additive2));
            tiotalMap.put("material_additive_3",String.valueOf(additive3));
            tiotalMap.put("material_total",String.valueOf(total));
            tiotalMap.put("temperature_warehouse_1",String.valueOf(warehouse1Tem));
            tiotalMap.put("temperature_mixture",String.valueOf(mixtureTem));
            tiotalMap.put("temperature_duster",String.valueOf(dusterTem));
            tiotalMap.put("temperature_asphalt",String.valueOf(asphaltTem));
            tiotalMap.put("temperature_aggregate",String.valueOf(aggregateTem));
            totalList.add(tiotalMap);
        }

        return totalList;
    }

}
