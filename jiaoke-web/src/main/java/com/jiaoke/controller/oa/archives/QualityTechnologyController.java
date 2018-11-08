package com.jiaoke.controller.oa.archives;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 档案管理-质量技术部
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/7 21:41
 */
@Controller
@RequestMapping(value = "/qualityTechnology")
public class QualityTechnologyController {

    /**
     * 跳转质量技术部档案
     *
     * @return oa_quality_technology.jsp
     */
    @RequestMapping(value = "/qualityTechnology.do")
    public String index() {
        return "oa/archives/oa_quality_technology";
    }

    /**
     * 跳转添加档案页面
     *
     * @return oa_new_contract.jsp
     */
    @RequestMapping(value = "/OANewContract.do")
    public String to() {
        return "oa/archives/oa_new_contract";
    }
}
