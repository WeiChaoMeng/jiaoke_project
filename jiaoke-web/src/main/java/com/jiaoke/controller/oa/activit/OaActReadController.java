package com.jiaoke.controller.oa.activit;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.service.OaActReadService;
import com.jiaoke.oa.service.OaCollaborationService;
import com.jiaoke.oa.service.OaReceiptReadingService;
import com.jiaoke.oa.service.UserInfoService;
import org.activiti.bpmn.model.UserTask;
import org.activiti.engine.ManagementService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.identity.Authentication;
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

    @Resource
    private OaReceiptReadingService oaReceiptReadingService;

    @Resource
    private TaskService taskService;

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
            String instance = activitiUtil.startProcessInstanceByKey("oa_read2", "oa_act_read:" + randomId, map, getCurrentUser().getId().toString());
            if (instance != null) {
                return "success";
            }
            return "error";
        }
    }

    /**
     * app获取审批页面信息
     *
     * @param id     id
     * @param taskId taskId
     * @return json
     */
    @RequestMapping(value = "/approval.api")
    @ResponseBody
    public String approvalApi(String id, String taskId) {
        HashMap<String, Object> map = new HashMap<>(16);
        OaActRead oaActRead = oaActReadService.selectByPrimaryKey(id);

        String nickname = getCurrentUser().getNickname();

        List<OaReceiptReading> receiptReadingList = oaReceiptReadingService.selectAllData();
        String receiptProposed = userInfoService.getUserInfoByPermission("receipt_proposed").getNickname();
        String companyPrincipal = userInfoService.getUserInfoByPermission("company_principal").getNickname();
        String outcome = userInfoService.getUserInfoByPermission("handling_result").getNickname();

        if (oaActRead.getDepOpinion() != null){
            Task task = activitiUtil.getTaskByTaskId(taskId);
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
            if ("_7".equals(nextNode)){
                map.put("nextNode",nextNode);
            }else {
                map.put("nextNode","");
            }
        }

        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
        List<Comments> commentsList = activitiUtil.selectHistoryComment(task1.getProcessInstanceId());

        map.put("nickname", nickname);
        map.put("receiptReadingList", receiptReadingList);
        map.put("commentsList", commentsList);
        map.put("receiptProposed", receiptProposed);
        map.put("companyPrincipal", companyPrincipal);
        map.put("outcome", outcome);
        map.put("taskId", taskId);
        map.put("read", oaActRead);
        return JSON.toJSONString(map);
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
        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);

        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(task1.getProcessInstanceId());
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("commentsListSize", commentsList.size());
        model.addAttribute("oaActRead", oaActRead);
        model.addAttribute("oaActReadJson", JsonHelper.toJSONString(oaActRead));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());

        if (oaActRead.getDepOpinion() != null){
            Task task = activitiUtil.getTaskByTaskId(taskId);
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
            if ("_7".equals(nextNode)){
                return "oa/act/oa_document_reading_handle2";
            }
        }
        List<OaReceiptReading> receiptReadingList = oaReceiptReadingService.selectAllData();
        model.addAttribute("receiptReadingListJson", JsonHelper.toJSONString(receiptReadingList));
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
    public String approvalSubmit(OaActRead oaActRead,String processingOpinion, String taskId, Integer flag) {

        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //选择部门
        String depOpinion = "dep_opinion";
        //总经理
        String handlingResult = "handling_result";
        //拟办意见网关
        String receiptProposedEG = "receiptProposedEG";
        //领导批示网关
        String companyEG = "companyEG";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        } else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //网关
            if (receiptProposedEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("company_principal", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActRead);
                } else {
                    //发起人
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActRead.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaActRead.setState(1);
                    return updateByPrimaryKeySelective(oaActRead);
                }
            } else if (companyEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("handling_result");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("handling_result", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActRead);
                } else {
                    //发起人
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActRead.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaActRead.setState(1);
                    return updateByPrimaryKeySelective(oaActRead);
                }
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActRead.getId(), 3);
                return "backSuccess";
            } else if (end.equals(nextNode)) {
                activitiUtil.endProcess(taskId);
                return updateByPrimaryKeySelective(oaActRead);
            } else {
                UserTask userTask = activitiUtil.getUserTask(task.getProcessDefinitionId(), nextNode);
                if (nextNode.equals(userTask.getId())) {
                    String enforcer = userTask.getAssignee().substring(userTask.getAssignee().indexOf("{") + 1, userTask.getAssignee().indexOf("}"));

                    if (promoter.equals(enforcer)) {
                        Map<String, Object> map = new HashMap<>(16);
                        map.put(promoter, activitiUtil.getStartUserId(task.getProcessInstanceId()));
                        activitiUtil.approvalComplete(taskId, map);
                        return updateByPrimaryKeySelective(oaActRead);

                        //选择部门
                    } else if (depOpinion.equals(enforcer)) {

                        Map<String, Object> map = new HashMap<>(16);
                        List<Object> depOpinionList = new ArrayList<>();
                        String[] strings = oaActRead.getDepOpinion().split(",");
                        List<String> boundUser = oaReceiptReadingService.selectBoundUser(strings[0]);
                        depOpinionList.addAll(boundUser);
                        map.put("dep_opinion_list", depOpinionList);
                        activitiUtil.approvalComplete(taskId, map);
                        oaActRead.setDepOpinion(strings[1]);
                        return updateByPrimaryKeySelective(oaActRead);

                        //选择部门
                    } else if (handlingResult.equals(enforcer)){
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("handling_result");
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("handling_result", userInfo.getId());
                        activitiUtil.completeAndAppointNextNode(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(),map);
                        return updateByPrimaryKeySelective(oaActRead);

                    }else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActRead);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActRead);
                }
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActRead oaActRead
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActRead oaActRead) {
        if (oaActReadService.updateByPrimaryKeySelective(oaActRead) < 1) {
            return "error";
        } else {
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
                oaCollaborationService.updateStatusCode(oaActRead.getId(), "协同");
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
     * app获取详细信息
     *
     * @param id id
     * @return json
     */
    @RequestMapping(value = "/details.api")
    @ResponseBody
    public String cardDetailsApi(String id, String taskId) {
        HashMap<String, Object> map = new HashMap<>(16);
        OaActRead oaActRead = oaActReadService.selectByPrimaryKey(id);

        List<OaReceiptReading> receiptReadingList = oaReceiptReadingService.selectAllData();
        String receiptProposed = userInfoService.getUserInfoByPermission("receipt_proposed").getNickname();
        String companyPrincipal = userInfoService.getUserInfoByPermission("company_principal").getNickname();
        String outcome = userInfoService.getUserInfoByPermission("handling_result").getNickname();

        if (oaActRead.getDepOpinion() != null){
            List<Task> taskList = taskService.createTaskQuery().processInstanceId(taskId).list();
            if (taskList.size() > 0){
                for (Task task1 : taskList) {
                    if (task1 == null){
                        map.put("nextNode","");
                    } else {
                        Task task = activitiUtil.getTaskByTaskId(task1.getId());
                        String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
                        if ("_7".equals(nextNode)){
                            map.put("nextNode",nextNode);
                        }else {
                            map.put("nextNode","");
                        }
                    }
                }
            }else{
                map.put("nextNode","");
            }
        }

        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);

        map.put("receiptReadingList", receiptReadingList);
        map.put("commentsList", commentsList);
        map.put("receiptProposed", receiptProposed);
        map.put("companyPrincipal", companyPrincipal);
        map.put("outcome", outcome);
        map.put("taskId", taskId);
        map.put("read", oaActRead);
        return JSON.toJSONString(map);
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
