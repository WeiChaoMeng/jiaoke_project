package com.jiaoke.controller.oa.archives;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 档案管理-经营开发部
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/7 21:41
 */
@Controller
@RequestMapping(value = "/businessDevelopment")
public class BusinessDevelopmentController {

    /**
     * 跳转经营开发部档案
     *
     * @return oa_business_development.jsp
     */
    @RequestMapping(value = "/businessDevelopment.do")
    public String index() {
        return "oa/archives/oa_business_development";
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
