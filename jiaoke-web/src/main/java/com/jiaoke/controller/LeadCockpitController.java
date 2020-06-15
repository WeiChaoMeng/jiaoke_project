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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

    @ResponseBody
    @RequestMapping("/getTodayProductList.do")
    public String getTodayProductList(){
        Map<String,Object> res = new HashMap<>();
        try{
            res = leadCockpitService.getTodayProductList();
        }catch (Exception e){
            res.put("message","error");
            e.printStackTrace();
        }
        return JSON.toJSONString(res);
    }

    @ResponseBody
    @RequestMapping("/getThisDayProduct.do")
    public String getThisDayProduct(){
        Map<String,Object> res = new HashMap<>();
        try{
            res = leadCockpitService.getThisDayProduct();
        }catch (Exception e){
            res.put("message","error");
            e.printStackTrace();
        }
        return JSON.toJSONString(res);
    }

    @ResponseBody
    @RequestMapping("/getThisDayMaxProductTemperature.do")
    public String getThisDayMaxProductTemperature(){
        Map<String,Object> res = new HashMap<>();
        try{
            res = leadCockpitService.getThisDayMaxProductTemperature();
        }catch (Exception e){
            res.put("message","error");
            e.printStackTrace();
        }
        return JSON.toJSONString(res);
    }


    @ResponseBody
    @RequestMapping("/getWarningProportion.do")
    public String getWarningProportion(){
        Map<String,Object> res = new HashMap<>();
        try{
            res = leadCockpitService.getWarningProportion();
        }catch (Exception e){
            res.put("message","error");
            e.printStackTrace();
        }
        return JSON.toJSONString(res);
    }

    @ResponseBody
    @RequestMapping("/getProductSvgGrading.do")
    public String getProductSvgGrading(){
        Map<String,Object> res = new HashMap<>();
        try{
            res = leadCockpitService.getProductSvgGrading();
        }catch (Exception e){
            res.put("message","error");
            e.printStackTrace();
        }
        return JSON.toJSONString(res);
    }

    @ResponseBody
    @RequestMapping("/getProductBasicMsg.do")
    public String getProductBasicMsg(){
        Map<String,Object> res = new HashMap<>();
        try{
            res = leadCockpitService.getProductBasicMsg();
        }catch (Exception e){
            res.put("message","error");
            e.printStackTrace();
        }
        return JSON.toJSONString(res);
    }

    @ResponseBody
    @RequestMapping(value = "/getMaxProductTemperatureByRationAndDate.do",method = RequestMethod.POST)
    public String getMaxProductTemperatureByRationAndDate(@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("ration") String ration){
        Map<String,Object> res = new HashMap<>();
        try{
            res = leadCockpitService.getMaxProductTemperatureByRationAndDate(startDate,endDate,ration);
        }catch (Exception e){
            res.put("message","error");
            e.printStackTrace();
        }
        return JSON.toJSONString(res);
    }

    @ResponseBody
    @RequestMapping(value = "/getWarningProportionByRationAndDate.do",method = RequestMethod.POST)
    public String getWarningProportionByRationAndDate(@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("ration") String ration){
        Map<String,Object> res = new HashMap<>();
        try{
            res = leadCockpitService.getWarningProportionByRationAndDate(startDate,endDate,ration);
        }catch (Exception e){
            res.put("message","error");
            e.printStackTrace();
        }
        return JSON.toJSONString(res);
    }

    @ResponseBody
    @RequestMapping(value = "/getProductSvgGradingByRationAndDate.do",method = RequestMethod.POST)
    public String getProductSvgGradingByRationAndDate(@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("ration") String ration){
        Map<String,Object> res = new HashMap<>();
        try{
            res = leadCockpitService.getProductSvgGradingByRationAndDate(startDate,endDate,ration);
        }catch (Exception e){
            res.put("message","error");
            e.printStackTrace();
        }
        return JSON.toJSONString(res);
    }

    @ResponseBody
    @RequestMapping(value = "/getProductBasicMsgByRationAndDate.do",method = RequestMethod.POST)
    public String getProductBasicMsgByRationAndDate(@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("ration") String ration){
        Map<String,Object> res = new HashMap<>();
        try{
            res = leadCockpitService.getProductBasicMsgByRationAndDate(startDate,endDate,ration);
        }catch (Exception e){
            res.put("message","error");
            e.printStackTrace();
        }
        return JSON.toJSONString(res);
    }

    @ResponseBody
    @RequestMapping(value = "/getProductToEchars.do",method = RequestMethod.POST)
    public String getProductToEchars(@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate){
        Map<String,Object> res = new HashMap<>();
        try{
            res = leadCockpitService.getProductToEchars(startDate,endDate);
        }catch (Exception e){
            res.put("message","error");
            e.printStackTrace();
        }
        return JSON.toJSONString(res);
    }
}
