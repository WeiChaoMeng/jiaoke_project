package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.*;
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
            Map<String, Object> map = new HashMap<>(16);
            ArrayList<Object> countersignList = new ArrayList<>();
            List<UserInfo> userInfoList = userInfoService.selectMultipleByPermission("JFYJ_countersign");
            for (UserInfo userInfo : userInfoList) {
                countersignList.add(userInfo.getId());
            }
            map.put("supervisor_countersign_list", countersignList);
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
        model.addAttribute("oaActRewardsPenalties", oaActRewardsPenalties);
        model.addAttribute("oaActRewardsPenaltiesJson", JsonHelper.toJSONString(oaActRewardsPenalties));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
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
        //会签网关
        String countersignEG = "countersignEG";
        //人事专员网关
        String personnelCensorEG = "personnelCensorEG";
        //人事主管网关
        String personnelEG = "personnelEG";
        //总经理网关
        String companyEG = "companyEG";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        }else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            if (countersignEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("personnel_censor", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActRewardsPenalties);
                } else {
                    Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                    List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                    for (Task tasks : taskList) {
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("promoter", oaActRewardsPenalties.getPromoter());
                        activitiUtil.approvalComplete(tasks.getId(), map);
                    }
                    oaCollaborationService.updateStatusCode(oaActRewardsPenalties.getId(), "被回退");
                    oaActRewardsPenalties.setState(1);
                    return updateByPrimaryKeySelective(oaActRewardsPenalties);
                }

            } else if (personnelCensorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("personnel", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActRewardsPenalties);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActRewardsPenalties.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActRewardsPenalties.getId(), "被回退");
                    oaActRewardsPenalties.setState(1);
                    return updateByPrimaryKeySelective(oaActRewardsPenalties);
                }

                //回退结束
            }else if (personnelEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("company_principal", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActRewardsPenalties);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActRewardsPenalties.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActRewardsPenalties.getId(), "被回退");
                    oaActRewardsPenalties.setState(1);
                    return updateByPrimaryKeySelective(oaActRewardsPenalties);
                }

                //回退结束
            }else if (companyEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("promoter", oaActRewardsPenalties.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActRewardsPenalties);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActRewardsPenalties.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActRewardsPenalties.getId(), "被回退");
                    oaActRewardsPenalties.setState(1);
                    return updateByPrimaryKeySelective(oaActRewardsPenalties);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActRewardsPenalties.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActRewardsPenalties);

                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActRewardsPenalties);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActRewardsPenalties);
                }
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActRewardsPenalties oaActRewardsPenalties
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActRewardsPenalties oaActRewardsPenalties) {
        if (oaActRewardsPenaltiesService.updateByPrimaryKeySelective(oaActRewardsPenalties) < 1) {
            return "error";
        } else {
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
            Map<String, Object> map = new HashMap<>(16);
            ArrayList<Object> countersignList = new ArrayList<>();
            List<UserInfo> userInfoList = userInfoService.selectMultipleByPermission("JFYJ_countersign");
            for (UserInfo userInfo : userInfoList) {
                countersignList.add(userInfo.getId());
            }
            map.put("supervisor_countersign_list", countersignList);
            String instance = activitiUtil.startProcessInstanceByKey("oa_rewards_penalties", "oa_act_rewards_penalties:" + oaActRewardsPenalties.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStatusCode(oaActRewardsPenalties.getId(), "协同");
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
        List<Permission> permissionList = userInfoService.getPermissionsByUserInfoId(getCurrentUser().getId());
        String url = "";
        for (Permission permission : permissionList) {
            if (permission.getUrl().contains("office_supervisor") || permission.getUrl().contains("personnel_censor") || permission.getUrl().contains("company_principal")){

                return "oa/act/act_rewards_penalties_details";
            }else{
                //权限不足
                url = "oa/act/act_rewards_penalties_details2";
            }
        }
        return url;
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
