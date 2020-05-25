package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.OaActTrainee;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActTraineeService;
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
 * 毕业生见习期满考核鉴定表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/trainee")
public class OaActTraineeController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActTraineeService oaActTraineeService;

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
        if (getCurrentUser().getSex() == 0) {
            model.addAttribute("sex", "男");
        } else {
            model.addAttribute("sex", "女");
        }
        return "oa/act/act_trainee";
    }

    /**
     * 提交新增
     *
     * @param oaActTrainee oaActTrainee
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActTrainee oaActTrainee) {
        String randomId = RandomUtil.randomId();
        if (oaActTraineeService.insert(oaActTrainee, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
            Map<String, Object> map = new HashMap<>(16);
            map.put("personnel_censor", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_trainee", "oa_act_trainee:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActTrainee oaActTrainee = oaActTraineeService.selectByPrimaryKey(id);
        model.addAttribute("oaActTrainee", oaActTrainee);
        model.addAttribute("oaActTraineeJson", JsonHelper.toJSONString(oaActTrainee));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_trainee_handle";
    }

    /**
     * 提交审批
     *
     * @param oaActTrainee oaActTrainee
     * @param taskId       taskId
     * @param flag         flag
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActTrainee oaActTrainee, String taskId, Integer flag) {
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //网关-总经理
        String companyEG = "companyEG";
        //人事审查
        String companyPrincipal = "company_principal";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        } else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            if (companyEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> leaveNotifyList = new ArrayList<>();
                    leaveNotifyList.add(oaActTrainee.getPromoter());
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("notifyHumanAffairs");
                    leaveNotifyList.add(userInfo.getId());
                    map.put("whether", 0);
                    map.put("normalList", leaveNotifyList);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActTrainee);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("personnel_censor", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActTrainee.getId(), "被回退");
                    oaActTrainee.setState(1);
                    return updateByPrimaryKeySelective(oaActTrainee);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActTrainee.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActTrainee);

                    } else if (companyPrincipal.equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                        Map<String, Object> map = new HashMap<>(16);
                        map.put(enforcer, userInfo.getId());
                        activitiUtil.approvalComplete(taskId, map);
                        return updateByPrimaryKeySelective(oaActTrainee);
                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActTrainee);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActTrainee);
                }
            }
        }

    }

    /**
     * 根据主键更新
     *
     * @param oaActTrainee oaActTrainee
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActTrainee oaActTrainee) {
        if (oaActTraineeService.updateByPrimaryKeySelective(oaActTrainee) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActTrainee oaActTrainee
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActTrainee oaActTrainee) {
        String randomId = RandomUtil.randomId();
        if (oaActTraineeService.insert(oaActTrainee, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActTrainee oaActTrainee = oaActTraineeService.selectByPrimaryKey(id);
        model.addAttribute("oaActTrainee", oaActTrainee);
        return "oa/act/act_trainee_edit";
    }

    /**
     * 编辑后保存
     *
     * @param oaActTrainee oaActTrainee
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActTrainee oaActTrainee) {
        if (oaActTraineeService.edit(oaActTrainee) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActTrainee oaActTrainee
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActTrainee oaActTrainee) {
        UserInfo userInfo = userInfoService.getUserInfoByPermission("personnel_censor");
        Map<String, Object> map = new HashMap<>(16);
        map.put("personnel_censor", userInfo.getId());
        String instance = activitiUtil.startProcessInstanceByKey("oa_trainee", "oa_act_trainee:" + oaActTrainee.getId(), map, getCurrentUser().getId().toString());
        if (instance != null) {
            //发送成功后更新状态
            oaActTraineeService.edit(oaActTrainee);
            oaCollaborationService.updateStatusCode(oaActTrainee.getId(), "协同");
            oaCollaborationService.updateStateByCorrelationId(oaActTrainee.getId(), 0, oaActTrainee.getTitle());
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
        OaActTrainee oaActTrainee = oaActTraineeService.selectByPrimaryKey(id);
        model.addAttribute("oaActTrainee", oaActTrainee);
        return "oa/act/act_trainee_details";
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
            oaActTraineeService.deleteData(id);
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
