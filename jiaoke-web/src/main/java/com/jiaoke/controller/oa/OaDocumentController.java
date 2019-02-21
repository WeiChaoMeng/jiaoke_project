package com.jiaoke.controller.oa;

import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.oa.bean.OaDocument;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.OaDocumentService;
import com.jiaoke.oa.service.UserInfoService;
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
 * 公文管理
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/15 1:28
 */
@Controller
@RequestMapping(value = "/document")
public class OaDocumentController {

    @Resource
    private OaDocumentService oaDocumentService;

    @Resource
    private ActivitiUtil activitiUtil;

    @Resource
    private UserInfoService userInfoService;

    /**
     * 待办公文跳转
     *
     * @return oa_pending_document.jsp
     */
    @RequestMapping(value = "/pendingDocument.do")
    public String pendingDocument(Model model) {
        //获取当前登录人的名称
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        //根据登录人的名称查询任务
        List<Task> taskList = activitiUtil.getTaskByAssignee(userInfo.getId());

        List<OaDocument> oaDocumentList = new ArrayList<>();
        for (Task task : taskList) {
            //根据taskId查询businessId
            String businessId = activitiUtil.getBusinessByTaskId(task.getId());
            OaDocument document = oaDocumentService.getAllById(Integer.valueOf(businessId));
            document.setTaskId(task.getId());
            oaDocumentList.add(document);
        }
        model.addAttribute("oaDocumentList", oaDocumentList);
        return "oa/document/oa_pending_document";
    }

    /**
     * 发布公文跳转
     *
     * @return oa_release_document.jsp
     */
    @RequestMapping(value = "/releaseDocument.do")
    public String releaseDocument(Model model) {
        //获取当前登录人的名称
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("nickName", userInfo.getNickname());
        model.addAttribute("departmentName", userInfo.getDepartment());
        return "oa/document/oa_release_document";
    }

    /**
     * 添加公文
     *
     * @param oaDocument oaDocument
     * @return oa_release_document.jsp
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(OaDocument oaDocument) {
        //生成公文id
        Integer random = RandomUtil.random();
        oaDocument.setId(random);
        if (oaDocumentService.add(oaDocument) == 1) {
            //获取当前登录人的id
            UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
            Map<String, Object> map = new HashMap<>(16);
            map.put("assignee", userInfo.getId());
            //启动流程实例
            String document = activitiUtil.startProceesInstance("document", random.toString(), map);
            //获取任务id
            Task taskId = activitiUtil.getTaskIdByProcessInstanceId(document);
            //指定会签人员
            Map<String, Object> assigneeListMap = new HashMap<>(16);
            List<Object> assigneeList = new ArrayList<>();
            assigneeList.add("1003");
            assigneeList.add("1004");
            assigneeList.add("1005");
            assigneeListMap.put("assigneeList", assigneeList);
            activitiUtil.designatedCountersignPersonnel(taskId.getId(), assigneeListMap);

            return "redirect:/document/issuedDocument.do";
        } else {
            return null;
        }
    }

    /**
     * 保存待发
     *
     * @param oaDocument oaDocument
     * @return oa_primed_document.jsp
     */
    @RequestMapping(value = "/preservationPending")
    @ResponseBody
    public String preservationPending(OaDocument oaDocument) {
        oaDocument.setId(RandomUtil.random());
        if (oaDocumentService.add(oaDocument) == 1) {
            return "success";
        } else {
            return "error";
        }
    }

    /**
     * 已办公文跳转
     *
     * @param model model
     * @return oa_complete_details.jsp
     */
    @RequestMapping(value = "/doneDocument.do")
    public String doneDocument(Model model) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        List<String> businessKeyList = activitiUtil.historicTask(userInfo.getId().toString());
        if (businessKeyList.size() == 0) {
            model.addAttribute("oaDocumentList", businessKeyList);
            return "oa/document/oa_done_document";
        } else {
            List<OaDocument> oaDocumentList = oaDocumentService.getListById(businessKeyList);
            model.addAttribute("oaDocumentList", oaDocumentList);
            return "oa/document/oa_done_document";
        }
    }

    /**
     * 根据id获取已办公文详情
     *
     * @param id    id
     * @param model model
     * @return oa_details_document.jsp
     */
    @RequestMapping(value = "/completeDetails")
    public String completeDetails(Integer id, Model model) {
        OaDocument oaDocument = oaDocumentService.getDocumentDetailsById(id);
        model.addAttribute("oaDocument", oaDocument);
        return "oa/document/oa_complete_details";
    }

    /**
     * 待发公文跳转
     *
     * @param model model
     * @return oa_primed_document.jsp
     */
    @RequestMapping(value = "/primedDocument.do")
    public String primedDocument(Model model) {
        int total = oaDocumentService.getTotalByFormState(1);
        model.addAttribute("total", total);
        return "oa/document/oa_primed_document";
    }

    /**
     * 跳转公文编辑页面
     *
     * @param id    id
     * @param model model
     * @return oa_edit_document.jsp
     */
    @RequestMapping(value = "/toEdit")
    public String toEdit(Integer id, Model model) {
        OaDocument oaDocument = oaDocumentService.getDocumentDetailsById(id);
        model.addAttribute("oaDocument", oaDocument);
        return "oa/document/oa_edit_document";
    }

    /**
     * 修改
     *
     * @param oaDocument oaDocument
     * @return result
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String edit(OaDocument oaDocument) {
        if (oaDocumentService.edit(oaDocument) == 1) {
            return "success";
        }
        return "error";
    }


    /**
     * 已发公文跳转
     *
     * @param model model
     * @return oa_issued_document.jsp
     */
    @RequestMapping(value = "/issuedDocument.do")
    public String issuedDocument(Model model) {
        int total = oaDocumentService.getTotalByFormState(0);
        model.addAttribute("total", total);
        return "oa/document/oa_issued_document";
    }

    /**
     * 根据id获取待办公文详情
     *
     * @param id    id
     * @param model model
     * @return oa_details_document.jsp
     */
    @RequestMapping(value = "/documentDetails")
    public String details(Integer id, String taskId, Model model) {
        OaDocument oaDocument = oaDocumentService.getDocumentDetailsById(id);
        oaDocument.setTaskId(taskId);
        model.addAttribute("oaDocument", oaDocument);
        return "oa/document/oa_details_document";
    }

    /**
     * 分页
     *
     * @param formState formState
     * @param page      page
     * @param rows      rows
     * @return list
     */
    @RequestMapping(value = "/pagingList")
    @ResponseBody
    public Object getPagingByFormState(Integer formState, Integer page, Integer rows) {
        List<OaDocument> oaDocumentList = oaDocumentService.getPagingByFormState(formState, page, rows);
        if (oaDocumentList != null) {
            return oaDocumentList;
        } else {
            return "error";
        }
    }

    /**
     * 公文审批结果
     *
     * @param taskId        任务id
     * @param variableName  变量名
     * @param variableValue 变量值
     * @param draftedPerson 拟稿人
     * @return oa_pending_document
     */
    @RequestMapping(value = "/documentApproval")
    public String documentApproval(String taskId, String variableName, String variableValue, int id, String draftedPerson) {
        String value = "1";
        activitiUtil.completeTaskByTaskId(taskId, variableName, variableValue);
        if (value.equals(variableValue)) {
            oaDocumentService.updateCountersignature(id, draftedPerson);
        }
        return "redirect:/document/pendingDocument.do";
    }

    /**
     * 获取部门成员
     *
     * @param department 部门id
     * @return 成员列表
     */
    @RequestMapping(value = "/departmentMember")
    @ResponseBody
    public String departmentMember(String department) {
        List<UserInfo> userInfoList = userInfoService.getUserByDepartmentKey(department);
        return JsonHelper.toJSONString(userInfoList);
    }
}
