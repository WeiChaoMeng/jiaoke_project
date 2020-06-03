package com.jiaoke.controller.oa.activit;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActCardService;
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
 * 饭卡审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 0:28
 */
@Controller
@RequestMapping("/card")
public class OaActCardController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActCardService oaActCardService;

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private DepartmentService departmentService;

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
     * 饭卡审批单
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toCard(Model model) {
        String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
        //查询部门负责人
        String principalIds = departmentService.selectEnforcerId("principal", department);
        List<String> list = new ArrayList<>();
        //部门负责人是否多个
        if (principalIds.contains(",")) {
            String[] principals = principalIds.split(",");
            for (String principal : principals) {
                String nickname = userInfoService.getNicknameById(Integer.valueOf(principal));
                list.add(nickname);
                list.add(principal);
            }
            model.addAttribute("principalGroup", JsonHelper.toJSONString(list));
        } else {
            model.addAttribute("principalGroup", "");
        }
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_card";
    }

    /**
     * 新增并启动流程
     *
     * @param oaActCard oaActCard
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActCard oaActCard) {
        String randomId = RandomUtil.randomId();
        if (oaActCardService.insertCard(oaActCard, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            Map<String, Object> map = new HashMap<>(16);
            List<Object> principalList = new ArrayList<>();

            String principal = oaActCard.getDepartmentPrincipal();
            //部门负责人勾选多个
            if (principal.contains(",")) {
                String[] split = principal.split(",");
                for (String s : split) {
                    principalList.add(s);
                }
                map.put("principalList", principalList);

                //部门负责人是单个
            } else if (principal.contains("single")) {
                String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
                String enforcerId = departmentService.selectEnforcerId("principal", department);
                principalList.add(enforcerId);
                map.put("principalList", principalList);

                //部门负责人勾选单个
            } else {
                principalList.add(principal);
                map.put("principalList", principalList);
            }
            String instance = activitiUtil.startProcessInstanceByKey("oa_card", "oa_act_card:" + randomId, map, getCurrentUser().getId().toString());
            if (instance != null) {
                return "success";
            }
            return "error";
        }
    }

    /**
     * 审批单处理页面
     *
     * @param id     id
     * @param taskId taskId
     * @param model  model
     * @return jsp
     */
    @RequestMapping(value = "/approval")
    public String approval(String id, String taskId, Model model) {
        //审批
        OaActCard oaActCard = oaActCardService.selectByPrimaryKey(id);
        model.addAttribute("oaActCard", oaActCard);
        model.addAttribute("oaActCardJson", JsonHelper.toJSONString(oaActCard));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        if (oaActCard.getDepartmentPrincipal().contains(",")) {
            return "oa/act/act_card_handle2";
        }
        return "oa/act/act_card_handle";
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
        String nickname = getCurrentUser().getNickname();
        OaActCard oaActCard = oaActCardService.selectByPrimaryKey(id);
        String principal;
        String principalT = null;
        String departmentId = userInfoService.selectDepartmentByUserId(oaActCard.getPromoter());
        if ("single".equals(oaActCard.getDepartmentPrincipal())){
            String principalId = departmentService.selectEnforcerId("principal", departmentId);
            principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        }else if (oaActCard.getDepartmentPrincipal().contains(",")){
            String[] split = oaActCard.getDepartmentPrincipal().split(",");
            principal = userInfoService.getNicknameById(Integer.valueOf(split[0]));
            principalT = userInfoService.getNicknameById(Integer.valueOf(split[1]));
        }else{
             principal = userInfoService.getNicknameById(Integer.valueOf(oaActCard.getDepartmentPrincipal()));
        }

        //选择执行者Id
        String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
        UserInfo userInfo = userInfoService.getUserInfoByPermission("card_approval");
        String supervisor = userInfoService.getNicknameById(Integer.valueOf(supervisorId));
        map.put("nickname", nickname);
        map.put("principal", principal);
        map.put("principalT", principalT);
        map.put("supervisor", supervisor);
        map.put("cardSupervisor", userInfo.getNickname());
        map.put("card", oaActCard);
        map.put("taskId", taskId);
        return JSON.toJSONString(map);
    }

    /**
     * 提交审批处理
     *
     * @param oaActCard oaActCard
     * @param taskId    任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActCard oaActCard, String taskId, Integer flag) {
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //部门负责人
        String principal = "principal";
        //部门主管领导
        String supervisor = "supervisor";
        //网关-部门负责人
        String principalEG = "principalEG";
        //网关-主管领导网关
        String supervisorEG = "supervisorEG";
        //主管部门负责人网关
        String cardApprovalEG = "cardApprovalEG";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        }else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //网关
            if (principalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    String department = userInfoService.selectDepartmentByUserId(oaActCard.getPromoter());
                    String supervisorId = departmentService.selectEnforcerId("supervisor", department);
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("supervisor", supervisorId);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActCard);
                } else {

                    if (oaActCard.getDepartmentPrincipal().contains(",")) {

                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("promoter", oaActCard.getPromoter());
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaCollaborationService.updateStatusCode(oaActCard.getId(), "被回退");
                        oaActCard.setState(1);
                        return updateByPrimaryKeySelective(oaActCard);

                    } else {
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("promoter", oaActCard.getPromoter());
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActCard.getId(), "被回退");
                        oaActCard.setState(1);
                        return updateByPrimaryKeySelective(oaActCard);
                    }
                }
            } else if (supervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("card_approval");
                    map.put("card_approval", userInfo.getId());
                    map.put("whether", 0);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActCard);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActCard.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActCard.getId(), "被回退");
                    oaActCard.setState(1);
                    return updateByPrimaryKeySelective(oaActCard);
                }

            } else if (cardApprovalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("promoter", oaActCard.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActCard);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActCard.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActCard.getId(), "被回退");
                    oaActCard.setState(1);
                    return updateByPrimaryKeySelective(oaActCard);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActCard.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActCard);
                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActCard);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActCard);
                }
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActCard oaActCard
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActCard oaActCard) {
        if (oaActCardService.updateByPrimaryKeySelective(oaActCard) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActCard oaActCard
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActCard oaActCard) {
        String randomId = RandomUtil.randomId();
        if (oaActCardService.insertCard(oaActCard, getCurrentUser().getId(), randomId, 1) < 0) {
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
        OaActCard oaActCard = oaActCardService.selectByPrimaryKey(id);
        String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
        //查询部门负责人
        String principalIds = departmentService.selectEnforcerId("principal", department);
        List<String> list = new ArrayList<>();
        //部门负责人是否多个
        if (principalIds.contains(",")) {
            String[] principals = principalIds.split(",");
            for (String principal : principals) {
                String nickname = userInfoService.getNicknameById(Integer.valueOf(principal));
                list.add(nickname);
                list.add(principal);
            }
            model.addAttribute("principalGroup", JsonHelper.toJSONString(list));
        } else {
            model.addAttribute("principalGroup", "");
        }
        model.addAttribute("oaActCard", oaActCard);
        return "oa/act/act_card_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActCard oaActCard
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActCard oaActCard) {
        if (oaActCardService.edit(oaActCard) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActCard oaActCard
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActCard oaActCard) {
        Map<String, Object> map = new HashMap<>(16);
        List<Object> principalList = new ArrayList<>();

        String principal = oaActCard.getDepartmentPrincipal();
        if (principal.contains(",")) {
            String[] split = principal.split(",");
            for (String s : split) {
                principalList.add(s);
            }
            map.put("principalList", principalList);

        } else if (principal.contains("single")) {
            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
            String enforcerId = departmentService.selectEnforcerId("principal", department);
            principalList.add(enforcerId);
            map.put("principalList", principalList);

        } else {
            principalList.add(principal);
            map.put("principalList", principalList);
        }
        String instance = activitiUtil.startProcessInstanceByKey("oa_card", "oa_act_card:" + oaActCard.getId(), map, getCurrentUser().getId().toString());
        if (instance != null) {
            oaActCardService.edit(oaActCard);
            oaCollaborationService.updateStatusCode(oaActCard.getId(), "协同");
            oaCollaborationService.updateStateByCorrelationId(oaActCard.getId(), 0, oaActCard.getTitle());
            return "success";
        }
        return "error";
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
    public String cardDetails(String id, String taskId, Model model) {
        OaActCard oaActCard = oaActCardService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActCard", oaActCard);
        model.addAttribute("commentsList", commentsList);
        if (oaActCard.getDepartmentPrincipal().contains(",")) {
            return "oa/act/act_card_details2";
        }else{
            return "oa/act/act_card_details";
        }
    }

    /**
     * app获取详细信息
     *
     * @param id id
     * @return json
     */
    @RequestMapping(value = "/details.api")
    @ResponseBody
    public String cardDetailsApi(String id) {
        HashMap<String, Object> map = new HashMap<>(16);
        OaActCard oaActCard = oaActCardService.selectByPrimaryKey(id);

        String principal;
        String principalT = null;
        String departmentId = userInfoService.selectDepartmentByUserId(oaActCard.getPromoter());
        if ("single".equals(oaActCard.getDepartmentPrincipal())){
            String principalId = departmentService.selectEnforcerId("principal", departmentId);
            principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        }else if (oaActCard.getDepartmentPrincipal().contains(",")){
            String[] split = oaActCard.getDepartmentPrincipal().split(",");
            principal = userInfoService.getNicknameById(Integer.valueOf(split[0]));
            principalT = userInfoService.getNicknameById(Integer.valueOf(split[1]));
        }else{
            principal = userInfoService.getNicknameById(Integer.valueOf(oaActCard.getDepartmentPrincipal()));
        }

        //选择执行者Id
        String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
        UserInfo userInfo = userInfoService.getUserInfoByPermission("card_approval");
        String supervisor = userInfoService.getNicknameById(Integer.valueOf(supervisorId));
        map.put("principal", principal);
        map.put("principalT", principalT);
        map.put("supervisor", supervisor);
        map.put("cardSupervisor", userInfo.getNickname());
        map.put("card", oaActCard);
        return JsonHelper.toJSONString(map);
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
            oaActCardService.delete(id);
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
            //撤销成功后更新state为2
            oaCollaborationService.updateState(id, 2);
            return "success";
        } else {
            //错误
            return "error";
        }
    }
}
