package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActLaborContractStopService;
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
 * 劳动合同终止通知书
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/laborContractStop")
public class OaActLaborContractStopController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActLaborContractStopService oaActLaborContractStopService;

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
        return "oa/act/act_labor_contract_stop";
    }

    /**
     * 提交新增
     *
     * @param oaActLaborContractStop oaActLaborContractStop
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActLaborContractStop oaActLaborContractStop) {
        String randomId = RandomUtil.randomId();
        if (oaActLaborContractStopService.insert(oaActLaborContractStop, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            Map<String, Object> map = new HashMap<>(16);
            map.put("notified_person", oaActLaborContractStop.getNotifiedPersonId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_labor_contract_stop", "oa_act_labor_contract_stop:" + randomId, map, getCurrentUser().getId().toString());
            if (instance != null) {
                return "success";
            }
            return "error";
        }
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
        OaActLaborContractStop oaActLaborContractStop = oaActLaborContractStopService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());
        model.addAttribute("oaActLaborContractStop", oaActLaborContractStop);
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_labor_contract_stop_handle";
    }

    /**
     * 提交审批
     *
     * @param oaActLaborContractStop oaActLaborContractStop
     * @param taskId                 任务Id
     * @param flag                   flag
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActLaborContractStop oaActLaborContractStop, String taskId, Integer flag) {
        //流程终点名称
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //知会人
        String maintainNotify = "maintainNotify";

        //更新数据
        if (oaActLaborContractStopService.updateByPrimaryKeySelective(oaActLaborContractStop) < 1) {
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
                        maintainNotifyList.add(oaActLaborContractStop.getPromoter());
                        maintainNotifyList.add(oaActLaborContractStop.getNotifiedPersonId());
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
            oaCollaborationService.updateState(oaActLaborContractStop.getId(), 3);
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActLaborContractStop oaActLaborContractStop
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActLaborContractStop oaActLaborContractStop) {
        String randomId = RandomUtil.randomId();
        if (oaActLaborContractStopService.insert(oaActLaborContractStop, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActLaborContractStop oaActLaborContractStop = oaActLaborContractStopService.selectByPrimaryKey(id);
        List<UserInfo> userInfoList = userInfoService.selectIdAndNicknameAndDepartment();
        List<Department> departmentList = departmentService.selectKeyAndName();
        model.addAttribute("userInfoList", JsonHelper.toJSONString(userInfoList));
        model.addAttribute("departmentList", JsonHelper.toJSONString(departmentList));
        model.addAttribute("oaActLaborContractStop", oaActLaborContractStop);
        return "oa/act/act_labor_contract_stop_edit";
    }

    /**
     * 编辑后保存
     *
     * @param oaActLaborContractStop oaActLaborContractStop
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActLaborContractStop oaActLaborContractStop) {
        if (oaActLaborContractStopService.edit(oaActLaborContractStop) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActLaborContractStop oaActLaborContractStop
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActLaborContractStop oaActLaborContractStop) {
        //更新数据
        if (oaActLaborContractStopService.edit(oaActLaborContractStop) < 0) {
            return "error";
        } else {
            Map<String, Object> map = new HashMap<>(16);
            map.put("notified_person", oaActLaborContractStop.getNotifiedPersonId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_labor_contract_stop", "oa_act_labor_contract_stop:" + oaActLaborContractStop.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStateByCorrelationId(oaActLaborContractStop.getId(), 0, oaActLaborContractStop.getTitle());
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
        OaActLaborContractStop oaActLaborContractStop = oaActLaborContractStopService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActLaborContractStop", oaActLaborContractStop);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_labor_contract_stop_details";
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
            oaActLaborContractStopService.deleteData(id);
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
