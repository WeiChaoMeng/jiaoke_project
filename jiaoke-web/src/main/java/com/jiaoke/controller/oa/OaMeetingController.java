package com.jiaoke.controller.oa;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.service.DepartmentService;
import com.jiaoke.oa.service.OaMeetingService;
import com.jiaoke.oa.service.UserInfoService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
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
 * 会议
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/9 11:14
 */
@Controller
@RequestMapping(value = "/meeting")
public class OaMeetingController {

    @Resource
    private OaMeetingService oaMeetingService;

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private DepartmentService departmentService;

    @Resource
    private ActivitiUtil activitiUtil;

    /**
     * 获取当前登录用户信息
     *
     * @return userInfo
     */
    private UserInfo getCurrentUser() {
        return (UserInfo) SecurityUtils.getSubject().getPrincipal();
    }
    /**----------------新建会议----------------*/
    /**
     * 跳转新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/toIndex")
    public String toIndex(Model model) {
        List<UserInfo> userInfoList = userInfoService.selectIdAndNicknameAndDepartment();
        List<Department> departmentList = departmentService.selectKeyAndName();
        model.addAttribute("nickname", getCurrentUser().getNickname());
        model.addAttribute("userInfoList", JsonHelper.toJSONString(userInfoList));
        model.addAttribute("departmentList", JsonHelper.toJSONString(departmentList));
        return "oa/meeting/act_meeting";
    }

    /**
     * 跳转新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/toAdd")
    public String toAdd(Model model) {
        List<UserInfo> userInfoList = userInfoService.selectIdAndNicknameAndDepartment();
        List<Department> departmentList = departmentService.selectKeyAndName();
        model.addAttribute("nickname", getCurrentUser().getNickname());
        model.addAttribute("userInfoList", JsonHelper.toJSONString(userInfoList));
        model.addAttribute("departmentList", JsonHelper.toJSONString(departmentList));
        return "oa/meeting/oa_new_meeting";
    }

    /**
     * 新增
     *
     * @return jsp
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(OaMeeting oaMeeting) {
        if (oaMeetingService.insertSelective(oaMeeting) < 1) {
            return "error";
        } else {
            List<String> usersList = new ArrayList<>();
            Map<String, Object> map = new HashMap<>(16);
            //遍历与会人员
            String[] strings = oaMeeting.getParticipants().split(",");
            for (String string : strings) {
                usersList.add(string);
            }
            map.put("usersList", usersList);

            //开启流程实例
            activitiUtil.startProceesInstance("oa_meeting", oaMeeting.getId().toString(), map);
            return "success";
        }
    }

    /**----------------待开会议----------------*/
    /**
     * 跳转待办会议
     *
     * @return jsp
     */
    @RequestMapping(value = "/toPendingMeeting")
    public String toPendingMeeting(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/meeting/oa_pending_meeting";
    }

    /**
     * 加载待办会议数据
     *
     * @param page page
     * @return json
     */
    @RequestMapping(value = "/loadingPendingMeetingData")
    @ResponseBody
    public String loadingPendingMeetingData(int page) {
        List<Integer> businessIdList = new ArrayList<>();
        Map<String, List<String>> map = new HashMap<>(16);

        UserInfo userInfo = getCurrentUser();
        //查询待办任务
        List<Task> taskList = activitiUtil.getTaskByProcessDefinitionKey(userInfo.getId(), "oa_meeting");
        if (taskList.size() < 1) {
            return JsonHelper.toJSONString("noData");
        }

        //根据taskId查询businessId
        for (Task task : taskList) {
            List<String> taskInfoList = new ArrayList<>();
            String businessId = activitiUtil.getBusinessByTaskId(task.getId());
            businessIdList.add(Integer.valueOf(businessId));
            taskInfoList.add(task.getId());
            taskInfoList.add(task.getProcessInstanceId());
            map.put(businessId, taskInfoList);
        }

        PageHelper.startPage(page, 15);
        List<OaMeeting> oaMeetingList = oaMeetingService.selectByBusinessId(businessIdList);

        for (Map.Entry<String, List<String>> entry : map.entrySet()) {
            for (OaMeeting oaMeeting : oaMeetingList) {
                if (oaMeeting.getId().equals(Integer.parseInt(entry.getKey()))) {
                    oaMeeting.setTaskId(entry.getValue().get(0));
                    oaMeeting.setProcessInstanceId(entry.getValue().get(1));
                }
            }
        }

        PageInfo<OaMeeting> pageInfo = new PageInfo<>(oaMeetingList);
        return JsonHelper.toJSONString(pageInfo);
    }

    /**
     * 待办会议详情
     *
     * @param id     id
     * @param taskId taskId
     * @param page   page
     * @param model  model
     * @return jsp
     */
    @RequestMapping(value = "/meetingDetails")
    public String meetingDetails(Integer id, String taskId, String processInstanceId, int page, Model model) {
        OaMeeting oaMeeting = oaMeetingService.selectByPrimaryKey(id);
        List<Comments> commentsList = activitiUtil.selectComments(taskId);
        model.addAttribute("oaMeeting", oaMeeting);
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("taskId", JsonHelper.toJSONString(taskId));
        model.addAttribute("processInstanceId", JsonHelper.toJSONString(processInstanceId));
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/meeting/oa_meeting_details";
    }

    /**
     * 完成任务
     *
     * @param page              page
     * @param processInstanceId 流程实例Id
     * @param processingOpinion 处理意见
     * @param taskId            任务Id
     * @return s/c
     */
    @RequestMapping(value = "/commitMeeting")
    @ResponseBody
    public String commitMeeting(String page, String processInstanceId, String processingOpinion, String taskId) {
        return activitiUtil.finishTask(processInstanceId, processingOpinion, taskId, getCurrentUser().getNickname());
    }

    /**----------------已开会议----------------*/
    /**
     * 跳转已开会议
     *
     * @param page  page
     * @param model model
     * @return jsp
     */
    @RequestMapping(value = "/toHistoryMeeting")
    public String toHistoryMeeting(int page, Model model) {
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/meeting/oa_history_meeting";
    }

    /**
     * 加载已办会议数据
     *
     * @param page page
     * @return json
     */
    @RequestMapping(value = "/loadingHistoryMeetingData")
    @ResponseBody
    public String loadingHistoryMeetingData(int page) {
        List<Integer> businessIdList = new ArrayList<>();
        Map<String, String> map = new HashMap<>(16);

        List<HistoricTaskInstance> historicTaskInstanceList = activitiUtil.selectHistoricTaskInstance(getCurrentUser().getId().toString(), "oa_meeting");
        if (historicTaskInstanceList.size() <= 0) {
            return JsonHelper.toJSONString("noData");
        } else {
            List<HistoricProcessInstance> processInstanceList = activitiUtil.selectHistoricProcessInstance(historicTaskInstanceList);
            for (HistoricProcessInstance historicProcessInstance : processInstanceList) {
                businessIdList.add(Integer.valueOf(historicProcessInstance.getBusinessKey()));
                map.put(historicProcessInstance.getBusinessKey(), historicProcessInstance.getId());
            }
            PageHelper.startPage(page, 15);
            List<OaMeeting> oaMeetingList = oaMeetingService.selectHistoricMeeting(businessIdList, map);
            PageInfo<OaMeeting> pageInfo = new PageInfo<>(oaMeetingList);
            return JsonHelper.toJSONString(pageInfo);
        }
    }

    /**
     * 查询历史会议详情
     *
     * @param id                id
     * @param processInstanceId processInstanceId
     * @param page              page
     * @param model             model
     * @return jsp
     */
    @RequestMapping(value = "/historicMeetingDetails")
    public String historicMeetingDetails(Integer id, String processInstanceId, int page, Model model) {
        OaMeeting oaMeeting = oaMeetingService.selectByPrimaryKey(id);
        List<Comments> commentsList = activitiUtil.selectHistoryComment(processInstanceId);
        model.addAttribute("oaMeeting", oaMeeting);
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("currentPage", JsonHelper.toJSONString(page));
        return "oa/meeting/oa_historic_details";
    }

    /**
     * 会议安排
     *
     * @return oa_schedule_planning.jsp
     */
    @RequestMapping("/OAMeetingSchedule.do")
    public String meetingSchedule() {
        return "oa/meeting/oa_meeting_schedule";
    }
}
