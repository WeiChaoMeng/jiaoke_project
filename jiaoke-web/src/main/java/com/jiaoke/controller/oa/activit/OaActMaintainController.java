package com.jiaoke.controller.oa.activit;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActMaintain;
import com.jiaoke.oa.bean.OaActReview;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActMaintainService;
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
     * 设备维修申请单
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toMaintain(Model model) {
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
            Map<String, Object> map = new HashMap<>(16);
            List<Object> principalList = new ArrayList<>();

            String principal = oaActMaintain.getDepartmentPrincipal();
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
        //查询部门负责人nickname
        if (oaActMaintain.getDepartmentPrincipal().contains(",")) {
            String principalNum = "";
            String[] strings = oaActMaintain.getDepartmentPrincipal().split(",");
            for (String s : strings) {
                principalNum += " ";
                principalNum += userInfoService.getNicknameById(Integer.valueOf(s));
            }
            model.addAttribute("principalNum", JsonHelper.toJSONString(principalNum));
        } else {
            model.addAttribute("principalNum", JsonHelper.toJSONString("noPrincipalNum"));
        }
        model.addAttribute("oaActMaintain", oaActMaintain);
        model.addAttribute("oaActMaintainJson", JsonHelper.toJSONString(oaActMaintain));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_maintain_handle";
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
        OaActMaintain oaActMaintain = oaActMaintainService.selectByPrimaryKey(id);

        String nickname = getCurrentUser().getNickname();

        String principal;
        String principalT = null;
        String departmentId = userInfoService.selectDepartmentByUserId(oaActMaintain.getPromoter());
        if ("single".equals(oaActMaintain.getDepartmentPrincipal())){
            String principalId = departmentService.selectEnforcerId("principal", departmentId);
            principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        }else if (oaActMaintain.getDepartmentPrincipal().contains(",")){
            String[] split = oaActMaintain.getDepartmentPrincipal().split(",");
            principal = userInfoService.getNicknameById(Integer.valueOf(split[0]));
            principalT = userInfoService.getNicknameById(Integer.valueOf(split[1]));
        }else{
            principal = userInfoService.getNicknameById(Integer.valueOf(oaActMaintain.getDepartmentPrincipal()));
        }

        //部门主管领导
        String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
        String supervisor = userInfoService.getNicknameById(Integer.valueOf(supervisorId));
        //主要领导（总经理）
        String companyPrincipal = userInfoService.getUserInfoByPermission("company_principal").getNickname();

        map.put("nickname", nickname);
        map.put("principal", principal);
        map.put("principalT", principalT);
        map.put("supervisor", supervisor);
        map.put("companyPrincipal", companyPrincipal);
        map.put("taskId", taskId);
        map.put("maintain", oaActMaintain);
        return JSON.toJSONString(map);
    }

    /**
     * 提交
     *
     * @param oaActMaintain oaActMaintain
     * @param taskId        任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActMaintain oaActMaintain, String taskId, Integer flag) {
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //网关-部门负责人
        String principalEG = "principalEG";
        //网关-部门主管领导
        String supervisorEG = "supervisorEG";
        //网关-总经理
        String companyEG = "companyEG";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        }else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //网关
            if (principalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    //根据发起者id获取所属部门id
                    String departmentId = userInfoService.selectDepartmentByUserId(oaActMaintain.getPromoter());
                    //选择执行者Id
                    String enforcerId = departmentService.selectEnforcerId("supervisor", departmentId);

                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("supervisor", enforcerId);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActMaintain);
                } else {

                    if (oaActMaintain.getDepartmentPrincipal().contains(",")){

                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("promoter", oaActMaintain.getPromoter());
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaCollaborationService.updateStatusCode(oaActMaintain.getId(), "被回退");
                        oaActMaintain.setPrincipal(null);
                        oaActMaintain.setPrincipalDate(null);
                        oaActMaintain.setState(1);
                        return updateByPrimaryKeySelective(oaActMaintain);

                    }else {
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("promoter", oaActMaintain.getPromoter());
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActMaintain.getId(), "被回退");
                        oaActMaintain.setPrincipal(null);
                        oaActMaintain.setPrincipalDate(null);
                        oaActMaintain.setState(1);
                        return updateByPrimaryKeySelective(oaActMaintain);
                    }
                }
            } else if (supervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("company_principal",userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActMaintain);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActMaintain.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActMaintain.getId(), "被回退");
                    oaActMaintain.setSupervisor(null);
                    oaActMaintain.setSupervisorDate(null);
                    oaActMaintain.setState(1);
                    return updateByPrimaryKeySelective(oaActMaintain);
                }

            }else if (companyEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("maintainNotify");
                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> leaveNotifyList = new ArrayList<>();
                    leaveNotifyList.add(userInfo.getId());
                    leaveNotifyList.add(oaActMaintain.getPromoter());
                    map.put("whether", 0);
                    map.put("maintainNotifyList", leaveNotifyList);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActMaintain);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActMaintain.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActMaintain.getId(), "被回退");
                    oaActMaintain.setCompanyPrincipal(null);
                    oaActMaintain.setCompanyPrincipalDate(null);
                    oaActMaintain.setState(1);
                    return updateByPrimaryKeySelective(oaActMaintain);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActMaintain.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActMaintain);
                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActMaintain);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActMaintain);
                }
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActMaintain oaActMaintain
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActMaintain oaActMaintain) {
        if (oaActMaintainService.updateByPrimaryKeySelective(oaActMaintain) < 1) {
            return "error";
        } else {
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
        if (oaActMaintainService.insert(oaActMaintain, getCurrentUser().getId(), randomId, 1) < 1) {
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
        Map<String, Object> map = new HashMap<>(16);
        List<Object> principalList = new ArrayList<>();

        String principal = oaActMaintain.getDepartmentPrincipal();
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
        String instance = activitiUtil.startProcessInstanceByKey("oa_maintain", "oa_act_maintain:" + oaActMaintain.getId(), map, getCurrentUser().getId().toString());
        if (instance != null) {
            //发送成功后更新状态
            oaActMaintainService.edit(oaActMaintain);
            oaCollaborationService.updateStatusCode(oaActMaintain.getId(), "协同");
            oaCollaborationService.updateStateByCorrelationId(oaActMaintain.getId(), 0, oaActMaintain.getTitle());
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
    public String details(String id, String taskId, Model model) {
        OaActMaintain oaActMaintain = oaActMaintainService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActMaintain", oaActMaintain);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_maintain_details";
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
        OaActMaintain oaActMaintain = oaActMaintainService.selectByPrimaryKey(id);

        String principal;
        String principalT = null;
        String departmentId = userInfoService.selectDepartmentByUserId(oaActMaintain.getPromoter());
        if ("single".equals(oaActMaintain.getDepartmentPrincipal())){
            String principalId = departmentService.selectEnforcerId("principal", departmentId);
            principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        }else if (oaActMaintain.getDepartmentPrincipal().contains(",")){
            String[] split = oaActMaintain.getDepartmentPrincipal().split(",");
            principal = userInfoService.getNicknameById(Integer.valueOf(split[0]));
            principalT = userInfoService.getNicknameById(Integer.valueOf(split[1]));
        }else{
            principal = userInfoService.getNicknameById(Integer.valueOf(oaActMaintain.getDepartmentPrincipal()));
        }

        //部门主管领导
        String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
        String supervisor = userInfoService.getNicknameById(Integer.valueOf(supervisorId));
        //主要领导（总经理）
        String companyPrincipal = userInfoService.getUserInfoByPermission("company_principal").getNickname();

        map.put("principal", principal);
        map.put("principalT", principalT);
        map.put("supervisor", supervisor);
        map.put("companyPrincipal", companyPrincipal);
        map.put("maintain", oaActMaintain);
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
