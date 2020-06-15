package com.jiaoke.controller.oa.activit;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActPactStopService;
import com.jiaoke.oa.service.OaCollaborationService;
import com.jiaoke.oa.service.UserInfoService;
import org.activiti.bpmn.model.UserTask;
import org.activiti.engine.ManagementService;
import org.activiti.engine.task.Task;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 劳务协议终止通知书
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/pactStop")
public class OaActPactStopController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActPactStopService oaActPactStopService;

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private DepartmentService departmentService;

    @Resource
    private OaCollaborationService oaCollaborationService;

    @Resource
    private ManagementService managementService;

    /**
     * 获取当前登录用户信息
     *
     * @return userInfo
     */
    private UserInfo getCurrentUser() {
        return (UserInfo) SecurityUtils.getSubject().getPrincipal();
    }

    /**
     * 跳转新增页面
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toMeals(Model model) {
        List<UserInfo> userInfoList = userInfoService.selectIdAndNicknameAndDepartment();
        List<Department> departmentList = departmentService.selectKeyAndName();
        model.addAttribute("userInfoList", JsonHelper.toJSONString(userInfoList));
        model.addAttribute("departmentList", JsonHelper.toJSONString(departmentList));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_pact_stop";
    }

    /**
     * 提交新增
     *
     * @param oaActPactStop oaActPactStop
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActPactStop oaActPactStop) {
        String randomId = RandomUtil.randomId();
        if (oaActPactStopService.insert(oaActPactStop, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            Map<String, Object> map = new HashMap<>(16);
            map.put("notified_person", oaActPactStop.getNotifiedPersonId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_pact_stop", "oa_act_pact_stop:" + randomId, map, getCurrentUser().getId().toString());
            if (instance != null) {
                return "success";
            }
            return "error";
        }
    }

    /**
     * app获取审批页面信息
     *
     * @param id     id
     * @param taskId taskId
     * @return json
     */
    @RequestMapping(value = "/approval.api")
    @ResponseBody
    public String approvalApi(String id, String taskId) {
        HashMap<String, Object> map = new HashMap<>(16);
        OaActPactStop oaActPactStop = oaActPactStopService.selectByPrimaryKey(id);

        String nickname = getCurrentUser().getNickname();

        map.put("nickname", nickname);
        map.put("taskId", taskId);
        map.put("pactStop", oaActPactStop);
        return JSON.toJSONString(map);
    }

    /**
     * 跳转审批页面
     *
     * @param id     id
     * @param taskId taskId
     * @param model  model
     * @return jsp
     */
    @RequestMapping(value = "/approval")
    public String approval(String id, String taskId, Model model) {
        //审批
        OaActPactStop oaActPactStop = oaActPactStopService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());
        model.addAttribute("oaActPactStop", oaActPactStop);
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_pact_stop_handle";
    }

    /**
     * 提交审批
     *
     * @param oaActPactStop oaActPactStop
     * @param taskId        任务Id
     * @param flag          flag
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActPactStop oaActPactStop, String taskId, Integer flag) {
        //流程终点名称
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //知会人
        String maintainNotify = "maintainNotify";

        //更新数据
        if (oaActPactStopService.updateByPrimaryKeySelective(oaActPactStop) < 1) {
            return "error";
        }

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        }

        if (flag == 1) {
            //同意
            //下个节点
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //下个节点是否为end直接结束
            if (end.equals(nextNode)) {
                activitiUtil.endProcess(taskId);
                return "success";
            } else {
                //附言
                String processingOpinion = "";

                UserTask userTask = activitiUtil.getUserTask(task.getProcessDefinitionId(), nextNode);
                if (nextNode.equals(userTask.getId())) {
                    String enforcer = userTask.getAssignee().substring(userTask.getAssignee().indexOf("{") + 1, userTask.getAssignee().indexOf("}"));

                    if (promoter.equals(enforcer)) {
                        Map<String, Object> map = new HashMap<>(16);
                        map.put(promoter, activitiUtil.getStartUserId(task.getProcessInstanceId()));
                        activitiUtil.completeAndAppointNextNode(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), map);
                        return "success";

                    } else if (maintainNotify.equals(enforcer)) {
                        Map<String, Object> map = new HashMap<>(16);
                        List<Object> maintainNotifyList = new ArrayList<>();
                        maintainNotifyList.add(oaActPactStop.getPromoter());
                        maintainNotifyList.add(oaActPactStop.getNotifiedPersonId());
                        map.put("maintainNotifyList", maintainNotifyList);
                        activitiUtil.designatedCountersignPersonnel(taskId, map);
                        return "success";

                    } else {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission(enforcer);
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        return "success";
                    }
                } else {
                    return "error";
                }
            }
        } else {
            //驳回
            managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
            //修改表单状态
            oaCollaborationService.updateState(oaActPactStop.getId(), 3);
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActPactStop oaActPactStop
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActPactStop oaActPactStop) {
        String randomId = RandomUtil.randomId();
        if (oaActPactStopService.insert(oaActPactStop, getCurrentUser().getId(), randomId, 1) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 跳转编辑页面
     *
     * @param id    id
     * @param model model
     * @return jsp
     */
    @RequestMapping(value = "/toEdit")
    public String toEdit(String id, Model model) {
        OaActPactStop oaActPactStop = oaActPactStopService.selectByPrimaryKey(id);
        List<UserInfo> userInfoList = userInfoService.selectIdAndNicknameAndDepartment();
        List<Department> departmentList = departmentService.selectKeyAndName();
        model.addAttribute("userInfoList", JsonHelper.toJSONString(userInfoList));
        model.addAttribute("departmentList", JsonHelper.toJSONString(departmentList));
        model.addAttribute("oaActPactStop", oaActPactStop);
        return "oa/act/act_pact_stop_edit";
    }

    /**
     * 编辑后保存
     *
     * @param oaActPactStop oaActPactStop
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActPactStop oaActPactStop) {
        if (oaActPactStopService.edit(oaActPactStop) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActPactStop oaActPactStop
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActPactStop oaActPactStop) {
        //更新数据
        if (oaActPactStopService.edit(oaActPactStop) < 0) {
            return "error";
        } else {
            Map<String, Object> map = new HashMap<>(16);
            map.put("notified_person", oaActPactStop.getNotifiedPersonId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_pact_stop", "oa_act_pact_stop:" + oaActPactStop.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStateByCorrelationId(oaActPactStop.getId(), 0, oaActPactStop.getTitle());
                return "success";
            } else {
                return "error";
            }
        }
    }

    /**
     * 跳转详情页面
     *
     * @param id     id
     * @param taskId taskId
     * @param model  model
     * @return jsp
     */
    @RequestMapping(value = "/details")
    public String details(String id, String taskId, Model model) {
        OaActPactStop oaActPactStop = oaActPactStopService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActPactStop", oaActPactStop);
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("commentsListSize", commentsList.size());
        return "oa/act/act_pact_stop_details";
    }

    /**
     * app获取详细信息
     *
     * @param id id
     * @return json
     */
    @RequestMapping(value = "/details.api")
    @ResponseBody
    public String cardDetailsApi(String id) {
        HashMap<String, Object> map = new HashMap<>(16);
        OaActPactStop oaActPactStop = oaActPactStopService.selectByPrimaryKey(id);

        map.put("pactStop", oaActPactStop);
        return JsonHelper.toJSONString(map);
    }

    /**
     * 删除
     *
     * @param id                id
     * @param processInstanceId processInstanceId
     * @return jsp
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(String id, String processInstanceId) {
        //删除流程
        if (activitiUtil.deleteByProcessInstanceId(processInstanceId) == 1) {
            //执行删除数据
            oaActPactStopService.deleteData(id);
            oaCollaborationService.deleteByCorrelationId(id);
            return "success";
        } else {
            return "error";
        }
    }

    /**
     * 撤销流程
     *
     * @param id                id
     * @param processInstanceId processInstanceId
     * @return jsp
     */
    @RequestMapping(value = "/rescind")
    @ResponseBody
    public String rescind(String id, String processInstanceId) {
        int rescind = activitiUtil.rescindByProcessInstanceId(processInstanceId);
        if (rescind < 0) {
            //流程结束无法撤销
            return "end";
        } else if (rescind > 0) {
            //撤销成功后更新state为1待发
            oaCollaborationService.updateState(id, 2);
            return "success";
        } else {
            //错误
            return "error";
        }
    }
}
