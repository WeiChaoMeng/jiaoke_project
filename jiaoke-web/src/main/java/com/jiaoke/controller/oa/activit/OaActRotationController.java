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
        String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
        //查询部门负责人
        String principalIds = departmentService.selectEnforcerId("principal", department);
        List<String> list = new ArrayList<>();
        //部门负责人是否多个
        if (principalIds.contains(",")) {
            String[] principals = principalIds.split(",");
            for (String principal : principals) {
                String nickname = userInfoService.getNicknameById(Integer.valueOf(principal));
                list.add(nickname);
                list.add(principal);
            }
            model.addAttribute("principalGroup", JsonHelper.toJSONString(list));
        } else {
            model.addAttribute("principalGroup", "");
        }
        model.addAttribute("departmentList", JsonHelper.toJSONString(departmentList));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        model.addAttribute("department", getCurrentUser().getDepartment());
        model.addAttribute("position", getCurrentUser().getPosition());
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
            Map<String, Object> map = new HashMap<>(16);
            List<Object> principalList = new ArrayList<>();

            String principal = oaActRotation.getDepartmentPrincipal();
            //部门负责人勾选多个
            if (principal.contains(",")) {
                String[] split = principal.split(",");
                for (String s : split) {
                    principalList.add(s);
                }
                map.put("principalList", principalList);

                //部门负责人是单个
            } else if (principal.contains("single")) {
                String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
                String enforcerId = departmentService.selectEnforcerId("principal", department);
                principalList.add(enforcerId);
                map.put("principalList", principalList);

                //部门负责人勾选单个
            } else {
                principalList.add(principal);
                map.put("principalList", principalList);
            }
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
        model.addAttribute("oaActRotation", oaActRotation);
        model.addAttribute("oaActRotationJson", JsonHelper.toJSONString(oaActRotation));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        if (oaActRotation.getDepartmentPrincipal().contains(",")){
            return "oa/act/act_rotation_handle2";
        }else{
            return "oa/act/act_rotation_handle";
        }
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
        //网关-部门负责人
        String principalEG = "principalEG";
        //网关-部门主管领导
        String transferPrincipalEG = "transferPrincipalEG";
        //网关-劳资主管
        String personnelEG = "personnelEG";
        //网关-总经理
        String companyEG = "companyEG";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        } else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //网关
            if (principalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> principalList = new ArrayList<>();

                    String principals = departmentService.selectEnforcerId("principal", oaActRotation.getNewDepartment());
                    //部门负责人勾选多个
                    if (principals.contains(",")) {
                        String[] split = principals.split(",");
                        for (String s : split) {
                            principalList.add(s);
                        }
                        map.put("transferPrincipalList", principalList);

                        //部门负责人是单个
                    } else {
                        principalList.add(principals);
                        map.put("transferPrincipalList", principalList);
                    }

                    map.put("whether", 0);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActRotation);
                } else {

                    if (oaActRotation.getDepartmentPrincipal().contains(",")) {

                        UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("humanAffairs", userInfo.getId());
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaCollaborationService.updateStatusCode(oaActRotation.getId(), "被回退");
                        oaActRotation.setState(1);
                        return updateByPrimaryKeySelective(oaActRotation);

                    } else {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("humanAffairs", userInfo.getId());
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActRotation.getId(), "被回退");
                        oaActRotation.setState(1);
                        return updateByPrimaryKeySelective(oaActRotation);
                    }
                }
            } else if (transferPrincipalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("personnel", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActRotation);
                } else {
                    String enforcerId = departmentService.selectEnforcerId("principal", oaActRotation.getNewDepartment());
                    if (enforcerId.contains(",")) {

                        UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("humanAffairs", userInfo.getId());
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaCollaborationService.updateStatusCode(oaActRotation.getId(), "被回退");
                        oaActRotation.setState(1);
                        return updateByPrimaryKeySelective(oaActRotation);

                    } else {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("humanAffairs", userInfo.getId());
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActRotation.getId(), "被回退");
                        oaActRotation.setState(1);
                        return updateByPrimaryKeySelective(oaActRotation);
                    }
                }

                //回退结束
            } else if (personnelEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("company_principal", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActRotation);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("humanAffairs", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActRotation.getId(), "被回退");
                    oaActRotation.setState(1);
                    return updateByPrimaryKeySelective(oaActRotation);
                }

                //正常结束
            } else if (companyEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> leaveNotifyList = new ArrayList<>();
                    leaveNotifyList.add(oaActRotation.getPromoter());
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    leaveNotifyList.add(userInfo.getId());
                    map.put("whether", 0);
                    map.put("normalList", leaveNotifyList);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActRotation);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("humanAffairs", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActRotation.getId(), "被回退");
                    oaActRotation.setState(1);
                    return updateByPrimaryKeySelective(oaActRotation);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActRotation.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActRotation);
                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActRotation);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActRotation);
                }
            }

        }

//        if (flag == 1) {
//            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
//            if (end.equals(nextNode)) {
//                activitiUtil.endProcess(taskId);
//                return "success";
//            } else {
//                String processingOpinion = "";
//                UserTask userTask = activitiUtil.getUserTask(task.getProcessDefinitionId(), nextNode);
//                if (nextNode.equals(userTask.getId())) {
//                    String enforcer = userTask.getAssignee().substring(userTask.getAssignee().indexOf("{") + 1, userTask.getAssignee().indexOf("}"));
//
//                    //发起人
//                    if (promoter.equals(enforcer)) {
//                        Map<String, Object> map = new HashMap<>(16);
//                        map.put(promoter, activitiUtil.getStartUserId(task.getProcessInstanceId()));
//                        activitiUtil.completeAndAppointNextNode(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), map);
//                        return "success";
//
//                        //部门负责人、主管领导
//                    } else if (principal.equals(enforcer)) {
//                        String startUserId = activitiUtil.getStartUserId(task.getProcessInstanceId());
//                        String departmentId = userInfoService.selectDepartmentByUserId(Integer.valueOf(startUserId));
//                        String enforcerId = departmentService.selectEnforcerId(enforcer, departmentId);
//                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, Integer.valueOf(enforcerId));
//                        return "success";
//
//                        //转入部门负责人
//                    } else if (transferPrincipal.equals(enforcer)) {
//                        String enforcerId = departmentService.selectEnforcerId("principal", oaActRotation.getNewDepartment());
//                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, Integer.valueOf(enforcerId));
//                        return "success";
//
//                        //人事部门
//                    } else if (personnel.equals(enforcer)) {
//                        UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel");
//                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
//                        return "success";
//
//                        //总经理
//                    } else if (companyPrincipal.equals(enforcer)) {
//                        UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
//                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
//                        return "success";
//
//                        //知会
//                    } else if (leaveNotify.equals(enforcer)) {
//                        List<UserInfo> userInfoList = userInfoService.selectMultipleByPermission("leaveNotify");
//                        Map<String, Object> map = new HashMap<>(16);
//                        List<Object> leaveNotifyList = new ArrayList<>();
//                        for (UserInfo user : userInfoList) {
//                            leaveNotifyList.add(user.getId());
//                        }
//                        leaveNotifyList.add(oaActRotation.getPromoter());
//                        map.put("leaveNotifyList", leaveNotifyList);
//                        activitiUtil.designatedCountersignPersonnel(taskId, map);
//                        return "success";
//
//                    } else {
//                        UserInfo userInfo = userInfoService.getUserInfoByPermission(enforcer);
//                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
//                        return "success";
//                    }
//                } else {
//                    return "error";
//                }
//            }
//        } else {
//            //驳回
//            managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
//            //修改表单状态
//            oaCollaborationService.updateState(oaActRotation.getId(), 3);
//            return "success";
//        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActRotation oaActRotation
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActRotation oaActRotation) {
        if (oaActRotationService.updateByPrimaryKeySelective(oaActRotation) < 1) {
            return "error";
        } else {
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
        //查询部门负责人
        String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
        String principalIds = departmentService.selectEnforcerId("principal", department);
        List<String> list = new ArrayList<>();
        if (principalIds.contains(",")) {
            String[] principals = principalIds.split(",");
            for (String principal : principals) {
                String nickname = userInfoService.getNicknameById(Integer.valueOf(principal));
                list.add(nickname);
                list.add(principal);
            }
            model.addAttribute("principalGroup", JsonHelper.toJSONString(list));
        } else {
            model.addAttribute("principalGroup", "");
        }
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
        Map<String, Object> map = new HashMap<>(16);
        List<Object> principalList = new ArrayList<>();

        String principal = oaActRotation.getDepartmentPrincipal();
        if (principal.contains(",")) {
            String[] split = principal.split(",");
            for (String s : split) {
                principalList.add(s);
            }
            map.put("principalList", principalList);

        } else if (principal.contains("single")) {
            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
            String enforcerId = departmentService.selectEnforcerId("principal", department);
            principalList.add(enforcerId);
            map.put("principalList", principalList);

        } else {
            principalList.add(principal);
            map.put("principalList", principalList);
        }
        String instance = activitiUtil.startProcessInstanceByKey("oa_rotation", "oa_act_rotation:" + oaActRotation.getId(), map, getCurrentUser().getId().toString());
        if (instance != null) {
            //发送成功后更新状态
            oaActRotationService.edit(oaActRotation);
            oaCollaborationService.updateStatusCode(oaActRotation.getId(), "协同");
            oaCollaborationService.updateStateByCorrelationId(oaActRotation.getId(), 0, oaActRotation.getTitle());
            return "success";
        } else {
            return "error";
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
        model.addAttribute("oaActRotation", oaActRotation);
        if (oaActRotation.getDepartmentPrincipal().contains(",")){
            return "oa/act/act_rotation_details2";
        }else {
            return "oa/act/act_rotation_details";
        }
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
