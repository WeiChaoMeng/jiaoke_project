package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.service.OaActAcceptanceWarehousingService;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 验收入库单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:29
 */
@Controller
@RequestMapping("/acceptanceWarehousing")
public class OaActAcceptanceWarehousingController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActAcceptanceWarehousingService oaActAcceptanceWarehousingService;

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
     * 审批单主页面
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toSealsBorrow(Model model) {
        model.addAttribute("nickname", getCurrentUser().getNickname());
        model.addAttribute("department", getCurrentUser().getDepartment());
        return "oa/act/act_acceptance_warehousing";
    }

    /**
     * 新增
     *
     * @param oaActAcceptanceWarehousing oaActAcceptanceWarehousing
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(@RequestBody OaActAcceptanceWarehousing oaActAcceptanceWarehousing) {
        String randomId = RandomUtil.randomId();
        if (oaActAcceptanceWarehousingService.insert(oaActAcceptanceWarehousing, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            UserInfo userInfo = userInfoService.getUserInfoByPermission("acceptanceWarehousingAcceptor");
            Map<String, Object> map = new HashMap<>(16);
            map.put("acceptor", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_acceptance_warehousing", "oa_act_acceptance_warehousing:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActAcceptanceWarehousing oaActAcceptanceWarehousing = oaActAcceptanceWarehousingService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());
        model.addAttribute("oaActAcceptanceWarehousing", oaActAcceptanceWarehousing);
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_acceptance_warehousing_handle";
    }

    /**
     * 提交
     *
     * @param oaActAcceptanceWarehousing oaActAcceptanceWarehousing
     * @param taskId                     任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActAcceptanceWarehousing oaActAcceptanceWarehousing, String taskId, Integer flag) {
        //流程终点名称
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //验收人网关
        String acceptorEG = "acceptorEG";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        } else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //网关
            if (acceptorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("promoter", oaActAcceptanceWarehousing.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    //入库
                    if (oaActAcceptanceWarehousingService.enteringWarehouse(oaActAcceptanceWarehousing) < 1) {
                        return "error";
                    }
                    return "success";
//                    return updateByPrimaryKeySelective(oaActAcceptanceWarehousing);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActAcceptanceWarehousing.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActAcceptanceWarehousing.getId(), "被回退");
                    oaActAcceptanceWarehousing.setAcceptor(null);
                    oaActAcceptanceWarehousing.setAcceptorDate(null);
                    oaActAcceptanceWarehousing.setState(1);
                    return updateByPrimaryKeySelective(oaActAcceptanceWarehousing);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActAcceptanceWarehousing.getId(), 3);
                return "backSuccess";
            } else if (end.equals(nextNode)) {
                activitiUtil.endProcess(taskId);
                return "success";
            } else {
                activitiUtil.endProcess(taskId);
                return "success";
            }
        }

        //同意
//        if (flag == 1) {
//
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
//                        //入库
//                        if (oaActAcceptanceWarehousingService.enteringWarehouse(oaActAcceptanceWarehousing) < 1) {
//                            return "error";
//                        }
//                        return "success";
//
//                    } else {
//                        UserInfo userInfo = userInfoService.getUserInfoByPermission(enforcer);
//                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
//                        //更新数据
//                        if (oaActAcceptanceWarehousingService.updateByPrimaryKeySelective(oaActAcceptanceWarehousing) < 1) {
//                            return "error";
//                        }
//                        return "success";
//                    }
//                } else {
//                    return "error";
//                }
//            }
//        } else {
//            //更新数据
//            if (oaActAcceptanceWarehousingService.updateByPrimaryKeySelective(oaActAcceptanceWarehousing) < 1) {
//                return "error";
//            }
//            //驳回
//            managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
//            //修改表单状态
//            oaCollaborationService.updateState(oaActAcceptanceWarehousing.getId(), 3);
//            return "success";
//        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActAcceptanceWarehousing oaActAcceptanceWarehousing
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActAcceptanceWarehousing oaActAcceptanceWarehousing) {
        if (oaActAcceptanceWarehousingService.updateByPrimaryKeySelective(oaActAcceptanceWarehousing) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActAcceptanceWarehousing oaActAcceptanceWarehousing
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(@RequestBody OaActAcceptanceWarehousing oaActAcceptanceWarehousing) {
        String randomId = RandomUtil.randomId();
        if (oaActAcceptanceWarehousingService.insert(oaActAcceptanceWarehousing, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActAcceptanceWarehousing oaActAcceptanceWarehousing = oaActAcceptanceWarehousingService.selectByPrimaryKey(id);
        model.addAttribute("oaActAcceptanceWarehousing", oaActAcceptanceWarehousing);
        return "oa/act/act_acceptance_warehousing_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActAcceptanceWarehousing oaActAcceptanceWarehousing
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(@RequestBody OaActAcceptanceWarehousing oaActAcceptanceWarehousing) {
        if (oaActAcceptanceWarehousingService.edit(oaActAcceptanceWarehousing) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActAcceptanceWarehousing oaActAcceptanceWarehousing
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(@RequestBody OaActAcceptanceWarehousing oaActAcceptanceWarehousing) {
        //更新数据
        if (oaActAcceptanceWarehousingService.edit(oaActAcceptanceWarehousing) < 0) {
            return "error";
        } else {
            UserInfo userInfo = userInfoService.getUserInfoByPermission("acceptanceWarehousingAcceptor");
            Map<String, Object> map = new HashMap<>(16);
            map.put("acceptor", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_acceptance_warehousing", "oa_act_acceptance_warehousing:" + oaActAcceptanceWarehousing.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStatusCode(oaActAcceptanceWarehousing.getId(), "协同");
                oaCollaborationService.updateStateByCorrelationId(oaActAcceptanceWarehousing.getId(), 0, oaActAcceptanceWarehousing.getTitle());
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
        OaActAcceptanceWarehousing oaActAcceptanceWarehousing = oaActAcceptanceWarehousingService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActAcceptanceWarehousing", oaActAcceptanceWarehousing);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_acceptance_warehousing_details";
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
            oaActAcceptanceWarehousingService.deleteData(id);
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

    /**
     * 查询关联表信息（办公用品需求计划表）
     *
     * @return json
     */
    @RequestMapping(value = "/associationTableList")
    @ResponseBody
    public String associationTableList() {
        List<String> list = activitiUtil.selectCompletedForm("oa_act_office_supplies");
        List<OaActOfficeSupplies> oaActOfficeSuppliesList = oaActAcceptanceWarehousingService.selectMultipleData(list);
        return JsonHelper.toJSONString(oaActOfficeSuppliesList);
    }
}
