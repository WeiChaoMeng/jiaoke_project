package com.jiaoke.controller.oa.activit;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActDepartureService;
import com.jiaoke.oa.service.OaCollaborationService;
import com.jiaoke.oa.service.UserInfoService;
import org.activiti.bpmn.model.UserTask;
import org.activiti.engine.ManagementService;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.*;

/**
 * 离职会签表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/departure")
public class OaActDepartureController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActDepartureService oaActDepartureService;

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private OaCollaborationService oaCollaborationService;

    @Resource
    private DepartmentService departmentService;

    @Resource
    private ManagementService managementService;

    @Resource
    private TaskService taskService;

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
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_departure";
    }

    /**
     * 提交新增
     *
     * @param oaActDeparture oaActDeparture
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActDeparture oaActDeparture) {
        String randomId = RandomUtil.randomId();
        if (oaActDepartureService.insert(oaActDeparture, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            Map<String, Object> map = new HashMap<>(16);
            Set<Object> set = new HashSet<>();

            List<Department> departmentList = departmentService.selectPrincipalAndSupervisor();
            for (Department department : departmentList) {
                String principal = department.getPrincipal();
                if (principal.contains(",")) {
                    String[] split = principal.split(",");
                    for (String s : split) {
                        set.add(s);
                    }
                    set.add(department.getSupervisor());
                } else {
                    set.add(department.getPrincipal());
                    set.add(department.getSupervisor());
                }
            }
            map.put("resignation_countersign_list", set);
            String instance = activitiUtil.startProcessInstanceByKey("oa_departure", "oa_act_departure:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActDeparture oaActDeparture = oaActDepartureService.selectByPrimaryKey(id);

        String nickname = getCurrentUser().getNickname();

        //权限
        List<Permission> permissionList = userInfoService.getPermissionsByUserInfoId(getCurrentUser().getId());

        String resignationCountersignMember = "";
        if (oaActDeparture.getResignationCountersign() != null) {
            Task task = activitiUtil.getTaskByTaskId(taskId);
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
            if ("countersignEG".equals(nextNode)) {
                resignationCountersignMember = "yes";
            }
        }

        map.put("nickname", nickname);
        map.put("departure", oaActDeparture);
        map.put("resignationCountersignMember", resignationCountersignMember);
        map.put("permissionList", permissionList);
        map.put("taskId", taskId);
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
        OaActDeparture oaActDeparture = oaActDepartureService.selectByPrimaryKey(id);
        model.addAttribute("oaActDeparture", oaActDeparture);
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_departure_handle";
    }

    /**
     * 提交审批
     *
     * @param oaActDeparture oaActDeparture
     * @param taskId         任务Id
     * @param flag           flag
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActDeparture oaActDeparture, String taskId, Integer flag) {
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //部门负责人
        String principal = "principal";
        //部门主管领导
        String supervisor = "supervisor";
        //总经理
        String companyPrincipal = "company_principal";
        //知会
        String leaveNotify = "leaveNotify";
        //会签网关
        String countersignEG = "countersignEG";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        } else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            if (countersignEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    List<UserInfo> userInfoList = userInfoService.selectMultipleByPermission("leaveNotify");
                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> leaveNotifyList = new ArrayList<>();
                    for (UserInfo user : userInfoList) {
                        leaveNotifyList.add(user.getId());
                    }
                    leaveNotifyList.add(oaActDeparture.getPromoter());
                    map.put("whether", 0);
                    map.put("leaveNotifyList", leaveNotifyList);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActDeparture);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                    List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                    for (Task tasks : taskList) {
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("human_affairs", userInfo.getId());
                        activitiUtil.approvalComplete(tasks.getId(), map);
                    }
                    oaCollaborationService.updateStatusCode(oaActDeparture.getId(), "被回退");
                    oaActDeparture.setState(1);
                    oaActDeparture.setHumanAffairs(userInfo.getNickname());
                    return updateByPrimaryKeySelective(oaActDeparture);
                }

            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActDeparture.getId(), 3);
                return "backSuccess";
            } else if (end.equals(nextNode)) {
                activitiUtil.endProcess(taskId);
                return "success";
            } else {
                UserTask userTask = activitiUtil.getUserTask(task.getProcessDefinitionId(), nextNode);
                if (nextNode.equals(userTask.getId())) {
                    String enforcer = userTask.getAssignee().substring(userTask.getAssignee().indexOf("{") + 1, userTask.getAssignee().indexOf("}"));

                    if (promoter.equals(enforcer)) {
                        Map<String, Object> map = new HashMap<>(16);
                        map.put(promoter, activitiUtil.getStartUserId(task.getProcessInstanceId()));
                        activitiUtil.approvalComplete(taskId, map);
                        return updateByPrimaryKeySelective(oaActDeparture);

                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActDeparture);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActDeparture);
                }
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActDeparture oaActDeparture
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActDeparture oaActDeparture) {
        if (oaActDepartureService.updateByPrimaryKeySelective(oaActDeparture) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActDeparture oaActDeparture
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActDeparture oaActDeparture) {
        String randomId = RandomUtil.randomId();
        if (oaActDepartureService.insert(oaActDeparture, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActDeparture oaActDeparture = oaActDepartureService.selectByPrimaryKey(id);
        model.addAttribute("oaActDeparture", oaActDeparture);
        return "oa/act/act_departure_edit";
    }

    /**
     * 编辑后保存
     *
     * @param oaActDeparture oaActDeparture
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActDeparture oaActDeparture) {
        if (oaActDepartureService.edit(oaActDeparture) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActDeparture oaActDeparture
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActDeparture oaActDeparture) {
        //更新数据
        if (oaActDepartureService.edit(oaActDeparture) < 0) {
            return "error";
        } else {
            Map<String, Object> map = new HashMap<>(16);
            Set<Object> set = new HashSet<>();

            List<Department> departmentList = departmentService.selectPrincipalAndSupervisor();
            for (Department department : departmentList) {
                String principal = department.getPrincipal();
                if (principal.contains(",")) {
                    String[] split = principal.split(",");
                    for (String s : split) {
                        set.add(s);
                    }
                    set.add(department.getSupervisor());
                } else {
                    set.add(department.getPrincipal());
                    set.add(department.getSupervisor());
                }
            }
            map.put("resignation_countersign_list", set);
            String instance = activitiUtil.startProcessInstanceByKey("oa_departure", "oa_act_departure:" + oaActDeparture.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStatusCode(oaActDeparture.getId(), "协同");
                oaCollaborationService.updateStateByCorrelationId(oaActDeparture.getId(), 0, oaActDeparture.getTitle());
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
        OaActDeparture oaActDeparture = oaActDepartureService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActDeparture", oaActDeparture);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_departure_details";
    }

    /**
     * app获取详细信息
     *
     * @param id id
     * @return json
     */
    @RequestMapping(value = "/details.api")
    @ResponseBody
    public String cardDetailsApi(String id, String taskId) {
        HashMap<String, Object> map = new HashMap<>(16);
        OaActDeparture oaActDeparture = oaActDepartureService.selectByPrimaryKey(id);

        //权限
        List<Permission> permissionList = userInfoService.getPermissionsByUserInfoId(getCurrentUser().getId());

        if (oaActDeparture.getResignationCountersign() != null) {
            if (taskId != null) {
                List<Task> taskList = taskService.createTaskQuery().processInstanceId(taskId).list();
                if (taskList.size() > 0) {
                    for (Task task1 : taskList) {
                        if (task1 == null) {
                            map.put("resignationCountersignMember", "");
                        } else {
                            Task task = activitiUtil.getTaskByTaskId(task1.getId());
                            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
                            if ("countersignEG".equals(nextNode)) {
                                map.put("resignationCountersignMember", "yes");
                            } else {
                                map.put("resignationCountersignMember", "");
                            }
                        }
                    }
                } else {
                    map.put("resignationCountersignMember", "");
                }
            }else{
                map.put("resignationCountersignMember", "");
            }
        }

        map.put("permissionList", permissionList);
        map.put("taskId", taskId);
        map.put("departure", oaActDeparture);
        return JSON.toJSONString(map);
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
            oaActDepartureService.deleteData(id);
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
