/**
 * FileName: QualityDynamicImpl
 * author:   Melone
 * Date:     2018/12/18 16:32
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.jiaoke.quality.dao.QualityDynamicDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.util.*;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/12/18 16:32
 * @Description:
 */
@Service
public class QualityDynamicImpl implements QualityDynamicInf {

    @Resource
    private QualityDynamicDao qualityDynamicDao;

    @Override
    public void getLastDayToChars(HttpServletRequest request) {


        List<Map<String,String>> list = qualityDynamicDao.getLastDayToChars();


        Map<String,List<String>> content = new HashMap<>();
        Map<String,List<String>> maxMin = new HashMap<>();
        Map<String,List<String>> svg3 = new HashMap<>();
        Map<String,List<String>> svg5up = new HashMap<>();
        Map<String,List<String>> svg5down = new HashMap<>();
        Map<String,List<String>> maxMinUp = new HashMap<>();
        Map<String,String> moudelRatio = new HashMap<>();
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
        }



        List<Map<String,Object>> ratioMap =  qualityDynamicDao.getAggregateRatioByMoudelId(ratios);

        for (int i = 0; i < ratioMap.size();i++){
            String ratio_stone = ratioMap.get(i).get("ratio_stone").toString();
            double asphalt_ratio_moudle =Double.parseDouble(ratio_stone) /(100 - Double.parseDouble(ratio_stone)) * 100;
            moudelRatio.put(ratioMap.get(i).get("crew1_modele_id").toString(),String.valueOf(df.format(asphalt_ratio_moudle/(100 - asphalt_ratio_moudle) * 100)));
        }



        //计算油石比
        for (int i = 0; i < list.size();i++){

            String asphalt = String.valueOf(list.get(i).get("material_asphalt"));
            String total = String.valueOf(list.get(i).get("material_total"));
            String key = list.get(i).get("produce_proportioning_num");

            //计算沥青含量
            Float asphalt_content = Float.parseFloat(asphalt)/Float.parseFloat(total) * 100;
            //计算油石比
            Float asphalt_ratio = (asphalt_content/(100 - asphalt_content)) * 100;

            content.get(key).add(df.format(asphalt_ratio));

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
                        svg5up.get(svgentry.getKey()).add(df.format(svgX - 0.577 * svgR));

                    }
                }
            }


        request.setAttribute("rationList",ratios);
        request.setAttribute("allItem",content);
        request.setAttribute("maxMin",maxMin);
        request.setAttribute("svg3",svg3);
        request.setAttribute("moudelRatio",moudelRatio);
        request.setAttribute("svg5up",svg5up);
        request.setAttribute("svg5down",svg5down);
        request.setAttribute("maxMinUp",maxMinUp);

    }

}
