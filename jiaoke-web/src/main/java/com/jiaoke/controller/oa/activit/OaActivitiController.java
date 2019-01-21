package com.jiaoke.controller.oa.activit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 工作流表单
 * @author lihui
 * @version 1.0
 * @date 2019/1/21 11:18
 */
@Controller
@RequestMapping(value = "/activitiForm")
public class OaActivitiController {

    /**
     *
     * @return
     */
    @RequestMapping("/actLeaveRequest")
    public String leaveRequest(){
        return "oa/activiti/act_leave_request";
    }
}
