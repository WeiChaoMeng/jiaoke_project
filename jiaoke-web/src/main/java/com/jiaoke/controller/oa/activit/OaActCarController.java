package com.jiaoke.controller.oa.activit;

import com.alibaba.fastjson.JSON;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActCarService;
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
 * 用车审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-4 23:57
 */
@Controller
@RequestMapping("/car")
public class OaActCarController {

    @Resource
    private OaActCarService oaActCarService;

    @Resource
    private ActivitiUtil activitiUtil;

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
     * 跳转审批单
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toCarApply(Model model) {
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
        return "oa/act/act_car";
    }

    /**
     * 新增并启动流程
     *
     * @param oaActCar oaActCar
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActCar oaActCar) {
        String randomId = RandomUtil.randomId();
        if (oaActCarService.insert(oaActCar, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            Map<String, Object> map = new HashMap<>(16);
            List<Object> principalList = new ArrayList<>();

            String principal = oaActCar.getDepartmentPrincipal();
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
            String instance = activitiUtil.startProcessInstanceByKey("oa_car", "oa_act_car:" + randomId, map, getCurrentUser().getId().toString());
            if (instance != null) {
                return "success";
            }
            return "error";
        }
    }


    /**
     * 审批单处理页面
     *
     * @param id    id
     * @param model model
     * @return jsp
     */
    @RequestMapping(value = "/approval")
    public String approval(String id, String taskId, Model model) {
        OaActCar oaActCar = oaActCarService.selectByPrimaryKey(id);
        //查询部门负责人nickname
        if (oaActCar.getDepartmentPrincipal().contains(",")) {
            String principalNum = "";
            String[] strings = oaActCar.getDepartmentPrincipal().split(",");
            for (String s : strings) {
                principalNum += " ";
                principalNum += userInfoService.getNicknameById(Integer.valueOf(s));
            }
            model.addAttribute("principalNum", JsonHelper.toJSONString(principalNum));
        } else {
            model.addAttribute("principalNum", JsonHelper.toJSONString("noPrincipalNum"));
        }
        model.addAttribute("oaActCar", oaActCar);
        model.addAttribute("oaActCarJson", JsonHelper.toJSONString(oaActCar));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_car_handle";
    }

    @RequestMapping(value = "/approval.api")
    @ResponseBody
    public String approvalApi(String id, String taskId) {
        HashMap<String, Object> map = new HashMap<>(16);
        OaActCar oaActCar = oaActCarService.selectByPrimaryKey(id);

        String nickname = getCurrentUser().getNickname();

        String principal;
        String principalT = null;
        String departmentId = userInfoService.selectDepartmentByUserId(oaActCar.getPromoter());
        if ("single".equals(oaActCar.getDepartmentPrincipal())){
            String principalId = departmentService.selectEnforcerId("principal", departmentId);
            principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        }else if (oaActCar.getDepartmentPrincipal().contains(",")){
            String[] split = oaActCar.getDepartmentPrincipal().split(",");
            principal = userInfoService.getNicknameById(Integer.valueOf(split[0]));
            principalT = userInfoService.getNicknameById(Integer.valueOf(split[1]));
        }else{
            principal = userInfoService.getNicknameById(Integer.valueOf(oaActCar.getDepartmentPrincipal()));
        }

        String lookup = userInfoService.getUserInfoByPermission("lookup").getNickname();

        map.put("nickname", nickname);
        map.put("principal", principal);
        map.put("principalT", principalT);
        map.put("lookup", lookup);
        map.put("car", oaActCar);
        map.put("taskId", taskId);
        return JSON.toJSONString(map);
    }

    /**
     * 审批处理
     *
     * @param oaActCar oaActCar
     * @param flag     flag 1.同意，2.拒绝
     * @param taskId   任务Id
     * @return s/e
     */
    @RequestMapping(value = "/lookupApprovalSubmit")
    @ResponseBody
    public String lookupApprovalSubmit(OaActCar oaActCar, String taskId, Integer flag) {

        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //网关-部门负责人
        String principalEG = "principalEG";
        //网关-查表计数网关
        String lookupEG = "lookupEG";

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
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("lookup");
                    map.put("whether", 0);
                    map.put("lookup", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActCar);
                } else {

                    if (oaActCar.getDepartmentPrincipal().contains(",")) {

                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("promoter", oaActCar.getPromoter());
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaCollaborationService.updateStatusCode(oaActCar.getId(), "被回退");
                        oaActCar.setPrincipal(null);
                        oaActCar.setPrincipalDate(null);
                        oaActCar.setState(1);
                        return updateByPrimaryKeySelective(oaActCar);

                    } else {
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("promoter", oaActCar.getPromoter());
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActCar.getId(), "被回退");
                        oaActCar.setPrincipal(null);
                        oaActCar.setPrincipalDate(null);
                        oaActCar.setState(1);
                        return updateByPrimaryKeySelective(oaActCar);
                    }
                }
            } else if (lookupEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    ArrayList<Object> list = new ArrayList<>();
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("lookup");
                    list.add(userInfo.getId());
                    list.add(oaActCar.getPromoter());
                    map.put("whether", 0);
                    map.put("normalList", list);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActCar);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActCar.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActCar.getId(), "被回退");
                    oaActCar.setAfter(null);
                    oaActCar.setDrivingNumber(null);
                    oaActCar.setBilling(null);
                    oaActCar.setLookup(null);
                    oaActCar.setEndTime(null);
                    oaActCar.setState(1);
                    return updateByPrimaryKeySelective(oaActCar);
                }

            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActCar.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActCar);
                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActCar);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActCar);
                }
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActCar oaActCar
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActCar oaActCar) {
        if (oaActCarService.updateByPrimaryKeySelective(oaActCar) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActCar oaActCar
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActCar oaActCar) {
        String randomId = RandomUtil.randomId();
        if (oaActCarService.insert(oaActCar, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActCar oaActCar = oaActCarService.selectByPrimaryKey(id);
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
        model.addAttribute("oaActCar", oaActCar);
        return "oa/act/act_car_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActCar oaActCar
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActCar oaActCar) {
        if (oaActCarService.edit(oaActCar) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActCar oaActCar
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActCar oaActCar) {

        Map<String, Object> map = new HashMap<>(16);
        List<Object> principalList = new ArrayList<>();

        String principal = oaActCar.getDepartmentPrincipal();
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
        String instance = activitiUtil.startProcessInstanceByKey("oa_car", "oa_act_car:" + oaActCar.getId(), map, getCurrentUser().getId().toString());
        if (instance != null) {
            //发送成功后更新状态
            oaActCarService.edit(oaActCar);
            oaCollaborationService.updateStatusCode(oaActCar.getId(), "协同");
            oaCollaborationService.updateStateByCorrelationId(oaActCar.getId(), 0, oaActCar.getTitle());
            return "success";
        } else {
            return "error";
        }
    }

    /**
     * 详情
     *
     * @param id    id
     * @param model model
     * @return jsp
     */
    @RequestMapping(value = "/details")
    public String details(String id, String taskId, Model model) {
        OaActCar oaActCar = oaActCarService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActCar", oaActCar);
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("commentsListSize", commentsList.size());
        return "oa/act/act_car_details";
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
        OaActCar oaActCar = oaActCarService.selectByPrimaryKey(id);

        String principal;
        String principalT = null;
        String departmentId = userInfoService.selectDepartmentByUserId(oaActCar.getPromoter());
        if ("single".equals(oaActCar.getDepartmentPrincipal())){
            String principalId = departmentService.selectEnforcerId("principal", departmentId);
            principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        }else if (oaActCar.getDepartmentPrincipal().contains(",")){
            String[] split = oaActCar.getDepartmentPrincipal().split(",");
            principal = userInfoService.getNicknameById(Integer.valueOf(split[0]));
            principalT = userInfoService.getNicknameById(Integer.valueOf(split[1]));
        }else{
            principal = userInfoService.getNicknameById(Integer.valueOf(oaActCar.getDepartmentPrincipal()));
        }

        String lookup = userInfoService.getUserInfoByPermission("lookup").getNickname();

        map.put("principal", principal);
        map.put("principalT", principalT);
        map.put("lookup", lookup);
        map.put("car", oaActCar);
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
            oaActCarService.deleteData(id);
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
