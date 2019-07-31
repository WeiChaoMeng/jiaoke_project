package com.jiaoke.controller.oa;

import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.OaIndexService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.task.Task;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

/**
 * OA模块首页
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-28 0:46
 */
@Controller
@RequestMapping(value = "/oaHomePage")
public class OaIndexController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaIndexService oaIndexService;

    /**
     * 获取当前登录用户信息
     *
     * @return userInfo
     */
    private UserInfo getCurrentUser() {
        return (UserInfo) SecurityUtils.getSubject().getPrincipal();
    }

    @RequestMapping(value = "/toOaHomePage")
    public String toOaHomePage() {
        return "oa/oa_index";
    }

    /**
     * 加载数据
     *
     * @return json
     */
    @RequestMapping(value = "/loadingData")
    @ResponseBody
    public String loadingData() {
        //待办任务
        HashMap<String, Object> map = new HashMap<>(16);
        //根据当前登录人id获取taskList
        List<Task> taskList = activitiUtil.getTaskByAssignee(getCurrentUser().getId().toString());
        if (taskList.size() <= 0) {
            map.put("upcomingMatterNumber", taskList.size());
            map.put("upcomingMatterList", "empty");
        } else {
            List<OaCollaboration> oaCollaborationList = oaIndexService.upcomingMatterData(taskList);
            Collections.reverse(oaCollaborationList);
            map.put("upcomingMatterNumber", taskList.size());
            map.put("upcomingMatterList", oaCollaborationList);
        }

        //审批未结束任务追踪
        List<HistoricProcessInstance> processInstanceList = activitiUtil.getUnfinishedProcessInstance(getCurrentUser().getId().toString());
        if (processInstanceList.size() <= 0) {
            map.put("trackingMatterNumber", processInstanceList.size());
            map.put("trackingMatterList", "empty");
        } else {
            List<OaCollaboration> oaCollaborationList = oaIndexService.trackingMatterData(processInstanceList);
            Collections.reverse(oaCollaborationList);
            map.put("trackingMatterNumber", processInstanceList.size());
            map.put("trackingMatterList", oaCollaborationList);
        }

        return JsonHelper.toJSONString(map);
    }
}
