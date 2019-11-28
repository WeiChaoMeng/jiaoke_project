package com.jiaoke.controller.oa;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.OaCollaborationService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.task.Task;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

/**
 * 协同
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-31 2:43
 */
@Controller
@RequestMapping(value = "/collaboration")
public class OaCollaborationController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaCollaborationService oaCoordinationService;

    /**
     * 获取当前登录用户信息
     *
     * @return userInfo
     */
    private UserInfo getCurrentUser() {
        return (UserInfo) SecurityUtils.getSubject().getPrincipal();
    }

    /**------------待发事项--------------*/
    /**
     * 待发事项
     *
     * @return jsp
     */
    @RequestMapping("/waitSend")
    public String waitingMatter(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/collaboration/oa_wait_send";
    }

    /**
     * 加载待发事项数据
     *
     * @param page page
     * @return json
     */
    @RequestMapping(value = "/loadingWaitSendData")
    @ResponseBody
    public String loadingWaitSendData(int page, String title) {
        PageHelper.startPage(page, 15);
        List<OaCollaboration> collaborationList = oaCoordinationService.selectWaitSend(getCurrentUser().getId(), title);
        for (OaCollaboration collaboration : collaborationList) {
            HistoricProcessInstance processInstance = activitiUtil.getProcessInstanceByBusinessKey(collaboration.getTable() + collaboration.getCorrelationId());
            if (processInstance != null) {
                collaboration.setProcessInstanceId(processInstance.getId());
            }
        }
        PageInfo<OaCollaboration> pageInfo = new PageInfo<>(collaborationList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 删除
     *
     * @param correlationId correlationId
     * @param table         table
     * @return s/e
     */
    @RequestMapping(value = "/deleteWaitSend")
    @ResponseBody
    public String deleteWaitSend(String correlationId, String table) {
        if (oaCoordinationService.delete(correlationId, table) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**------------已发事项--------------*/
    /**
     * 已发事项
     *
     * @return jsp
     */
    @RequestMapping("/alreadySend")
    public String alreadyIssuedMatter(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/collaboration/oa_already_send";
    }

    /**
     * 加载已发事项数据
     *
     * @param page page
     * @return json
     */
    @RequestMapping(value = "/loadingAlreadySendData")
    @ResponseBody
    public String loadingAlreadySendData(int page, String title) {
        List<OaCollaboration> collaborationList = activitiUtil.alreadyIssuedProcessInstance(getCurrentUser().getId().toString());
        if (collaborationList.size() < 1) {
            return JsonHelper.toJSONString("noData");
        } else {
            PageHelper.startPage(page, 15);
            List<OaCollaboration> oaCollaborationList = oaCoordinationService.selectAlreadySend(collaborationList, title);
            //list逆序
            Collections.reverse(oaCollaborationList);
            PageInfo<OaCollaboration> pageInfo = new PageInfo<>(oaCollaborationList);
            return JsonHelper.toJSONString(pageInfo);
        }
    }

    /**------------待办事项--------------*/
    /**
     * 待办事项
     *
     * @return jsp
     */
    @RequestMapping("/pending")
    public String pending(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/collaboration/oa_pending";
    }

    /**
     * 加载待办任务数据
     *
     * @param page page
     * @return json
     */
    @RequestMapping(value = "/loadingPendingData")
    @ResponseBody
    public String loadingPendingData(int page, String title) {
        //待办任务
        //根据当前登录人id获取taskList
        List<Task> taskList = activitiUtil.getTaskByAssignee(getCurrentUser().getId().toString());
        if (taskList.size() <= 0) {
            return JsonHelper.toJSONString("noData");
        } else {
            List<OaCollaboration> oaCollaborations = activitiUtil.getPendingProcessInstance(taskList);
            PageHelper.startPage(page, 15);
            List<OaCollaboration> oaCollaborationList = oaCoordinationService.selectPending(oaCollaborations, title);
            Collections.reverse(oaCollaborationList);
            PageInfo<OaCollaboration> pageInfo = new PageInfo<>(oaCollaborationList);
            return JsonHelper.toJSONString(pageInfo);
        }
    }

    /**
     * app获取待办事项
     *
     * @return json
     */
    @RequestMapping(value = "/pendingApproval.api")
    @ResponseBody
    public String pendingApproval() {
        HashMap<String, Object> map = new HashMap<>(16);
        //根据当前登录人id获取taskList
        List<Task> taskList = activitiUtil.getTaskByAssignee(getCurrentUser().getId().toString());
        if (taskList.size() <= 0) {
            map.put("resultCode", "204");
            map.put("reason", "无匹配数据");
            map.put("result", "null");
            return JsonHelper.toJSONString(map);
        } else {
            List<OaCollaboration> oaCollaborations = activitiUtil.getPendingProcessInstance(taskList);
            List<OaCollaboration> oaCollaborationList = oaCoordinationService.selectPending(oaCollaborations, "");
            for (OaCollaboration collaboration : oaCollaborationList) {
                collaboration.setCreateTimeStr(collaboration.getCreateTimeStr().substring(0, 10));
            }
            Collections.reverse(oaCollaborationList);
            map.put("resultCode", "200");
            map.put("reason", "success");
            map.put("result", oaCollaborationList);
            return JSON.toJSONString(map);
        }

    }

    /**------------已办事项--------------*/
    /**
     * 已办事项
     *
     * @return jsp
     */
    @RequestMapping("/done")
    public String managedMatter(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/collaboration/oa_done";
    }

    /**
     * 加载已办事项数据
     *
     * @param page  page
     * @param title title
     * @return json
     */
    @RequestMapping(value = "/loadingDoneData")
    @ResponseBody
    public String loadingDoneData(int page, String title) {
        List<OaCollaboration> collaborationList = activitiUtil.selectDoneProcessInstance(getCurrentUser().getId().toString());
        if (collaborationList.size() < 1) {
            return JsonHelper.toJSONString("noData");
        } else {
            PageHelper.startPage(page, 15);
            List<OaCollaboration> oaCollaborationList = oaCoordinationService.selectDone(collaborationList, title);
            Collections.reverse(oaCollaborationList);
            PageInfo<OaCollaboration> pageInfo = new PageInfo<>(oaCollaborationList);
            return JsonHelper.toJSONString(pageInfo);
        }
    }

    /**
     * app获取已完成事项
     *
     * @return json
     */
    @RequestMapping(value = "/doneApproval.api")
    @ResponseBody
    public String doneApproval() {
        HashMap<String, Object> map = new HashMap<>(16);
        //根据当前登录人id获取taskList
        List<OaCollaboration> collaborationList = activitiUtil.selectDoneProcessInstance(getCurrentUser().getId().toString());
        if (collaborationList.size() <= 0) {
            map.put("resultCode", "204");
            map.put("reason", "无匹配数据");
            map.put("result", "null");
            return JsonHelper.toJSONString(map);
        } else {
            List<OaCollaboration> oaCollaborationList = oaCoordinationService.selectDone(collaborationList, "");
            for (OaCollaboration collaboration : oaCollaborationList) {
                collaboration.setCreateTimeStr(collaboration.getStartTimeStr().substring(0, 10));
            }
            Collections.reverse(oaCollaborationList);
            map.put("resultCode", "200");
            map.put("reason", "success");
            map.put("result", oaCollaborationList);
            return JSON.toJSONString(map);
        }
    }
}
