package com.jiaoke.controller.qualitytest.report;

import com.jiaoke.qualitytest.bean.report.*;
import com.jiaoke.qualitytest.service.report.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * VQualityTestReportCjlAvg的路由接口服务
 *
 * @author
 */
@Controller
@RequestMapping("/QualityTestReportAvg")
public class VQualityTestReportAvgController {

    /**
     * VQualityTestReportCjlAvgService服务
     */
    @Autowired
    private VQualityTestReportCjlAvgService vQualityTestReportCjlAvgService;
    /**
     * VQualityTestReportKfAvgService服务
     */
    @Autowired
    private VQualityTestReportKfAvgService vQualityTestReportKfAvgService;

    /**
     * VQualityTestReportXjlAvgService服务
     */
    @Autowired
    private VQualityTestReportXjlAvgService vQualityTestReportXjlAvgService;
    @Autowired
    private VQualityTestReportLqAvgService vQualityTestReportLqAvgService;
    @Autowired
    private VQualityTestReportRhlqAvgService vQualityTestReportRhlqAvgService;
    @Autowired
    private VQualityTestReportLqhhlAvgService vQualityTestReportLqhhlAvgService;


    /**
     * 不合格率分析界面
     *
     * @return
     */
    @RequestMapping("/page.do")
    public String page() {
        return "qualitytest/reports/qualitytestexperimental_avg";
    }

    /**
     * 正态分布界面
     *
     * @return
     */
    @RequestMapping("/ztfbt_page.do")
    public String ztfbt_page(String param) {
        return "qualitytest/reports/qualitytestexperimental_avg_ztfbt";
    }

    /**
     * 查询所有VQualityTestReportCjlAvg数据的方法
     *
     * @param value
     * @return
     */
    @GetMapping(value = "/CJL", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String CJL_find(VQualityTestReportCjlAvg value) {
        return vQualityTestReportCjlAvgService.find(value);
    }


    /**
     * 查询所有VQualityTestReportXjlAvg数据的方法
     *
     * @param value
     * @return
     */
    @GetMapping(value = "/XJL", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String XJL_find(VQualityTestReportXjlAvg value) {
        return vQualityTestReportXjlAvgService.find(value);
    }


    /**
     * 查询所有VQualityTestReportKfAvg数据的方法
     *
     * @param value
     * @return
     */
    @GetMapping(value = "/KF", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String KF_find(VQualityTestReportKfAvg value) {
        return vQualityTestReportKfAvgService.find(value);
    }

    @GetMapping(value = "/LQ", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String LQ_find(VQualityTestReportLqAvg value) {
        return vQualityTestReportLqAvgService.find(value);
    }

    @GetMapping(value = "/RHLQ", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String RHLQ_find(VQualityTestReportRhlqAvg value) {
        return vQualityTestReportRhlqAvgService.find(value);
    }

    /**
     * 查询所有VvQualityTestReportLqhhlAvgService 据的方法
     *
     * @param value
     * @return
     */
    @GetMapping(value = "/LQHHL", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String LQHHL_find(VQualityTestReportLqhhlAvg value) {
        return vQualityTestReportLqhhlAvgService.find(value);
    }
}
