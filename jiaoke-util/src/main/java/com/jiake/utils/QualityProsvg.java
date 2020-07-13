/**
 * FileName: QualityProsvg
 * author:   Melone
 * Date:     2019/5/5 12:12
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiake.utils;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/5/5 12:12
 * @Description:
 */
public class QualityProsvg {

    /**
     *
     * 功能描述: <br>
     *  <根据数据返回数据平均值>
     * @param
     * @return
     * @auther Melone
     * @date 2019/5/5 14:16
     */
    public static Map<String,String> getProsvgByProList(List<Map<String,Object>> list){
        Map<String,String> map = new HashMap<>();

        String rationNum = "1";
        Double aggregate10 = 0.00;
        Double aggregate9 = 0.00;
        Double aggregate8 = 0.00;
        Double aggregate7 = 0.00;
        Double aggregate6 = 0.00;
        Double aggregate5 = 0.00;
        Double aggregate4 = 0.00;
        Double aggregate3 = 0.00;
        Double aggregate2 = 0.00;
        Double aggregate1 = 0.00;
        Double stone1 = 0.00;
        Double stone2 = 0.00;
        Double stone3 = 0.00;
        Double stone4 = 0.00;
        Double asphalt = 0.00;
        Double regenerate = 0.00;
        Double additive = 0.00;
        Double additive1 = 0.00;
        Double additive2 = 0.00;
        Double additive3 = 0.00;
        Double total = 0.00;
        String produce_date = "";

        Double TemWarehouse1 = 0.00;
        Double TemMixture = 0.00;
        Double TemDuster = 0.00;
        Double TemAsphalt = 0.00;
        Double TemAggregate = 0.00;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

        for (int i = 0; i < list.size(); i++){
            rationNum = list.get(i).get("produce_proportioning_num").toString();
            aggregate10 += Double.parseDouble(list.get(i).get("material_aggregate_10").toString());
            aggregate9 += Double.parseDouble(list.get(i).get("material_aggregate_9").toString());
            aggregate8 += Double.parseDouble(list.get(i).get("material_aggregate_8").toString());
            aggregate7 += Double.parseDouble(list.get(i).get("material_aggregate_7").toString());
            aggregate6 += Double.parseDouble(list.get(i).get("material_aggregate_6").toString());
            aggregate5 += Double.parseDouble(list.get(i).get("material_aggregate_5").toString());
            aggregate4 += Double.parseDouble(list.get(i).get("material_aggregate_4").toString());
            aggregate3 += Double.parseDouble(list.get(i).get("material_aggregate_3").toString());
            aggregate2 += Double.parseDouble(list.get(i).get("material_aggregate_2").toString());
            aggregate1 += Double.parseDouble(list.get(i).get("material_aggregate_1").toString());
            stone1 += Double.parseDouble(list.get(i).get("material_stone_1").toString());
            stone2 += Double.parseDouble(list.get(i).get("material_stone_2").toString());
            stone3 += Double.parseDouble(list.get(i).get("material_stone_3").toString());
            stone4 += Double.parseDouble(list.get(i).get("material_stone_4").toString());
            asphalt += Double.parseDouble(list.get(i).get("material_asphalt").toString());
            regenerate += Double.parseDouble(list.get(i).get("material_regenerate").toString());
            additive += Double.parseDouble(list.get(i).get("material_additive").toString());
            additive1 += Double.parseDouble(list.get(i).get("material_additive_1").toString());
            additive2 += Double.parseDouble(list.get(i).get("material_additive_2").toString());
            additive3 += Double.parseDouble(list.get(i).get("material_additive_3").toString());
            total += Double.parseDouble(list.get(i).get("material_total").toString());
            try {
                produce_date = sdf.format(list.get(i).get("produce_date"));
            }catch (Exception e){
                produce_date = list.get(i).get("produce_date").toString();
            }


            TemWarehouse1 += Double.parseDouble(list.get(i).get("temperature_warehouse_1").toString());
            TemMixture += Double.parseDouble(list.get(i).get("temperature_mixture").toString());
            TemDuster += Double.parseDouble(list.get(i).get("temperature_duster").toString());
            TemAsphalt += Double.parseDouble(list.get(i).get("temperature_asphalt").toString());
            TemAggregate += Double.parseDouble(list.get(i).get("temperature_aggregate").toString());


        }

        DecimalFormat df = new DecimalFormat("0.00");
        map.put("produce_proportioning_num",rationNum);
        map.put("material_aggregate_10",df.format(aggregate10/list.size()));
        map.put("material_aggregate_9",df.format(aggregate9/list.size()));
        map.put("material_aggregate_8",df.format(aggregate8/list.size()));
        map.put("material_aggregate_7",df.format(aggregate7/list.size()));
        map.put("material_aggregate_6",df.format(aggregate6/list.size()));
        map.put("material_aggregate_5",df.format(aggregate5/list.size()));
        map.put("material_aggregate_4",df.format(aggregate4/list.size()));
        map.put("material_aggregate_3",df.format(aggregate3/list.size()));
        map.put("material_aggregate_2",df.format(aggregate2/list.size()));
        map.put("material_aggregate_1",df.format(aggregate1/list.size()));

        map.put("material_stone_1",df.format(stone1/list.size()));
        map.put("material_stone_2",df.format(stone2/list.size()));
        map.put("material_stone_3",df.format(stone3/list.size()));
        map.put("material_stone_4",df.format(stone4/list.size()));
        map.put("material_asphalt",df.format(asphalt/list.size()));
        map.put("material_regenerate",df.format(regenerate/list.size()));
        map.put("material_additive",df.format(additive/list.size()));
        map.put("material_additive_1",df.format(additive1/list.size()));
        map.put("material_additive_2",df.format(additive2/list.size()));
        map.put("material_additive_3",df.format(additive3/list.size()));
        map.put("material_total",df.format(total/list.size()));

        map.put("temperature_warehouse_1",df.format(TemWarehouse1/list.size()));
        map.put("temperature_mixture",df.format(TemMixture/list.size()));
        map.put("temperature_duster",df.format(TemDuster/list.size()));
        map.put("temperature_asphalt",df.format(TemAsphalt/list.size()));
        map.put("temperature_aggregate",df.format(TemAggregate/list.size()));
        map.put("produce_date",produce_date);
        //如果有配比放入map中
        if (!list.isEmpty()){
            if (list.get(0).containsKey("ratio_regenerate1")){
                map.put("crewNum",list.get(0).get("crewNum").toString());
                map.put("repertory_one",list.get(1).get("repertory_one").toString());
                map.put("repertory_two",list.get(1).get("repertory_two").toString());
                map.put("repertory_three",list.get(1).get("repertory_three").toString());
                map.put("repertory_four",list.get(1).get("repertory_four").toString());
                map.put("repertory_five",list.get(1).get("repertory_five").toString());
                map.put("repertory_six",list.get(1).get("repertory_six").toString());
                map.put("repertory_seven",list.get(1).get("repertory_seven").toString());
                map.put("repertory_eight",list.get(1).get("repertory_eight").toString());
                map.put("repertory_nine",list.get(1).get("repertory_nine").toString());
                map.put("repertory_ten",list.get(1).get("repertory_ten").toString());
                map.put("breeze",list.get(1).get("breeze").toString());
                map.put("breeze_two",list.get(1).get("breeze_two").toString());
                map.put("breeze_three",list.get(1).get("breeze_three").toString());
                map.put("breeze_four",list.get(1).get("breeze_four").toString());
                map.put("ratio_stone",list.get(1).get("ratio_stone").toString());
                map.put("ratio_regenerate1",list.get(1).get("ratio_regenerate1").toString());
                map.put("ratio_additive",list.get(1).get("ratio_additive").toString());
                map.put("ratio_additive_two",list.get(1).get("ratio_additive_two").toString());
                map.put("ratio_additive_three",list.get(1).get("ratio_additive_three").toString());
                map.put("ratio_additive_four",list.get(1).get("ratio_additive_four").toString());
                map.put("ratio_regenerate2",list.get(1).get("ratio_regenerate2").toString());
                map.put("ratio_regenerate3",list.get(1).get("ratio_regenerate3").toString());
            }
        }


        return map;
    }

    /**
     *
     * 功能描述: <br>
     *  <放入平均值集合，返回平均值占比集合>
     * @param
     * @return
     * @auther Melone
     * @date 2019/5/5 14:17
     */
    public static Map<String,String> getProportionBySvgMessage(Map<String, String> prosvgByProList ){

        Map<String,String> mapProportion = new HashMap<>();
        String total = prosvgByProList.get("material_total");
        String aggregate10Proportion = QualityDataMontoringUtil.calculateRatio(total,prosvgByProList.get("material_aggregate_10"));
        double aggre9 = Double.parseDouble(prosvgByProList.get("material_aggregate_10")) -Double.parseDouble(prosvgByProList.get("material_aggregate_9"));
        String aggregate9Proportion = QualityDataMontoringUtil.calculateRatio(total,String.valueOf(aggre9));
        double aggre8 = Double.parseDouble(prosvgByProList.get("material_aggregate_9")) -Double.parseDouble(prosvgByProList.get("material_aggregate_8"));
        String aggregate8Proportion = QualityDataMontoringUtil.calculateRatio(total,String.valueOf(aggre8));
        double aggre7 = Double.parseDouble(prosvgByProList.get("material_aggregate_8")) -Double.parseDouble(prosvgByProList.get("material_aggregate_7"));
        String aggregate7Proportion = QualityDataMontoringUtil.calculateRatio(total,String.valueOf(aggre7));
        double aggre6 = Double.parseDouble(prosvgByProList.get("material_aggregate_7")) -Double.parseDouble(prosvgByProList.get("material_aggregate_6"));
        String aggregate6Proportion = QualityDataMontoringUtil.calculateRatio(total,String.valueOf(aggre6));
        double aggre5 = Double.parseDouble(prosvgByProList.get("material_aggregate_5")) -Double.parseDouble(prosvgByProList.get("material_aggregate_6"));
        String aggregate5Proportion = QualityDataMontoringUtil.calculateRatio(total,String.valueOf(aggre5));
        double aggre4= Double.parseDouble(prosvgByProList.get("material_aggregate_4")) -Double.parseDouble(prosvgByProList.get("material_aggregate_5"));
        String aggregate4Proportion = QualityDataMontoringUtil.calculateRatio(total,String.valueOf(aggre4));
        double aggre3= Double.parseDouble(prosvgByProList.get("material_aggregate_3")) -Double.parseDouble(prosvgByProList.get("material_aggregate_4"));
        String aggregate3Proportion = QualityDataMontoringUtil.calculateRatio(total,String.valueOf(aggre3));
        double aggre2= Double.parseDouble(prosvgByProList.get("material_aggregate_2")) -Double.parseDouble(prosvgByProList.get("material_aggregate_3"));
        String aggregate2Proportion = QualityDataMontoringUtil.calculateRatio(total,String.valueOf(aggre2));
        double aggre1= Double.parseDouble(prosvgByProList.get("material_aggregate_1")) -Double.parseDouble(prosvgByProList.get("material_aggregate_2"));
        String aggregate1Proportion = QualityDataMontoringUtil.calculateRatio(total,String.valueOf(aggre1));
        double stoneOne = Double.parseDouble(prosvgByProList.get("material_stone_1")) > 0? Double.parseDouble(prosvgByProList.get("material_stone_1")) - Double.parseDouble(prosvgByProList.get("material_stone_2")):0;
        String stone1Proportion = QualityDataMontoringUtil.calculateRatio(total,String.valueOf(stoneOne));
        double stoneTwo = Double.parseDouble(prosvgByProList.get("material_stone_2")) > 0? Double.parseDouble(prosvgByProList.get("material_stone_2")) - Double.parseDouble(prosvgByProList.get("material_stone_3")):0;
        String stone2Proportion = QualityDataMontoringUtil.calculateRatio(total,String.valueOf(stoneTwo));
        double stoneThree = Double.parseDouble(prosvgByProList.get("material_stone_3")) > 0? Double.parseDouble(prosvgByProList.get("material_stone_3")) - Double.parseDouble(prosvgByProList.get("material_stone_4")):0;
        String stone3Proportion = QualityDataMontoringUtil.calculateRatio(total,String.valueOf(stoneThree));
        String stone4Proportion = QualityDataMontoringUtil.calculateRatio(total,prosvgByProList.get("material_stone_4"));
        String asphaltProportion = QualityDataMontoringUtil.calculateRatio(total,prosvgByProList.get("material_asphalt"));
        String additiveProportion = QualityDataMontoringUtil.calculateRatio(total,prosvgByProList.get("material_additive"));
        String additive1Proportion = QualityDataMontoringUtil.calculateRatio(total,prosvgByProList.get("material_additive_1"));
        String additive2Proportion = QualityDataMontoringUtil.calculateRatio(total,prosvgByProList.get("material_additive_2"));
        String additive3Proportion = QualityDataMontoringUtil.calculateRatio(total,prosvgByProList.get("material_additive_3"));
        String regenerateProportion = QualityDataMontoringUtil.calculateRatio(total,prosvgByProList.get("material_regenerate"));

        mapProportion.put("material_aggregate_10",aggregate10Proportion);
        mapProportion.put("material_aggregate_9",aggregate9Proportion);
        mapProportion.put("material_aggregate_8",aggregate8Proportion);
        mapProportion.put("material_aggregate_7",aggregate7Proportion);
        mapProportion.put("material_aggregate_6",aggregate6Proportion);
        mapProportion.put("material_aggregate_5",aggregate5Proportion);
        mapProportion.put("material_aggregate_4",aggregate4Proportion);
        mapProportion.put("material_aggregate_3",aggregate3Proportion);
        mapProportion.put("material_aggregate_2",aggregate2Proportion);
        mapProportion.put("material_aggregate_1",aggregate1Proportion);
        mapProportion.put("material_stone_1",stone1Proportion);
        mapProportion.put("material_stone_2",stone2Proportion);
        mapProportion.put("material_stone_3",stone3Proportion);
        mapProportion.put("material_stone_4",stone4Proportion);
        mapProportion.put("material_asphalt",asphaltProportion);
        mapProportion.put("material_regenerate",regenerateProportion);
        mapProportion.put("material_additive",additiveProportion);
        mapProportion.put("material_additive_1",additive1Proportion);
        mapProportion.put("material_additive_2",additive2Proportion);
        mapProportion.put("material_additive_3",additive3Proportion);
        mapProportion.put("temperature_warehouse_1",prosvgByProList.get("material_regenerate"));
        mapProportion.put("temperature_mixture",prosvgByProList.get("temperature_mixture"));
        mapProportion.put("temperature_duster",prosvgByProList.get("temperature_duster"));
        mapProportion.put("temperature_asphalt",prosvgByProList.get("temperature_asphalt"));
        mapProportion.put("temperature_aggregate",prosvgByProList.get("temperature_aggregate"));

        return mapProportion;
    }



}
