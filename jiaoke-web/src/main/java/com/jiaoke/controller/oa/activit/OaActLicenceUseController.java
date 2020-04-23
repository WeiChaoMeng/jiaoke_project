package com.jiaoke.controller.oa.activit;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActLicenceUseService;
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
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 3:01
 */
@Controller
@RequestMapping("/licenceUse")
public class OaActLicenceUseController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActLicenceUseService oaActLicenceUseService;

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
     * 证照使用审批单（复印件）
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toLicenceUse(Model model) {
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
        return "oa/act/act_licence_use";
    }

    /**
     * 新增
     *
     * @param oaActLicenceUse oaActLicenceUse
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActLicenceUse oaActLicenceUse) {
        String randomId = RandomUtil.randomId();
        if (oaActLicenceUseService.insert(oaActLicenceUse, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            Map<String, Object> map = new HashMap<>(16);
            List<Object> principalList = new ArrayList<>();

            String principal = oaActLicenceUse.getDepartmentPrincipal();
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
            String instance = activitiUtil.startProcessInstanceByKey("oa_licence_use", "oa_act_licence_use:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActLicenceUse oaActLicenceUse = oaActLicenceUseService.selectByPrimaryKey(id);
        //查询部门负责人nickname
        if (oaActLicenceUse.getDepartmentPrincipal().contains(",")) {
            String principalNum = "";
            String[] strings = oaActLicenceUse.getDepartmentPrincipal().split(",");
            for (String s : strings) {
                principalNum += " ";
                principalNum += userInfoService.getNicknameById(Integer.valueOf(s));
            }
            model.addAttribute("principalNum", JsonHelper.toJSONString(principalNum));
        } else {
            model.addAttribute("principalNum", JsonHelper.toJSONString("noPrincipalNum"));
        }
        model.addAttribute("oaActLicenceUse", oaActLicenceUse);
        model.addAttribute("oaActLicenceUseJson", JsonHelper.toJSONString(oaActLicenceUse));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_licence_use_handle";
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
        OaActLicenceUse oaActLicenceUse = oaActLicenceUseService.selectByPrimaryKey(id);

        String nickname = getCurrentUser().getNickname();
        //根据发起者id获取所属部门id
        String departmentId = userInfoService.selectDepartmentByUserId(oaActLicenceUse.getPromoter());
        //部门负责人
        String principalId = departmentService.selectEnforcerId("principal", departmentId);
        String principal = userInfoService.getNicknameById(Integer.valueOf(principalId));

        //证照主管领导
        String licenceManage = userInfoService.getUserInfoByPermission("licence_manage").getNickname();

        //证照经办人
        String licenceOperator = userInfoService.getUserInfoByPermission("licence_operator").getNickname();

        map.put("nickname", nickname);
        map.put("principal", principal);
        map.put("licenceManage", licenceManage);
        map.put("licenceOperator", licenceOperator);
        map.put("licenceUse", oaActLicenceUse);
        map.put("taskId", taskId);
        return JSON.toJSONString(map);
    }

    /**
     * 提交
     *
     * @param oaActLicenceUse oaActLicenceUse
     * @param taskId          任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActLicenceUse oaActLicenceUse, String taskId, Integer flag) {
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //网关-部门负责人
        String principalEG = "principalEG";
        //网关-证照主管网关
        String licenceManageEG = "licenceManageEG";
        //经办人网关
        String licenceOperatorEG = "licenceOperatorEG";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        }else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //网关
            if (principalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("licence_manage");
                    map.put("whether", 0);
                    map.put("licence_manage", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActLicenceUse);
                } else {

                    if (oaActLicenceUse.getDepartmentPrincipal().contains(",")) {

                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("promoter", oaActLicenceUse.getPromoter());
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaCollaborationService.updateStatusCode(oaActLicenceUse.getId(), "被回退");
                        oaActLicenceUse.setPrincipal(null);
                        oaActLicenceUse.setPrincipalDate(null);
                        oaActLicenceUse.setState(1);
                        return updateByPrimaryKeySelective(oaActLicenceUse);

                    } else {
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("promoter", oaActLicenceUse.getPromoter());
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActLicenceUse.getId(), "被回退");
                        oaActLicenceUse.setPrincipal(null);
                        oaActLicenceUse.setPrincipalDate(null);
                        oaActLicenceUse.setState(1);
                        return updateByPrimaryKeySelective(oaActLicenceUse);
                    }
                }
            } else if (licenceManageEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("licence_operator");
                    map.put("licence_operator", userInfo.getId());
                    map.put("whether", 0);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActLicenceUse);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActLicenceUse.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActLicenceUse.getId(), "被回退");
                    oaActLicenceUse.setLicenceManage(null);
                    oaActLicenceUse.setLicenceManageDate(null);
                    oaActLicenceUse.setState(1);
                    return updateByPrimaryKeySelective(oaActLicenceUse);
                }

            } else if (licenceOperatorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("promoter", oaActLicenceUse.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActLicenceUse);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActLicenceUse.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActLicenceUse.getId(), "被回退");
                    oaActLicenceUse.setLicenceOperator(null);
                    oaActLicenceUse.setLicenceOperatorDate(null);
                    oaActLicenceUse.setState(1);
                    return updateByPrimaryKeySelective(oaActLicenceUse);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActLicenceUse.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActLicenceUse);
                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActLicenceUse);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActLicenceUse);
                }
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActLicenceUse oaActLicenceUse
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActLicenceUse oaActLicenceUse) {
        if (oaActLicenceUseService.updateByPrimaryKeySelective(oaActLicenceUse) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActLicenceUse oaActLicenceUse
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActLicenceUse oaActLicenceUse) {
        String randomId = RandomUtil.randomId();
        if (oaActLicenceUseService.insert(oaActLicenceUse, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActLicenceUse oaActLicenceUse = oaActLicenceUseService.selectByPrimaryKey(id);
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
        model.addAttribute("oaActLicenceUse", oaActLicenceUse);
        return "oa/act/act_licence_use_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActLicenceUse oaActLicenceUse
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActLicenceUse oaActLicenceUse) {
        if (oaActLicenceUseService.edit(oaActLicenceUse) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActLicenceUse oaActLicenceUse
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActLicenceUse oaActLicenceUse) {
        Map<String, Object> map = new HashMap<>(16);
        List<Object> principalList = new ArrayList<>();

        String principal = oaActLicenceUse.getDepartmentPrincipal();
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
        String instance = activitiUtil.startProcessInstanceByKey("oa_licence_use", "oa_act_licence_use:" + oaActLicenceUse.getId(), map, getCurrentUser().getId().toString());
        if (instance != null) {
            //发送成功后更新状态
            oaActLicenceUseService.edit(oaActLicenceUse);
            oaCollaborationService.updateStatusCode(oaActLicenceUse.getId(), "协同");
            oaCollaborationService.updateStateByCorrelationId(oaActLicenceUse.getId(), 0, oaActLicenceUse.getTitle());
            return "success";
        } else {
            return "error";
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
    public String licenceUseDetails(String id, String taskId, Model model) {
        OaActLicenceUse oaActLicenceUse = oaActLicenceUseService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActLicenceUse", oaActLicenceUse);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_licence_use_details";
    }

    /**
     * app获取详细信息
     *
     * @param id id
     * @return json
     */
    @RequestMapping(value = "/details.api")
    @ResponseBody
    public String detailsApi(String id) {
        HashMap<String, Object> map = new HashMap<>(16);
        OaActLicenceUse oaActLicenceUse = oaActLicenceUseService.selectByPrimaryKey(id);

        //根据发起者id获取所属部门id
        String departmentId = userInfoService.selectDepartmentByUserId(oaActLicenceUse.getPromoter());
        //部门负责人
        String principalId = departmentService.selectEnforcerId("principal", departmentId);
        String principal = userInfoService.getNicknameById(Integer.valueOf(principalId));

        //证照主管领导
        String licenceManage = userInfoService.getUserInfoByPermission("licence_manage").getNickname();

        //证照经办人
        String licenceOperator = userInfoService.getUserInfoByPermission("licence_operator").getNickname();

        map.put("principal", principal);
        map.put("licenceManage", licenceManage);
        map.put("licenceOperator", licenceOperator);
        map.put("licenceUse", oaActLicenceUse);
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
            oaActLicenceUseService.deleteData(id);
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
            //撤销成功后更新state为1
            oaCollaborationService.updateState(id, 2);
            return "success";
        } else {
            //错误
            return "error";
        }
    }
}
