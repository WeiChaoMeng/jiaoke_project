package com.jiaoke.controller.oa.archives;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 档案管理-综合办公室
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/7 21:41
 */
@Controller
@RequestMapping(value = "/generalOffice")
public class GeneralOfficeController {

    /**
     * 跳转综合办公室档案
     *
     * @return oa_general_office.jsp
     */
    @RequestMapping(value = "/generalOffice.do")
    public String index() {
        return "oa/archives/oa_general_office";
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
