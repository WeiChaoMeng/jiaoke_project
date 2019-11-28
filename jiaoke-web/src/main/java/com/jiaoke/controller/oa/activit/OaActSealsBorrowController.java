package com.jiaoke.controller.oa.activit;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActSealsBorrowService;
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
 * 印章借用审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:29
 */
@Controller
@RequestMapping("/sealsBorrow")
public class OaActSealsBorrowController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActSealsBorrowService oaActSealsBorrowService;

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
     * 印章借用审批单
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toSealsBorrow(Model model) {
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_seals_borrow";
    }

    /**
     * 新增
     *
     * @param oaActSealsBorrow oaActSealsBorrow
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActSealsBorrow oaActSealsBorrow) {
        String randomId = RandomUtil.randomId();
        if (oaActSealsBorrowService.insert(oaActSealsBorrow, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            //用户所在部门id
            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
            //部门负责人
            String principal = departmentService.selectEnforcerId("principal", department);
            Map<String, Object> map = new HashMap<>(16);
            map.put("principal", principal);
            String instance = activitiUtil.startProcessInstanceByKey("oa_seals_borrow", "oa_act_seals_borrow:" + randomId, map, getCurrentUser().getId().toString());
            if (instance != null) {
                return "success";
            }
            return "error";
        }
    }

    /**
     * 审批
     *
     * @param id     id
     * @param taskId taskId
     * @param model  model
     * @return jsp
     */
    @RequestMapping(value = "/approval")
    public String approval(String id, String taskId, Model model) {
        //审批
        OaActSealsBorrow oaActSealsBorrow = oaActSealsBorrowService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());
        model.addAttribute("oaActSealsBorrow", oaActSealsBorrow);
        model.addAttribute("oaActSealsBorrowJson", JsonHelper.toJSONString(oaActSealsBorrow));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_seals_borrow_handle";
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
        OaActSealsBorrow oaActSealsBorrow = oaActSealsBorrowService.selectByPrimaryKey(id);


        String nickname = getCurrentUser().getNickname();
        //根据发起者id获取所属部门id
        String departmentId = userInfoService.selectDepartmentByUserId(oaActSealsBorrow.getPromoter());
        //部门负责人
        String principalId = departmentService.selectEnforcerId("principal", departmentId);
        String principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        //印章主管领导
        String sealSupervisor;
        if (oaActSealsBorrow.getSeal() == 4 || oaActSealsBorrow.getSeal() == 5) {
            sealSupervisor = userInfoService.getUserInfoByPermission("specialChapter").getNickname();
        } else {
            sealSupervisor = userInfoService.getUserInfoByPermission("seal_supervisor").getNickname();
        }

        //印章经办人
        String sealOperator;
        if (oaActSealsBorrow.getSeal() == 4) {
            sealOperator = userInfoService.getUserInfoByPermission("legalStamp").getNickname();
        } else if (oaActSealsBorrow.getSeal() == 5) {
            sealOperator = userInfoService.getUserInfoByPermission("financeStamp").getNickname();
        } else {
            sealOperator = userInfoService.getUserInfoByPermission("seal_operator").getNickname();
        }

        map.put("nickname", nickname);
        map.put("principal", principal);
        map.put("sealSupervisor", sealSupervisor);
        map.put("sealOperator", sealOperator);
        map.put("sealsBorrow", oaActSealsBorrow);
        map.put("taskId", taskId);
        return JSON.toJSONString(map);
    }

    /**
     * 提交
     *
     * @param oaActSealsBorrow oaActSealsBorrow
     * @param taskId           任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActSealsBorrow oaActSealsBorrow, String taskId, Integer flag) {
        //流程终点名称
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //部门负责人
        String principal = "principal";
        //印章主管领导
        String sealSupervisor = "seal_supervisor";
        //印章经办人
        String sealOperator = "seal_operator";

        //更新数据
        if (oaActSealsBorrowService.updateByPrimaryKeySelective(oaActSealsBorrow) < 1) {
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

                    } else if (principal.equals(enforcer)) {
                        String startUserId = activitiUtil.getStartUserId(task.getProcessInstanceId());
                        //根据发起者id获取所属部门id
                        String departmentId = userInfoService.selectDepartmentByUserId(Integer.valueOf(startUserId));
                        //选择执行者Id
                        String enforcerId = departmentService.selectEnforcerId(enforcer, departmentId);
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, Integer.valueOf(enforcerId));
                        return "success";
                    } else if (sealSupervisor.equals(enforcer)) {
                        //法人章和财务章的印章主管是总经理
                        if (oaActSealsBorrow.getSeal() == 4 || oaActSealsBorrow.getSeal() == 5) {
                            UserInfo userInfo = userInfoService.getUserInfoByPermission("specialChapter");
                            activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        } else {
                            UserInfo userInfo = userInfoService.getUserInfoByPermission("seal_supervisor");
                            activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        }
                        return "success";
                    } else if (sealOperator.equals(enforcer)) {
                        //法人章经办人（出纳回凤英）和财务章经办人（李佳）其他印章经办人是（汪宁）
                        if (oaActSealsBorrow.getSeal() == 4) {
                            UserInfo userInfo = userInfoService.getUserInfoByPermission("legalStamp");
                            activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        } else if (oaActSealsBorrow.getSeal() == 5) {
                            UserInfo userInfo = userInfoService.getUserInfoByPermission("financeStamp");
                            activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        } else {
                            UserInfo userInfo = userInfoService.getUserInfoByPermission("seal_operator");
                            activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        }
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
            oaCollaborationService.updateState(oaActSealsBorrow.getId(), 3);
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActSealsBorrow oaActSealsBorrow
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActSealsBorrow oaActSealsBorrow) {
        String randomId = RandomUtil.randomId();
        if (oaActSealsBorrowService.insert(oaActSealsBorrow, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActSealsBorrow oaActSealsBorrow = oaActSealsBorrowService.selectByPrimaryKey(id);
        model.addAttribute("oaActSealsBorrow", oaActSealsBorrow);
        return "oa/act/act_seals_borrow_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActSealsBorrow oaActSealsBorrow
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActSealsBorrow oaActSealsBorrow) {
        if (oaActSealsBorrowService.edit(oaActSealsBorrow) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActSealsBorrow oaActSealsBorrow
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActSealsBorrow oaActSealsBorrow) {
        //更新数据
        if (oaActSealsBorrowService.edit(oaActSealsBorrow) < 0) {
            return "error";
        } else {
            //用户所在部门id
            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
            //部门负责人
            String principal = departmentService.selectEnforcerId("principal", department);
            Map<String, Object> map = new HashMap<>(16);
            map.put("principal", principal);
            String instance = activitiUtil.startProcessInstanceByKey("oa_seals_borrow", "oa_act_seals_borrow:" + oaActSealsBorrow.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStateByCorrelationId(oaActSealsBorrow.getId(), 0, oaActSealsBorrow.getTitle());
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
    public String sealsBorrowDetails(String id, String taskId, Model model) {
        OaActSealsBorrow oaActSealsBorrow = oaActSealsBorrowService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActSealsBorrow", oaActSealsBorrow);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_seals_borrow_details";
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
        OaActSealsBorrow oaActSealsBorrow = oaActSealsBorrowService.selectByPrimaryKey(id);

        //根据发起者id获取所属部门id
        String departmentId = userInfoService.selectDepartmentByUserId(oaActSealsBorrow.getPromoter());
        //部门负责人
        String principalId = departmentService.selectEnforcerId("principal", departmentId);
        String principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        //印章主管领导
        String sealSupervisor;
        if (oaActSealsBorrow.getSeal() == 4 || oaActSealsBorrow.getSeal() == 5) {
            sealSupervisor = userInfoService.getUserInfoByPermission("specialChapter").getNickname();
        } else {
            sealSupervisor = userInfoService.getUserInfoByPermission("seal_supervisor").getNickname();
        }

        //印章经办人
        String sealOperator;
        if (oaActSealsBorrow.getSeal() == 4) {
            sealOperator = userInfoService.getUserInfoByPermission("legalStamp").getNickname();
        } else if (oaActSealsBorrow.getSeal() == 5) {
            sealOperator = userInfoService.getUserInfoByPermission("financeStamp").getNickname();
        } else {
            sealOperator = userInfoService.getUserInfoByPermission("seal_operator").getNickname();
        }

        map.put("principal", principal);
        map.put("sealSupervisor", sealSupervisor);
        map.put("sealOperator", sealOperator);
        map.put("sealsBorrow", oaActSealsBorrow);
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
            oaActSealsBorrowService.deleteData(id);
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
