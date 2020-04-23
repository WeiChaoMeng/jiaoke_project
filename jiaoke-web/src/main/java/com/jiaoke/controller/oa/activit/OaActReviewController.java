package com.jiaoke.controller.oa.activit;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActReview;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActReviewService;
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
 * 合同审查表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:15
 */
@Controller
@RequestMapping("/review")
public class OaActReviewController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActReviewService oaActReviewService;

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
        return "oa/act/act_review";
    }

    /**
     * 新增
     *
     * @param oaActReview oaActReview
     * @return s/e
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaActReview oaActReview) {
        String randomId = RandomUtil.randomId();
        if (oaActReviewService.insert(oaActReview, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            Map<String, Object> map = new HashMap<>(16);
            List<Object> principalList = new ArrayList<>();

            String principal = oaActReview.getDepartmentPrincipal();
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
            String instance = activitiUtil.startProcessInstanceByKey("oa_review", "oa_act_review:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActReview oaActReview = oaActReviewService.selectByPrimaryKey(id);
        //查询部门负责人nickname
        if (oaActReview.getDepartmentPrincipal().contains(",")) {
            String principalNum = "";
            String[] strings = oaActReview.getDepartmentPrincipal().split(",");
            for (String s : strings) {
                principalNum += " ";
                principalNum += userInfoService.getNicknameById(Integer.valueOf(s));
            }
            model.addAttribute("principalNum", JsonHelper.toJSONString(principalNum));
        } else {
            model.addAttribute("principalNum", JsonHelper.toJSONString("noPrincipalNum"));
        }
        model.addAttribute("oaActReview", oaActReview);
        model.addAttribute("oaActReviewJson", JsonHelper.toJSONString(oaActReview));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_review_handle";
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
        OaActReview oaActReview = oaActReviewService.selectByPrimaryKey(id);

        String nickname = getCurrentUser().getNickname();
        //根据发起者id获取所属部门id
        String departmentId = userInfoService.selectDepartmentByUserId(oaActReview.getPromoter());
        //部门负责人
        String principalId = departmentService.selectEnforcerId("principal", departmentId);
        String principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        //部门主管领导
        String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
        String supervisor = userInfoService.getNicknameById(Integer.valueOf(supervisorId));
        //法务
        String legalAffairs = userInfoService.getUserInfoByPermission("legal_affairs").getNickname();
        //财务部门
        String finance = userInfoService.getUserInfoByPermission("finance").getNickname();
        //主要领导（总经理）
        String companyPrincipal = userInfoService.getUserInfoByPermission("company_principal").getNickname();

        map.put("nickname", nickname);
        map.put("principal", principal);
        map.put("supervisor", supervisor);
        map.put("legalAffairs", legalAffairs);
        map.put("finance", finance);
        map.put("companyPrincipal", companyPrincipal);
        map.put("taskId", taskId);
        map.put("review", oaActReview);
        return JSON.toJSONString(map);
    }

    /**
     * 提交
     *
     * @param oaActReview oaActReview
     * @param taskId      任务Id
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActReview oaActReview, String taskId, Integer flag) {
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //网关-部门负责人
        String principalEG = "principalEG";
        //法务-网关
        String legalAffairsEG = "legalAffairsEG";
        //财务网关
        String financeEG = "financeEG";
        //主管领导-网关
        String supervisorEG = "supervisorEG";
        //网关-总经理网关
        String companyPrincipalEG = "companyPrincipalEG";
       

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
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("legal_affairs");
                    map.put("whether", 0);
                    map.put("legal_affairs", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActReview);
                } else {

                    if (oaActReview.getDepartmentPrincipal().contains(",")) {

                        Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                        List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                        for (Task tasks : taskList) {
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 1);
                            map.put("promoter", oaActReview.getPromoter());
                            activitiUtil.approvalComplete(tasks.getId(), map);
                        }
                        oaCollaborationService.updateStatusCode(oaActReview.getId(), "被回退");
                        oaActReview.setPrincipal(null);
                        oaActReview.setPrincipalDate(null);
                        oaActReview.setState(1);
                        return updateByPrimaryKeySelective(oaActReview);

                    } else {
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("promoter", oaActReview.getPromoter());
                        activitiUtil.approvalComplete(taskId, map);
                        oaCollaborationService.updateStatusCode(oaActReview.getId(), "被回退");
                        oaActReview.setPrincipal(null);
                        oaActReview.setPrincipalDate(null);
                        oaActReview.setState(1);
                        return updateByPrimaryKeySelective(oaActReview);
                    }
                }
            } else if (legalAffairsEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("finance");
                    map.put("whether", 0);
                    map.put("finance", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActReview);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActReview.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActReview.getId(), "被回退");
                    oaActReview.setState(1);
                    return updateByPrimaryKeySelective(oaActReview);
                }

            }  else if (financeEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    String departmentId = userInfoService.selectDepartmentByUserId(oaActReview.getPromoter());
                    String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
                    map.put("whether", 0);
                    map.put("supervisor", supervisorId);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActReview);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActReview.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActReview.getId(), "被回退");
                    oaActReview.setState(1);
                    return updateByPrimaryKeySelective(oaActReview);
                }

            } else if (supervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                    map.put("whether", 0);
                    map.put("company_principal", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActReview);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActReview.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActReview.getId(), "被回退");
                    oaActReview.setState(1);
                    return updateByPrimaryKeySelective(oaActReview);
                }

            } else if (companyPrincipalEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("promoter", oaActReview.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActReview);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActReview.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActReview.getId(), "被回退");
                    oaActReview.setState(1);
                    return updateByPrimaryKeySelective(oaActReview);
                }

                //回退结束
            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActReview.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActReview);
                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActReview);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActReview);
                }
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActReview oaActReview
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActReview oaActReview) {
        if (oaActReviewService.updateByPrimaryKeySelective(oaActReview) < 1) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 保存待发
     *
     * @param oaActReview oaActReview
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActReview oaActReview) {
        String randomId = RandomUtil.randomId();
        if (oaActReviewService.insert(oaActReview, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActReview oaActReview = oaActReviewService.selectByPrimaryKey(id);
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
        model.addAttribute("oaActReview", oaActReview);
        return "oa/act/act_review_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActReview oaActReview
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActReview oaActReview) {
        if (oaActReviewService.edit(oaActReview) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActReview oaActReview
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActReview oaActReview) {
        Map<String, Object> map = new HashMap<>(16);
        List<Object> principalList = new ArrayList<>();

        String principal = oaActReview.getDepartmentPrincipal();
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
        String instance = activitiUtil.startProcessInstanceByKey("oa_review", "oa_act_review:" + oaActReview.getId(), map, getCurrentUser().getId().toString());
        if (instance != null) {
            //发送成功后更新状态
            oaActReviewService.edit(oaActReview);
            oaCollaborationService.updateStatusCode(oaActReview.getId(), "协同");
            oaCollaborationService.updateStateByCorrelationId(oaActReview.getId(), 0, oaActReview.getTitle());
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
        OaActReview oaActReview = oaActReviewService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActReview", oaActReview);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_review_details";
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
        OaActReview oaActReview = oaActReviewService.selectByPrimaryKey(id);

        String nickname = getCurrentUser().getNickname();
        //根据发起者id获取所属部门id
        String departmentId = userInfoService.selectDepartmentByUserId(oaActReview.getPromoter());
        //部门负责人
        String principalId = departmentService.selectEnforcerId("principal", departmentId);
        String principal = userInfoService.getNicknameById(Integer.valueOf(principalId));
        //部门主管领导
        String supervisorId = departmentService.selectEnforcerId("supervisor", departmentId);
        String supervisor = userInfoService.getNicknameById(Integer.valueOf(supervisorId));
        //法务
        String legalAffairs = userInfoService.getUserInfoByPermission("legal_affairs").getNickname();
        //财务部门
        String finance = userInfoService.getUserInfoByPermission("finance").getNickname();
        //主要领导（总经理）
        String companyPrincipal = userInfoService.getUserInfoByPermission("company_principal").getNickname();

        map.put("nickname", nickname);
        map.put("principal", principal);
        map.put("supervisor", supervisor);
        map.put("legalAffairs", legalAffairs);
        map.put("finance", finance);
        map.put("companyPrincipal", companyPrincipal);
        map.put("review", oaActReview);
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
            oaActReviewService.deleteData(id);
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
     * 跳转合同管理首页
     *
     * @param model model
     * @param page  page
     * @return jsp
     */
    @RequestMapping(value = "/toContractManagement")
    public String toContractManagement(Model model, int page) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/collaboration/oa_contract_management";
    }

    /**
     * 加载合同数据
     *
     * @param page page
     * @return list
     */
    @RequestMapping(value = "/contractManagement")
    @ResponseBody
    public String userManager(int page) {
        List<String> idList = activitiUtil.selectCompletedForm("oa_act_review");
        if (idList.size() == 0) {
            return JsonHelper.toJSONString("noData");
        }
        PageHelper.startPage(page, 15);
        List<OaActReview> oaActReviewList = oaActReviewService.selectAllByIdList(idList);
        PageInfo<OaActReview> pageInfo = new PageInfo<>(oaActReviewList);
        return JsonHelper.toJSONString(pageInfo);
    }
}
