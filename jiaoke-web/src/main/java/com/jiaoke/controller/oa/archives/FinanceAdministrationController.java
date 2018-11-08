package com.jiaoke.controller.oa.archives;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 档案管理-财务管理部
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/7 21:41
 */
@Controller
@RequestMapping(value = "/financeAdministration")
public class FinanceAdministrationController {

    /**
     * 跳转财务管理部档案
     *
     * @return oa_finance_administration.jsp
     */
    @RequestMapping(value = "/financeAdministration.do")
    public String index() {
        return "oa/archives/oa_finance_administration";
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
