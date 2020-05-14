/**
 * FileName: LeadCockpitServiceImpl
 * author:   Melone
 * Date:     2020/5/10 16:14
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.leadCockpit.service;

import com.jiaoke.LeadCockpit.dao.LeadCockpitServiceDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/5/10 16:14
 * @Description:
 */
@Service
public class LeadCockpitServiceImpl implements LeadCockpitServiceInf {

    @Resource
    private LeadCockpitServiceDao leadCockpitServiceDao;
    @Override
    public Map<String, Object> getTopTenProject() {
        Map<String,Object> map = new HashMap<>();
        List<Map<String,String>> list = leadCockpitServiceDao.selectTopTenProject();
        map.put("dataBody",list);
        map.put("message","success");
        if (list == null || list.isEmpty()){
            map.put("message","empty");
        }
        return map ;
    }

    @Override
    public Map<String, Object> getThisMonthYield() {
        Map<String,Object> map = new HashMap<>();
        //查询本月产量
        List<Map<String,String>> list = leadCockpitServiceDao.selectThisMonthYield();
        //查询本月两个机组前十名产品
        List<Map<String,String>> proList = leadCockpitServiceDao.selectThisMonthProduct();

        map.put("thisMonthYield",list);
        map.put("thisMonthProduct",proList);
        map.put("message","success");

        if (list == null || list.isEmpty()){
            map.put("message","empty");
            return map;
        }
        if (proList == null || proList.isEmpty()){
            map.put("message","empty");
            return map;
        }

        return map ;
    }
}
