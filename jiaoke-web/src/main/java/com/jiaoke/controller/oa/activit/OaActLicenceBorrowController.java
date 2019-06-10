package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActLicenceBorrow;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActLicenceBorrowService;
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
 * 证照借用审批单（原件）
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:51
 */
@Controller
@RequestMapping("/licenceBorrow")
public class OaActLicenceBorrowController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActLicenceBorrowService oaActLicenceBorrowService;

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
     * 证照借用审批单（原件）
     *
     * @return jsp
     */
    @RequestMapping("/toLicenceBorrow")
    public String toLicenceBorrow(Model model) {
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_licence_borrow";
    }

    /**
     *  新增
     *
     * @param oaActLicenceBorrow oaActLicenceBorrow
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActLicenceBorrow oaActLicenceBorrow) {
        String randomId = RandomUtil.randomId();
        if (oaActLicenceBorrowService.insert(oaActLicenceBorrow, getCurrentUser().getId(),randomId,0) < 1) {
            return "error";
        } else {
            //用户所在部门id
            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
            //部门负责人
            String principal = departmentService.selectEnforcerId("principal", department);
            Map<String, Object> map = new HashMap<>(16);
            map.put("principal", principal);
            String instance = activitiUtil.startProcessInstanceByKey("oa_licence_borrow", "oa_act_licence_borrow:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActLicenceBorrow oaActLicenceBorrow = oaActLicenceBorrowService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());
        model.addAttribute("oaActLicenceBorrow", oaActLicenceBorrow);
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_licence_borrow_handle";
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
                    //指定证照主管领导
                    if ("licenceManage".equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("licenceManage");
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        return "success";

                        //指定公司负责人
                    } else if ("companyPrincipal".equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("companyPrincipal");
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        return "success";

                        //指定证照经办人
                    } else if ("licenceOperator".equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("licenceOperator");
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
     * @param oaActLicenceBorrow oaActLicenceBorrow
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActLicenceBorrow oaActLicenceBorrow) {
        String randomId = RandomUtil.randomId();
        if (oaActLicenceBorrowService.insert(oaActLicenceBorrow, getCurrentUser().getId(), randomId,1) < 1) {
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
        OaActLicenceBorrow oaActLicenceBorrow = oaActLicenceBorrowService.selectByPrimaryKey(id);
        model.addAttribute("oaActLicenceBorrow", oaActLicenceBorrow);
        return "oa/act/act_licence_borrow_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActLicenceBorrow oaActLicenceBorrow
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActLicenceBorrow oaActLicenceBorrow) {
        if (oaActLicenceBorrowService.edit(oaActLicenceBorrow) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActLicenceBorrow oaActLicenceBorrow
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActLicenceBorrow oaActLicenceBorrow) {
        //更新数据
        if (oaActLicenceBorrowService.edit(oaActLicenceBorrow) < 0) {
            return "error";
        } else {
            //获取拥有查表计数人权限的用户信息
            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
            //部门负责人
            String principal = departmentService.selectEnforcerId("principal", department);
            Map<String, Object> map = new HashMap<>(16);
            map.put("principal", principal);
            String instance = activitiUtil.startProcessInstanceByKey("oa_licence_borrow", "oa_act_licence_borrow:" + oaActLicenceBorrow.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStateByCorrelationId(oaActLicenceBorrow.getId(), 0, oaActLicenceBorrow.getTitle());
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
        OaActLicenceBorrow oaActLicenceBorrow = oaActLicenceBorrowService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActLicenceBorrow", oaActLicenceBorrow);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_licence_borrow_details";
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
            oaActLicenceBorrowService.deleteData(id);
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
