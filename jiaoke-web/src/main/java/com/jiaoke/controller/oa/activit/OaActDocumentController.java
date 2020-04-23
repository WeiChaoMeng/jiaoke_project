package com.jiaoke.controller.oa.activit;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.controller.oa.ActivitiUtil;
import com.jiaoke.controller.oa.TargetFlowNodeCommand;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.Department;
import com.jiaoke.oa.bean.OaActDocument;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaActDocumentService;
import com.jiaoke.oa.service.OaCollaborationService;
import com.jiaoke.oa.service.UserInfoService;
import org.activiti.bpmn.model.UserTask;
import org.activiti.engine.ManagementService;
import org.activiti.engine.task.Task;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 公文
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 1:59
 */
@Controller
@RequestMapping("/document")
public class OaActDocumentController {

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private OaActDocumentService oaActDocumentService;

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
        //所有用户
        List<UserInfo> userInfoList = userInfoService.selectIdAndNicknameAndDepartment();
        List<Department> departmentList = departmentService.selectKeyAndName();
        model.addAttribute("nickname", getCurrentUser().getNickname());
        model.addAttribute("departmentName", getCurrentUser().getDepartment());
        model.addAttribute("userInfoList", JsonHelper.toJSONString(userInfoList));
        model.addAttribute("departmentListJson", JsonHelper.toJSONString(departmentList));
        model.addAttribute("departmentList", departmentList);
        return "oa/act/act_document";
    }

    /**
     * 获取部门成员
     *
     * @param departmentKey 部门id
     * @return 成员列表
     */
    @RequestMapping(value = "/departmentMember")
    @ResponseBody
    public String departmentMember(String departmentKey) {
        List<UserInfo> userInfoList = userInfoService.getUserByDepartmentKey(departmentKey);
        return JsonHelper.toJSONString(userInfoList);
    }

    /**
     * 发送公文
     *
     * @param oaActDocument oaActDocument
     * @return oa_release_document.jsp
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String add(OaActDocument oaActDocument) {
        String randomId = RandomUtil.randomId();
        if (oaActDocumentService.insert(oaActDocument, getCurrentUser().getId(), randomId, 0) < 1) {
            return "error";
        } else {
            //用户所在部门id
            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
            //部门负责人
            String supervisor = departmentService.selectEnforcerId("supervisor", department);
            Map<String, Object> map = new HashMap<>(16);
            map.put("supervisor", supervisor);
            String instance = activitiUtil.startProcessInstanceByKey("oa_document", "oa_act_document:" + randomId, map, getCurrentUser().getId().toString());
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
        OaActDocument oaActDocument = oaActDocumentService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(activitiUtil.getTaskByTaskId(taskId).getProcessInstanceId());
        model.addAttribute("oaActDocument", oaActDocument);
        model.addAttribute("oaActDocumentJson", JsonHelper.toJSONString(oaActDocument));
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("nickname", getCurrentUser().getNickname());
        return "oa/act/act_document_handle";
    }

    /**
     * 提交审批
     *
     * @param oaActDocument oaActDocument
     * @param taskId        taskId
     * @param flag          flag
     * @return s/e
     */
    @RequestMapping(value = "/approvalSubmit")
    @ResponseBody
    public String approvalSubmit(OaActDocument oaActDocument, String taskId, Integer flag) {
        //结束标识
        String end = "end";
        //发起人
        String promoter = "promoter";
        //回退
        String back = "back";
        //核稿人网关
        String supervisorEG = "supervisorEG";
        //会签网关
        String countersignEG = "countersignEG";
        //签发网关
        String companyEG = "companyEG";
        //主送网关
        String mainGiveEG = "mainGiveEG";

        Task task = activitiUtil.getTaskByTaskId(taskId);
        if (task == null) {
            return "error";
        }else {
            String nextNode = activitiUtil.getNextNode(task.getProcessDefinitionId(), task.getTaskDefinitionKey());

            //网关
            if (supervisorEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    List<UserInfo> userInfoList = userInfoService.selectMultipleByPermission("countersign");
                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> countersignList = new ArrayList<>();
                    for (UserInfo user : userInfoList) {
                        countersignList.add(user.getId());
                    }
                    map.put("whether", 0);
                    map.put("countersignList", countersignList);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActDocument);
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActDocument.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActDocument.getId(), "被回退");
                    oaActDocument.setState(1);
                    return updateByPrimaryKeySelective(oaActDocument);
                }

                //会签
            } else if (countersignEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {
                    UserInfo userInfo = userInfoService.getUserInfoByPermission("company_principal");
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 0);
                    map.put("company_principal", userInfo.getId());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActDocument);
                } else {
                    Task task1 = activitiUtil.getProcessInstanceIdByTaskId(taskId);
                    List<Task> taskList = activitiUtil.getTaskListByProcessInstanceId(task1.getProcessInstanceId());
                    for (Task tasks : taskList) {
                        Map<String, Object> map = new HashMap<>(16);
                        map.put("whether", 1);
                        map.put("promoter", oaActDocument.getPromoter());
                        activitiUtil.approvalComplete(tasks.getId(), map);
                    }
                    oaCollaborationService.updateStatusCode(oaActDocument.getId(), "被回退");
                    oaActDocument.setState(1);
                    return updateByPrimaryKeySelective(oaActDocument);
                }
            } else if (companyEG.equals(nextNode)) {
                //同意
                if (flag.equals(1)) {

                    //主送
                    if (!"".equals(oaActDocument.getMainGiveId())){
                        Map<String, Object> map = new HashMap<>(16);
                        List<Object> mainGiveList = new ArrayList<>();

                        //领导班子
                        if ("1".equals(oaActDocument.getMainGiveId())){
                            mainGiveList.add(1);
                            mainGiveList.add(2);
                            mainGiveList.add(3);
                            mainGiveList.add(4);
                            mainGiveList.add(23);
                        }else{
                            mainGiveList.add(5);
                            mainGiveList.add(6);
                            mainGiveList.add(22);
                            mainGiveList.add(34);
                            mainGiveList.add(38);
                            mainGiveList.add(47);
                            mainGiveList.add(48);
                            mainGiveList.add(58);
                        }
//                         String mainGive = oaActDocument.getMainGiveId();
//                        String[] users = mainGive.split(",");
//                        for (String user : users) {
//                            mainGiveList.add(user);
//                        }
                        map.put("whether", 0);
                        map.put("mainGiveList", mainGiveList);
                        activitiUtil.approvalComplete(taskId, map);
                        return updateByPrimaryKeySelective(oaActDocument);
                    }else{
                        //抄送
                        if (!"".equals(oaActDocument.getCopyGiveId())){
                            Map<String, Object> map = new HashMap<>(16);
                            List<Object> copyGiveList = new ArrayList<>();
                            String copyGive = oaActDocument.getCopyGiveId();
                            String[] users = copyGive.split(",");
                            for (String user : users) {
                                copyGiveList.add(user);
                            }
                            map.put("whether", 1);
                            map.put("copyGiveList", copyGiveList);
                            activitiUtil.approvalComplete(taskId, map);
                            return updateByPrimaryKeySelective(oaActDocument);
                        }else{
                            //发起人
                            Map<String, Object> map = new HashMap<>(16);
                            map.put("whether", 2);
                            map.put("promoter", oaActDocument.getPromoter());
                            activitiUtil.approvalComplete(taskId, map);
                            return updateByPrimaryKeySelective(oaActDocument);
                        }
                    }
                } else {
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 3);
                    map.put("promoter", oaActDocument.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    oaCollaborationService.updateStatusCode(oaActDocument.getId(), "被回退");
                    oaActDocument.setState(1);
                    return updateByPrimaryKeySelective(oaActDocument);
                }

            }else if (mainGiveEG.equals(nextNode)) {
                if (!"".equals(oaActDocument.getCopyGiveId())){
                    Map<String, Object> map = new HashMap<>(16);
                    List<Object> copyGiveList = new ArrayList<>();
                    String copyGive = oaActDocument.getCopyGiveId();
                    String[] users = copyGive.split(",");
                    for (String user : users) {
                        copyGiveList.add(user);
                    }
                    map.put("whether", 0);
                    map.put("copyGiveList", copyGiveList);
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActDocument);
                }else{
                    //发起人
                    Map<String, Object> map = new HashMap<>(16);
                    map.put("whether", 1);
                    map.put("promoter", oaActDocument.getPromoter());
                    activitiUtil.approvalComplete(taskId, map);
                    return updateByPrimaryKeySelective(oaActDocument);
                }

            } else if (back.equals(nextNode)) {
                //驳回
                managementService.executeCommand(new TargetFlowNodeCommand(task.getId(), back));
                //修改表单状态
                oaCollaborationService.updateState(oaActDocument.getId(), 3);
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
                        return updateByPrimaryKeySelective(oaActDocument);

                    } else {
                        //直接结束
                        activitiUtil.endProcess(taskId);
                        return updateByPrimaryKeySelective(oaActDocument);
                    }
                } else {
                    //直接结束
                    activitiUtil.endProcess(taskId);
                    return updateByPrimaryKeySelective(oaActDocument);
                }
            }
        }
    }

    /**
     * 根据主键更新
     *
     * @param oaActDocument oaActDocument
     * @return int
     */
    public String updateByPrimaryKeySelective(OaActDocument oaActDocument) {
        if (oaActDocumentService.updateByPrimaryKeySelective(oaActDocument) < 1) {
            return "error";
        } else {
            return "success";
        }
    }
    
    /**
     * 保存待发
     *
     * @param oaActDocument oaActDocument
     * @return s/e
     */
    @RequestMapping(value = "/savePending")
    @ResponseBody
    public String savePending(OaActDocument oaActDocument) {
        String randomId = RandomUtil.randomId();
        if (oaActDocumentService.insert(oaActDocument, getCurrentUser().getId(), randomId, 1) < 1) {
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
        OaActDocument oaActDocument = oaActDocumentService.selectByPrimaryKey(id);
        //所有用户
        List<UserInfo> userInfoList = userInfoService.selectIdAndNicknameAndDepartment();
        List<Department> departmentList = departmentService.selectKeyAndName();
        model.addAttribute("oaActDocument", oaActDocument);
        model.addAttribute("userInfoList", JsonHelper.toJSONString(userInfoList));
        model.addAttribute("departmentListJson", JsonHelper.toJSONString(departmentList));
        return "oa/act/act_document_edit";
    }

    /**
     * 编辑后的保存
     *
     * @param oaActDocument oaActLicenceBorrow
     * @return s/e
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaActDocument oaActDocument) {
        if (oaActDocumentService.edit(oaActDocument) < 0) {
            return "error";
        } else {
            return "success";
        }
    }

    /**
     * 编辑后发送
     *
     * @param oaActDocument oaActDocument
     * @return s/e
     */
    @RequestMapping(value = "/editAdd")
    @ResponseBody
    public String editAdd(OaActDocument oaActDocument) {
        //更新数据
        if (oaActDocumentService.edit(oaActDocument) < 0) {
            return "error";
        } else {
            //用户所在部门id
            String department = userInfoService.selectDepartmentByUserId(getCurrentUser().getId());
            //部门负责人
            String supervisor = departmentService.selectEnforcerId("supervisor", department);
            Map<String, Object> map = new HashMap<>(16);
            map.put("supervisor", supervisor);
            String instance = activitiUtil.startProcessInstanceByKey("oa_document", "oa_act_document:" + oaActDocument.getId(), map, getCurrentUser().getId().toString());
            if (instance != null) {
                //发送成功后更新状态
                oaCollaborationService.updateStatusCode(oaActDocument.getId(), "协同");
                oaCollaborationService.updateStateByCorrelationId(oaActDocument.getId(), 0, oaActDocument.getTitle());
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
        OaActDocument oaActDocument = oaActDocumentService.selectByPrimaryKey(id);
        //获取批注信息
        List<Comments> commentsList = activitiUtil.selectHistoryComment(taskId);
        model.addAttribute("oaActDocument", oaActDocument);
        model.addAttribute("commentsList", commentsList);
        return "oa/act/act_document_details";
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
            oaActDocumentService.deleteData(id);
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
