/**
 * FileName: QualityDynamicUtil
 * author:   Melone
 * Date:     2019/1/2 15:18
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiake.utils;

import com.jiaoke.quality.dao.QualityDynamicDao;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.util.*;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/1/2 15:18
 * @Description:
 */
public class QualityDynamicUtil {


    public static void setRequestAttributeUtil(List<Map<String,String>> list, QualityDynamicDao qualityDynamicDao, String ratioName, String material, String crew, HttpServletRequest request){



        Map<String,List<String>> content = new HashMap<>();
        Map<String,List<String>> maxMin = new HashMap<>();
        Map<String,List<String>> svg3 = new HashMap<>();
        Map<String,List<String>> svg5up = new HashMap<>();
        Map<String,List<String>> svg5down = new HashMap<>();
        Map<String,List<String>> maxMinUp = new HashMap<>();
        Map<String,String> moudelRatio = new HashMap<>();
        //各结果最大最小，用于渲染Y轴
        Map<String,Map<String,String>> contentY = new HashMap<>();
        Map<String,Map<String,String>> maxMinY = new HashMap<>();
        Map<String,Map<String,String>> svg3Y = new HashMap<>();
        //盘号，渲染X轴
        Map<String,List<String>> discNumMap = new HashMap<>();
        Set ratios = new HashSet();


        DecimalFormat df = new DecimalFormat("0.00");
        for (int i= 0; i < list.size();i++){

            String key = list.get(i).get("produce_proportioning_num");
            ratios.add(key);
            content.put(key,new ArrayList<>());
            maxMin.put(key,new ArrayList<>());
            svg3.put(key,new ArrayList<>());
            svg5up.put(key,new ArrayList<>());
            svg5down.put(key,new ArrayList<>());
            maxMinUp.put(key,new ArrayList<>());
            discNumMap.put(key,new ArrayList<>());
        }
        //添加盘号
        for (int i= 0; i < list.size();i++) {
            String discNum = list.get(i).get("produce_disc_num");
            String key = list.get(i).get("produce_proportioning_num");
            discNumMap.get(key).add(discNum);
        }

        List<Map<String,Object>> ratioMap =  qualityDynamicDao.getAggregateRatioByMoudelId(ratioName,ratios,crew);




        for (int i = 0; i < ratioMap.size();i++){
            String ratio_stone = ratioMap.get(i).get(ratioName).toString();
            double asphalt_ratio_moudle =Double.parseDouble(ratio_stone) /(100 - Double.parseDouble(ratio_stone)) * 100;
            moudelRatio.put(ratioMap.get(i).get(crew+"_modele_id").toString(),String.valueOf(df.format(asphalt_ratio_moudle/(100 - asphalt_ratio_moudle) * 100)));
        }



        //计算油石比
        for (int i = 0; i < list.size();i++){

            String asphalt ;
            String total = String.valueOf(list.get(i).get("material_total"));
            String key = list.get(i).get("produce_proportioning_num");

            switch (material){
                case "material_aggregate_5":
                    Double five =Double.parseDouble(String.valueOf(list.get(i).get("material_aggregate_5")) ) - Double.parseDouble(String.valueOf(list.get(i).get("material_aggregate_6")));
                    asphalt = String.valueOf(five);
                    break;
                case "material_aggregate_4":
                    Double  four =Double.parseDouble(String.valueOf(list.get(i).get("material_aggregate_4") )) - Double.parseDouble(String.valueOf(list.get(i).get("material_aggregate_5")));
                    asphalt = String.valueOf(four);
                    break;
                case "material_aggregate_3":
                    Double three =Double.parseDouble(String.valueOf(list.get(i).get("material_aggregate_3")) ) - Double.parseDouble(String.valueOf(list.get(i).get("material_aggregate_4")));
                    asphalt = String.valueOf(three);
                    break;
                case "material_aggregate_2":
                    Double doubles =Double.parseDouble(String.valueOf(list.get(i).get("material_aggregate_2")) ) - Double.parseDouble(String.valueOf(list.get(i).get("material_aggregate_3")));
                    asphalt = String.valueOf(doubles);
                    break;
                case "material_aggregate_1":
                    Double one =Double.parseDouble(String.valueOf(list.get(i).get("material_aggregate_1")) ) - Double.parseDouble(String.valueOf(list.get(i).get("material_aggregate_2")));
                    asphalt = String.valueOf(one);
                    break;
                case "material_stone":
                    Double b =Double.parseDouble(String.valueOf(list.get(i).get("material_stone_1")) ) + Double.parseDouble(String.valueOf(list.get(i).get("material_stone_2")));
                    asphalt = String.valueOf(b);
                    break;
                default:
                    asphalt = String.valueOf(list.get(i).get(material));
            }


            Float asphalt_content ;
            Float asphalt_ratio;
            //计算沥青含量
            if (Double.parseDouble(String.valueOf(asphalt)) > 0){
                asphalt_content = Float.parseFloat(asphalt)/Float.parseFloat(total) * 100;
                //计算油石比,暂时使用含量
//                asphalt_ratio = (asphalt_content/(100 - asphalt_content)) * 100;
                content.get(key).add(df.format(asphalt_content));
            }else {
                content.get(key).add(df.format(0));
            }
        }

        //计算极差及三个数据平均值
        for (Map.Entry<String, List<String>> entry : content.entrySet()) {

            //删除少于二十盘的配比号，使用Set集合做控制
            if(entry.getValue().size() <= 20 ) {
                ratios.remove(entry.getKey());
                continue;
            }
            for (int i = 0; i < entry.getValue().size();i++){

                if (i > 1){
                    double first = Double.parseDouble(entry.getValue().get(i - 2));
                    double second = Double.parseDouble(entry.getValue().get(i - 1));
                    double third = Double.parseDouble(entry.getValue().get(i));

                    double maxtem = first > second ? first:second;
                    double max = maxtem > third ? second:third;

                    double mintem = first < second ? first:second;
                    double min = mintem < third ?  mintem : third;

                    maxMin.get(entry.getKey()).add(df.format(max - min));
                    svg3.get(entry.getKey()).add(df.format((first+second+third)/3));
                }
            }
        }

        //计算极差上限
        for (Map.Entry<String, List<String>> maxMinentry : maxMin.entrySet()) {
            for (int i = 1; i < maxMinentry.getValue().size(); i++) {
                if(i%5 == 0) {
                    double a1 = Double.parseDouble(maxMinentry.getValue().get(i - 5));
                    double b2 = Double.parseDouble(maxMinentry.getValue().get(i - 4));
                    double c3 = Double.parseDouble(maxMinentry.getValue().get(i - 3));
                    double d4 = Double.parseDouble(maxMinentry.getValue().get(i - 2));
                    double e5 = Double.parseDouble(maxMinentry.getValue().get(i - 1));

                    //极差平均值
                    double maxMinX = (a1 + b2 + c3 + d4 + e5)/5;
                    //添加极差上限
                    maxMinUp.get(maxMinentry.getKey()).add(df.format(2.115*maxMinX));
                }
            }
        }

        //计算平均值上下限
        for (Map.Entry<String, List<String>> svgentry : svg3.entrySet()){
            for (int i = 1 ; i < svgentry.getValue().size(); i++){
                if(i%5 == 0){
                    double a1 = Double.parseDouble(svgentry.getValue().get(i - 5));
                    double b2 = Double.parseDouble(svgentry.getValue().get(i - 4));
                    double c3 = Double.parseDouble(svgentry.getValue().get(i - 3));
                    double d4 = Double.parseDouble(svgentry.getValue().get(i - 2));
                    double e5 = Double.parseDouble(svgentry.getValue().get(i - 1));

                    //平均值
                    double svgX = (a1 + b2 + c3 + d4 + e5)/5;
                    //此处逻辑，获得5个三次平均后的值，再次平均。获得已经获得的极差上限除以固定值获得5个三次极差的平均值后套用公式
                    //极差
                    double svgR =  i/5 ==1? Double.parseDouble(maxMinUp.get(svgentry.getKey()).get(0))/2.115 : Double.parseDouble(maxMinUp.get(svgentry.getKey()).get(i/5 - 1))/2.115;

                    //添加平均值上限
                    svg5up.get(svgentry.getKey()).add(df.format(svgX + 0.577 * svgR));
                    //添加平均值下限
                    svg5down.get(svgentry.getKey()).add(df.format(svgX - 0.577 * svgR));

                }
            }
        }


        //获取最大最小值，用于Y轴上下限
        contentY =  getMaxAndMinByList(content,contentY);
        maxMinY =  getMaxAndMinByList(maxMin,maxMinY);
        svg3Y =  getMaxAndMinByList(svg3,svg3Y);

        request.setAttribute("rationList",ratios);
        request.setAttribute("allItem",content);
        request.setAttribute("maxMin",maxMin);
        request.setAttribute("svg3",svg3);
        request.setAttribute("moudelRatio",moudelRatio);
        request.setAttribute("svg5up",svg5up);
        request.setAttribute("svg5down",svg5down);
        request.setAttribute("maxMinUp",maxMinUp);
        request.setAttribute("contentY",contentY);
        request.setAttribute("maxMinY",maxMinY);
        request.setAttribute("svg3Y",svg3Y);
        request.setAttribute("discNumMap",discNumMap);

    }

    public static Map<String,Map<String,String>> getMaxAndMinByList(Map<String,List<String>> content, Map<String,Map<String,String>> contentY){

        for (Map.Entry<String,List<String>> entry : content.entrySet()) {
            List<String> list1 = entry.getValue();
            if (list1.size() != 0 ){
                double max = Double.parseDouble(list1.get(0));
                double min = Double.parseDouble(list1.get(0));

                for (int i =0; i < list1.size();i++){
                    max = max < Double.parseDouble(list1.get(i))? Double.parseDouble(list1.get(i)):max;
                    min = min > Double.parseDouble(list1.get(i))? Double.parseDouble(list1.get(i)):min;
                }
                Map<String,String> map1 = new HashMap<>();
                map1.put("max",String.valueOf(max));
                map1.put("min",String.valueOf(min));
                contentY.put(entry.getKey(),map1);
            }
        }

        return contentY;
    }

}
