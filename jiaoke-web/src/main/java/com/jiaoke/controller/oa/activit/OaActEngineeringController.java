package com.jiaoke.controller.oa.activit;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActAcceptance;
import com.jiaoke.oa.bean.OaActEngineering;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActEngineeringService;
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
 * 工程名称变更记录表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 3:28
 */
@Controller
@RequestMapping("/engineering")
public class OaActEngineeringController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActEngineeringService oaActEngineeringService;

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
     * 工程名称变更记录表
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toEngineering(Model model) {
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_engineering";
    }

    /**
     * 新增
     *
     * @param oaActEngineering oaActEngineering
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActEngineering oaActEngineering) {
        String randomId = RandomUtil.randomId();
        if (oaActEngineeringService.insert(oaActEngineering, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            //审批人指定经营部
            UserInfo userInfo = userInfoService.getUserInfoByPermission("operating_principal");
            Map<String, Object> map = new HashMap<>(16);
            map.put("principal", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_engineering", "oa_act_engineering:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActEngineering oaActEngineering = oaActEngineeringService.selectByPrimaryKey(id);

        String nickname = getCurrentUser().getNickname();

        String operatingPrincipal = userInfoService.getUserInfoByPermission("operating_principal").getNickname();
        String operatingSupervisor = userInfoService.getUserInfoByPermission("operating_supervisor").getNickname();

        map.put("nickname", nickname);
        map.put("principal", operatingPrincipal);
        map.put("supervisor", operatingSupervisor);
        map.put("taskId", taskId);
        map.put("engineering", oaActEngineering);
        return JSON.toJSONString(map);
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
        OaActEngineering oaActEngineering = oaActEngineeringService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());
        model.addAttribute("oaActEngineering", oaActEngineering);
        model.addAttribute("oaActEngineeringJson", JsonHelper.toJSONString(oaActEngineering));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_engineering_handle";
    }

    /**
     * 提交审批
     *
     * @param oaActEngineering oaActEngineering
     * @param flag             flag
     * @param taskId           任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActEngineering oaActEngineering, String taskId, Integer flag) {
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //网关-部门负责人
        String principalEG = "principalEG";
        //网关-主管领导
        String supervisorEG = "supervisorEG";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        }else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //网关
            if (principalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("operating_supervisor");
                    map.put("whether", 0);
                    map.put("supervisor", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActEngineering);
                } else {

                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActEngineering.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActEngineering.getId(), "被回退");
                    oaActEngineering.setPrincipal(null);
                    oaActEngineering.setPrincipalDate(null);
                    oaActEngineering.setState(1);
                    return updateByPrimaryKeySelective(oaActEngineering);
                }
            } else if (supervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("promoter", oaActEngineering.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActEngineering);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActEngineering.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActEngineering.getId(), "被回退");
                    oaActEngineering.setSupervisor(null);
                    oaActEngineering.setSupervisorDate(null);
                    oaActEngineering.setState(1);
                    return updateByPrimaryKeySelective(oaActEngineering);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActEngineering.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActEngineering);
                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActEngineering);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActEngineering);
                }
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActEngineering oaActEngineering
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActEngineering oaActEngineering) {
        if (oaActEngineeringService.updateByPrimaryKeySelective(oaActEngineering) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActEngineering oaActEngineering
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActEngineering oaActEngineering) {
        String randomId = RandomUtil.randomId();
        if (oaActEngineeringService.insert(oaActEngineering, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActEngineering oaActEngineering = oaActEngineeringService.selectByPrimaryKey(id);
        model.addAttribute("oaActEngineering", oaActEngineering);
        return "oa/act/act_engineering_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActEngineering oaActEngineering
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActEngineering oaActEngineering) {
        if (oaActEngineeringService.edit(oaActEngineering) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActEngineering oaActEngineering
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActEngineering oaActEngineering) {
        //更新数据
        if (oaActEngineeringService.edit(oaActEngineering) < 0) {
            return "error";
        } else {
            //审批人指定经营部门
            String principal = departmentService.selectEnforcerId("principal", "11");
            Map<String, Object> map = new HashMap<>(16);
            map.put("principal", principal);
            String instance = activitiUtil.startProcessInstanceByKey("oa_engineering", "oa_act_engineering:" + oaActEngineering.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStatusCode(oaActEngineering.getId(), "协同");
                oaCollaborationService.updateStateByCorrelationId(oaActEngineering.getId(), 0, oaActEngineering.getTitle());
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
    public String engineeringDetails(String id, String taskId, Model model) {
        OaActEngineering oaActEngineering = oaActEngineeringService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActEngineering", oaActEngineering);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_engineering_details";
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
        OaActEngineering oaActEngineering = oaActEngineeringService.selectByPrimaryKey(id);

        String operatingPrincipal = userInfoService.getUserInfoByPermission("operating_principal").getNickname();
        String operatingSupervisor = userInfoService.getUserInfoByPermission("operating_supervisor").getNickname();

        map.put("principal", operatingPrincipal);
        map.put("supervisor", operatingSupervisor);
        map.put("engineering", oaActEngineering);
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
            oaActEngineeringService.deleteData(id);
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
