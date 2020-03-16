package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActRelieveLaborContract;
import com.jiaoke.oa.bean.OaActRewardsPenalties;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActRewardsPenaltiesService;
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
 * 奖罚意见表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/rewardsPenalties")
public class OaActRewardsPenaltiesController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActRewardsPenaltiesService oaActRewardsPenaltiesService;

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
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_rewards_penalties";
    }

    /**
     * 提交新增
     *
     * @param oaActRewardsPenalties oaActRewardsPenalties
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActRewardsPenalties oaActRewardsPenalties) {
        String randomId = RandomUtil.randomId();
        if (oaActRewardsPenaltiesService.insert(oaActRewardsPenalties, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            String enforcerId = departmentService.selectEnforcerId("supervisor", "10");
            Map<String, Object> map = new HashMap<>(16);
            map.put("officeSupervisor", enforcerId);
            String instance = activitiUtil.startProcessInstanceByKey("oa_rewards_penalties", "oa_act_rewards_penalties:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActRewardsPenalties oaActRewardsPenalties = oaActRewardsPenaltiesService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());
        model.addAttribute("oaActRewardsPenalties", oaActRewardsPenalties);
        model.addAttribute("oaActRewardsPenaltiesJson", JsonHelper.toJSONString(oaActRewardsPenalties));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_rewards_penalties_handle";
    }

    /**
     * 提交审批
     *
     * @param taskId 任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActRewardsPenalties oaActRewardsPenalties, String taskId, Integer flag) {
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";

        //部门主管领导
        String qualitySupervisor = "qualitySupervisor";
        String businessSupervisor = "businessSupervisor";
        String productionSupervisor = "productionSupervisor";
        String suppliesSupervisor = "suppliesSupervisor";
        String financialSupervisor = "financialSupervisor";

        //总经理
        String companyPrincipal = "company_principal";
        //更新数据
        if (oaActRewardsPenaltiesService.updateByPrimaryKeySelective(oaActRewardsPenalties) < 1) {
            return "error";
        }

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        }

        if (flag == 1) {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
            if (end.equals(nextNode)) {
                activitiUtil.endProcess(taskId);
                return "success";
            } else {
                String processingOpinion = "";
                UserTask userTask = activitiUtil.getUserTask(task.getProcessDefinitionId(), nextNode);
                if (nextNode.equals(userTask.getId())) {
                    String enforcer = userTask.getAssignee().substring(userTask.getAssignee().indexOf("{") + 1, userTask.getAssignee().indexOf("}"));

                    //发起人
                    if (promoter.equals(enforcer)) {
                        Map<String, Object> map = new HashMap<>(16);
                        map.put(promoter, activitiUtil.getStartUserId(task.getProcessInstanceId()));
                        activitiUtil.completeAndAppointNextNode(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), map);
                        return "success";

                        //部门主管领导
                    } else if (qualitySupervisor.equals(enforcer)) {
                        String enforcerId = departmentService.selectEnforcerId("supervisor", "15");
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), "qualitySupervisor", Integer.valueOf(enforcerId));
                        return "success";

                    } else if (businessSupervisor.equals(enforcer)) {
                        String enforcerId = departmentService.selectEnforcerId("supervisor", "11");
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), "businessSupervisor", Integer.valueOf(enforcerId));
                        return "success";

                    } else if (productionSupervisor.equals(enforcer)) {
                        String enforcerId = departmentService.selectEnforcerId("supervisor", "12");
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), "productionSupervisor", Integer.valueOf(enforcerId));
                        return "success";

                    } else if (suppliesSupervisor.equals(enforcer)) {
                        String enforcerId = departmentService.selectEnforcerId("supervisor", "14");
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), "suppliesSupervisor", Integer.valueOf(enforcerId));
                        return "success";

                    } else if (financialSupervisor.equals(enforcer)) {
                        String enforcerId = departmentService.selectEnforcerId("supervisor", "13");
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), "financialSupervisor", Integer.valueOf(enforcerId));
                        return "success";

                        //总经理
                    } else if (companyPrincipal.equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
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
            oaCollaborationService.updateState(oaActRewardsPenalties.getId(), 3);
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActRewardsPenalties oaActRewardsPenalties
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActRewardsPenalties oaActRewardsPenalties) {
        String randomId = RandomUtil.randomId();
        if (oaActRewardsPenaltiesService.insert(oaActRewardsPenalties, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActRewardsPenalties oaActRewardsPenalties = oaActRewardsPenaltiesService.selectByPrimaryKey(id);
        model.addAttribute("oaActRewardsPenalties", oaActRewardsPenalties);
        return "oa/act/act_rewards_penalties_edit";
    }

    /**
     * 编辑后保存
     *
     * @param oaActRewardsPenalties oaActRewardsPenalties
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActRewardsPenalties oaActRewardsPenalties) {
        if (oaActRewardsPenaltiesService.edit(oaActRewardsPenalties) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActRewardsPenalties oaActRewardsPenalties
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActRewardsPenalties oaActRewardsPenalties) {
        //更新数据
        if (oaActRewardsPenaltiesService.edit(oaActRewardsPenalties) < 0) {
            return "error";
        } else {
            String enforcerId = departmentService.selectEnforcerId("supervisor", "10");
            Map<String, Object> map = new HashMap<>(16);
            map.put("officeSupervisor", enforcerId);
            String instance = activitiUtil.startProcessInstanceByKey("oa_rewards_penalties", "oa_act_rewards_penalties:" + oaActRewardsPenalties.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStateByCorrelationId(oaActRewardsPenalties.getId(), 0, oaActRewardsPenalties.getTitle());
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
        OaActRewardsPenalties oaActRewardsPenalties = oaActRewardsPenaltiesService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActRewardsPenalties", oaActRewardsPenalties);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_rewards_penalties_details";
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
            oaActRewardsPenaltiesService.deleteData(id);
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

    /**
     * 删除附件
     *
     * @param array array
     * @return jsp
     */
    @RequestMapping(value = "/deleteAnnexes")
    @ResponseBody
    public String deleteAnnexes(String[] array, String id) {
        if (oaActRewardsPenaltiesService.updateAnnexes(array, id) < 1) {
            return "error";
        }
        return "success";
    }
}
