package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.Department;
import com.jiaoke.oa.bean.OaActRegularization;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActRegularizationService;
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
 * 转正申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/document")
public class OaActDocumentController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActRegularizationService oaActRegularizationService;

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
        //所有用户
        List<UserInfo> userInfoList = userInfoService.selectIdAndNicknameAndDepartment();
        List<Department> departmentList = departmentService.selectKeyAndName();
        model.addAttribute("nickName", getCurrentUser().getNickname());
        model.addAttribute("departmentName", getCurrentUser().getDepartment());
        model.addAttribute("userInfoList", JsonHelper.toJSONString(userInfoList));
        model.addAttribute("departmentListJson", JsonHelper.toJSONString(departmentList));
        model.addAttribute("departmentList", departmentList);
        return "oa/act/act_document";
    }

//    /**
//     * 提交新增
//     *
//     * @param oaActRegularization oaActRegularization
//     * @return s/e
//     */
//    @RequestMapping(value = "/add")
//    @ResponseBody
//    public String add(OaActRegularization oaActRegularization) {
//        String randomId = RandomUtil.randomId();
//        if (oaActRegularizationService.insert(oaActRegularization, getCurrentUser().getId(), randomId, 0) < 1) {
//            return "error";
//        } else {
//            //用户所在部门id
//            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
//            //部门负责人
//            String principal = departmentService.selectEnforcerId("principal", department);
//
//            //开启流程
//            Map<String, Object> map = new HashMap<>(16);
//            map.put("officePrincipal", principal);
//            String instance = activitiUtil.startProcessInstanceByKey("oa_regularization", "oa_act_regularization:" + randomId, map, getCurrentUser().getId().toString());
//            if (instance != null) {
//                return "success";
//            }
//            return "error";
//        }
//    }
//
//    /**
//     * 跳转审批页面
//     *
//     * @param id     id
//     * @param taskId taskId
//     * @param model  model
//     * @return jsp
//     */
//    @RequestMapping(value = "/approval")
//    public String approval(String id, String taskId, Model model) {
//        //审批
//        OaActRegularization oaActRegularization = oaActRegularizationService.selectByPrimaryKey(id);
//        //获取批注信息
//        List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());
//        model.addAttribute("oaActRegularization", oaActRegularization);
//        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
//        model.addAttribute("commentsList", commentsList);
//        model.addAttribute("nickname", getCurrentUser().getNickname());
//        return "oa/act/act_regularization_handle";
//    }
//
//    /**
//     * 提交审批
//     *
//     * @param oaActRegularization oaActRegularization
//     * @param taskId              taskId
//     * @param flag                flag
//     * @return s/e
//     */
//    @RequestMapping(value = "/approvalSubmit")
//    @ResponseBody
//    public String approvalSubmit(OaActRegularization oaActRegularization, String taskId, Integer flag) {
//        //结束标识
//        String end = "end";
//        //发起人
//        String promoter = "promoter";
//        //回退
//        String back = "back";
//        //部门负责人
//        String principal = "principal";
//        //部门主管领导
//        String supervisor = "supervisor";
//        //更新数据
//        if (oaActRegularizationService.updateData(oaActRegularization) < 1) {
//            return "error";
//        }
//
//        Task task = activitiUtil.getTaskByTaskId(taskId);
//        if (task == null) {
//            return "error";
//        }
//
//        if (flag == 1) {
//            //同意
//            //下个节点
//            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
//
//            //下个节点是否为end直接结束
//            if (end.equals(nextNode)) {
//                activitiUtil.endProcess(taskId);
//                return "success";
//            } else {
//                //附言
//                String processingOpinion = "";
//
//                UserTask userTask = activitiUtil.getUserTask(task.getProcessDefinitionId(), nextNode);
//                if (nextNode.equals(userTask.getId())) {
//                    String enforcer = userTask.getAssignee().substring(userTask.getAssignee().indexOf("{") + 1, userTask.getAssignee().indexOf("}"));
//
//                    if (promoter.equals(enforcer)) {
//                        Map<String, Object> map = new HashMap<>(16);
//                        map.put(promoter, activitiUtil.getStartUserId(task.getProcessInstanceId()));
//                        activitiUtil.completeAndAppointNextNode(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), map);
//                        return "success";
//
//                    } else if (principal.equals(enforcer) || supervisor.equals(enforcer)){
//                        String startUserId = activitiUtil.getStartUserId(task.getProcessInstanceId());
//                        //根据发起者id获取所属部门id
//                        String departmentId = userInfoService.selectDepartmentByUserId(Integer.valueOf(startUserId));
//                        //选择执行者Id
//                        String enforcerId = departmentService.selectEnforcerId(enforcer, departmentId);
//                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, Integer.valueOf(enforcerId));
//                        return "success";
//                    } else {
//                        UserInfo userInfo = userInfoService.getUserInfoByPermission(enforcer);
//                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
//                        return "success";
//                    }
//                } else {
//                    return "error";
//                }
//            }
//        } else {
//            //驳回
//            managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
//            //修改表单状态
//            oaCollaborationService.updateState(oaActRegularization.getId(), 3);
//            return "success";
//        }
//    }
//
//    /**
//     * 保存待发
//     *
//     * @param oaActRegularization oaActRegularization
//     * @return s/e
//     */
//    @RequestMapping(value = "/savePending")
//    @ResponseBody
//    public String savePending(OaActRegularization oaActRegularization) {
//        String randomId = RandomUtil.randomId();
//        if (oaActRegularizationService.insert(oaActRegularization, getCurrentUser().getId(), randomId, 1) < 1) {
//            return "error";
//        } else {
//            return "success";
//        }
//    }
//
//    /**
//     * 跳转编辑页面
//     *
//     * @param id    id
//     * @param model model
//     * @return jsp
//     */
//    @RequestMapping(value = "/toEdit")
//    public String toEdit(String id, Model model) {
//        OaActRegularization oaActRegularization = oaActRegularizationService.selectByPrimaryKey(id);
//        model.addAttribute("oaActRegularization", oaActRegularization);
//        model.addAttribute("annexList", JsonHelper.toJSONString(oaActRegularization.getAnnex()));
//        return "oa/act/act_regularization_edit";
//    }
//
//    /**
//     * 编辑后保存
//     *
//     * @param oaActRegularization oaActRegularization
//     * @return s/e
//     */
//    @RequestMapping(value = "/edit")
//    @ResponseBody
//    public String edit(OaActRegularization oaActRegularization) {
//        if (oaActRegularizationService.edit(oaActRegularization) < 0) {
//            return "error";
//        } else {
//            return "success";
//        }
//    }
//
//    /**
//     * 编辑后发送
//     *
//     * @param oaActRegularization oaActRegularization
//     * @return s/e
//     */
//    @RequestMapping(value = "/editAdd")
//    @ResponseBody
//    public String editAdd(OaActRegularization oaActRegularization) {
//        //更新数据
//        if (oaActRegularizationService.edit(oaActRegularization) < 0) {
//            return "error";
//        } else {
//            //获取拥有权限的用户
//            UserInfo userInfo = userInfoService.getUserInfoByPermission("mealsApproval");
//            Map<String, Object> map = new HashMap<>(16);
//            map.put("mealsApproval", userInfo.getId());
//            String instance = activitiUtil.startProcessInstanceByKey("oa_meals", "oa_act_meals:" + oaActRegularization.getId(), map, getCurrentUser().getId().toString());
//            if (instance != null) {
//                //发送成功后更新状态
//                oaCollaborationService.updateStateByCorrelationId(oaActRegularization.getId(), 0, oaActRegularization.getTitle());
//                return "success";
//            } else {
//                return "error";
//            }
//        }
//    }
//
//    /**
//     * 跳转详情页面
//     *
//     * @param id     id
//     * @param taskId taskId
//     * @param model  model
//     * @return jsp
//     */
//    @RequestMapping(value = "/details")
//    public String details(String id, String taskId, Model model) {
//        OaActRegularization oaActRegularization = oaActRegularizationService.selectByPrimaryKey(id);
//        //获取批注信息
//        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
//        model.addAttribute("oaActRegularization", oaActRegularization);
//        model.addAttribute("commentsList", commentsList);
//        model.addAttribute("commentsListSize", commentsList.size());
//        return "oa/act/act_regularization_details";
//    }
//
//    /**
//     * 删除
//     *
//     * @param id                id
//     * @param processInstanceId processInstanceId
//     * @return jsp
//     */
//    @RequestMapping(value = "/delete")
//    @ResponseBody
//    public String delete(String id, String processInstanceId) {
//        //删除流程
//        if (activitiUtil.deleteByProcessInstanceId(processInstanceId) == 1) {
//            //执行删除数据
//            oaActRegularizationService.deleteData(id);
//            oaCollaborationService.deleteByCorrelationId(id);
//            return "success";
//        } else {
//            return "error";
//        }
//    }
//
//    /**
//     * 删除附件
//     *
//     * @param array array
//     * @return jsp
//     */
//    @RequestMapping(value = "/deleteAnnexes")
//    @ResponseBody
//    public String deleteAnnexes(String[] array, String id) {
//        if (oaActRegularizationService.updateAnnexes(array, id) < 1) {
//            return "error";
//        }
//        return "success";
//    }
//
//    /**
//     * 撤销流程
//     *
//     * @param id                id
//     * @param processInstanceId processInstanceId
//     * @return jsp
//     */
//    @RequestMapping(value = "/rescind")
//    @ResponseBody
//    public String rescind(String id, String processInstanceId) {
//        int rescind = activitiUtil.rescindByProcessInstanceId(processInstanceId);
//        if (rescind < 0) {
//            //流程结束无法撤销
//            return "end";
//        } else if (rescind > 0) {
//            //撤销成功后更新state为1待发
//            oaCollaborationService.updateState(id, 2);
//            return "success";
//        } else {
//            //错误
//            return "error";
//        }
//    }
}
