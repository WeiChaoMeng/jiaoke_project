package com.jiaoke.controller.qualitytest.report;

import com.google.gson.Gson;
import com.jiaoke.qualitytest.bean.QualityTestExperimental;
import com.jiaoke.qualitytest.dao.QualityTestExperimentalDao;
import com.jiaoke.qualitytest.service.QualityTestExperimentalService;
import com.jiaoke.qualitytest.service.report.QualityTestExperimentalPassRateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * QualityTestExperimental试验管理的路由接口服务
 *
 * @author
 */
@Controller
@RequestMapping("/QualityTestExperimentalPassRate")
public class QualityTestExperimentalPassRateController {

    /**
     * QualityTestExperimentalService服务
     */
    @Autowired
    private QualityTestExperimentalPassRateService qualityTestExperimentalPassRateService;

    /**
     * 不合格率分析界面
     * @return
     */
    @RequestMapping("/page.do")
    public String page() {
        return "qualitytest/reports/qualitytestexperimental_passrate";
    }

    /**
     * 不合格记录界面
     */
    @RequestMapping("/unqualified_page.do")
    public String unqualified_page(QualityTestExperimental value) {
        Gson gson = new Gson();
        String json = gson.toJson(value);
        String aa="qualitytest/reports/qualitytestexperimental_passrate_unqualified.jsp?queryData="+json;
        return "qualitytest/reports/qualitytestexperimental_passrate_unqualified.jsp?queryData="+json;
    }

    /**
     * 查询所有QualityTestExperimental数据的方法
     *
     * @param value
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String find(QualityTestExperimental value) {
        return qualityTestExperimentalPassRateService.find(value);
    }


    /**
     * 试验不合格率
     *
     * @param value
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/Experiment_list", method = RequestMethod.GET)
    public String find2(QualityTestExperimental value) {
        return qualityTestExperimentalPassRateService.find_experimental(value);
    }


}
