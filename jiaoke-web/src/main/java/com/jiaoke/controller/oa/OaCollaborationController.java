package com.jiaoke.controller.oa;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.OaCollaborationService;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.task.Task;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Collections;
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
            PageInfo<OaCollaboration> pageInfo = new PageInfo<>(oaCollaborationList);
            return JsonHelper.toJSONString(pageInfo);
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
        List<HistoricTaskInstance> historicTaskInstanceList = activitiUtil.getHistoricTask(getCurrentUser().getId().toString());
        if (historicTaskInstanceList.size() <= 0) {
            return JsonHelper.toJSONString("noData");
        } else {
            List<OaCollaboration> collaborationList = activitiUtil.selectDoneProcessInstance(historicTaskInstanceList);
            if (collaborationList.size() <= 0) {
                return JsonHelper.toJSONString("noData");
            } else {
                PageHelper.startPage(page, 15);
                List<OaCollaboration> oaCollaborationList = oaCoordinationService.selectDone(collaborationList, title);
                PageInfo<OaCollaboration> pageInfo = new PageInfo<>(oaCollaborationList);
                return JsonHelper.toJSONString(pageInfo);
            }
        }
    }

    /**------------督办事项--------------*/
    /**
     * 督办事项
     *
     * @return jsp
     */
    @RequestMapping("/supervise")
    public String supervisionMatters() {
        return "oa/collaboration/oa_supervise";
    }

    /**
     * 新建事项
     *
     * @return jsp
     */
    @RequestMapping("/newBuild")
    public String newMatter() {
        return "oa/collaboration/oa_new_build";
    }
}
