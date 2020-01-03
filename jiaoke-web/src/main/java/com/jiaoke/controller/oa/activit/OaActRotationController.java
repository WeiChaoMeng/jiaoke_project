package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActRotationService;
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
 * 员工轮岗审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/rotation")
public class OaActRotationController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActRotationService oaActRotationService;

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private OaCollaborationService oaCollaborationService;

    @Resource
    private DepartmentService departmentService;

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
        List<Department> departmentList = departmentService.selectKeyAndName();
        model.addAttribute("departmentList", JsonHelper.toJSONString(departmentList));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        model.addAttribute("department", getCurrentUser().getDepartment());
        model.addAttribute("job", getCurrentUser().getJob());
        return "oa/act/act_rotation";
    }

    /**
     * 提交新增
     *
     * @param oaActRotation oaActRotation
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActRotation oaActRotation) {
        String randomId = RandomUtil.randomId();
        if (oaActRotationService.insert(oaActRotation, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
            String principal = departmentService.selectEnforcerId("principal", department);
            Map<String, Object> map = new HashMap<>(16);
            map.put("principal", principal);
            String instance = activitiUtil.startProcessInstanceByKey("oa_rotation", "oa_act_rotation:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActRotation oaActRotation = oaActRotationService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());
        model.addAttribute("oaActRotation", oaActRotation);
        model.addAttribute("oaActRotationJson", JsonHelper.toJSONString(oaActRotation));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_rotation_handle";
    }

    /**
     * 提交审批
     *
     * @param oaActRotation oaActRotation
     * @param taskId        任务Id
     * @param flag          flag
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActRotation oaActRotation, String taskId, Integer flag) {
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //部门负责人
        String principal = "principal";
        //转入部门负责人
        String transferPrincipal = "transfer_principal";
        //人事
        String personnel = "personnel";
        //总经理
        String companyPrincipal = "company_principal";
        //知会
        String leaveNotify = "leaveNotify";
        //更新数据
        if (oaActRotationService.updateByPrimaryKeySelective(oaActRotation) < 1) {
            return "error";
        }

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        }

        if (flag == 1) {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
            if (end.equals(nextNode)) {
                activitiUtil.endProcess(taskId);
                return "success";
            } else {
                String processingOpinion = "";
                UserTask userTask = activitiUtil.getUserTask(task.getProcessDefinitionId(), nextNode);
                if (nextNode.equals(userTask.getId())) {
                    String enforcer = userTask.getAssignee().substring(userTask.getAssignee().indexOf("{") + 1, userTask.getAssignee().indexOf("}"));

                    //发起人
                    if (promoter.equals(enforcer)) {
                        Map<String, Object> map = new HashMap<>(16);
                        map.put(promoter, activitiUtil.getStartUserId(task.getProcessInstanceId()));
                        activitiUtil.completeAndAppointNextNode(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), map);
                        return "success";

                        //部门负责人、主管领导
                    } else if (principal.equals(enforcer)) {
                        String startUserId = activitiUtil.getStartUserId(task.getProcessInstanceId());
                        String departmentId = userInfoService.selectDepartmentByUserId(Integer.valueOf(startUserId));
                        String enforcerId = departmentService.selectEnforcerId(enforcer, departmentId);
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, Integer.valueOf(enforcerId));
                        return "success";

                        //转入部门负责人
                    } else if (transferPrincipal.equals(enforcer)) {
                        String enforcerId = departmentService.selectEnforcerId("principal", oaActRotation.getNewDepartment());
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, Integer.valueOf(enforcerId));
                        return "success";

                        //人事部门
                    } else if (personnel.equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel");
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        return "success";

                        //总经理
                    } else if (companyPrincipal.equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        return "success";

                        //知会
                    } else if (leaveNotify.equals(enforcer)) {
                        List<UserInfo> userInfoList = userInfoService.selectMultipleByPermission("leaveNotify");
                        Map<String, Object> map = new HashMap<>(16);
                        List<Object> leaveNotifyList = new ArrayList<>();
                        for (UserInfo user : userInfoList) {
                            leaveNotifyList.add(user.getId());
                        }
                        leaveNotifyList.add(oaActRotation.getPromoter());
                        map.put("leaveNotifyList", leaveNotifyList);
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
            oaCollaborationService.updateState(oaActRotation.getId(), 3);
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActRotation oaActRotation
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActRotation oaActRotation) {
        String randomId = RandomUtil.randomId();
        if (oaActRotationService.insert(oaActRotation, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActRotation oaActRotation = oaActRotationService.selectByPrimaryKey(id);
        List<Department> departmentList = departmentService.selectKeyAndName();
        model.addAttribute("departmentList", JsonHelper.toJSONString(departmentList));
        model.addAttribute("oaActRotation", oaActRotation);
        return "oa/act/act_rotation_edit";
    }

    /**
     * 编辑后保存
     *
     * @param oaActRotation oaActRotation
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActRotation oaActRotation) {
        if (oaActRotationService.edit(oaActRotation) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActRotation oaActRotation
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActRotation oaActRotation) {
        //更新数据
        if (oaActRotationService.edit(oaActRotation) < 0) {
            return "error";
        } else {
            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
            String principal = departmentService.selectEnforcerId("principal", department);
            Map<String, Object> map = new HashMap<>(16);
            map.put("principal", principal);
            String instance = activitiUtil.startProcessInstanceByKey("oa_rotation", "oa_act_rotation:" + oaActRotation.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStateByCorrelationId(oaActRotation.getId(), 0, oaActRotation.getTitle());
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
        OaActRotation oaActRotation = oaActRotationService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActRotation", oaActRotation);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_rotation_details";
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
            oaActRotationService.deleteData(id);
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
