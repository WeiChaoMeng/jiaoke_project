package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActProductionLeave;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActProductionLeaveService;
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
 * 生产假审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/productionLeave")
public class OaActProductionLeaveController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActProductionLeaveService oaActProductionLeaveService;

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
        model.addAttribute("department", getCurrentUser().getDepartment());
        return "oa/act/act_production_leave";
    }

    /**
     * 提交新增
     *
     * @param oaActProductionLeave oaActProductionLeave
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActProductionLeave oaActProductionLeave) {
        String randomId = RandomUtil.randomId();
        if (oaActProductionLeaveService.insert(oaActProductionLeave, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
            String supervisor = departmentService.selectEnforcerId("supervisor", department);
            Map<String, Object> map = new HashMap<>(16);
            map.put("supervisor", supervisor);
            String instance = activitiUtil.startProcessInstanceByKey("oa_production_leave", "oa_act_production_leave:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActProductionLeave oaActProductionLeave = oaActProductionLeaveService.selectByPrimaryKey(id);
        model.addAttribute("oaActProductionLeave", oaActProductionLeave);
        model.addAttribute("oaActProductionLeaveJson", JsonHelper.toJSONString(oaActProductionLeave));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_production_leave_handle";
    }

    /**
     * 提交审批
     *
     * @param oaActProductionLeave oaActProductionLeave
     * @param taskId               taskId
     * @param flag                 flag
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActProductionLeave oaActProductionLeave, String taskId, Integer flag) {
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //部门主管领导
        String supervisor = "supervisor";
        //人事
        String personnel = "personnel";
        //总经理
        String companyPrincipal = "company_principal";
        //知会
        String leaveNotify = "leaveNotify";

        //网关-部门主管领导
        String supervisorEG = "supervisorEG";
        //网关-人事
        String personnelEG = "personnelEG";
        //网关-总经理
        String companyEG = "companyEG";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        }else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            if (supervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("personnel", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActProductionLeave);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("human_affairs", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaActProductionLeave.setHumanAffairs(userInfo.getNickname());
                    oaCollaborationService.updateStatusCode(oaActProductionLeave.getId(), "被回退");
                    oaActProductionLeave.setSupervisor(null);
                    oaActProductionLeave.setSupervisorDate(null);
                    oaActProductionLeave.setState(1);
                    return updateByPrimaryKeySelective(oaActProductionLeave);
                }

            } else if (personnelEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("company_principal", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActProductionLeave);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("human_affairs", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaActProductionLeave.setHumanAffairs(userInfo.getNickname());
                    oaCollaborationService.updateStatusCode(oaActProductionLeave.getId(), "被回退");
                    oaActProductionLeave.setPersonnel(null);
                    oaActProductionLeave.setPersonnelDate(null);
                    oaActProductionLeave.setState(1);
                    return updateByPrimaryKeySelective(oaActProductionLeave);
                }

                //回退结束
            }else if (companyEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> normalList = new ArrayList<>();
                    normalList.add(userInfo.getId());
                    normalList.add(oaActProductionLeave.getPromoter());
                    map.put("whether", 0);
                    map.put("normalList", normalList);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActProductionLeave);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("human_affairs", userInfo.getId());
                    oaActProductionLeave.setHumanAffairs(userInfo.getNickname());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActProductionLeave.getId(), "被回退");
                    oaActProductionLeave.setCompanyPrincipal(null);
                    oaActProductionLeave.setCompanyPrincipalDate(null);
                    oaActProductionLeave.setState(1);
                    return updateByPrimaryKeySelective(oaActProductionLeave);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActProductionLeave.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActProductionLeave);

                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActProductionLeave);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActProductionLeave);
                }
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActProductionLeave oaActProductionLeave
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActProductionLeave oaActProductionLeave) {
        if (oaActProductionLeaveService.updateByPrimaryKeySelective(oaActProductionLeave) < 1) {
            return "error";
        } else {
            return "success";
        }
    }
    
    /**
     * 保存待发
     *
     * @param oaActProductionLeave oaActProductionLeave
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActProductionLeave oaActProductionLeave) {
        String randomId = RandomUtil.randomId();
        if (oaActProductionLeaveService.insert(oaActProductionLeave, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActProductionLeave oaActProductionLeave = oaActProductionLeaveService.selectByPrimaryKey(id);
        model.addAttribute("oaActProductionLeave", oaActProductionLeave);
        return "oa/act/act_production_leave_edit";
    }

    /**
     * 编辑后保存
     *
     * @param oaActProductionLeave oaActProductionLeave
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActProductionLeave oaActProductionLeave) {
        if (oaActProductionLeaveService.edit(oaActProductionLeave) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActProductionLeave oaActProductionLeave
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActProductionLeave oaActProductionLeave) {
        //更新数据
        if (oaActProductionLeaveService.edit(oaActProductionLeave) < 0) {
            return "error";
        } else {
            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
            String supervisor = departmentService.selectEnforcerId("supervisor", department);
            Map<String, Object> map = new HashMap<>(16);
            map.put("supervisor", supervisor);
            String instance = activitiUtil.startProcessInstanceByKey("oa_production_leave", "oa_act_production_leave:" + oaActProductionLeave.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStatusCode(oaActProductionLeave.getId(), "协同");
                oaCollaborationService.updateStateByCorrelationId(oaActProductionLeave.getId(), 0, oaActProductionLeave.getTitle());
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
        OaActProductionLeave oaActProductionLeave = oaActProductionLeaveService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActProductionLeave", oaActProductionLeave);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_production_leave_details";
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
            oaActProductionLeaveService.deleteData(id);
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
