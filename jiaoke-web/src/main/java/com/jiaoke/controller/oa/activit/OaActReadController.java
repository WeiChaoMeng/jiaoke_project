package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActCar;
import com.jiaoke.oa.bean.OaActRead;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.OaActReadService;
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
 * 收文阅办审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 3:36
 */
@Controller
@RequestMapping("/read")
public class OaActReadController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActReadService oaActReadService;

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
     * 收文阅办审批单
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toRead(Model model) {
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/oa_document_reading";
    }

    /**
     * 新增
     *
     * @param oaActRead oaActRead
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActRead oaActRead) {
        String randomId = RandomUtil.randomId();
        if (oaActReadService.insert(oaActRead, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            //获取拥有权限的用户
            UserInfo userInfo = userInfoService.getUserInfoByPermission("receipt_proposed");
            Map<String, Object> map = new HashMap<>(16);
            map.put("receipt_proposed", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_read", "oa_act_read:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActRead oaActRead = oaActReadService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());
        model.addAttribute("oaActRead", oaActRead);
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/oa_document_reading_handle";
    }

    /**
     * 提交
     *
     * @param oaActRead oaActRead
     * @param taskId    任务Id
     * @param flag      flag
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActRead oaActRead, String taskId, Integer flag) {

        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //公司负责人
        String companyPrincipal = "company_principal";
        //拟办意见
        String receiptProposed = "receipt_proposed";
        //知会
        String leaveNotify = "leaveNotify";

        //更新数据
        if (oaActReadService.updateByPrimaryKeySelective(oaActRead) < 1) {
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

                    //发起人
                    if (promoter.equals(enforcer)) {
                        Map<String, Object> map = new HashMap<>(16);
                        map.put(promoter, activitiUtil.getStartUserId(task.getProcessInstanceId()));
                        activitiUtil.completeAndAppointNextNode(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), map);
                        return "success";

                        //拟办意见
                    } else if (receiptProposed.equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("receipt_proposed");
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        return "success";

                        //领导批示
                    } else if (companyPrincipal.equals(enforcer)) {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
                        return "success";

                        //部门意见0：领导班子，1.各部门负责人
                    } else if (leaveNotify.equals(enforcer)) {

                        Map<String, Object> map = new HashMap<>(16);
                        List<Object> leaveNotifyList = new ArrayList<>();

                        if (oaActRead.getReceiptDepartment() == 0){
                            leaveNotifyList.add("3");
                            leaveNotifyList.add("4");
                        }else {
                            leaveNotifyList.add("5");
                            leaveNotifyList.add("22");
                            leaveNotifyList.add("23");
                            leaveNotifyList.add("24");
                            leaveNotifyList.add("25");
                            leaveNotifyList.add("34");
                            leaveNotifyList.add("38");
                            leaveNotifyList.add("47");
                            leaveNotifyList.add("48");
                            leaveNotifyList.add("58");
                            leaveNotifyList.add("59");
                            leaveNotifyList.add("60");
                        }

                        map.put("leaveNotifyList", leaveNotifyList);
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
            oaCollaborationService.updateState(oaActRead.getId(), 3);
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActRead oaActCar
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActRead oaActRead) {
        String randomId = RandomUtil.randomId();
        if (oaActReadService.insert(oaActRead, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActRead oaActRead = oaActReadService.selectByPrimaryKey(id);
        model.addAttribute("oaActRead", oaActRead);
        return "oa/act/oa_document_reading_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActRead oaActRead
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActRead oaActRead) {
        if (oaActReadService.edit(oaActRead) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActRead oaActRead
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActRead oaActRead) {
        //更新数据
        if (oaActReadService.edit(oaActRead) < 0) {
            return "error";
        } else {
            //获取拥有权限的用户
            UserInfo userInfo = userInfoService.getUserInfoByPermission("receipt_proposed");
            Map<String, Object> map = new HashMap<>(16);
            map.put("receipt_proposed", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_read", "oa_act_read:" + oaActRead.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStateByCorrelationId(oaActRead.getId(), 0, oaActRead.getTitle());
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
    public String readDetails(String id, String taskId, Model model) {
        OaActRead oaActRead = oaActReadService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActRead", oaActRead);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/oa_document_reading_details";
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
            oaActReadService.deleteData(id);
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
            oaCollaborationService.updateState(id, 1);
            return "success";
        } else {
            //错误
            return "error";
        }
    }
}
