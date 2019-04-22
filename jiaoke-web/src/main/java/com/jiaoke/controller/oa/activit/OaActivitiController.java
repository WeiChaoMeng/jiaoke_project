package com.jiaoke.controller.oa.activit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 工作流表单
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/21 11:18
 */
@Controller
@RequestMapping(value = "/activitiForm")
public class OaActivitiController {

    /**
     * 跳转请假申请单
     *
     * @return jsp
     */
    @RequestMapping("/toLeaveRequest")
    public String toLeaveRequest() {
        return "oa/activiti/act_leave_request";
    }

    /**
     * 跳转资产领用申请单
     *
     * @return jsp
     */
    @RequestMapping("/toAssetUse")
    public String toAssetUse() {
        return "oa/activiti/act_asset_use";
    }

    /**
     * 跳转会议室申请单
     *
     * @return jsp
     */
    @RequestMapping("/toConferenceRoom")
    public String toConferenceRoom() {
        return "oa/activiti/act_conference_room";
    }

    /**
     * 跳转用车申请单
     *
     * @return jsp
     */
    @RequestMapping("/toCarApply")
    public String toCarApply() {
        return "oa/activiti/act_car_apply";
    }


}
