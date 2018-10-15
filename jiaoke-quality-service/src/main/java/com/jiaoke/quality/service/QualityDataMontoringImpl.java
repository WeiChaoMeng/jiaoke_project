/**
 * FileName: QualityDataMontoringImpl
 * author:   Melone
 * Date:     2018/10/12 16:23
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiake.utils.QualityDataMontoringUtil;
import com.jiaoke.quality.dao.QualityDataMontoringDao;
import org.apache.logging.log4j.util.Strings;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/12 16:23
 * @Description:
 */
@Service
public class QualityDataMontoringImpl implements QualityDataMontoringInf {

    @Resource
    private QualityDataMontoringDao qualityDataMontoringDao;

    @Override
    public String selectProductionData() {

        List<Map<String,Object>>  list = qualityDataMontoringDao.selectProductionData();

        String str = "";

        String[] cloumName = {
                "material_aggregate_1",
                "material_aggregate_2",
                "material_aggregate_3",
                "material_aggregate_4",
                "material_aggregate_5",
                "material_aggregate_6",
                "material_stone_1",
                "material_stone_2",
                "material_asphalt",
                "material_regenerate",
                "material_additive"
        };

        if ( null != list ) {

            for (Map<String, Object> m : list) {

                for (String k : m.keySet()){

                    for (int i = 0; i < cloumName.length;i++){

                        if (k.equals(cloumName[i])){
                            String date = String.valueOf(m.get(k));
                            if(Strings.isBlank(date)){
                                m.put(k,"0");
                            } else {
                                m.put(k, QualityDataMontoringUtil.calculateRatio(String.valueOf(m.get("material_total")),date));
                            }
                        }

                    }

                }
            }

            str = JSONArray.parseArray(JSONObject.toJSONString(list)).toString();
        }
        return str;
    }

}
