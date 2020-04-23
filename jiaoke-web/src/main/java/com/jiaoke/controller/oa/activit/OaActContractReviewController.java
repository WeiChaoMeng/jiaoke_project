package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActContractReview;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActContractReviewService;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 合同评审表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:15
 */
@Controller
@RequestMapping("/contractReview")
public class OaActContractReviewController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActContractReviewService oaActContractReviewService;

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
     * 合同审查表
     *
     * @return jsp
     */
    @RequestMapping("/toIndex")
    public String toReview(Model model) {
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_contract_review";
    }

    /**
     * 新增
     *
     * @param oaActContractReview oaActContractReview
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActContractReview oaActContractReview) {
        String randomId = RandomUtil.randomId();
        if (oaActContractReviewService.insert(oaActContractReview, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            //获取拥有权限的用户
            UserInfo userInfo = userInfoService.getUserInfoByPermission("HTPS_material");
            //开启流程
            Map<String, Object> map = new HashMap<>(16);
            map.put("material", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_contract_review", "oa_act_contract_review:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActContractReview oaActContractReview = oaActContractReviewService.selectByPrimaryKey(id);
        model.addAttribute("oaActContractReview", oaActContractReview);
        model.addAttribute("oaActContractReviewJson", JsonHelper.toJSONString(oaActContractReview));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_contract_review_handle";
    }

    /**
     * 提交
     *
     * @param oaActContractReview oaActContractReview
     * @param taskId              任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActContractReview oaActContractReview, String taskId, Integer flag) {
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //网关-物资
        String materialEG = "materialEG";
        //网关-财务
        String financeEG = "financeEG";
        //网关-质量
        String qualityEG = "qualityEG";
        //网关-经营
        String operatingEG = "operatingEG";
        //网关-法务
        String legalAffairsEG = "legalAffairsEG";
        //网关-总经理
        String companyPrincipalEG = "companyPrincipalEG";
        
        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        }else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            if (materialEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("HTPS_finance");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("finance", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActContractReview);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActContractReview.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActContractReview.getId(), "被回退");
                    oaActContractReview.setState(1);
                    return updateByPrimaryKeySelective(oaActContractReview);
                }

                //回退结束
            }else if (financeEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("HTPS_quality");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("quality", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActContractReview);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActContractReview.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActContractReview.getId(), "被回退");
                    oaActContractReview.setState(1);
                    return updateByPrimaryKeySelective(oaActContractReview);
                }

                //回退结束
            }else if (qualityEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("HTPS_operating");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("operating", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActContractReview);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActContractReview.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActContractReview.getId(), "被回退");
                    oaActContractReview.setState(1);
                    return updateByPrimaryKeySelective(oaActContractReview);
                }

                //回退结束
            }else if (operatingEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("legal_affairs");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("legal_affairs", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActContractReview);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActContractReview.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActContractReview.getId(), "被回退");
                    oaActContractReview.setState(1);
                    return updateByPrimaryKeySelective(oaActContractReview);
                }

                //回退结束
            }else if (legalAffairsEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("company_principal", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActContractReview);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActContractReview.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActContractReview.getId(), "被回退");
                    oaActContractReview.setState(1);
                    return updateByPrimaryKeySelective(oaActContractReview);
                }

                //回退结束
            }else if (companyPrincipalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("promoter", oaActContractReview.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActContractReview);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActContractReview.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActContractReview.getId(), "被回退");
                    oaActContractReview.setState(1);
                    return updateByPrimaryKeySelective(oaActContractReview);
                }

                //回退结束
            }else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActContractReview.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActContractReview);

                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActContractReview);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActContractReview);
                }
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActContractReview oaActContractReview
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActContractReview oaActContractReview) {
        if (oaActContractReviewService.updateByPrimaryKeySelective(oaActContractReview) < 1) {
            return "error";
        } else {
            return "success";
        }
    }
    
    /**
     * 保存待发
     *
     * @param oaActContractReview oaActContractReview
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActContractReview oaActContractReview) {
        String randomId = RandomUtil.randomId();
        if (oaActContractReviewService.insert(oaActContractReview, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActContractReview oaActContractReview = oaActContractReviewService.selectByPrimaryKey(id);
        model.addAttribute("oaActContractReview", oaActContractReview);
        return "oa/act/act_contract_review_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActContractReview oaActContractReview
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActContractReview oaActContractReview) {
        if (oaActContractReviewService.edit(oaActContractReview) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActContractReview oaActContractReview
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActContractReview oaActContractReview) {
        //更新数据
        if (oaActContractReviewService.edit(oaActContractReview) < 0) {
            return "error";
        } else {
            //获取拥有权限的用户
            UserInfo userInfo = userInfoService.getUserInfoByPermission("material_principal");
            //开启流程
            Map<String, Object> map = new HashMap<>(16);
            map.put("material", userInfo.getId());
            String instance = activitiUtil.startProcessInstanceByKey("oa_contract_review", "oa_act_contract_review:" + oaActContractReview.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStatusCode(oaActContractReview.getId(), "协同");
                oaCollaborationService.updateStateByCorrelationId(oaActContractReview.getId(), 0, oaActContractReview.getTitle());
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
    public String details(String id, String taskId, Model model) {
        OaActContractReview oaActContractReview = oaActContractReviewService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActContractReview", oaActContractReview);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_contract_review_details";
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
            oaActContractReviewService.deleteData(id);
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
