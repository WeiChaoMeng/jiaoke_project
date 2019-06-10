package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActCar;
import com.jiaoke.oa.bean.OaActMaintain;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActMaintainService;
import com.jiaoke.oa.service.OaCollaborationService;
import com.jiaoke.oa.service.UserInfoService;
import org.activiti.bpmn.model.UserTask;
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
 * 设备维修申请单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 3:09
 */
@Controller
@RequestMapping("/maintain")
public class OaActMaintainController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActMaintainService oaActMaintainService;

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private DepartmentService departmentService;

    @Resource
    private OaCollaborationService oaCollaborationService;

    /**
     * 获取当前登录用户信息
     *
     * @return userInfo
     */
    private UserInfo getCurrentUser() {
        return (UserInfo) SecurityUtils.getSubject().getPrincipal();
    }

    /**
     * 设备维修申请单
     *
     * @return jsp
     */
    @RequestMapping("/toMaintain")
    public String toMaintain(Model model) {
        model.addAttribute("department", getCurrentUser().getDepartment());
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_maintain";
    }

    /**
     * 新增
     *
     * @param oaActMaintain oaActMaintain
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActMaintain oaActMaintain) {
        String randomId = RandomUtil.randomId();
        if (oaActMaintainService.insert(oaActMaintain, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            //用户所在部门id
            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
            //部门负责人
            String principal = departmentService.selectEnforcerId("principal", department);
            Map<String, Object> map = new HashMap<>(16);
            map.put("principal", principal);
            String instance = activitiUtil.startProcessInstanceByKey("oa_maintain", "oa_act_maintain:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActMaintain oaActMaintain = oaActMaintainService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());
        model.addAttribute("oaActMaintain", oaActMaintain);
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_maintain_handle";
    }

    /**
     * 提交
     *
     * @param processingOpinion 处理意见
     * @param taskId            任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(String processingOpinion, String taskId) {
        //根据processDefinitionId获取下个节点
        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        } else {
            //下个节点
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //判断下个节点是否为end
            if ("end".equals(nextNode)) {
                // 直接完成审批并结束流程。
                activitiUtil.complete(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname());
                return "success";
            } else {
                UserTask userTask = activitiUtil.getUserTask(task.getProcessDefinitionId(), nextNode);
                if (nextNode.equals(userTask.getId())) {
                    String assignee = userTask.getAssignee();
                    String enforcer = assignee.substring(assignee.indexOf("{") + 1, assignee.indexOf("}"));
                    //指定总经理
                    if ("companyPrincipal".equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("companyPrincipal");
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        return "success";
                    }
                    // 否:  1.获取当前流程发起者id(act_hi_procinst表，START_USER_ID_字段)
                    String startUserId = activitiUtil.getStartUserId(task.getProcessInstanceId());
                    //根据发起者id获取所属部门id
                    String departmentId = userInfoService.selectDepartmentByUserId(Integer.valueOf(startUserId));
                    //选择执行者Id
                    String enforcerId = departmentService.selectEnforcerId(enforcer, departmentId);
                    //4.完成审批指定下个节点
                    Map<String, Object> map = new HashMap<>(16);
                    map.put(enforcer, enforcerId);
                    activitiUtil.completeAndAppointNextNode(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), map);
                }
            }
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActMaintain oaActMaintain
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActMaintain oaActMaintain) {
        String randomId = RandomUtil.randomId();
        if (oaActMaintainService.insert(oaActMaintain, getCurrentUser().getId(), randomId,1) < 1) {
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
        OaActMaintain oaActMaintain = oaActMaintainService.selectByPrimaryKey(id);
        model.addAttribute("oaActMaintain", oaActMaintain);
        return "oa/act/act_maintain_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActMaintain oaActMaintain
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActMaintain oaActMaintain) {
        if (oaActMaintainService.edit(oaActMaintain) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActMaintain oaActMaintain
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActMaintain oaActMaintain) {
        //更新数据
        if (oaActMaintainService.edit(oaActMaintain) < 0) {
            return "error";
        } else {
            //用户所在部门id
            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
            //部门负责人
            String principal = departmentService.selectEnforcerId("principal", department);
            Map<String, Object> map = new HashMap<>(16);
            map.put("principal", principal);
            String instance = activitiUtil.startProcessInstanceByKey("oa_maintain", "oa_act_maintain:" + oaActMaintain.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStateByCorrelationId(oaActMaintain.getId(), 0, oaActMaintain.getTitle());
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
        OaActMaintain oaActMaintain = oaActMaintainService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActMaintain", oaActMaintain);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_maintain_details";
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
            oaActMaintainService.deleteData(id);
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
