package com.jiaoke.controller.oa.activit;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActAcceptance;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActAcceptanceService;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 设备维修验收单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 3:18
 */
@Controller
@RequestMapping("/acceptance")
public class OaActAcceptanceController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActAcceptanceService oaActAcceptanceService;

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
     * 验收单
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toAcceptance(Model model) {
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_acceptance";
    }

    /**
     * 新增并启动流程
     *
     * @param oaActAcceptance oaActAcceptance
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActAcceptance oaActAcceptance) {
        String randomId = RandomUtil.randomId();
        if (oaActAcceptanceService.insert(oaActAcceptance, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            //验收人
            UserInfo userInfo = userInfoService.getUserInfoByPermission("accepter");
            Map<String, Object> map = new HashMap<>(16);
            map.put("accepter", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_acceptance", "oa_act_acceptance:" + randomId, map, getCurrentUser().getId().toString());
            if (instance != null) {
                return "success";
            }
            return "error";
        }
    }

    /**
     * 审批单处理页面
     *
     * @param id     id
     * @param taskId taskId
     * @param model  model
     * @return jsp
     */
    @RequestMapping(value = "/approval")
    public String approval(String id, String taskId, Model model) {
        //审批
        OaActAcceptance oaActAcceptance = oaActAcceptanceService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());
        model.addAttribute("oaActAcceptance", oaActAcceptance);
        model.addAttribute("oaActAcceptanceJson", JsonHelper.toJSONString(oaActAcceptance));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_acceptance_handle";
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
        OaActAcceptance oaActAcceptance = oaActAcceptanceService.selectByPrimaryKey(id);

        String nickname = getCurrentUser().getNickname();
        //根据发起者id获取所属部门id
        String departmentId = userInfoService.selectDepartmentByUserId(oaActAcceptance.getPromoter());
        //部门负责人
        String principalId = departmentService.selectEnforcerId("principal", departmentId);
        String principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        //部门主管领导
        String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
        String supervisor = userInfoService.getNicknameById(Integer.valueOf(supervisorId));
        //验收人
        String accepter = userInfoService.getUserInfoByPermission("accepter").getNickname();
        //主要领导（总经理）
        String companyPrincipal = userInfoService.getUserInfoByPermission("company_principal").getNickname();

        map.put("nickname", nickname);
        map.put("principal", principal);
        map.put("supervisor", supervisor);
        map.put("accepter", accepter);
        map.put("companyPrincipal", companyPrincipal);
        map.put("taskId", taskId);
        map.put("acceptance", oaActAcceptance);
        return JSON.toJSONString(map);
    }

    /**
     * 提交
     *
     * @param oaActAcceptance oaActAcceptance
     * @param taskId          任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActAcceptance oaActAcceptance, String taskId, Integer flag) {
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
        //设备维修通过后的知会
        String accepter = "accepter";
        //更新数据
        if (oaActAcceptanceService.updateByPrimaryKeySelective(oaActAcceptance) < 1) {
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

                        //负责人、主管领导
                    } else if (principal.equals(enforcer) || supervisor.equals(enforcer)) {
                        String startUserId = activitiUtil.getStartUserId(task.getProcessInstanceId());
                        //根据发起者id获取所属部门id
                        String departmentId = userInfoService.selectDepartmentByUserId(Integer.valueOf(startUserId));
                        //选择执行者Id
                        String enforcerId = departmentService.selectEnforcerId(enforcer, departmentId);
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, Integer.valueOf(enforcerId));
                        return "success";

                        //总经理
                    } else if (companyPrincipal.equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        return "success";

                        //验收人
                    } else if (accepter.equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("accepter");
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
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
            oaCollaborationService.updateState(oaActAcceptance.getId(), 3);
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActAcceptance oaActAcceptance
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActAcceptance oaActAcceptance) {
        String randomId = RandomUtil.randomId();
        if (oaActAcceptanceService.insert(oaActAcceptance, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActAcceptance oaActAcceptance = oaActAcceptanceService.selectByPrimaryKey(id);
        model.addAttribute("oaActAcceptance", oaActAcceptance);
        return "oa/act/act_acceptance_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActAcceptance oaActAcceptance
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActAcceptance oaActAcceptance) {
        if (oaActAcceptanceService.edit(oaActAcceptance) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActAcceptance oaActAcceptance
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActAcceptance oaActAcceptance) {
        //更新数据
        if (oaActAcceptanceService.edit(oaActAcceptance) < 0) {
            return "error";
        } else {
            //验收人
            UserInfo userInfo = userInfoService.getUserInfoByPermission("accepter");
            Map<String, Object> map = new HashMap<>(16);
            map.put("accepter", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_acceptance", "oa_act_acceptance:" + oaActAcceptance.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStateByCorrelationId(oaActAcceptance.getId(), 0, oaActAcceptance.getTitle());
                return "success";
            } else {
                return "error";
            }
        }
    }

    /**
     * 详情
     *
     * @param id     id
     * @param taskId taskId
     * @param model  model
     * @return jsp
     */
    @RequestMapping(value = "/details")
    public String details(String id, String taskId, Model model) {
        OaActAcceptance oaActAcceptance = oaActAcceptanceService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActAcceptance", oaActAcceptance);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_acceptance_details";
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
        OaActAcceptance oaActAcceptance = oaActAcceptanceService.selectByPrimaryKey(id);

        String nickname = getCurrentUser().getNickname();
        //根据发起者id获取所属部门id
        String departmentId = userInfoService.selectDepartmentByUserId(oaActAcceptance.getPromoter());
        //部门负责人
        String principalId = departmentService.selectEnforcerId("principal", departmentId);
        String principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        //部门主管领导
        String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
        String supervisor = userInfoService.getNicknameById(Integer.valueOf(supervisorId));
        //验收人
        String accepter = userInfoService.getUserInfoByPermission("accepter").getNickname();
        //主要领导（总经理）
        String companyPrincipal = userInfoService.getUserInfoByPermission("company_principal").getNickname();

        map.put("nickname", nickname);
        map.put("principal", principal);
        map.put("supervisor", supervisor);
        map.put("accepter", accepter);
        map.put("companyPrincipal", companyPrincipal);
        map.put("acceptance", oaActAcceptance);
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
            oaActAcceptanceService.deleteData(id);
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
            //撤销成功后更新state为
            oaCollaborationService.updateState(id, 2);
            return "success";
        } else {
            //错误
            return "error";
        }
    }

}
