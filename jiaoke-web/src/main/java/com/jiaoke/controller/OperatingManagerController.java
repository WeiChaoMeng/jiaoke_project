/**
 * FileName: OperatingManagerController
 * author:   Melone
 * Date:     2019/8/6 18:28
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.controller;

import com.jiaoke.operating.service.OperatingManagerInf;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/8/6 18:28
 * @Description:
 */
@Controller
public class OperatingManagerController {

    @Resource
    private OperatingManagerInf operatingManagerInf;

    @RequestMapping("/operatingManager.do")
    public String operatingManager(){
        return "operating_manager/om_index";
    }

    @ResponseBody
    @RequestMapping("/getThisWeekData.do")
    public String getThisWeekData(){
        String res = operatingManagerInf.getThisWeekData();
        return res;
    }
    @ResponseBody
    @RequestMapping("/getThisMonthData.do")
    public String getThisMonthData(){
        String res = operatingManagerInf.getThisMonthData();
        return res;
    }
    @ResponseBody
    @RequestMapping("/getThisYearData.do")
    public String getThisYearData(){
        String res = operatingManagerInf.getThisYearData();
        return res;
    }
    @ResponseBody
    @RequestMapping("/getAllData.do")
    public String getAllData(){
        String res = operatingManagerInf.getAllData();
        return res;
    }

    @ResponseBody
    @RequestMapping("/getLastMonthData.do")
    public String getLastMonthData(){
        String res = operatingManagerInf.getLastMonthData();
        return res;
    }
    @ResponseBody
    @RequestMapping("/getMonthContrast.do")
    public String getMonthContrast(){
        String res = operatingManagerInf.getMonthContrast();
        return res;
    }
    @ResponseBody
    @RequestMapping("/getAllMonthPercent.do")
    public String getAllMonthPercent(){
        String res = operatingManagerInf.getAllMonthPercent();
        return res;
    }
    @ResponseBody
    @RequestMapping("/getEveryMonthDays.do")
    public String getEveryMonthDays(){
        String res = operatingManagerInf.getEveryMonthDays();
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/sendYearTotalFromData.do",method = RequestMethod.POST)
    public String sendFromData(@RequestParam("dates") String dates,@RequestParam("total") String total){
        String res = operatingManagerInf.sendFromData(dates,total);
        return res;
    }
    @ResponseBody
    @RequestMapping(value = "/getThisYearDataAndPlan.do")
    public String getThisYearDataAndPlan(){
        String res = operatingManagerInf.getThisYearDataAndPlan();
        return res;
    }
 }
