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
        Double aggregate6 = 0.00;
        Double aggregate5 = 0.00;
        Double aggregate4 = 0.00;
        Double aggregate3 = 0.00;
        Double aggregate2 = 0.00;
        Double aggregate1 = 0.00;
        Double stone1 = 0.00;
        Double stone2 = 0.00;
        Double asphalt = 0.00;
        Double regenerate = 0.00;
        Double additive = 0.00;
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
            aggregate6 += Double.parseDouble(list.get(i).get("material_aggregate_6").toString());
            aggregate5 += Double.parseDouble(list.get(i).get("material_aggregate_5").toString());
            aggregate4 += Double.parseDouble(list.get(i).get("material_aggregate_4").toString());
            aggregate3 += Double.parseDouble(list.get(i).get("material_aggregate_3").toString());
            aggregate2 += Double.parseDouble(list.get(i).get("material_aggregate_2").toString());
            aggregate1 += Double.parseDouble(list.get(i).get("material_aggregate_1").toString());
            stone1 += Double.parseDouble(list.get(i).get("material_stone_1").toString());
            stone2 += Double.parseDouble(list.get(i).get("material_stone_2").toString());
            asphalt += Double.parseDouble(list.get(i).get("material_asphalt").toString());
            regenerate += Double.parseDouble(list.get(i).get("material_regenerate").toString());
            additive += Double.parseDouble(list.get(i).get("material_additive").toString());
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
        map.put("material_aggregate_6",df.format(aggregate6/list.size()));
        map.put("material_aggregate_5",df.format(aggregate5/list.size()));
        map.put("material_aggregate_4",df.format(aggregate4/list.size()));
        map.put("material_aggregate_3",df.format(aggregate3/list.size()));
        map.put("material_aggregate_2",df.format(aggregate2/list.size()));
        map.put("material_aggregate_1",df.format(aggregate1/list.size()));

        map.put("material_stone_1",df.format(stone1/list.size()));
        map.put("material_stone_2",df.format(stone2/list.size()));
        map.put("material_asphalt",df.format(asphalt/list.size()));
        map.put("material_regenerate",df.format(regenerate/list.size()));
        map.put("material_additive",df.format(additive/list.size()));
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
                map.put("breeze",list.get(1).get("breeze").toString());
                map.put("ratio_stone",list.get(1).get("ratio_stone").toString());
                map.put("ratio_regenerate1",list.get(1).get("ratio_regenerate1").toString());
                map.put("ratio_additive",list.get(1).get("ratio_additive").toString());
                map.put("regenerate",list.get(1).get("regenerate").toString());
                map.put("additive",list.get(1).get("additive").toString());
                map.put("ratio_regenerate2",list.get(1).get("ratio_regenerate2").toString());
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
        String aggregate6Proportion = QualityDataMontoringUtil.calculateRatio(total,prosvgByProList.get("material_aggregate_6"));
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
        String stone1Proportion = QualityDataMontoringUtil.calculateRatio(total,prosvgByProList.get("material_stone_1"));
        String stone2Proportion = QualityDataMontoringUtil.calculateRatio(total,prosvgByProList.get("material_stone_2"));
        String asphaltProportion = QualityDataMontoringUtil.calculateRatio(total,prosvgByProList.get("material_asphalt"));
        String additiveProportion = QualityDataMontoringUtil.calculateRatio(total,prosvgByProList.get("material_additive"));
        String regenerateProportion = QualityDataMontoringUtil.calculateRatio(total,prosvgByProList.get("material_regenerate"));

        mapProportion.put("material_aggregate_6",aggregate6Proportion);
        mapProportion.put("material_aggregate_5",aggregate5Proportion);
        mapProportion.put("material_aggregate_4",aggregate4Proportion);
        mapProportion.put("material_aggregate_3",aggregate3Proportion);
        mapProportion.put("material_aggregate_2",aggregate2Proportion);
        mapProportion.put("material_aggregate_1",aggregate1Proportion);
        mapProportion.put("material_stone_1",stone1Proportion);
        mapProportion.put("material_stone_2",stone2Proportion);
        mapProportion.put("material_asphalt",asphaltProportion);
        mapProportion.put("material_regenerate",regenerateProportion);
        mapProportion.put("material_additive",additiveProportion);
        mapProportion.put("temperature_warehouse_1",prosvgByProList.get("material_regenerate"));
        mapProportion.put("temperature_mixture",prosvgByProList.get("temperature_mixture"));
        mapProportion.put("temperature_duster",prosvgByProList.get("temperature_duster"));
        mapProportion.put("temperature_asphalt",prosvgByProList.get("temperature_asphalt"));
        mapProportion.put("temperature_aggregate",prosvgByProList.get("temperature_aggregate"));

        return mapProportion;
    }



}
