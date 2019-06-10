package com.jiaoke.controller.oa.activit;

import com.jiaoke.oa.bean.UserInfo;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 工作流表单
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/21 11:18
 */
@Controller
@RequestMapping(value = "/actTab")
public class OaActTabController {

    /**
     * 获取当前登录用户信息
     *
     * @return userInfo
     */
    private UserInfo getCurrentUser() {
        return (UserInfo) SecurityUtils.getSubject().getPrincipal();
    }

    /**--------------其他----------------*/
    /**
     * 跳转请假申请单
     *
     * @return jsp
     */
    @RequestMapping("/toLeaveRequest")
    public String toLeaveRequest() {
        return "oa/act/act_leave_request";
    }

    /**
     * 跳转资产领用申请单
     *
     * @return jsp
     */
    @RequestMapping("/toAssetUse")
    public String toAssetUse() {
        return "oa/act/act_asset_use";
    }

    /**
     * 跳转会议室申请单
     *
     * @return jsp
     */
    @RequestMapping("/toConferenceRoom")
    public String toConferenceRoom() {
        return "oa/act/act_conference_room";
    }

    /**
     * 上传
     *
     * @return jsp
     */
    @RequestMapping("/filesUpload")
    public String filesUpload(Model model) {
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/files_upload";
    }

    /**
     * 上传
     *
     * @return jsp
     */
    @RequestMapping("/filesDownload")
    public String filesDownload(Model model) {
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/listfile";
    }

    /**
     * 上传
     *
     * @return jsp
     */
    @RequestMapping("/result")
    public String result() {
        return "oa/act/message";
    }

}
