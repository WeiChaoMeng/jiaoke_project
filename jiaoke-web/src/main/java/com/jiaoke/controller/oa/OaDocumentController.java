package com.jiaoke.controller.oa;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.DateUtil;
import com.jiake.utils.JsonHelper;
import com.jiake.utils.RandomUtil;
import com.jiaoke.oa.bean.Department;
import com.jiaoke.oa.bean.OaDocument;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaDocumentService;
import com.jiaoke.oa.service.UserInfoService;
import org.activiti.bpmn.model.SequenceFlow;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.*;

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

    @Resource
    private DepartmentService departmentService;

    /**------------发送公文--------------*/
    /**
     * 跳转发布公文
     *
     * @return oa_release_document.jsp
     */
    @RequestMapping(value = "/releaseDocument.do")
    public String releaseDocument(Model model) {
        //获取当前登录人的名称
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        //所有用户
        List<UserInfo> userInfoList = userInfoService.selectIdAndNicknameAndDepartment();
        List<Department> departmentList = departmentService.selectKeyAndName();
        model.addAttribute("nickName", userInfo.getNickname());
        model.addAttribute("departmentName", userInfo.getDepartment());
        model.addAttribute("userInfoList", JsonHelper.toJSONString(userInfoList));
        model.addAttribute("departmentList", JsonHelper.toJSONString(departmentList));
        return "oa/document/oa_release_document";
    }

    /**
     * 发送公文
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
            map.put("user", userInfo.getId());
            //启动流程实例
            String document = activitiUtil.startProceesInstance("oa_doc", random.toString(), map);
            //获取任务id
            Task taskId = activitiUtil.getTaskIdByProcessInstanceId(document);
            //指定会签人员
            Map<String, Object> assigneeListMap = new HashMap<>(16);
            List<Object> assigneeList = new ArrayList<>();
            assigneeList.add("2");
            assigneeList.add("3");
            assigneeList.add("4");
            assigneeListMap.put("userList", assigneeList);
            activitiUtil.designatedCountersignPersonnel(taskId.getId(), assigneeListMap);
            return "redirect:/document/toIssuedDocument.do?page=1";
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

    /**------------待发公文--------------*/

    /**
     * 跳转待发公文
     *
     * @param model model
     * @return oa_primed_document.jsp
     */
    @RequestMapping(value = "/toPrimedDocument.do")
    public String toPrimedDocument(int page, Model model) {
        model.addAttribute("page", JsonHelper.toJSONString(page));
        return "oa/document/oa_primed_document";
    }

    /**
     * 加载待发公文
     *
     * @param page      page
     * @param formState formState
     * @return oa_primed_document.jsp
     */
    @RequestMapping(value = "/primedDocument")
    @ResponseBody
    public String primedDocument(int page, int formState) {
        PageHelper.startPage(page, 15);
        List<OaDocument> oaDocumentList = oaDocumentService.getAllByFormState(formState);
        PageInfo<OaDocument> pageInfo = new PageInfo<>(oaDocumentList);
        return JsonHelper.toJSONString(pageInfo);
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
        //所有用户
        List<UserInfo> userInfoList = userInfoService.selectIdAndNicknameAndDepartment();
        List<Department> departmentList = departmentService.selectKeyAndName();
        model.addAttribute("oaDocument", oaDocument);
        model.addAttribute("userInfoList", JsonHelper.toJSONString(userInfoList));
        model.addAttribute("departmentList", JsonHelper.toJSONString(departmentList));
        return "oa/document/oa_edit_document";
    }

    /**
     * 更新待发文档
     *
     * @param oaDocument oaDocument
     * @return s/e
     */
    @RequestMapping(value = "/updatePendingDocument")
    @ResponseBody
    public String updatePendingDocument(OaDocument oaDocument) {
        if (oaDocumentService.updatePendingDocument(oaDocument) < 0) {
            return "error";
        }
        return "success";
    }

    /**
     * 根据主键删除
     *
     * @param id 主键
     * @return s/e
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String deleteById(int id) {
        if (oaDocumentService.deleteById(id) < 0) {
            return "error";
        }
        return "success";
    }

    /**-------------已发公文--------------*/
    /**
     * 跳转已发公文
     *
     * @return oa_issued_document.jsp
     */
    @RequestMapping(value = "/toIssuedDocument.do")
    public String toIssuedDocument(int page, Model model) {
        model.addAttribute("page", JsonHelper.toJSONString(page));
        return "oa/document/oa_issued_document";
    }

    /**
     * 加载已发公文数据
     *
     * @return json
     */
    @RequestMapping(value = "/issuedDocument")
    @ResponseBody
    public String issuedDocument(int page, int formState) {
        PageHelper.startPage(page, 15);
        List<OaDocument> oaDocumentList = oaDocumentService.getAllByFormState(formState);
        PageInfo<OaDocument> pageInfo = new PageInfo<>(oaDocumentList);
        return JsonHelper.toJSONString(pageInfo);
    }


    /**-------------待办公文--------------*/
    /**
     * 跳转待办公文
     *
     * @return oa_pending_document.jsp
     */
    @RequestMapping(value = "/toPendingDocument.do")
    public String toPendingDocument(int page, Model model) {
        model.addAttribute("page", JsonHelper.toJSONString(page));
        return "oa/document/oa_pending_document";
    }

    /**
     * 加载待办公文数据
     *
     * @return json
     */
    @RequestMapping(value = "/pendingDocument")
    @ResponseBody
    public String pendingDocument(int page, String textTitle) {
        List<Integer> businessIdList = new ArrayList<>();
        Map<String, List<String>> map = new HashMap<>(16);

        //获取当前登录人的名称
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        //根据登录人的名称查询任务
        List<Task> taskList = activitiUtil.getTaskByAssignee(userInfo.getId());
        if (taskList.size() < 1) {
            return JsonHelper.toJSONString("noData");
        }

        //根据taskId查询businessId
        for (Task task : taskList) {
            List<String> taskInfoList = new ArrayList<>();
            String businessId = activitiUtil.getBusinessByTaskId(task.getId());
            businessIdList.add(Integer.valueOf(businessId));
            taskInfoList.add(task.getId());
            taskInfoList.add(DateUtil.dateConvertYYYYMMDDHHMMSS(task.getCreateTime()));
            map.put(businessId, taskInfoList);
        }

        PageHelper.startPage(page, 15);
        List<OaDocument> oaDocumentList = oaDocumentService.selectByBusinessId(businessIdList, textTitle);

        for (Map.Entry<String, List<String>> entry : map.entrySet()) {
            for (OaDocument oaDocument : oaDocumentList) {
                if (oaDocument.getId().equals(Integer.parseInt(entry.getKey()))) {
                    oaDocument.setTaskId(entry.getValue().get(0));
                    oaDocument.setReceiveTime(entry.getValue().get(1));
                }
            }
        }

        PageInfo<OaDocument> pageInfo = new PageInfo<>(oaDocumentList);
        return JsonHelper.toJSONString(pageInfo);
    }


    /**-------------已办公文--------------*/

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

    /**------------communal---------------------*/

    /**
     * 根据id获取已办公文详情
     *
     * @param id    id
     * @param model model
     * @return oa_details_document.jsp
     */
    @RequestMapping(value = "/completeDetails")
    public String completeDetails(Integer id, int page, Model model) {
        OaDocument oaDocument = oaDocumentService.getDocumentDetailsById(id);
        model.addAttribute("oaDocument", oaDocument);
        model.addAttribute("page", JsonHelper.toJSONString(page));
        return "oa/document/oa_complete_details";
    }


    /**
     * 标题搜索
     *
     * @return json
     */
    @RequestMapping(value = "/textTitleFilter")
    @ResponseBody
    public String titleFilter(int page, String textTitle, int formState) {
        PageHelper.startPage(page, 15);
        List<OaDocument> oaDocumentList = oaDocumentService.textTitleFilter(textTitle, formState);
        PageInfo<OaDocument> pageInfo = new PageInfo<>(oaDocumentList);
        return JsonHelper.toJSONString(pageInfo);
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
     * 公文审批结果
     *
     * @param taskId     任务id
     * @param taskId     表单id
     * @param annotation 处理人意见
     * @return oa_pending_document
     */
    @RequestMapping(value = "/documentApproval")
    public String documentApproval(String taskId, int id, String annotation) throws UnsupportedEncodingException {
        //解决textarea乱码问题
        String annotationText = new String(annotation.getBytes("iso-8859-1"), "utf-8");
        //完成会签
        Map<String, Object> map = new HashMap<>(16);
        map.put("president", 1);
        activitiUtil.finishCountersignTask(taskId, map, annotationText);

        /*UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        if (userInfo.getId() == 1) {
            //指定知会人员
            Map<String, Object> usersListMap = new HashMap<>(16);
            List<Object> usersList = new ArrayList<>();
            usersList.add("5");
            usersList.add("7");
            usersListMap.put("usersList", usersList);
            activitiUtil.completeTaskByTaskId(taskId, usersListMap);
        } else if (userInfo.getId() == 2 || userInfo.getId() == 3 || userInfo.getId() == 4) {
            //会签完毕，指定总经理
            Map<String, Object> map = new HashMap<>(16);
            map.put("president", 1);
            activitiUtil.completeTaskByTaskId(taskId, map);
        } else {
            activitiUtil.finishNotifyTask(taskId);
        }

        String value = "1";
        if (value.equals(variableValue)) {
            oaDocumentService.updateCountersignature(id, draftedPerson);
        }*/
        return "redirect:/document/toPendingDocument.do?page=1";
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

    @RequestMapping(value = "/testFlow")
    public List<SequenceFlow> test(String abc) {
        return activitiUtil.reject(abc);
    }


}
