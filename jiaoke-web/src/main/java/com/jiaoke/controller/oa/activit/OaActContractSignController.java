package com.jiaoke.controller.oa.activit;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActContractSignService;
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
 * 劳务派遣员工合同签订、续订、变更、终止审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/contractSign")
public class OaActContractSignController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActContractSignService oaActContractSignService;

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
        List<UserInfo> userInfoList = userInfoService.selectIdAndNicknameAndDepartment();
        List<Department> departmentList = departmentService.selectKeyAndName();
        model.addAttribute("userInfoList", JsonHelper.toJSONString(userInfoList));
        model.addAttribute("departmentList", JsonHelper.toJSONString(departmentList));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_contract_sign";
    }

    /**
     * 获取被通知人部门负责人
     *
     * @param notifiedPerson 被通知人
     * @return 部门负责人
     */
    @RequestMapping("/getNotifiedPersonPrincipal")
    @ResponseBody
    public String getNotifiedPersonPrincipal(String notifiedPerson){
        String department = userInfoService.selectDepartmentByUserId(Integer.valueOf(notifiedPerson));
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
            return JsonHelper.toJSONString(list);
        } else {
            return JsonHelper.toJSONString("noData");
        }
    }

    /**
     * 提交新增
     *
     * @param oaActContractSign oaActContractSign
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActContractSign oaActContractSign) {
        String randomId = RandomUtil.randomId();
        if (oaActContractSignService.insert(oaActContractSign, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {

            Map<String, Object> map = new HashMap<>(16);
            List<Object> principalList = new ArrayList<>();

            String principal = oaActContractSign.getDepartmentPrincipal();
            //部门负责人勾选多个
            if (principal.contains(",")) {
                String[] split = principal.split(",");
                for (String s : split) {
                    principalList.add(s);
                }
                map.put("principalList", principalList);

                //部门负责人是单个
            } else if (principal.contains("single")) {
                String department = userInfoService.selectDepartmentByUserId(oaActContractSign.getNotifiedPerson());
                String enforcerId = departmentService.selectEnforcerId("principal", department);
                principalList.add(enforcerId);
                map.put("principalList", principalList);

                //部门负责人勾选单个
            } else {
                principalList.add(principal);
                map.put("principalList", principalList);
            }

            String instance = activitiUtil.startProcessInstanceByKey("oa_contract_sign", "oa_act_contract_sign:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActContractSign oaActContractSign = oaActContractSignService.selectByPrimaryKey(id);
        model.addAttribute("oaActContractSign", oaActContractSign);
        model.addAttribute("oaActContractSignJson", JsonHelper.toJSONString(oaActContractSign));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        if (oaActContractSign.getDepartmentPrincipal().contains(",")){
            return "oa/act/act_contract_sign_handle2";
        }else{
            return "oa/act/act_contract_sign_handle";
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
        OaActContractSign oaActContractSign = oaActContractSignService.selectByPrimaryKey(id);

        String nickname = getCurrentUser().getNickname();

        String principal;
        String principalT = null;
        String departmentId = userInfoService.selectDepartmentByUserId(oaActContractSign.getNotifiedPerson());
        if ("single".equals(oaActContractSign.getDepartmentPrincipal())){
            String principalId = departmentService.selectEnforcerId("principal", departmentId);
            principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        }else if (oaActContractSign.getDepartmentPrincipal().contains(",")){
            String[] split = oaActContractSign.getDepartmentPrincipal().split(",");
            principal = userInfoService.getNicknameById(Integer.valueOf(split[0]));
            principalT = userInfoService.getNicknameById(Integer.valueOf(split[1]));
        }else{
            principal = userInfoService.getNicknameById(Integer.valueOf(oaActContractSign.getDepartmentPrincipal()));
        }

        //部门主管领导
        String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
        String supervisor = userInfoService.getNicknameById(Integer.valueOf(supervisorId));
        //法务
        String personnel = userInfoService.getUserInfoByPermission("personnel").getNickname();
        //主要领导（总经理）
        String companyPrincipal = userInfoService.getUserInfoByPermission("company_principal").getNickname();

        map.put("nickname", nickname);
        map.put("principal", principal);
        map.put("principalT", principalT);
        map.put("supervisor", supervisor);
        map.put("personnel", personnel);
        map.put("companyPrincipal", companyPrincipal);
        map.put("taskId", taskId);
        map.put("contractSign", oaActContractSign);
        return JSON.toJSONString(map);
    }

    /**
     * 提交审批
     *
     * @param oaActContractSign oaActContractSign
     * @param taskId            任务Id
     * @param flag            flag
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActContractSign oaActContractSign, String taskId, Integer flag) {
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
        //人事
        String personnel = "personnel";
        //总经理
        String companyPrincipal = "company_principal";
        //知会
        String maintainNotify = "maintainNotify";

        //网关-部门负责人
        String principalEG = "principalEG";
        //网关-部门主管领导
        String supervisorEG = "supervisorEG";
        //网关-劳资主管
        String personnelEG = "personnelEG";
        //网关-总经理
        String companyEG = "companyEG";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        }else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //网关
            if (principalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    //根据发起者id获取所属部门id
                    String departmentId = userInfoService.selectDepartmentByUserId(oaActContractSign.getNotifiedPerson());
                    //选择执行者Id
                    String enforcerId = departmentService.selectEnforcerId("supervisor", departmentId);

                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("supervisor", enforcerId);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActContractSign);
                } else {

                    if (oaActContractSign.getDepartmentPrincipal().contains(",")){

                        UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("humanAffairs", userInfo.getId());
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaCollaborationService.updateStatusCode(oaActContractSign.getId(), "被回退");
                        oaActContractSign.setState(1);
                        return updateByPrimaryKeySelective(oaActContractSign);

                    }else {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("humanAffairs", userInfo.getId());
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActContractSign.getId(), "被回退");
                        oaActContractSign.setState(1);
                        return updateByPrimaryKeySelective(oaActContractSign);
                    }
                }
            } else if (supervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("personnel",userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActContractSign);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("humanAffairs", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActContractSign.getId(), "被回退");
                    oaActContractSign.setState(1);
                    return updateByPrimaryKeySelective(oaActContractSign);
                }

                //回退结束
            }else if (personnelEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("company_principal",userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActContractSign);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("humanAffairs", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActContractSign.getId(), "被回退");
                    oaActContractSign.setState(1);
                    return updateByPrimaryKeySelective(oaActContractSign);
                }

                //回退结束
            }else if (companyEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> leaveNotifyList = new ArrayList<>();
                    leaveNotifyList.add(oaActContractSign.getPromoter());
                    leaveNotifyList.add(oaActContractSign.getNotifiedPerson());
                    map.put("whether", 0);
                    map.put("normalList", leaveNotifyList);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActContractSign);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("humanAffairs", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActContractSign.getId(), "被回退");
                    oaActContractSign.setState(1);
                    return updateByPrimaryKeySelective(oaActContractSign);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActContractSign.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActContractSign);
                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActContractSign);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActContractSign);
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
//                    } else if (principal.equals(enforcer) || supervisor.equals(enforcer)) {
//                        String departmentId = userInfoService.selectDepartmentByUserId(oaActContractSign.getNotifiedPerson());
//                        String enforcerId = departmentService.selectEnforcerId(enforcer, departmentId);
//                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, Integer.valueOf(enforcerId));
//                        return "success";
//
//                        //人事部门
//                    }  else if (personnel.equals(enforcer)) {
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
//                    } else if (maintainNotify.equals(enforcer)) {
//                        Map<String, Object> map = new HashMap<>(16);
//                        List<Object> maintainNotifyList = new ArrayList<>();
//                        maintainNotifyList.add(oaActContractSign.getPromoter());
//                        maintainNotifyList.add(oaActContractSign.getNotifiedPerson());
//                        map.put("maintainNotifyList", maintainNotifyList);
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
//            oaCollaborationService.updateState(oaActContractSign.getId(), 3);
//            return "success";
//        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActContractSign oaActContractSign
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActContractSign oaActContractSign) {
        if (oaActContractSignService.updateByPrimaryKeySelective(oaActContractSign) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActContractSign oaActContractSign
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActContractSign oaActContractSign) {
        String randomId = RandomUtil.randomId();
        if (oaActContractSignService.insert(oaActContractSign, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActContractSign oaActContractSign = oaActContractSignService.selectByPrimaryKey(id);
        List<UserInfo> userInfoList = userInfoService.selectIdAndNicknameAndDepartment();
        List<Department> departmentList = departmentService.selectKeyAndName();
        model.addAttribute("userInfoList", JsonHelper.toJSONString(userInfoList));
        model.addAttribute("departmentList", JsonHelper.toJSONString(departmentList));
        model.addAttribute("oaActContractSign", oaActContractSign);
        return "oa/act/act_contract_sign_edit";
    }

    /**
     * 编辑后保存
     *
     * @param oaActContractSign oaActContractSign
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActContractSign oaActContractSign) {
        if (oaActContractSignService.edit(oaActContractSign) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActContractSign oaActContractSign
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActContractSign oaActContractSign) {

        Map<String, Object> map = new HashMap<>(16);
        List<Object> principalList = new ArrayList<>();

        String principal = oaActContractSign.getDepartmentPrincipal();
        if (principal.contains(",")) {
            String[] split = principal.split(",");
            for (String s : split) {
                principalList.add(s);
            }
            map.put("principalList", principalList);

        } else if (principal.contains("single")) {
            String department = userInfoService.selectDepartmentByUserId(oaActContractSign.getNotifiedPerson());
            String enforcerId = departmentService.selectEnforcerId("principal", department);
            principalList.add(enforcerId);
            map.put("principalList", principalList);

        } else {
            principalList.add(principal);
            map.put("principalList", principalList);
        }

        String instance = activitiUtil.startProcessInstanceByKey("oa_contract_sign", "oa_act_contract_sign:" + oaActContractSign.getId(), map, getCurrentUser().getId().toString());
        if (instance != null) {
            //发送成功后更新状态
            oaActContractSignService.edit(oaActContractSign);
            oaCollaborationService.updateStatusCode(oaActContractSign.getId(), "协同");
            oaCollaborationService.updateStateByCorrelationId(oaActContractSign.getId(), 0, oaActContractSign.getTitle());
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
        OaActContractSign oaActContractSign = oaActContractSignService.selectByPrimaryKey(id);
        model.addAttribute("oaActContractSign", oaActContractSign);
        if (oaActContractSign.getDepartmentPrincipal().contains(",")){
            return "oa/act/act_contract_sign_details2";
        }else{
            return "oa/act/act_contract_sign_details";
        }
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
        OaActContractSign oaActContractSign = oaActContractSignService.selectByPrimaryKey(id);

        String principal;
        String principalT = null;
        String departmentId = userInfoService.selectDepartmentByUserId(oaActContractSign.getNotifiedPerson());
        if ("single".equals(oaActContractSign.getDepartmentPrincipal())){
            String principalId = departmentService.selectEnforcerId("principal", departmentId);
            principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        }else if (oaActContractSign.getDepartmentPrincipal().contains(",")){
            String[] split = oaActContractSign.getDepartmentPrincipal().split(",");
            principal = userInfoService.getNicknameById(Integer.valueOf(split[0]));
            principalT = userInfoService.getNicknameById(Integer.valueOf(split[1]));
        }else{
            principal = userInfoService.getNicknameById(Integer.valueOf(oaActContractSign.getDepartmentPrincipal()));
        }

        //部门主管领导
        String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
        String supervisor = userInfoService.getNicknameById(Integer.valueOf(supervisorId));
        //法务
        String personnel = userInfoService.getUserInfoByPermission("personnel").getNickname();
        //主要领导（总经理）
        String companyPrincipal = userInfoService.getUserInfoByPermission("company_principal").getNickname();

        map.put("principal", principal);
        map.put("principalT", principalT);
        map.put("supervisor", supervisor);
        map.put("personnel", personnel);
        map.put("companyPrincipal", companyPrincipal);
        map.put("contractSign", oaActContractSign);
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
            oaActContractSignService.deleteData(id);
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
