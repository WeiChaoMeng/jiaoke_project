package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActUnitPrice;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.OaActUnitPriceService;
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
 * 单价审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/unitPrice")
public class OaActUnitPriceController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActUnitPriceService oaActUnitPriceService;

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
     * 跳转新增页面
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toMeals(Model model) {
        model.addAttribute("nickname", getCurrentUser().getNickname());
        model.addAttribute("department", getCurrentUser().getDepartment());
        return "oa/act/act_unit_price";
    }

    /**
     * 提交新增
     *
     * @param oaActUnitPrice oaActUnitPrice
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(@RequestBody OaActUnitPrice oaActUnitPrice) {
        String randomId = RandomUtil.randomId();
        if (oaActUnitPriceService.insert(oaActUnitPrice, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            //获取拥有权限的用户
            UserInfo userInfo = userInfoService.getUserInfoByPermission("operating_principal");
            //开启流程
            Map<String, Object> map = new HashMap<>(16);
            map.put("operating_principal", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_unit_price", "oa_act_unit_price:" + randomId, map, getCurrentUser().getId().toString());
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
        //审批
        OaActUnitPrice oaActUnitPrice = oaActUnitPriceService.selectByPrimaryKey(id);
        model.addAttribute("oaActUnitPrice", oaActUnitPrice);
        model.addAttribute("oaActUnitPriceJson", JsonHelper.toJSONString(oaActUnitPrice));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_unit_price_handle";
    }

    /**
     * 提交审批
     *
     * @param oaActUnitPrice oaActUnitPrice
     * @param taskId            任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActUnitPrice oaActUnitPrice, String taskId, Integer flag) {
        //流程终点名称
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //经营主管审核
        String supervisor = "supervisor";
        //总经理
        String company = "company";

        //经营负责人网关
        String operatingPrincipalEG = "operatingPrincipalEG";
        //经营主管网关
        String operatingSupervisorEG = "operatingSupervisorEG";
        //总经理网关
        String companyPrincipalEG = "companyPrincipalEG";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        }else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            if (operatingPrincipalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("operating_supervisor");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("operating_supervisor", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActUnitPrice);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActUnitPrice.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActUnitPrice.getId(), "被回退");
                    oaActUnitPrice.setBusinessPrincipal(null);
                    oaActUnitPrice.setBusinessPrincipalDate(null);
                    oaActUnitPrice.setState(1);
                    return updateByPrimaryKeySelective(oaActUnitPrice);
                }

                //回退结束
            }if (operatingSupervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("company_principal", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActUnitPrice);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActUnitPrice.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActUnitPrice.getId(), "被回退");
                    oaActUnitPrice.setBusinessSupervisor(null);
                    oaActUnitPrice.setBusinessSupervisorDate(null);
                    oaActUnitPrice.setState(1);
                    return updateByPrimaryKeySelective(oaActUnitPrice);
                }

                //回退结束
            }if (companyPrincipalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("promoter", oaActUnitPrice.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActUnitPrice);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActUnitPrice.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActUnitPrice.getId(), "被回退");
                    oaActUnitPrice.setCompanyPrincipal(null);
                    oaActUnitPrice.setCompanyPrincipalDate(null);
                    oaActUnitPrice.setState(1);
                    return updateByPrimaryKeySelective(oaActUnitPrice);
                }

                //回退结束
            }else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActUnitPrice.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActUnitPrice);

                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActUnitPrice);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActUnitPrice);
                }
            }
        }

//        if (flag == 1) {
//            //同意
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
//                        return "success";
//
//                        //经营主管领导
//                    } else if (supervisor.equals(enforcer)) {
//                        UserInfo userInfo = userInfoService.getUserInfoByPermission("operating_supervisor");
//                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
//                        return "success";
//
//                        //总经理
//                    } else if (company.equals(enforcer)) {
//                        UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
//                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
//                        return "success";
//
//                    } else {
//                        UserInfo userInfo = userInfoService.getUserInfoByPermission(enforcer);
//                        activitiUtil.completeAndAppoint(task.getProcessInstanceId(), processingOpinion, taskId, getCurrentUser().getNickname(), enforcer, userInfo.getId());
//                        return "success";
//                    }
//                } else {
//                    return "error";
//                }
//            }
//        } else {
//            //驳回
//            managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
//            //修改表单状态
//            oaCollaborationService.updateState(oaActUnitPrice.getId(), 3);
//            return "success";
//        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActUnitPrice oaActUnitPrice
     * @return int
     */
    public String updateByPrimaryKeySelective( OaActUnitPrice oaActUnitPrice) {
        if (oaActUnitPriceService.updateByPrimaryKeySelective(oaActUnitPrice) < 1) {
            return "error";
        } else {
            return "success";
        }
    }
    
    /**
     * 保存待发
     *
     * @param oaActUnitPrice oaActUnitPrice
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(@RequestBody OaActUnitPrice oaActUnitPrice) {
        String randomId = RandomUtil.randomId();
        if (oaActUnitPriceService.insert(oaActUnitPrice, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActUnitPrice oaActUnitPrice = oaActUnitPriceService.selectByPrimaryKey(id);
        model.addAttribute("oaActUnitPrice", oaActUnitPrice);
        return "oa/act/act_unit_price_edit";
    }

    /**
     * 编辑后保存
     *
     * @param oaActUnitPrice oaActUnitPrice
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(@RequestBody OaActUnitPrice oaActUnitPrice) {
        if (oaActUnitPriceService.edit(oaActUnitPrice) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActUnitPrice oaActUnitPrice
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(@RequestBody OaActUnitPrice oaActUnitPrice) {
        //更新数据
        if (oaActUnitPriceService.edit(oaActUnitPrice) < 0) {
            return "error";
        } else {
            //获取拥有权限的用户
            UserInfo userInfo = userInfoService.getUserInfoByPermission("operating_principal");
            Map<String, Object> map = new HashMap<>(16);
            map.put("operating_principal", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_unit_price", "oa_act_unit_price:" + oaActUnitPrice.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStatusCode(oaActUnitPrice.getId(), "协同");
                oaCollaborationService.updateStateByCorrelationId(oaActUnitPrice.getId(), 0, oaActUnitPrice.getTitle());
                return "success";
            } else {
                return "error";
            }
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
        OaActUnitPrice oaActUnitPrice = oaActUnitPriceService.selectByPrimaryKey(id);
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActUnitPrice", oaActUnitPrice);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_unit_price_details";
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
            oaActUnitPriceService.deleteData(id);
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
