package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActTransferService;
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
 * 转岗申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/transfer")
public class OaActTransferController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActTransferService oaActTransferService;

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
        model.addAttribute("nickname", getCurrentUser().getNickname());
        model.addAttribute("department", getCurrentUser().getDepartment());
        model.addAttribute("position", getCurrentUser().getPosition());
        model.addAttribute("departmentList", JsonHelper.toJSONString(departmentList));
        return "oa/act/act_transfer";
    }

    /**
     * 提交新增
     *
     * @param oaActTransfer oaActTransfer
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActTransfer oaActTransfer) {
        String randomId = RandomUtil.randomId();
        if (oaActTransferService.insert(oaActTransfer, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
            Map<String, Object> map = new HashMap<>(16);
            map.put("personnel_censor", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_transfer", "oa_act_transfer:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActTransfer oaActTransfer = oaActTransferService.selectByPrimaryKey(id);
        model.addAttribute("oaActTransfer", oaActTransfer);
        model.addAttribute("oaActTransferJson", JsonHelper.toJSONString(oaActTransfer));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        if (oaActTransfer.getDepartmentPrincipal().contains(",")){
            return "oa/act/act_transfer_handle2";
        }
        return "oa/act/act_transfer_handle";
    }

    /**
     * 提交审批
     *
     * @param oaActTransfer oaActTransfer
     * @param taskId        任务Id
     * @param flag          flag
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActTransfer oaActTransfer, String taskId, Integer flag) {
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //人事审查
        String personnelCensor = "personnel_censor";
        //部门负责人
        String principal = "principal";
        //转出负责人网关
        String outPrincipalEG = "outPrincipalEG";
        //转出主管网关
        String outSupervisorEG = "outSupervisorEG";
        //转入负责人网关
        String enterPrincipalEG = "enterPrincipalEG";
        //转入主管网关
        String enterSupervisorEG = "enterSupervisorEG";
        //网关-劳资主管
        String personnelEG = "personnelEG";
        //网关-总经理
        String companyEG = "companyEG";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        } else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //转出负责人
            if (outPrincipalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    //根据发起者id获取所属部门id
                    String departmentId = userInfoService.selectDepartmentByUserId(oaActTransfer.getPromoter());
                    //选择执行者Id
                    String enforcerId = departmentService.selectEnforcerId("supervisor", departmentId);

                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("supervisor", enforcerId);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActTransfer);
                } else {

                    if (oaActTransfer.getDepartmentPrincipal().contains(",")) {

                        UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("humanAffairs", userInfo.getId());
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaCollaborationService.updateStatusCode(oaActTransfer.getId(), "被回退");
                        oaActTransfer.setState(1);
                        return updateByPrimaryKeySelective(oaActTransfer);

                    } else {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("humanAffairs", userInfo.getId());
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActTransfer.getId(), "被回退");
                        oaActTransfer.setState(1);
                        return updateByPrimaryKeySelective(oaActTransfer);
                    }
                }
            } else if (outSupervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> principalList = new ArrayList<>();

                    String principals = departmentService.selectEnforcerId("principal", oaActTransfer.getNewDepartment());

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
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActTransfer);
                } else {

                    if (oaActTransfer.getDepartmentPrincipal().contains(",")) {

                        UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("humanAffairs", userInfo.getId());
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaCollaborationService.updateStatusCode(oaActTransfer.getId(), "被回退");
                        oaActTransfer.setState(1);
                        return updateByPrimaryKeySelective(oaActTransfer);

                    } else {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("humanAffairs", userInfo.getId());
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActTransfer.getId(), "被回退");
                        oaActTransfer.setState(1);
                        return updateByPrimaryKeySelective(oaActTransfer);
                    }
                }

                //回退结束
            } else if (enterPrincipalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    String enforcerId = departmentService.selectEnforcerId("supervisor", oaActTransfer.getNewDepartment());
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("transferSupervisor", enforcerId);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActTransfer);
                } else {

                    if (oaActTransfer.getDepartmentPrincipal().contains(",")) {

                        UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("humanAffairs", userInfo.getId());
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaCollaborationService.updateStatusCode(oaActTransfer.getId(), "被回退");
                        oaActTransfer.setState(1);
                        return updateByPrimaryKeySelective(oaActTransfer);

                    } else {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("humanAffairs", userInfo.getId());
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActTransfer.getId(), "被回退");
                        oaActTransfer.setState(1);
                        return updateByPrimaryKeySelective(oaActTransfer);
                    }
                }
            } else if (enterSupervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("personnel", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActTransfer);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("humanAffairs", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActTransfer.getId(), "被回退");
                    oaActTransfer.setState(1);
                    return updateByPrimaryKeySelective(oaActTransfer);
                }

                //正常结束
            } else if (personnelEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("company_principal", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActTransfer);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("humanAffairs", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActTransfer.getId(), "被回退");
                    oaActTransfer.setState(1);
                    return updateByPrimaryKeySelective(oaActTransfer);
                }

                //正常结束
            } else if (companyEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> leaveNotifyList = new ArrayList<>();
                    leaveNotifyList.add(oaActTransfer.getPromoter());
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    leaveNotifyList.add(userInfo.getId());
                    map.put("whether", 0);
                    map.put("normalList", leaveNotifyList);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActTransfer);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("humanAffairs", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActTransfer.getId(), "被回退");
                    oaActTransfer.setState(1);
                    return updateByPrimaryKeySelective(oaActTransfer);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActTransfer.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActTransfer);

                    } else if (personnelCensor.equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                        Map<String, Object> map = new HashMap<>(16);
                        map.put(enforcer, userInfo.getId());
                        activitiUtil.approvalComplete(taskId, map);
                        return updateByPrimaryKeySelective(oaActTransfer);

                    } else if (principal.equals(enforcer)) {

                        Map<String, Object> map = new HashMap<>(16);
                        List<Object> principalList = new ArrayList<>();

                        String principals = oaActTransfer.getDepartmentPrincipal();
                        //部门负责人勾选多个
                        if (principals.contains(",")) {
                            String[] split = principals.split(",");
                            for (String s : split) {
                                principalList.add(s);
                            }
                            map.put("principalList", principalList);

                            //部门负责人是单个
                        } else if (principals.contains("single")) {
                            String department = userInfoService.selectDepartmentByUserId(oaActTransfer.getPromoter());
                            String enforcerId = departmentService.selectEnforcerId("principal", department);
                            principalList.add(enforcerId);
                            map.put("principalList", principalList);

                            //部门负责人勾选单个
                        } else {
                            principalList.add(principals);
                            map.put("principalList", principalList);
                        }
                        activitiUtil.approvalComplete(taskId, map);
                        return updateByPrimaryKeySelective(oaActTransfer);
                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActTransfer);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActTransfer);
                }
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActTransfer oaActTransfer
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActTransfer oaActTransfer) {
        if (oaActTransferService.updateByPrimaryKeySelective(oaActTransfer) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActTransfer oaActTransfer
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActTransfer oaActTransfer) {
        String randomId = RandomUtil.randomId();
        if (oaActTransferService.insert(oaActTransfer, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActTransfer oaActTransfer = oaActTransferService.selectByPrimaryKey(id);
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
        model.addAttribute("oaActTransfer", oaActTransfer);
        model.addAttribute("department", getCurrentUser().getDepartment());
        model.addAttribute("job", getCurrentUser().getJob());
        return "oa/act/act_transfer_edit";
    }

    /**
     * 编辑后保存
     *
     * @param oaActTransfer oaActTransfer
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActTransfer oaActTransfer) {
        if (oaActTransferService.edit(oaActTransfer) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActTransfer oaActTransfer
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActTransfer oaActTransfer) {
        //更新数据
        if (oaActTransferService.edit(oaActTransfer) < 0) {
            return "error";
        } else {
            UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
            Map<String, Object> map = new HashMap<>(16);
            map.put("personnel_censor", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_transfer", "oa_act_transfer:" + oaActTransfer.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStatusCode(oaActTransfer.getId(), "协同");
                oaCollaborationService.updateStateByCorrelationId(oaActTransfer.getId(), 0, oaActTransfer.getTitle());
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
        OaActTransfer oaActTransfer = oaActTransferService.selectByPrimaryKey(id);
        model.addAttribute("transfer", oaActTransfer);
        if (oaActTransfer.getDepartmentPrincipal().contains(",")){
            return "oa/act/act_transfer_details2";
        }else {
            return "oa/act/act_transfer_details";
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
            oaActTransferService.deleteData(id);
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
