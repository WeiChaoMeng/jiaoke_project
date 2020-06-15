package com.jiaoke.controller.oa.activit;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.OaActEmployment;
import com.jiaoke.oa.bean.OaActRegularization;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActEmploymentService;
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
 * 部室用人申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/employment")
public class OaActEmploymentController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActEmploymentService oaActEmploymentService;

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
        model.addAttribute("department", getCurrentUser().getDepartment());
        return "oa/act/act_employment";
    }

    /**
     * 提交新增
     *
     * @param oaActEmployment oaActEmployment
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActEmployment oaActEmployment) {
        String randomId = RandomUtil.randomId();
        if (oaActEmploymentService.insert(oaActEmployment, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
            Map<String, Object> map = new HashMap<>(16);
            map.put("personnel_censor", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_employment", "oa_act_employment:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActEmployment oaActEmployment = oaActEmploymentService.selectByPrimaryKey(id);

        String nickname = getCurrentUser().getNickname();

        String principal;
        String principalT = null;
        String departmentId = userInfoService.selectDepartmentByUserId(oaActEmployment.getPromoter());
        if ("single".equals(oaActEmployment.getDepartmentPrincipal())){
            String principalId = departmentService.selectEnforcerId("principal", departmentId);
            principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        }else if (oaActEmployment.getDepartmentPrincipal().contains(",")){
            String[] split = oaActEmployment.getDepartmentPrincipal().split(",");
            principal = userInfoService.getNicknameById(Integer.valueOf(split[0]));
            principalT = userInfoService.getNicknameById(Integer.valueOf(split[1]));
        }else{
            principal = userInfoService.getNicknameById(Integer.valueOf(oaActEmployment.getDepartmentPrincipal()));
        }

        //部门主管领导
        String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
        String supervisor = userInfoService.getNicknameById(Integer.valueOf(supervisorId));
        //人事
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
        map.put("employment", oaActEmployment);
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
        OaActEmployment oaActEmployment = oaActEmploymentService.selectByPrimaryKey(id);
        model.addAttribute("oaActEmployment", oaActEmployment);
        model.addAttribute("oaActEmploymentJson", JsonHelper.toJSONString(oaActEmployment));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        if (oaActEmployment.getDepartmentPrincipal().contains(",")) {
            return "oa/act/act_employment_handle2";
        } else {
            return "oa/act/act_employment_handle";
        }
    }

    /**
     * 提交审批
     *
     * @param oaActEmployment oaActEmployment
     * @param taskId          taskId
     * @param flag            flag
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActEmployment oaActEmployment, String taskId, Integer flag) {
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //人事审查
        String personnelCensor = "personnel_censor";
        String personnel = "personnel";
        //部门负责人
        String principal = "principal";
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
        } else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //网关
            if (principalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    //根据发起者id获取所属部门id
                    String departmentId = userInfoService.selectDepartmentByUserId(oaActEmployment.getPromoter());
                    //选择执行者Id
                    String enforcerId = departmentService.selectEnforcerId("supervisor", departmentId);

                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("supervisor", enforcerId);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActEmployment);
                } else {

                    if (oaActEmployment.getDepartmentPrincipal().contains(",")) {

                        UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("personnel_censor", userInfo.getId());
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaCollaborationService.updateStatusCode(oaActEmployment.getId(), "被回退");
                        oaActEmployment.setState(1);
                        return updateByPrimaryKeySelective(oaActEmployment);

                    } else {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("personnel_censor", userInfo.getId());
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActEmployment.getId(), "被回退");
                        oaActEmployment.setState(1);
                        return updateByPrimaryKeySelective(oaActEmployment);
                    }
                }
            } else if (supervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("personnel_censor", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActEmployment);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("personnel_censor", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActEmployment.getId(), "被回退");
                    oaActEmployment.setState(1);
                    return updateByPrimaryKeySelective(oaActEmployment);
                }

            } else if (personnelEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("company_principal", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActEmployment);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("personnel_censor", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActEmployment.getId(), "被回退");
                    oaActEmployment.setState(1);
                    return updateByPrimaryKeySelective(oaActEmployment);
                }

                //正常结束
            } else if (companyEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> leaveNotifyList = new ArrayList<>();
                    leaveNotifyList.add(oaActEmployment.getPromoter());
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                    leaveNotifyList.add(userInfo.getId());
                    map.put("whether", 0);
                    map.put("normalList", leaveNotifyList);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActEmployment);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("personnel_censor", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActEmployment.getId(), "被回退");
                    oaActEmployment.setState(1);
                    return updateByPrimaryKeySelective(oaActEmployment);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActEmployment.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActEmployment);

                    } else if (personnel.equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel");
                        Map<String, Object> map = new HashMap<>(16);
                        map.put(enforcer, userInfo.getId());
                        activitiUtil.approvalComplete(taskId, map);
                        return updateByPrimaryKeySelective(oaActEmployment);
                    } else if (principal.equals(enforcer)) {
                        Map<String, Object> map = new HashMap<>(16);
                        List<Object> principalList = new ArrayList<>();

                        String principals = oaActEmployment.getDepartmentPrincipal();
                        //部门负责人勾选多个
                        if (principals.contains(",")) {
                            String[] split = principals.split(",");
                            for (String s : split) {
                                principalList.add(s);
                            }
                            map.put("principalList", principalList);

                            //部门负责人是单个
                        } else if (principals.contains("single")) {
                            String department = userInfoService.selectDepartmentByUserId(oaActEmployment.getPromoter());
                            String enforcerId = departmentService.selectEnforcerId("principal", department);
                            principalList.add(enforcerId);
                            map.put("principalList", principalList);

                            //部门负责人勾选单个
                        } else {
                            principalList.add(principals);
                            map.put("principalList", principalList);
                        }
                        activitiUtil.approvalComplete(taskId, map);
                        return updateByPrimaryKeySelective(oaActEmployment);
                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActEmployment);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActEmployment);
                }
            }
        }

    }

    /**
     * 根据主键更新
     *
     * @param oaActEmployment oaActEmployment
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActEmployment oaActEmployment) {
        if (oaActEmploymentService.updateByPrimaryKeySelective(oaActEmployment) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActEmployment oaActEmployment
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActEmployment oaActEmployment) {
        String randomId = RandomUtil.randomId();
        if (oaActEmploymentService.insert(oaActEmployment, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActEmployment oaActEmployment = oaActEmploymentService.selectByPrimaryKey(id);
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
        model.addAttribute("oaActEmployment", oaActEmployment);
        return "oa/act/act_employment_edit";
    }

    /**
     * 编辑后保存
     *
     * @param oaActEmployment oaActEmployment
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActEmployment oaActEmployment) {
        if (oaActEmploymentService.edit(oaActEmployment) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActEmployment oaActEmployment
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActEmployment oaActEmployment) {
        UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
        Map<String, Object> map = new HashMap<>(16);
        map.put("personnel_censor", userInfo.getId());
        String instance = activitiUtil.startProcessInstanceByKey("oa_employment", "oa_act_employment:" + oaActEmployment.getId(), map, getCurrentUser().getId().toString());
        if (instance != null) {
            //发送成功后更新状态
            oaActEmploymentService.edit(oaActEmployment);
            oaCollaborationService.updateStatusCode(oaActEmployment.getId(), "协同");
            oaCollaborationService.updateStateByCorrelationId(oaActEmployment.getId(), 0, oaActEmployment.getTitle());
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
        OaActEmployment oaActEmployment = oaActEmploymentService.selectByPrimaryKey(id);
        model.addAttribute("oaActEmployment", oaActEmployment);
        if (oaActEmployment.getDepartmentPrincipal().contains(",")) {
            return "oa/act/act_employment_details2";
        } else {
            return "oa/act/act_employment_details";
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
        OaActEmployment oaActEmployment = oaActEmploymentService.selectByPrimaryKey(id);

        String principal;
        String principalT = null;
        String departmentId = userInfoService.selectDepartmentByUserId(oaActEmployment.getPromoter());
        if ("single".equals(oaActEmployment.getDepartmentPrincipal())){
            String principalId = departmentService.selectEnforcerId("principal", departmentId);
            principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        }else if (oaActEmployment.getDepartmentPrincipal().contains(",")){
            String[] split = oaActEmployment.getDepartmentPrincipal().split(",");
            principal = userInfoService.getNicknameById(Integer.valueOf(split[0]));
            principalT = userInfoService.getNicknameById(Integer.valueOf(split[1]));
        }else{
            principal = userInfoService.getNicknameById(Integer.valueOf(oaActEmployment.getDepartmentPrincipal()));
        }

        //部门主管领导
        String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
        String supervisor = userInfoService.getNicknameById(Integer.valueOf(supervisorId));
        //人事
        String personnel = userInfoService.getUserInfoByPermission("personnel").getNickname();
        //主要领导（总经理）
        String companyPrincipal = userInfoService.getUserInfoByPermission("company_principal").getNickname();

        map.put("principal", principal);
        map.put("principalT", principalT);
        map.put("supervisor", supervisor);
        map.put("personnel", personnel);
        map.put("companyPrincipal", companyPrincipal);
        map.put("employment", oaActEmployment);
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
            oaActEmploymentService.deleteData(id);
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
