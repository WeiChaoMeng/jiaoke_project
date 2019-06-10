package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActReview;
import com.jiaoke.oa.bean.OaActSealsBorrow;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActSealsBorrowService;
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
 * 印章借用审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:29
 */
@Controller
@RequestMapping("/sealsBorrow")
public class OaActSealsBorrowController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActSealsBorrowService oaActSealsBorrowService;

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
     * 印章借用审批单
     *
     * @return jsp
     */
    @RequestMapping("/toSealsBorrow")
    public String toSealsBorrow(Model model) {
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_seals_borrow";
    }

    /**
     * 新增
     *
     * @param oaActSealsBorrow oaActSealsBorrow
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActSealsBorrow oaActSealsBorrow) {
        String randomId = RandomUtil.randomId();
        if (oaActSealsBorrowService.insert(oaActSealsBorrow, getCurrentUser().getId(),randomId,0) < 1) {
            return "error";
        } else {
            //用户所在部门id
            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
            //部门负责人
            String principal = departmentService.selectEnforcerId("principal", department);
            Map<String, Object> map = new HashMap<>(16);
            map.put("principal", principal);
            String instance = activitiUtil.startProcessInstanceByKey("oa_seals_borrow", "oa_act_seals_borrow:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActSealsBorrow oaActSealsBorrow = oaActSealsBorrowService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());
        model.addAttribute("oaActSealsBorrow", oaActSealsBorrow);
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_seals_borrow_handle";
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
        //印章主管领导
        String sealManage = "sealManage";
        //公司负责人
        String companyPrincipal = "companyPrincipal";
        //印章经办人
        String sealOperator = "sealOperator";
        //流程终点名称
        String end = "end";

        //根据processDefinitionId获取下个节点
        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        } else {
            //下个节点
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //判断下个节点是否为end
            if (end.equals(nextNode)) {
                // 直接完成审批并结束流程。
                activitiUtil.complete(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname());
                return "success";
            } else {
                UserTask userTask = activitiUtil.getUserTask(task.getProcessDefinitionId(), nextNode);
                if (nextNode.equals(userTask.getId())) {
                    String assignee = userTask.getAssignee();
                    String enforcer = assignee.substring(assignee.indexOf("{") + 1, assignee.indexOf("}"));
                    //指定印章主管领导
                    if (sealManage.equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission(sealManage);
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        return "success";

                        //指定公司负责人
                    } else if (companyPrincipal.equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission(companyPrincipal);
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        return "success";

                        //指定印章经办人
                    } else if (sealOperator.equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission(sealOperator);
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
     * @param oaActSealsBorrow oaActSealsBorrow
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActSealsBorrow oaActSealsBorrow) {
        String randomId = RandomUtil.randomId();
        if (oaActSealsBorrowService.insert(oaActSealsBorrow, getCurrentUser().getId(), randomId,1) < 1) {
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
        OaActSealsBorrow oaActSealsBorrow = oaActSealsBorrowService.selectByPrimaryKey(id);
        model.addAttribute("oaActSealsBorrow", oaActSealsBorrow);
        return "oa/act/act_seals_borrow_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActSealsBorrow oaActSealsBorrow
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActSealsBorrow oaActSealsBorrow) {
        if (oaActSealsBorrowService.edit(oaActSealsBorrow) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActSealsBorrow oaActSealsBorrow
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActSealsBorrow oaActSealsBorrow) {
        //更新数据
        if (oaActSealsBorrowService.edit(oaActSealsBorrow) < 0) {
            return "error";
        } else {
            //用户所在部门id
            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
            //部门负责人
            String principal = departmentService.selectEnforcerId("principal", department);
            Map<String, Object> map = new HashMap<>(16);
            map.put("principal", principal);
            String instance = activitiUtil.startProcessInstanceByKey("oa_seals_borrow", "oa_act_seals_borrow:" + oaActSealsBorrow.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStateByCorrelationId(oaActSealsBorrow.getId(), 0, oaActSealsBorrow.getTitle());
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
        OaActSealsBorrow oaActSealsBorrow = oaActSealsBorrowService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActSealsBorrow", oaActSealsBorrow);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_seals_borrow_details";
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
            oaActSealsBorrowService.deleteData(id);
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
