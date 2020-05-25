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
import org.springframework.web.bind.annotation.RequestParam;
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
    private OaCollaborationService oaCollaborationService;

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
        return "oa/collaborative/oa_wait_send";
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
        PageHelper.startPage(page, 12);
        List<OaCollaboration> collaborationList = oaCollaborationService.selectWaitSend(getCurrentUser().getId(), title);
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
        if (oaCollaborationService.delete(correlationId, table) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 批量删除待发数据
     *
     * @param ids ids
     * @return int
     */
    @RequestMapping(value = "/batchDeleteWaitSend")
    @ResponseBody
    public String batchDeleteWaitSend(@RequestParam(value = "ids[]") String[] ids) {
        for (int i = 0; i < ids.length; i++) {
            if (ids[i].contains(",")) {
                String[] split = ids[i].split(",");
                if (oaCollaborationService.delete(split[0], split[1]) < 0) {
                    return "error";
                }
            } else {
                if (oaCollaborationService.delete(ids[0], ids[1]) < 0) {
                    return "error";
                } else {
                    return "success";
                }
            }
        }
        return "success";
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
        return "oa/collaborative/oa_already_send";
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
            PageHelper.startPage(page, 12);
            List<OaCollaboration> oaCollaborationList = oaCollaborationService.selectAlreadySend(collaborationList, title);
            PageInfo<OaCollaboration> pageInfo = new PageInfo<>(oaCollaborationList);
            return JsonHelper.toJSONString(pageInfo);
        }
    }

    /**
     * 批量删除已发数据
     *
     * @param ids ids
     * @return int
     */
    @RequestMapping(value = "/batchDeleteAlreadySend")
    @ResponseBody
    public String batchDeleteAlreadySend(@RequestParam(value = "ids[]") String[] ids) {
        for (int i = 0; i < ids.length; i++) {
            if (ids[i].contains(",")) {
                String[] split = ids[i].split(",");
                if (oaCollaborationService.deleteByCorrelationId(split[1]) < 0) {
                    return "error";
                } else {
                    if (oaCollaborationService.batchDeleteAlreadySend(split[0], split[1]) < 0) {
                        return "error";
                    } else {
                        if (activitiUtil.deleteByProcessInstanceId(split[2]) < 0) {
                            return "error";
                        }
                    }
                }
            } else {
                if (oaCollaborationService.deleteByCorrelationId(ids[1]) < 0) {
                    return "error";
                } else {
                    if (oaCollaborationService.batchDeleteAlreadySend(ids[0], ids[1]) < 0) {
                        return "error";
                    } else {
                        if (activitiUtil.deleteByProcessInstanceId(ids[2]) < 0) {
                            return "error";
                        } else {
                            return "success";
                        }
                    }
                }
            }
        }
        return "success";
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
        return "oa/collaborative/oa_pending";
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
            PageHelper.startPage(page, 12);
            List<OaCollaboration> oaCollaborationList = oaCollaborationService.selectPending(oaCollaborations, title);
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
            List<OaCollaboration> oaCollaborationList = oaCollaborationService.selectPending(oaCollaborations, "");
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
        return "oa/collaborative/oa_done";
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
            PageHelper.startPage(page, 12);
            List<OaCollaboration> oaCollaborationList = oaCollaborationService.selectDone(collaborationList, title);
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
            List<OaCollaboration> oaCollaborationList = oaCollaborationService.selectDone(collaborationList, "");
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

    /**
     * 流程模板
     *
     * @return jsp
     */
    @RequestMapping("/toFlowTemplate")
    public String toFlowTemplate() {
        return "oa/collaborative/oa_flow";
    }
}
