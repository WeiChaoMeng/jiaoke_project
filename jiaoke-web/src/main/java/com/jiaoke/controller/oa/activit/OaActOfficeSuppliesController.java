package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActOfficeSupplies;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActOfficeSuppliesService;
import com.jiaoke.oa.service.OaCollaborationService;
import com.jiaoke.oa.service.UserInfoService;
import org.activiti.bpmn.model.UserTask;
import org.activiti.engine.ManagementService;
import org.activiti.engine.task.Task;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 办公用品需求计划
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:29
 */
@Controller
@RequestMapping("/officeSupplies")
public class OaActOfficeSuppliesController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActOfficeSuppliesService oaActOfficeSuppliesService;

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
     * 审批单主页面
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toSealsBorrow(Model model) {
        model.addAttribute("nickname", getCurrentUser().getNickname());
        model.addAttribute("department", getCurrentUser().getDepartment());
        return "oa/act/act_office_supplies";
    }

    /**
     * 新增
     *
     * @param oaActOfficeSupplies oaActOfficeSupplies
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(@RequestBody OaActOfficeSupplies oaActOfficeSupplies) {
        String randomId = RandomUtil.randomId();
        if (oaActOfficeSuppliesService.insert(oaActOfficeSupplies, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            UserInfo userInfo = userInfoService.getUserInfoByPermission("office_supplies_review");
            Map<String, Object> map = new HashMap<>(16);
            map.put("office_supplies_review", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_office_supplies", "oa_act_office_supplies:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActOfficeSupplies oaActOfficeSupplies = oaActOfficeSuppliesService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());
        model.addAttribute("oaActOfficeSupplies", oaActOfficeSupplies);
        model.addAttribute("oaActOfficeSuppliesJson", JsonHelper.toJSONString(oaActOfficeSupplies));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_office_supplies_handle";
    }

    /**
     * 提交
     *
     * @param oaActOfficeSupplies oaActOfficeSupplies
     * @param taskId              任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActOfficeSupplies oaActOfficeSupplies, String taskId, Integer flag) {
        //流程终点名称
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //部门负责人
        String principal = "principal";
        //主管领导
        String officeSuppliesSupervisor = "office_supplies_supervisor";
        //知会
        String leaveNotify = "leaveNotify";

        //更新数据
        if (oaActOfficeSuppliesService.updateByPrimaryKeySelective(oaActOfficeSupplies) < 1) {
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

                        //部门负责人
                    } else if (principal.equals(enforcer)){
                        String startUserId = activitiUtil.getStartUserId(task.getProcessInstanceId());
                        String departmentId = userInfoService.selectDepartmentByUserId(Integer.valueOf(startUserId));
                        String enforcerId = departmentService.selectEnforcerId(enforcer, departmentId);
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, Integer.valueOf(enforcerId));
                        return "success";

                        //主管领导
                    } else if (officeSuppliesSupervisor.equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("office_supplies_supervisor");
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        return "success";

                        //知会
                    }else if (leaveNotify.equals(enforcer)) {
                        List<UserInfo> userInfoList = userInfoService.selectMultipleByPermission("officeSuppliesNotify");
                        Map<String, Object> map = new HashMap<>(16);
                        List<Object> officeSuppliesNotifyList = new ArrayList<>();
                        for (UserInfo user : userInfoList) {
                            officeSuppliesNotifyList.add(user.getId());
                        }
                        officeSuppliesNotifyList.add(oaActOfficeSupplies.getPromoter());
                        map.put("leaveNotifyList", officeSuppliesNotifyList);
                        activitiUtil.designatedCountersignPersonnel(taskId,map);
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
            oaCollaborationService.updateState(oaActOfficeSupplies.getId(), 3);
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActOfficeSupplies oaActOfficeSupplies
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(@RequestBody OaActOfficeSupplies oaActOfficeSupplies) {
        String randomId = RandomUtil.randomId();
        if (oaActOfficeSuppliesService.insert(oaActOfficeSupplies, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActOfficeSupplies oaActOfficeSupplies = oaActOfficeSuppliesService.selectByPrimaryKey(id);
        model.addAttribute("oaActOfficeSupplies", oaActOfficeSupplies);
        return "oa/act/act_office_supplies_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActOfficeSupplies oaActOfficeSupplies
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(@RequestBody OaActOfficeSupplies oaActOfficeSupplies) {
        if (oaActOfficeSuppliesService.edit(oaActOfficeSupplies) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActOfficeSupplies oaActOfficeSupplies
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(@RequestBody OaActOfficeSupplies oaActOfficeSupplies) {
        //更新数据
        if (oaActOfficeSuppliesService.edit(oaActOfficeSupplies) < 0) {
            return "error";
        } else {
            UserInfo userInfo = userInfoService.getUserInfoByPermission("office_supplies_review");
            Map<String, Object> map = new HashMap<>(16);
            map.put("office_supplies_review", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_office_supplies", "oa_act_office_supplies:" + oaActOfficeSupplies.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStateByCorrelationId(oaActOfficeSupplies.getId(), 0, oaActOfficeSupplies.getTitle());
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
        OaActOfficeSupplies oaActOfficeSupplies = oaActOfficeSuppliesService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActOfficeSupplies", oaActOfficeSupplies);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_office_supplies_details";
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
            oaActOfficeSuppliesService.deleteData(id);
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
