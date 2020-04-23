package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActTaxiUse;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActTaxiUseService;
import com.jiaoke.oa.service.OaCollaborationService;
import com.jiaoke.oa.service.UserInfoService;
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
 * 用车审批表(出租车)
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/taxiUse")
public class OaActTaxiUseController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActTaxiUseService oaActTaxiUseService;

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
        return "oa/act/act_taxi_use";
    }

    /**
     * 提交新增
     *
     * @param oaActTaxiUse oaActLeave
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActTaxiUse oaActTaxiUse) {
        String randomId = RandomUtil.randomId();
        if (oaActTaxiUseService.insert(oaActTaxiUse, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            Map<String, Object> map = new HashMap<>(16);
            List<Object> principalList = new ArrayList<>();

            String principal = oaActTaxiUse.getDepartmentPrincipal();
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
            String instance = activitiUtil.startProcessInstanceByKey("oa_taxi_uses", "oa_act_taxi_use:" + randomId, map, getCurrentUser().getId().toString());
            if (instance != null) {
                return "success";
            }
            return "error";
        }
    }

    /**
     * 跳转审批页面
     *
     * @param id     id
     * @param taskId taskId
     * @param model  model
     * @return jsp
     */
    @RequestMapping(value = "/approval")
    public String approval(String id, String taskId, Model model) {
        OaActTaxiUse oaActTaxiUse = oaActTaxiUseService.selectByPrimaryKey(id);

        //查询部门负责人nickname
        if (oaActTaxiUse.getDepartmentPrincipal().contains(",")) {
            String principalNum = "";
            String[] strings = oaActTaxiUse.getDepartmentPrincipal().split(",");
            for (String s : strings) {
                principalNum += " ";
                principalNum += userInfoService.getNicknameById(Integer.valueOf(s));
            }
            model.addAttribute("principalNum", JsonHelper.toJSONString(principalNum));
        } else {
            model.addAttribute("principalNum", JsonHelper.toJSONString("noPrincipalNum"));
        }
        model.addAttribute("oaActTaxiUse", oaActTaxiUse);
        model.addAttribute("oaActTaxiUseJson", JsonHelper.toJSONString(oaActTaxiUse));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_taxi_use_handle";
    }

    /**
     * 提交审批
     *
     * @param oaActTaxiUse oaActTaxiUse
     * @param taskId       taskId
     * @param flag         flag
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActTaxiUse oaActTaxiUse, String taskId, Integer flag) {

        //网关-部门负责人
        String principalEG = "principalEG";
        //网关-部门主管领导
        String supervisorEG = "supervisorEG";
        //回退
        String back = "back";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        //没有该流程
        if (task == null) {
            return "error";
        } else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //网关
            if (principalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    //根据发起者id获取所属部门id
                    String departmentId = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
                    //选择执行者Id
                    String enforcerId = departmentService.selectEnforcerId("supervisor", departmentId);

                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("supervisor", enforcerId);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActTaxiUse);
                } else {

                    if (oaActTaxiUse.getDepartmentPrincipal().contains(",")){

                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("backNotify", activitiUtil.getStartUserId(task.getProcessInstanceId()));
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaCollaborationService.updateStatusCode(oaActTaxiUse.getId(), "被回退");
                        oaActTaxiUse.setPrincipal(null);
                        oaActTaxiUse.setPrincipalDate(null);
                        oaActTaxiUse.setState(1);
                        return updateByPrimaryKeySelective(oaActTaxiUse);

                    }else {
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("backNotify", activitiUtil.getStartUserId(task.getProcessInstanceId()));
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActTaxiUse.getId(), "被回退");
                        oaActTaxiUse.setPrincipal(null);
                        oaActTaxiUse.setPrincipalDate(null);
                        oaActTaxiUse.setState(1);
                        return updateByPrimaryKeySelective(oaActTaxiUse);
                    }


//                    Map<String, Object> map = new HashMap<>(16);
//                    map.put("whether", 1);
//                    map.put("backNotify", activitiUtil.getStartUserId(task.getProcessInstanceId()));
//                    activitiUtil.approvalComplete(taskId, map);
//                    oaCollaborationService.updateStatusCode(oaActTaxiUse.getId(), "被回退");
//                    oaActTaxiUse.setPrincipal(null);
//                    oaActTaxiUse.setPrincipalDate(null);
//                    oaActTaxiUse.setState(1);
//                    return updateByPrimaryKeySelective(oaActTaxiUse);
                }
            } else if (supervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("promoter", activitiUtil.getStartUserId(task.getProcessInstanceId()));
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActTaxiUse);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("backNotify", activitiUtil.getStartUserId(task.getProcessInstanceId()));
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActTaxiUse.getId(), "被回退");
                    oaActTaxiUse.setSupervisor(null);
                    oaActTaxiUse.setSupervisorDate(null);
                    oaActTaxiUse.setState(1);
                    return updateByPrimaryKeySelective(oaActTaxiUse);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActTaxiUse.getId(), 3);
                return "backSuccess";
            } else {
                //直接结束
                activitiUtil.endProcess(taskId);
                return updateByPrimaryKeySelective(oaActTaxiUse);
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActTaxiUse oaActTaxiUse
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActTaxiUse oaActTaxiUse) {
        if (oaActTaxiUseService.updateByPrimaryKeySelective(oaActTaxiUse) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActTaxiUse oaActTaxiUse
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActTaxiUse oaActTaxiUse) {
        String randomId = RandomUtil.randomId();
        if (oaActTaxiUseService.insert(oaActTaxiUse, getCurrentUser().getId(), randomId, 1) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 跳转编辑页面
     *
     * @param id    id
     * @param model model
     * @return jsp
     */
    @RequestMapping(value = "/toEdit")
    public String toEdit(String id, Model model) {

        OaActTaxiUse oaActTaxiUse = oaActTaxiUseService.selectByPrimaryKey(id);

        //查询部门负责人
        String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
        String principalIds = departmentService.selectEnforcerId("principal", department);
        List<String> list = new ArrayList<>();
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
        model.addAttribute("oaActTaxiUse", oaActTaxiUse);
        return "oa/act/act_taxi_use_edit";
    }

    /**
     * 编辑后保存
     *
     * @param oaActTaxiUse oaActTaxiUse
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActTaxiUse oaActTaxiUse) {
        if (oaActTaxiUseService.edit(oaActTaxiUse) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActTaxiUse oaActTaxiUse
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActTaxiUse oaActTaxiUse) {

        Map<String, Object> map = new HashMap<>(16);
        List<Object> principalList = new ArrayList<>();

        String principal = oaActTaxiUse.getDepartmentPrincipal();
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
        String instance = activitiUtil.startProcessInstanceByKey("oa_taxi_uses", "oa_act_taxi_use:" + oaActTaxiUse.getId(), map, getCurrentUser().getId().toString());
        if (instance != null) {
            //发送成功后更新状态
            oaActTaxiUseService.edit(oaActTaxiUse);
            oaCollaborationService.updateStatusCode(oaActTaxiUse.getId(), "协同");
            oaCollaborationService.updateStateByCorrelationId(oaActTaxiUse.getId(), 0, oaActTaxiUse.getTitle());
            return "success";
        } else {
            return "error";
        }
    }

    /**
     * 跳转详情页面
     *
     * @param id     id
     * @param taskId taskId
     * @param model  model
     * @return jsp
     */
    @RequestMapping(value = "/details")
    public String details(String id, String taskId, Model model) {
        OaActTaxiUse oaActTaxiUse = oaActTaxiUseService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActTaxiUse", oaActTaxiUse);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_taxi_use_details";
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
            oaActTaxiUseService.deleteData(id);
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
