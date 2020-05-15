/**
 * FileName: LeadCockpitController
 * author:   Melone
 * Date:     2020/5/10 16:04
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.controller;

import com.alibaba.fastjson.JSON;
import com.jiaoke.leadCockpit.service.LeadCockpitServiceInf;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/5/10 16:04
 * @Description:
 */
@Controller
public class LeadCockpitController {

    @Resource
    private LeadCockpitServiceInf leadCockpitService;
    @ResponseBody
    @RequestMapping("/getTopTenProject.do")
    public String getTopTenProject(){
        Map<String,Object> res = new HashMap<>();
        try{
            res = leadCockpitService.getTopTenProject();
        }catch (Exception e){
            res.put("message","error");
            e.printStackTrace();
        }
        return JSON.toJSONString(res);
    }

    @ResponseBody
    @RequestMapping("/getThisMonthYield.do")
    public String getThisMonthYield(){
        Map<String,Object> res = new HashMap<>();
        try{
            res = leadCockpitService.getThisMonthYield();
        }catch (Exception e){
            res.put("message","error");
            e.printStackTrace();
        }
        return JSON.toJSONString(res);
    }

    @ResponseBody
    @RequestMapping("/getAsphaltAggregateRatio.do")
    public String getAsphaltAggregateRatio(){
        Map<String,Object> res = new HashMap<>();
        try{
            res = leadCockpitService.getAsphaltAggregateRatio();
        }catch (Exception e){
            res.put("message","error");
            e.printStackTrace();
        }
        return JSON.toJSONString(res);
    }
}
