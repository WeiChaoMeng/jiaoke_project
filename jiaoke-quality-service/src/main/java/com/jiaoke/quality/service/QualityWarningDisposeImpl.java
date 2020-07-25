/**
 * FileName: QualityWarningDisposeImpl
 * author:   Melone
 * Date:     2020/7/21 9:17
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.jiaoke.quality.dao.QualityWarningDisposeDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/7/21 09:17
 * @Description:
 */
@Service
public class QualityWarningDisposeImpl implements QualityWarningDisposeInf {
    @Resource
    private QualityWarningDisposeDao qualityWarningDisposeDao;

    /**
     *
     * 功能描述: <br>
     *  <查询两个机组本日产品>
     * @param
     * @return
     * @auther Melone
     * @date 2020/7/21 9:23
     */
    @Override
    public String getTwoCrewPro() {
        Map<String,Object> res = new HashMap<>();
        List<Map<String,Object>> list = qualityWarningDisposeDao.getTwoCrewPro();
        if (list == null || list.isEmpty()){
            res.put("state","empty");
        }else {
            res.put("state","success");
            res.put("data",list);
        }
        return JSON.toJSONStringWithDateFormat(res,"yyyy-MM-dd", SerializerFeature.WriteDateUseDateFormat);
    }

    /**
     *
     * 功能描述: <br>
     *  <根据日期、配比查询产品>
     * @param [proDate, rationNum]
     * @return java.lang.String
     * @auther Melone
     * @date 2020/7/22 14:31
     */
    @Override
    public String getProDataByRation(String proDate, String rationNum,String crewNum) {
        Map<String,Object> res = new HashMap<>();
        List<Map<String,String>> list = qualityWarningDisposeDao.selectProDataByRation(proDate,rationNum,crewNum);
        Set<Integer> dateSet = new HashSet<>();
        for (Map<String,String> temMap:list){
            dateSet.add(Integer.parseInt(String.valueOf(temMap.get("id"))));
        }
        List<Map<String,String>> resList = new ArrayList<>();
        for (Integer id:dateSet){
            Map<String,String> tem = new HashMap<>();

            for (Map<String,String> temMap:list){

                String actualRatio = temMap.get("actual_ratio");
                String moudleRatio = temMap.get("moudle_ratio");
                String deviationRatio = temMap.get("deviation_ratio");

                if (id == Integer.parseInt(String.valueOf(temMap.get("id")))){

                    tem.put("id",String.valueOf(id));
                    tem.put("proDate",temMap.get("proDate"));
                    tem.put("produce_disc_num",temMap.get("produce_disc_num"));
                    tem.put("pro_name",temMap.get("pro_name"));
                    tem.put("warning_reason",temMap.get("warning_reason"));

                    switch (temMap.get("material_name")){
                        case "骨料1":
                            tem.put("materialOneActual",actualRatio);
                            tem.put("materialOneMoudle",moudleRatio);
                            tem.put("materialOneDeviation",deviationRatio);
                            tem.put("materialOneLeve",temMap.get("warning_level"));
                            break;
                        case "沥青":
                            tem.put("asphaltActual",actualRatio);
                            tem.put("asphaltMoudle",moudleRatio);
                            tem.put("asphaltDeviation",deviationRatio);
                            tem.put("asphaltLeve",temMap.get("warning_level"));
                            break;
                        case "一仓温度":
                            tem.put("warehouseOneActual",actualRatio);
                            tem.put("warehouseOneMoudle",moudleRatio);
                            tem.put("warehouseOneDeviation",deviationRatio);
                            tem.put("warehouseOneLeve",temMap.get("warning_level"));
                            break;
                            default:break;
                    }
                }
            }
            resList.add(tem);
        }

        if (resList == null || resList.isEmpty()){
            res.put("code","1");
            res.put("msg","");
            res.put("count",0);
            res.put("data",0);
        }else {
            res.put("code",0);
            res.put("msg","");
            res.put("count",resList.size());
            res.put("data",resList);
        }
//        return JSON.toJSONStringWithDateFormat(res, "yyyy-MM-dd HH:mm:ss", SerializerFeature.WriteDateUseDateFormat);
        return JSON.toJSONString(res);
    }

    @Override
    public String addProductWarningMsg(String proMsg, List<String> idList) {
        Map<String,String> map = new HashMap<>();
        int res = qualityWarningDisposeDao.insertProductWarningMsg(proMsg,idList);
        map.put("message","success");
        if (res <= 0){
            map.put("message","error");
        }
        return JSON.toJSONString(map);
    }
}
