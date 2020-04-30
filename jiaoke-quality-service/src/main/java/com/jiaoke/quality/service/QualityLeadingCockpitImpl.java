/**
 * FileName: QualityLeadingCockpitImpl
 * author:   Melone
 * Date:     2020/4/27 18:57
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.jiaoke.quality.dao.QualityLeadingCockpit;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/4/27 18:57
 * @Description:
 */
@Service
public class QualityLeadingCockpitImpl implements QualityLeadingCockpitInf {

    @Resource
    private QualityLeadingCockpit qualityLeadingCockpit;
    @Override
    public Map<String, Object> getThisMonthTwoCrewData() {
        Map<String,Object> map = new HashMap<>();
        List<Map<String,Object>> list  = qualityLeadingCockpit.selectThisMonthTwoCrewData();
        map.put("dataList",list);
        map.put("message","success");
        if (list == null || list.isEmpty()){
            map.put("message","empty");
        }
        return map;
    }

    @Override
    public Map<String, Object> getThisYearTwoCrewData() {
        Map<String,Object> map = new HashMap<>();
        List<Map<String,Object>> list  = qualityLeadingCockpit.selectThisYearTwoCrewData();
        map.put("dataList",list);
        map.put("message","success");
        if (list == null || list.isEmpty()){
            map.put("message","empty");
        }
        return map;
    }

    @Override
    public Map<String, Object> getProductionDays() {
        Map<String,Object> map = new HashMap<>();
        List<Map<String,Object>> list  = qualityLeadingCockpit.selectProductionDays();
        map.put("dataList",list);
        map.put("message","success");
        if (list == null || list.isEmpty()){
            map.put("message","empty");
        }
        return map;
    }

    @Override
    public Map<String, Object> getMaterialRegenerate() {
        Map<String,Object> map = new HashMap<>();
        List<Map<String,Object>> list  = qualityLeadingCockpit.getMaterialRegenerate();
        map.put("dataList",list);
        map.put("message","success");
        if (list == null || list.isEmpty()){
            map.put("message","empty");
        }
        return map;
    }

    @Override
    public Map<String, Object> getThisMonthRegenerate() {
        Map<String,Object> map = new HashMap<>();
        List<Map<String,Object>> list  = qualityLeadingCockpit.getThisMonthRegenerate();
        map.put("dataList",list);
        map.put("message","success");
        if (list == null || list.isEmpty()){
            map.put("message","empty");
        }
        return map;
    }
}
