package com.jiaoke.controller.oa.activit;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActEngage;
import com.jiaoke.oa.bean.OaActExamination;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActEngageService;
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
 * 职称（技术等级）评聘申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/engage")
public class OaActEngageController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActEngageService oaActEngageService;

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
        model.addAttribute("position", getCurrentUser().getPosition());
        return "oa/act/act_engage";
    }

    /**
     * 提交新增
     *
     * @param oaActEngage oaActEngage
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActEngage oaActEngage) {
        String randomId = RandomUtil.randomId();
        if (oaActEngageService.insert(oaActEngage, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
            Map<String, Object> map = new HashMap<>(16);
            map.put("personnel_censor", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_engage", "oa_act_engage:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActEngage oaActEngage = oaActEngageService.selectByPrimaryKey(id);

        String nickname = getCurrentUser().getNickname();

        String principal;
        String principalT = null;
        String departmentId = userInfoService.selectDepartmentByUserId(oaActEngage.getPromoter());
        if ("single".equals(oaActEngage.getDepartmentPrincipal())){
            String principalId = departmentService.selectEnforcerId("principal", departmentId);
            principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        }else if (oaActEngage.getDepartmentPrincipal().contains(",")){
            String[] split = oaActEngage.getDepartmentPrincipal().split(",");
            principal = userInfoService.getNicknameById(Integer.valueOf(split[0]));
            principalT = userInfoService.getNicknameById(Integer.valueOf(split[1]));
        }else{
            principal = userInfoService.getNicknameById(Integer.valueOf(oaActEngage.getDepartmentPrincipal()));
        }

        //部门主管领导
        String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
        String supervisor = userInfoService.getNicknameById(Integer.valueOf(supervisorId));
        //人事
        String personnel = userInfoService.getUserInfoByPermission("personnel").getNickname();
        //主要领导（总经理）
        String companyPrincipal = userInfoService.getUserInfoByPermission("company_principal").getNickname();

        String evaluateTeamMember = "";
        if (oaActEngage.getUndoutedlyTeam() != null) {
            Task task = activitiUtil.getTaskByTaskId(taskId);
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
            if ("_10".equals(nextNode)){
                evaluateTeamMember = "yes";
            }
        }

        Task task = activitiUtil.getProcessInstanceIdByTaskId(taskId);
        List<Comments> commentsList = activitiUtil.selectHistoryComment(task.getProcessInstanceId());

        map.put("nickname", nickname);
        map.put("principal", principal);
        map.put("principalT", principalT);
        map.put("supervisor", supervisor);
        map.put("personnel", personnel);
        map.put("companyPrincipal", companyPrincipal);
        map.put("evaluateTeamMember", evaluateTeamMember);
        map.put("commentsList", commentsList);
        map.put("taskId", taskId);
        map.put("engage", oaActEngage);
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
        OaActEngage oaActEngage = oaActEngageService.selectByPrimaryKey(id);
        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);

        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(task1.getProcessInstanceId());
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("commentsListSize", commentsList.size());
        model.addAttribute("oaActEngage", oaActEngage);
        model.addAttribute("oaActEngageJson", JsonHelper.toJSONString(oaActEngage));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        if (oaActEngage.getDepartmentPrincipal().contains(",")) {
            if (oaActEngage.getUndoutedlyTeam() != null) {
                Task task = activitiUtil.getTaskByTaskId(taskId);
                String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
                if ("_10".equals(nextNode)){
                    return "oa/act/act_engage_handle4";
                }else{
                    return "oa/act/act_engage_handle2";
                }
            } else {
                return "oa/act/act_engage_handle2";
            }
        } else {
            if (oaActEngage.getUndoutedlyTeam() != null) {
                Task task = activitiUtil.getTaskByTaskId(taskId);
                String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
                if ("_10".equals(nextNode)){
                    return "oa/act/act_engage_handle3";
                }else{
                    return "oa/act/act_engage_handle";
                }
            } else {
                return "oa/act/act_engage_handle";
            }
        }
    }

    /**
     * 提交审批
     *
     * @param oaActEngage oaActEngage
     * @param taskId      taskId
     * @param flag        flag
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActEngage oaActEngage, String processingOpinion, String taskId, Integer flag) {
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //人事审查
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
        //人事专员
        String personnelCommissioner = "personnel_commissioner";
        //知会
        String normal = "normal";

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
                    String departmentId = userInfoService.selectDepartmentByUserId(oaActEngage.getPromoter());
                    //选择执行者Id
                    String enforcerId = departmentService.selectEnforcerId("supervisor", departmentId);

                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("supervisor", enforcerId);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActEngage);
                } else {

                    if (oaActEngage.getDepartmentPrincipal().contains(",")) {

                        UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("personnel_censor", userInfo.getId());
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaCollaborationService.updateStatusCode(oaActEngage.getId(), "被回退");
                        oaActEngage.setState(1);
                        return updateByPrimaryKeySelective(oaActEngage);

                    } else {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("personnel_censor", userInfo.getId());
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActEngage.getId(), "被回退");
                        oaActEngage.setState(1);
                        return updateByPrimaryKeySelective(oaActEngage);
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
                    return updateByPrimaryKeySelective(oaActEngage);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("personnel_censor", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActEngage.getId(), "被回退");
                    oaActEngage.setState(1);
                    return updateByPrimaryKeySelective(oaActEngage);
                }

            } else if (personnelEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("company_principal", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActEngage);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("personnel_censor", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActEngage.getId(), "被回退");
                    oaActEngage.setState(1);
                    return updateByPrimaryKeySelective(oaActEngage);
                }

            } else if (companyEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> undoutedlyTeam = new ArrayList<>();
                    List<UserInfo> userInfoList = userInfoService.getUserByDepartmentKey("16");
                    StringBuilder stringBuilder = new StringBuilder();
                    for (UserInfo userInfo : userInfoList) {
                        undoutedlyTeam.add(userInfo.getId());
                        stringBuilder.append(userInfo.getNickname());
                        stringBuilder.append(",");
                    }
                    map.put("whether", 0);
                    map.put("undoutedly_team_list", undoutedlyTeam);
                    activitiUtil.approvalComplete(taskId, map);
                    oaActEngage.setUndoutedlyTeam((stringBuilder.deleteCharAt(stringBuilder.length()-1)).toString());
                    return updateByPrimaryKeySelective(oaActEngage);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("personnel_censor", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActEngage.getId(), "被回退");
                    oaActEngage.setState(1);
                    return updateByPrimaryKeySelective(oaActEngage);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActEngage.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActEngage);

                    } else if (personnel.equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel");
                        Map<String, Object> map = new HashMap<>(16);
                        map.put(enforcer, userInfo.getId());
                        activitiUtil.approvalComplete(taskId, map);
                        return updateByPrimaryKeySelective(oaActEngage);

                    } else if (personnelCommissioner.equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                        Map<String, Object> map = new HashMap<>(16);
                        map.put(enforcer, userInfo.getId());
                        activitiUtil.completeAndAppointNextNode(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(),map);
                        return updateByPrimaryKeySelective(oaActEngage);

                    } else if (normal.equals(enforcer)) {
                        Map<String, Object> map = new HashMap<>(16);
                        List<Object> leaveNotifyList = new ArrayList<>();
                        leaveNotifyList.add(oaActEngage.getPromoter());
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                        leaveNotifyList.add(userInfo.getId());
                        map.put("whether", 0);
                        map.put("normalList", leaveNotifyList);
                        activitiUtil.approvalComplete(taskId, map);
                        return updateByPrimaryKeySelective(oaActEngage);

                    } else if (principal.equals(enforcer)) {
                        Map<String, Object> map = new HashMap<>(16);
                        List<Object> principalList = new ArrayList<>();

                        String principals = oaActEngage.getDepartmentPrincipal();
                        //部门负责人勾选多个
                        if (principals.contains(",")) {
                            String[] split = principals.split(",");
                            for (String s : split) {
                                principalList.add(s);
                            }
                            map.put("principalList", principalList);

                            //部门负责人是单个
                        } else if (principals.contains("single")) {
                            String department = userInfoService.selectDepartmentByUserId(oaActEngage.getPromoter());
                            String enforcerId = departmentService.selectEnforcerId("principal", department);
                            principalList.add(enforcerId);
                            map.put("principalList", principalList);

                            //部门负责人勾选单个
                        } else {
                            principalList.add(principals);
                            map.put("principalList", principalList);
                        }
                        activitiUtil.approvalComplete(taskId, map);
                        return updateByPrimaryKeySelective(oaActEngage);
                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActEngage);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActEngage);
                }
            }
        }

    }

    /**
     * 根据主键更新
     *
     * @param oaActEngage oaActEngage
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActEngage oaActEngage) {
        if (oaActEngageService.updateByPrimaryKeySelective(oaActEngage) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActEngage oaActEngage
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActEngage oaActEngage) {
        String randomId = RandomUtil.randomId();
        if (oaActEngageService.insert(oaActEngage, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActEngage oaActEngage = oaActEngageService.selectByPrimaryKey(id);
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
        model.addAttribute("oaActEngage", oaActEngage);
        return "oa/act/act_engage_edit";
    }

    /**
     * 编辑后保存
     *
     * @param oaActEngage oaActEngage
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActEngage oaActEngage) {
        if (oaActEngageService.edit(oaActEngage) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActEngage oaActEngage
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActEngage oaActEngage) {
        UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
        Map<String, Object> map = new HashMap<>(16);
        map.put("personnel_censor", userInfo.getId());
        String instance = activitiUtil.startProcessInstanceByKey("oa_engage", "oa_act_engage:" + oaActEngage.getId(), map, getCurrentUser().getId().toString());
        if (instance != null) {
            //发送成功后更新状态
            oaActEngageService.edit(oaActEngage);
            oaCollaborationService.updateStatusCode(oaActEngage.getId(), "协同");
            oaCollaborationService.updateStateByCorrelationId(oaActEngage.getId(), 0, oaActEngage.getTitle());
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
        OaActEngage oaActEngage = oaActEngageService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActEngage", oaActEngage);
        model.addAttribute("commentsList", commentsList);
        if (oaActEngage.getDepartmentPrincipal().contains(",")) {
            return "oa/act/act_engage_details2";
        } else {
            return "oa/act/act_engage_details";
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
    public String cardDetailsApi(String id, String taskId) {
        HashMap<String, Object> map = new HashMap<>(16);
        OaActEngage oaActEngage = oaActEngageService.selectByPrimaryKey(id);

        String principal;
        String principalT = null;
        String departmentId = userInfoService.selectDepartmentByUserId(oaActEngage.getPromoter());
        if ("single".equals(oaActEngage.getDepartmentPrincipal())){
            String principalId = departmentService.selectEnforcerId("principal", departmentId);
            principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        }else if (oaActEngage.getDepartmentPrincipal().contains(",")){
            String[] split = oaActEngage.getDepartmentPrincipal().split(",");
            principal = userInfoService.getNicknameById(Integer.valueOf(split[0]));
            principalT = userInfoService.getNicknameById(Integer.valueOf(split[1]));
        }else{
            principal = userInfoService.getNicknameById(Integer.valueOf(oaActEngage.getDepartmentPrincipal()));
        }

        //部门主管领导
        String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
        String supervisor = userInfoService.getNicknameById(Integer.valueOf(supervisorId));
        //人事
        String personnel = userInfoService.getUserInfoByPermission("personnel").getNickname();
        //主要领导（总经理）
        String companyPrincipal = userInfoService.getUserInfoByPermission("company_principal").getNickname();

        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);

        map.put("principal", principal);
        map.put("principalT", principalT);
        map.put("supervisor", supervisor);
        map.put("personnel", personnel);
        map.put("companyPrincipal", companyPrincipal);
        map.put("commentsList", commentsList);
        map.put("engage", oaActEngage);
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
            oaActEngageService.deleteData(id);
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
