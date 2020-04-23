package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActConfirm;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.OaActConfirmService;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 确认单审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/confirm")
public class OaActConfirmController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActConfirmService oaActConfirmService;

    @Resource
    private UserInfoService userInfoService;

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
     * 跳转新增页面
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toMeals(Model model) {
        model.addAttribute("nickname", getCurrentUser().getNickname());
        model.addAttribute("department", getCurrentUser().getDepartment());
        return "oa/act/act_confirm";
    }

    /**
     * 提交新增
     *
     * @param oaActConfirm oaActConfirm
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(@RequestBody OaActConfirm oaActConfirm) {
        String randomId = RandomUtil.randomId();
        if (oaActConfirmService.insert(oaActConfirm, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            //经营统计
            UserInfo userInfo = userInfoService.getUserInfoByPermission("operating_statistics");
            //开启流程
            Map<String, Object> map = new HashMap<>(16);
            map.put("operating_statistics", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_confirm", "oa_act_confirm:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActConfirm oaActConfirm = oaActConfirmService.selectByPrimaryKey(id);
        model.addAttribute("oaActConfirm", oaActConfirm);
        model.addAttribute("oaActConfirmJson", JsonHelper.toJSONString(oaActConfirm));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_confirm_handel";
    }

    /**
     * 提交审批
     *
     * @param oaActConfirm oaActConfirm
     * @param taskId       任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActConfirm oaActConfirm, String taskId, Integer flag) {
        //回退标识
        String back = "back";
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";

        //经营统计网关
        String operatingStatisticsEG = "operatingStatisticsEG";
        //财务审核网关
        String financeReviewEG = "financeReviewEG";
        //财务主管网关
        String financeSupervisorEG = "financeSupervisorEG";
        //经营主管网关
        String operatingSupervisorEG = "operatingSupervisorEG";
        //总经理网关
        String companyPrincipalEG = "companyPrincipalEG";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        } else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            if (operatingStatisticsEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    UserInfo userInfo = userInfoService.getUserInfoByPermission("finance_review");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("finance_review", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActConfirm);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActConfirm.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActConfirm.getId(), "被回退");
                    oaActConfirm.setOperatingStatistics(null);
                    oaActConfirm.setOperatingStatisticsDate(null);
                    oaActConfirm.setState(1);
                    return updateByPrimaryKeySelective(oaActConfirm);
                }

            } else if (financeReviewEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("finance_principal");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("finance_supervisor", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActConfirm);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActConfirm.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActConfirm.getId(), "被回退");
                    oaActConfirm.setFinancialAudit(null);
                    oaActConfirm.setFinancialAuditDate(null);
                    oaActConfirm.setState(1);
                    return updateByPrimaryKeySelective(oaActConfirm);
                }

                //回退结束
            } else if (financeSupervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("operating_supervisor");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("operating_supervisor", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActConfirm);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActConfirm.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActConfirm.getId(), "被回退");
                    oaActConfirm.setFinanceSupervisor(null);
                    oaActConfirm.setFinanceSupervisorDate(null);
                    oaActConfirm.setState(1);
                    return updateByPrimaryKeySelective(oaActConfirm);
                }

                //回退结束
            } else if (operatingSupervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("company_principal", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActConfirm);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActConfirm.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActConfirm.getId(), "被回退");
                    oaActConfirm.setBusinessSupervisor(null);
                    oaActConfirm.setBusinessSupervisorDate(null);
                    oaActConfirm.setState(1);
                    return updateByPrimaryKeySelective(oaActConfirm);
                }

                //回退结束
            } else if (companyPrincipalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("promoter", oaActConfirm.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActConfirm);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActConfirm.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActConfirm.getId(), "被回退");
                    oaActConfirm.setCompanyPrincipal(null);
                    oaActConfirm.setCompanyPrincipalDate(null);
                    oaActConfirm.setState(1);
                    return updateByPrimaryKeySelective(oaActConfirm);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActConfirm.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActConfirm);

                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActConfirm);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActConfirm);
                }
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActConfirm oaActConfirm
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActConfirm oaActConfirm) {
        if (oaActConfirmService.updateByPrimaryKeySelective(oaActConfirm) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActConfirm oaActConfirm
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(@RequestBody OaActConfirm oaActConfirm) {
        String randomId = RandomUtil.randomId();
        if (oaActConfirmService.insert(oaActConfirm, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActConfirm oaActConfirm = oaActConfirmService.selectByPrimaryKey(id);
        model.addAttribute("oaActConfirm", oaActConfirm);
        return "oa/act/act_confirm_edit";
    }

    /**
     * 编辑后保存
     *
     * @param oaActConfirm oaActConfirm
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(@RequestBody OaActConfirm oaActConfirm) {
        if (oaActConfirmService.edit(oaActConfirm) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActConfirm oaActConfirm
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(@RequestBody OaActConfirm oaActConfirm) {
        //更新数据
        if (oaActConfirmService.edit(oaActConfirm) < 0) {
            return "error";
        } else {
            //经营统计
            UserInfo userInfo = userInfoService.getUserInfoByPermission("operating_statistics");
            //开启流程
            Map<String, Object> map = new HashMap<>(16);
            map.put("operating_statistics", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_confirm", "oa_act_confirm:" + oaActConfirm.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStatusCode(oaActConfirm.getId(), "协同");
                oaCollaborationService.updateStateByCorrelationId(oaActConfirm.getId(), 0, oaActConfirm.getTitle());
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
        OaActConfirm oaActConfirm = oaActConfirmService.selectByPrimaryKey(id);
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActConfirm", oaActConfirm);
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_confirm_details";
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
            oaActConfirmService.deleteData(id);
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
