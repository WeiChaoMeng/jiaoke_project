package com.jiaoke.controller.oa.archives;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 档案管理-生产管理部
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/7 21:41
 */
@Controller
@RequestMapping(value = "/productionAdministration")
public class ProductionAdministrationController {

    /**
     * 跳转生产管理部档案
     *
     * @return oa_production_administration.jsp
     */
    @RequestMapping(value = "/productionAdministration.do")
    public String index() {
        return "oa/archives/oa_production_administration";
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
