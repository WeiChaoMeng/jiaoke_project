package com.jiaoke.controller.oa.activit;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActEmployment;
import com.jiaoke.oa.bean.OaActOfficeSupplies;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActOfficeSuppliesService;
import com.jiaoke.oa.service.OaCollaborationService;
import com.jiaoke.oa.service.UserInfoService;
import org.activiti.bpmn.model.UserTask;
import org.activiti.engine.ManagementService;
import org.activiti.engine.task.Task;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 办公用品需求计划
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:29
 */
@Controller
@RequestMapping("/officeSupplies")
public class OaActOfficeSuppliesController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActOfficeSuppliesService oaActOfficeSuppliesService;

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
     * 审批单主页面
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toSealsBorrow(Model model) {
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
        model.addAttribute("department", getCurrentUser().getDepartment());
        return "oa/act/act_office_supplies";
    }

    /**
     * 新增
     *
     * @param oaActOfficeSupplies oaActOfficeSupplies
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(@RequestBody OaActOfficeSupplies oaActOfficeSupplies) {
        String randomId = RandomUtil.randomId();
        if (oaActOfficeSuppliesService.insert(oaActOfficeSupplies, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            UserInfo userInfo = userInfoService.getUserInfoByPermission("office_supplies_review");
            Map<String, Object> map = new HashMap<>(16);
            map.put("review", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_office_supplies", "oa_act_office_supplies:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActOfficeSupplies oaActOfficeSupplies = oaActOfficeSuppliesService.selectByPrimaryKey(id);

        String nickname = getCurrentUser().getNickname();

        String principal;
        String principalT = null;
        String departmentId = userInfoService.selectDepartmentByUserId(oaActOfficeSupplies.getPromoter());
        if ("single".equals(oaActOfficeSupplies.getDepartmentPrincipal())){
            String principalId = departmentService.selectEnforcerId("principal", departmentId);
            principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        }else if (oaActOfficeSupplies.getDepartmentPrincipal().contains(",")){
            String[] split = oaActOfficeSupplies.getDepartmentPrincipal().split(",");
            principal = userInfoService.getNicknameById(Integer.valueOf(split[0]));
            principalT = userInfoService.getNicknameById(Integer.valueOf(split[1]));
        }else{
            principal = userInfoService.getNicknameById(Integer.valueOf(oaActOfficeSupplies.getDepartmentPrincipal()));
        }

        String review = userInfoService.getUserInfoByPermission("office_supplies_review").getNickname();
        String officeSuppliesSupervisor = userInfoService.getUserInfoByPermission("office_supplies_supervisor").getNickname();

        map.put("nickname", nickname);
        map.put("principal", principal);
        map.put("principalT", principalT);
        map.put("supervisor", officeSuppliesSupervisor);
        map.put("review", review);
        map.put("taskId", taskId);
        map.put("officeSupplies", oaActOfficeSupplies);
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
        OaActOfficeSupplies oaActOfficeSupplies = oaActOfficeSuppliesService.selectByPrimaryKey(id);
        model.addAttribute("oaActOfficeSupplies", oaActOfficeSupplies);
        model.addAttribute("oaActOfficeSuppliesJson", JsonHelper.toJSONString(oaActOfficeSupplies));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        if (oaActOfficeSupplies.getDepartmentPrincipal().contains(",")) {
            return "oa/act/act_office_supplies_handle2";
        }else{
            return "oa/act/act_office_supplies_handle";
        }
    }

    /**
     * 提交
     *
     * @param oaActOfficeSupplies oaActOfficeSupplies
     * @param taskId              任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActOfficeSupplies oaActOfficeSupplies, String taskId, Integer flag) {
        //流程终点名称
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //审核网关
        String reviewEG = "reviewEG";
        //网关-部门负责人
        String principalEG = "principalEG";
        //网关-部门主管领导
        String supervisorEG = "supervisorEG";


        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        } else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            if (reviewEG.equals(nextNode)) {
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> principalList = new ArrayList<>();

                    String principals = oaActOfficeSupplies.getDepartmentPrincipal();
                    //部门负责人勾选多个
                    if (principals.contains(",")) {
                        String[] split = principals.split(",");
                        for (String s : split) {
                            principalList.add(s);
                        }
                        map.put("principalList", principalList);

                        //部门负责人是单个
                    } else if (principals.contains("single")) {
                        String department = userInfoService.selectDepartmentByUserId(oaActOfficeSupplies.getPromoter());
                        String enforcerId = departmentService.selectEnforcerId("principal", department);
                        principalList.add(enforcerId);
                        map.put("principalList", principalList);

                        //部门负责人勾选单个
                    } else {
                        principalList.add(principals);
                        map.put("principalList", principalList);
                    }
                    map.put("whether", 0);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActOfficeSupplies);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActOfficeSupplies.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActOfficeSupplies.getId(), "被回退");
                    oaActOfficeSupplies.setState(1);
                    return updateByPrimaryKeySelective(oaActOfficeSupplies);
                }

            } else if (principalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("office_supplies_supervisor");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("supervisor", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActOfficeSupplies);
                } else {

                    if (oaActOfficeSupplies.getDepartmentPrincipal().contains(",")) {

                        UserInfo userInfo = userInfoService.getUserInfoByPermission("office_supplies_review");
                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("review", userInfo.getId());
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaCollaborationService.updateStatusCode(oaActOfficeSupplies.getId(), "被回退");
                        oaActOfficeSupplies.setState(1);
                        return updateByPrimaryKeySelective(oaActOfficeSupplies);

                    } else {
                        UserInfo userInfo = userInfoService.getUserInfoByPermission("office_supplies_review");
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("review", userInfo.getId());
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActOfficeSupplies.getId(), "被回退");
                        oaActOfficeSupplies.setState(1);
                        return updateByPrimaryKeySelective(oaActOfficeSupplies);
                    }
                }

            } else if (supervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> leaveNotifyList = new ArrayList<>();
                    leaveNotifyList.add(oaActOfficeSupplies.getPromoter());
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("office_supplies_review");
                    leaveNotifyList.add(userInfo.getId());
                    map.put("whether", 0);
                    map.put("normalList", leaveNotifyList);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActOfficeSupplies);
                } else {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("office_supplies_review");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("review", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActOfficeSupplies.getId(), "被回退");
                    oaActOfficeSupplies.setState(1);
                    return updateByPrimaryKeySelective(oaActOfficeSupplies);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActOfficeSupplies.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActOfficeSupplies);

                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActOfficeSupplies);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActOfficeSupplies);
                }
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActOfficeSupplies oaActOfficeSupplies
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActOfficeSupplies oaActOfficeSupplies) {
        if (oaActOfficeSuppliesService.updateByPrimaryKeySelective(oaActOfficeSupplies) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActOfficeSupplies oaActOfficeSupplies
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(@RequestBody OaActOfficeSupplies oaActOfficeSupplies) {
        String randomId = RandomUtil.randomId();
        if (oaActOfficeSuppliesService.insert(oaActOfficeSupplies, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActOfficeSupplies oaActOfficeSupplies = oaActOfficeSuppliesService.selectByPrimaryKey(id);
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
        model.addAttribute("oaActOfficeSupplies", oaActOfficeSupplies);
        return "oa/act/act_office_supplies_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActOfficeSupplies oaActOfficeSupplies
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(@RequestBody OaActOfficeSupplies oaActOfficeSupplies) {
        if (oaActOfficeSuppliesService.edit(oaActOfficeSupplies) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActOfficeSupplies oaActOfficeSupplies
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(@RequestBody OaActOfficeSupplies oaActOfficeSupplies) {
        //更新数据
        UserInfo userInfo = userInfoService.getUserInfoByPermission("office_supplies_review");
        Map<String, Object> map = new HashMap<>(16);
        map.put("review", userInfo.getId());
        String instance = activitiUtil.startProcessInstanceByKey("oa_office_supplies", "oa_act_office_supplies:" + oaActOfficeSupplies.getId(), map, getCurrentUser().getId().toString());
        if (instance != null) {
            //发送成功后更新状态
            oaActOfficeSuppliesService.edit(oaActOfficeSupplies);
            oaCollaborationService.updateStatusCode(oaActOfficeSupplies.getId(), "协同");
            oaCollaborationService.updateStateByCorrelationId(oaActOfficeSupplies.getId(), 0, oaActOfficeSupplies.getTitle());
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
    public String sealsBorrowDetails(String id, String taskId, Model model) {
        OaActOfficeSupplies oaActOfficeSupplies = oaActOfficeSuppliesService.selectByPrimaryKey(id);
        model.addAttribute("oaActOfficeSupplies", oaActOfficeSupplies);
        if (oaActOfficeSupplies.getDepartmentPrincipal() == null || "".equals(oaActOfficeSupplies.getDepartmentPrincipal())){
            return "oa/act/act_office_supplies_details";
        }else{
            if (oaActOfficeSupplies.getDepartmentPrincipal().contains(",")){
                return "oa/act/act_office_supplies_details2";
            }else{
                return "oa/act/act_office_supplies_details";
            }
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
        OaActOfficeSupplies oaActOfficeSupplies = oaActOfficeSuppliesService.selectByPrimaryKey(id);

        String principal;
        String principalT = null;
        String departmentId = userInfoService.selectDepartmentByUserId(oaActOfficeSupplies.getPromoter());
        if ("single".equals(oaActOfficeSupplies.getDepartmentPrincipal())){
            String principalId = departmentService.selectEnforcerId("principal", departmentId);
            principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        }else if (oaActOfficeSupplies.getDepartmentPrincipal().contains(",")){
            String[] split = oaActOfficeSupplies.getDepartmentPrincipal().split(",");
            principal = userInfoService.getNicknameById(Integer.valueOf(split[0]));
            principalT = userInfoService.getNicknameById(Integer.valueOf(split[1]));
        }else{
            principal = userInfoService.getNicknameById(Integer.valueOf(oaActOfficeSupplies.getDepartmentPrincipal()));
        }

        String review = userInfoService.getUserInfoByPermission("office_supplies_review").getNickname();
        String officeSuppliesSupervisor = userInfoService.getUserInfoByPermission("office_supplies_supervisor").getNickname();

        map.put("principal", principal);
        map.put("principalT", principalT);
        map.put("supervisor", officeSuppliesSupervisor);
        map.put("review", review);
        map.put("officeSupplies", oaActOfficeSupplies);
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
            oaActOfficeSuppliesService.deleteData(id);
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
