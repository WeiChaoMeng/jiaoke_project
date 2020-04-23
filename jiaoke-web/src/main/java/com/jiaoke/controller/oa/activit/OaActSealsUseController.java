package com.jiaoke.controller.oa.activit;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActSealsUse;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActSealsUseService;
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
 * 印章使用审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:41
 */
@Controller
@RequestMapping("/sealsUse")
public class OaActSealsUseController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActSealsUseService oaActSealsUseService;

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
     * 印章使用审批单
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toSealsUse(Model model) {
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
        return "oa/act/act_seals_use";
    }

    /**
     * 新增
     *
     * @param oaActSealsUse oaActSealsUse
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActSealsUse oaActSealsUse) {
        String randomId = RandomUtil.randomId();
        if (oaActSealsUseService.insert(oaActSealsUse, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            Map<String, Object> map = new HashMap<>(16);
            List<Object> principalList = new ArrayList<>();

            String principal = oaActSealsUse.getDepartmentPrincipal();
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
            String instance = activitiUtil.startProcessInstanceByKey("oa_seals_use", "oa_act_seals_use:" + randomId, map, getCurrentUser().getId().toString());
            if (instance != null) {
                return "success";
            }
            return "error";
        }
    }

    /**
     * 印章使用审批单 - 审批
     *
     * @param id     id
     * @param taskId taskId
     * @param model  model
     * @return jsp
     */
    @RequestMapping(value = "/approval")
    public String approval(String id, String taskId, Model model) {
        //审批
        OaActSealsUse oaActSealsUse = oaActSealsUseService.selectByPrimaryKey(id);
        //查询部门负责人nickname
        if (oaActSealsUse.getDepartmentPrincipal().contains(",")) {
            String principalNum = "";
            String[] strings = oaActSealsUse.getDepartmentPrincipal().split(",");
            for (String s : strings) {
                principalNum += " ";
                principalNum += userInfoService.getNicknameById(Integer.valueOf(s));
            }
            model.addAttribute("principalNum", JsonHelper.toJSONString(principalNum));
        } else {
            model.addAttribute("principalNum", JsonHelper.toJSONString("noPrincipalNum"));
        }
        model.addAttribute("oaActSealsUse", oaActSealsUse);
        model.addAttribute("oaActSealsUseJson", JsonHelper.toJSONString(oaActSealsUse));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_seals_use_handle";
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
        OaActSealsUse oaActSealsUse = oaActSealsUseService.selectByPrimaryKey(id);

        String nickname = getCurrentUser().getNickname();
        //根据发起者id获取所属部门id
        String departmentId = userInfoService.selectDepartmentByUserId(oaActSealsUse.getPromoter());
        //部门负责人
        String principalId = departmentService.selectEnforcerId("principal", departmentId);
        String principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        //部门主管领导
        String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
        String supervisor = userInfoService.getNicknameById(Integer.valueOf(supervisorId));
        //印章主管领导
        String sealSupervisor;
        if (oaActSealsUse.getSeal() == 4 || oaActSealsUse.getSeal() == 5) {
            sealSupervisor = userInfoService.getUserInfoByPermission("specialChapter").getNickname();
        } else {
            sealSupervisor = userInfoService.getUserInfoByPermission("seal_supervisor").getNickname();
        }

        //印章经办人
        String sealOperator;
        if (oaActSealsUse.getSeal() == 4) {
            sealOperator = userInfoService.getUserInfoByPermission("legalStamp").getNickname();
        } else if (oaActSealsUse.getSeal() == 5) {
            sealOperator = userInfoService.getUserInfoByPermission("financeStamp").getNickname();
        } else {
            sealOperator = userInfoService.getUserInfoByPermission("seal_operator").getNickname();
        }

        map.put("nickname", nickname);
        map.put("principal", principal);
        map.put("supervisor", supervisor);
        map.put("sealSupervisor", sealSupervisor);
        map.put("sealOperator", sealOperator);
        map.put("sealsUse", oaActSealsUse);
        map.put("taskId", taskId);
        return JSON.toJSONString(map);
    }

    /**
     * 印章使用审批单 - 提交
     *
     * @param oaActSealsUse oaActSealsUse
     * @param taskId        任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActSealsUse oaActSealsUse, String taskId, Integer flag) {
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //网关-部门负责人
        String principalEG = "principalEG";
        //网关-部门主管领导
        String supervisorEG = "supervisorEG";
        //印章主管网关
        String sealSupervisorEG = "sealSupervisorEG";
        //盖章人网关
        String operatorEG = "operatorEG";

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
                    String departmentId = userInfoService.selectDepartmentByUserId(oaActSealsUse.getPromoter());
                    //选择执行者Id
                    String enforcerId = departmentService.selectEnforcerId("supervisor", departmentId);

                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("supervisor", enforcerId);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActSealsUse);
                } else {

                    if (oaActSealsUse.getDepartmentPrincipal().contains(",")) {

                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("promoter", oaActSealsUse.getPromoter());
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaCollaborationService.updateStatusCode(oaActSealsUse.getId(), "被回退");
                        oaActSealsUse.setPrincipal(null);
                        oaActSealsUse.setPrincipalDate(null);
                        oaActSealsUse.setState(1);
                        return updateByPrimaryKeySelective(oaActSealsUse);

                    } else {
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("promoter", oaActSealsUse.getPromoter());
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActSealsUse.getId(), "被回退");
                        oaActSealsUse.setPrincipal(null);
                        oaActSealsUse.setPrincipalDate(null);
                        oaActSealsUse.setState(1);
                        return updateByPrimaryKeySelective(oaActSealsUse);
                    }
                }
            } else if (supervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    if (oaActSealsUse.getSeal() == 4 || oaActSealsUse.getSeal() == 5) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("specialChapter");
                        map.put("seal_supervisor", userInfo.getId());
                    } else {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("seal_supervisor");
                        map.put("seal_supervisor", userInfo.getId());
                    }
                    map.put("whether", 0);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActSealsUse);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActSealsUse.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActSealsUse.getId(), "被回退");
                    oaActSealsUse.setSupervisor(null);
                    oaActSealsUse.setSupervisorDate(null);
                    oaActSealsUse.setState(1);
                    return updateByPrimaryKeySelective(oaActSealsUse);
                }

            } else if (sealSupervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    //法人章经办人（出纳回凤英）和财务章经办人（李佳）其他印章经办人是（汪宁）
                    if (oaActSealsUse.getSeal() == 4) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("legalStamp");
                        map.put("seal_operator", userInfo.getId());
                    } else if (oaActSealsUse.getSeal() == 5) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("financeStamp");
                        map.put("seal_operator", userInfo.getId());
                    } else {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("seal_operator");
                        map.put("seal_operator", userInfo.getId());
                    }
                    map.put("whether", 0);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActSealsUse);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActSealsUse.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActSealsUse.getId(), "被回退");
                    oaActSealsUse.setSealSupervisor(null);
                    oaActSealsUse.setSealSupervisorDate(null);
                    oaActSealsUse.setState(1);
                    return updateByPrimaryKeySelective(oaActSealsUse);
                }

                //回退结束
            } else if (operatorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("promoter", oaActSealsUse.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActSealsUse);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActSealsUse.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActSealsUse.getId(), "被回退");
                    oaActSealsUse.setSealOperator(null);
                    oaActSealsUse.setSealOperatorDate(null);
                    oaActSealsUse.setState(1);
                    return updateByPrimaryKeySelective(oaActSealsUse);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActSealsUse.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActSealsUse);
                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActSealsUse);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActSealsUse);
                }
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActSealsUse oaActSealsUse
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActSealsUse oaActSealsUse) {
        if (oaActSealsUseService.updateByPrimaryKeySelective(oaActSealsUse) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActSealsUse oaActSealsUse
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActSealsUse oaActSealsUse) {
        String randomId = RandomUtil.randomId();
        if (oaActSealsUseService.insert(oaActSealsUse, getCurrentUser().getId(), randomId, 1) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 跳转编辑
     *
     * @param id    id
     * @param model model
     * @return jsp
     */
    @RequestMapping(value = "/toEdit")
    public String toEdit(String id, Model model) {
        OaActSealsUse oaActSealsUse = oaActSealsUseService.selectByPrimaryKey(id);
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
        model.addAttribute("oaActSealsUse", oaActSealsUse);
        return "oa/act/act_seals_use_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActSealsUse oaActSealsUse
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActSealsUse oaActSealsUse) {
        if (oaActSealsUseService.edit(oaActSealsUse) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActSealsUse oaActSealsUse
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActSealsUse oaActSealsUse) {
        Map<String, Object> map = new HashMap<>(16);
        List<Object> principalList = new ArrayList<>();

        String principal = oaActSealsUse.getDepartmentPrincipal();
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
        String instance = activitiUtil.startProcessInstanceByKey("oa_seals_use", "oa_act_seals_use:" + oaActSealsUse.getId(), map, getCurrentUser().getId().toString());
        if (instance != null) {
            //发送成功后更新状态
            oaActSealsUseService.edit(oaActSealsUse);
            oaCollaborationService.updateStatusCode(oaActSealsUse.getId(), "协同");
            oaCollaborationService.updateStateByCorrelationId(oaActSealsUse.getId(), 0, oaActSealsUse.getTitle());
            return "success";
        } else {
            return "error";
        }
    }

    /**
     * 印章使用审批单 - 详情
     *
     * @param id     id
     * @param taskId taskId
     * @param model  model
     * @return jsp
     */
    @RequestMapping(value = "/details")
    public String details(String id, String taskId, Model model) {
        OaActSealsUse oaActSealsUse = oaActSealsUseService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActSealsUse", oaActSealsUse);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_seals_use_details";
    }


    /**
     * app获取详细信息
     *
     * @param id id
     * @return json
     */
    @RequestMapping(value = "/details.api")
    @ResponseBody
    public String detailsApi(String id) {
        HashMap<String, Object> map = new HashMap<>(16);
        OaActSealsUse oaActSealsUse = oaActSealsUseService.selectByPrimaryKey(id);

        //根据发起者id获取所属部门id
        String departmentId = userInfoService.selectDepartmentByUserId(oaActSealsUse.getPromoter());
        //部门负责人
        String principalId = departmentService.selectEnforcerId("principal", departmentId);
        String principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        //部门主管领导
        String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
        String supervisor = userInfoService.getNicknameById(Integer.valueOf(supervisorId));
        //印章主管领导
        String sealSupervisor;
        if (oaActSealsUse.getSeal() == 4 || oaActSealsUse.getSeal() == 5) {
            sealSupervisor = userInfoService.getUserInfoByPermission("specialChapter").getNickname();
        } else {
            sealSupervisor = userInfoService.getUserInfoByPermission("seal_supervisor").getNickname();
        }

        //印章经办人
        String sealOperator;
        if (oaActSealsUse.getSeal() == 4) {
            sealOperator = userInfoService.getUserInfoByPermission("legalStamp").getNickname();
        } else if (oaActSealsUse.getSeal() == 5) {
            sealOperator = userInfoService.getUserInfoByPermission("financeStamp").getNickname();
        } else {
            sealOperator = userInfoService.getUserInfoByPermission("seal_operator").getNickname();
        }

        map.put("principal", principal);
        map.put("supervisor", supervisor);
        map.put("sealSupervisor", sealSupervisor);
        map.put("sealOperator", sealOperator);
        map.put("sealsUse", oaActSealsUse);
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
            oaActSealsUseService.deleteData(id);
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
