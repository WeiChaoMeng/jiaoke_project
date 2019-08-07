package com.jiaoke.controller.personnel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 人事管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019-8-6 15:39
 */
@Controller
@RequestMapping(value = "/personnel")
public class PersonnelManageController {

    @RequestMapping(value = "toIndex")
    public String toIndex(){
        return "personnel/index";
    }
}
