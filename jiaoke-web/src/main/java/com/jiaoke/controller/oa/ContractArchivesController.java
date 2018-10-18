package com.jiaoke.controller.oa;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 合同档案
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/12 12:02
 */
@Controller
@RequestMapping(value = "/contractArchives")
public class ContractArchivesController {


    /**
     * 跳转添加合同页面
     *
     * @return oa_new_contract.jsp
     */
    @RequestMapping(value = "/OANewContract.do")
    public String to() {
        return "oa/archives/oa_new_contract";
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String add(String createTime, String company) {
        System.out.println(createTime + "-----" + company);
        return "";
    }
}
