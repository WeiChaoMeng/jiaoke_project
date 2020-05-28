package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActLeave;
import com.jiaoke.oa.bean.OaActSealsBorrow;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActLeaveService;
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
 * 请假审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/leave")
public class OaActLeaveController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActLeaveService oaActLeaveService;

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
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_leave";
    }

    /**
     * 提交新增
     *
     * @param oaActLeave oaActLeave
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActLeave oaActLeave) {
        String randomId = RandomUtil.randomId();
        if (oaActLeaveService.insert(oaActLeave, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            Map<String, Object> map = new HashMap<>(16);
            List<Object> principalList = new ArrayList<>();

            String principal = oaActLeave.getDepartmentPrincipal();
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
            String instance = activitiUtil.startProcessInstanceByKey("oa_leave", "oa_act_leave:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActLeave oaActLeave = oaActLeaveService.selectByPrimaryKey(id);
        model.addAttribute("oaActLeave", oaActLeave);
        model.addAttribute("oaActLeaveJson", JsonHelper.toJSONString(oaActLeave));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        if (oaActLeave.getDepartmentPrincipal().contains(",")){
            return "oa/act/act_leave_handle2";
        }else{
            return "oa/act/act_leave_handle";
        }
    }

    /**
     * 提交审批
     *
     * @param oaActLeave oaActLeave
     * @param taskId     taskId
     * @param flag       flag
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActLeave oaActLeave, String taskId, Integer flag) {
        //流程终点名称
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //部门负责人
        String principal = "principal";
        //部门主管领导
        String supervisor = "supervisor";
        //知会人
        String leaveNotify = "leaveNotify";

        //网关-部门负责人
        String principalEG = "principalEG";
        //网关-部门主管领导
        String supervisorEG = "supervisorEG";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        } else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //网关
            if (principalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    //根据发起者id获取所属部门id
                    String departmentId = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
                    //选择执行者Id
                    String enforcerId = departmentService.selectEnforcerId("supervisor", departmentId);

                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("supervisor", enforcerId);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActLeave);
                } else {

                    if (oaActLeave.getDepartmentPrincipal().contains(",")){

                        UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("human_affairs", userInfo.getId());
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaActLeave.setHumanAffairs(userInfo.getNickname());
                        oaCollaborationService.updateStatusCode(oaActLeave.getId(), "被回退");
                        oaActLeave.setState(1);
                        return updateByPrimaryKeySelective(oaActLeave);

                    }else {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("human_affairs", userInfo.getId());
                        oaActLeave.setHumanAffairs(userInfo.getNickname());
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActLeave.getId(), "被回退");
                        oaActLeave.setState(1);
                        return updateByPrimaryKeySelective(oaActLeave);
                    }
                }
            } else if (supervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    List<UserInfo> userInfoList = userInfoService.selectMultipleByPermission("leaveNotify");
                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> leaveNotifyList = new ArrayList<>();
                    for (UserInfo user : userInfoList) {
                        leaveNotifyList.add(user.getId());
                    }
                    leaveNotifyList.add(oaActLeave.getPromoter());
                    map.put("whether", 0);
                    map.put("normalList", leaveNotifyList);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActLeave);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("human_affairs", userInfo.getId());
                    oaActLeave.setHumanAffairs(userInfo.getNickname());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActLeave.getId(), "被回退");
                    oaActLeave.setState(1);
                    return updateByPrimaryKeySelective(oaActLeave);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActLeave.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActLeave);
                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActLeave);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActLeave);
                }
            }
        }


//        if (flag == 1) {
//            //同意
//            //下个节点
//            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
//
//            //下个节点是否为end直接结束
//            if (end.equals(nextNode)) {
//                activitiUtil.endProcess(taskId);
//                return "success";
//            } else {
//                //附言
//                String processingOpinion = "";
//
//                UserTask userTask = activitiUtil.getUserTask(task.getProcessDefinitionId(), nextNode);
//                if (nextNode.equals(userTask.getId())) {
//                    String enforcer = userTask.getAssignee().substring(userTask.getAssignee().indexOf("{") + 1, userTask.getAssignee().indexOf("}"));
//
//                    if (promoter.equals(enforcer)) {
//                        Map<String, Object> map = new HashMap<>(16);
//                        map.put(promoter, activitiUtil.getStartUserId(task.getProcessInstanceId()));
//                        activitiUtil.completeAndAppointNextNode(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), map);
//                        return "success";
//
//                        //部门负责人和主管领导
//                    } else if (principal.equals(enforcer) || supervisor.equals(enforcer)) {
//                        String startUserId = activitiUtil.getStartUserId(task.getProcessInstanceId());
//                        //根据发起者id获取所属部门id
//                        String departmentId = userInfoService.selectDepartmentByUserId(Integer.valueOf(startUserId));
//                        //选择执行者Id
//                        String enforcerId = departmentService.selectEnforcerId(enforcer, departmentId);
//                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, Integer.valueOf(enforcerId));
//                        return "success";
//
//                        //审批后知会
//                    } else if (leaveNotify.equals(enforcer)) {
//                        List<UserInfo> userInfoList = userInfoService.selectMultipleByPermission("leaveNotify");
//                        Map<String, Object> map = new HashMap<>(16);
//                        List<Object> leaveNotifyList = new ArrayList<>();
//                        for (UserInfo user : userInfoList) {
//                            leaveNotifyList.add(user.getId());
//                        }
//                        leaveNotifyList.add(oaActLeave.getPromoter());
//                        map.put("leaveNotifyList", leaveNotifyList);
//                        activitiUtil.designatedCountersignPersonnel(taskId,map);
//                        return "success";
//
//                        //知会
//                    }else {
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
//            oaCollaborationService.updateState(oaActLeave.getId(), 3);
//            return "success";
//        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActLeave oaActTaxiUse
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActLeave oaActLeave) {
        if (oaActLeaveService.updateByPrimaryKeySelective(oaActLeave) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActLeave oaActLeave
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActLeave oaActLeave) {
        String randomId = RandomUtil.randomId();
        if (oaActLeaveService.insert(oaActLeave, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActLeave oaActLeave = oaActLeaveService.selectByPrimaryKey(id);
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
        model.addAttribute("nickname", getCurrentUser().getNickname());
        model.addAttribute("oaActLeave", oaActLeave);
        return "oa/act/act_leave_edit";
    }

    /**
     * 编辑后保存
     *
     * @param oaActLeave oaActLeave
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActLeave oaActLeave) {
        if (oaActLeaveService.edit(oaActLeave) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActLeave oaActLeave
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActLeave oaActLeave) {

        Map<String, Object> map = new HashMap<>(16);
        List<Object> principalList = new ArrayList<>();

        String principal = oaActLeave.getDepartmentPrincipal();
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
        String instance = activitiUtil.startProcessInstanceByKey("oa_leave", "oa_act_leave:" + oaActLeave.getId(), map, getCurrentUser().getId().toString());
        if (instance != null) {
            //发送成功后更新状态
            oaActLeaveService.edit(oaActLeave);
            oaCollaborationService.updateStatusCode(oaActLeave.getId(), "协同");

            oaCollaborationService.updateStateByCorrelationId(oaActLeave.getId(), 0, oaActLeave.getTitle());
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
        OaActLeave oaActLeave = oaActLeaveService.selectByPrimaryKey(id);
        model.addAttribute("oaActLeave", oaActLeave);
        if (oaActLeave.getDepartmentPrincipal().contains(",")){
            return "oa/act/act_leave_details2";
        }else{
            return "oa/act/act_leave_details";
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
            oaActLeaveService.deleteData(id);
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
