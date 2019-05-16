package com.jiaoke.controller.oa.personal;

import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.DingTalkClient;
import com.dingtalk.api.request.OapiUserListbypageRequest;
import com.dingtalk.api.response.OapiAttendanceListRecordResponse;
import com.dingtalk.api.response.OapiAttendanceListResponse;
import com.dingtalk.api.response.OapiDepartmentListResponse;
import com.dingtalk.api.response.OapiUserListbypageResponse;
import com.jiake.utils.DateUtil;
import com.jiake.utils.DingDingUtil;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.service.DingDingAttendanceService;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * OA-个人事务-考勤
 *
 * @author lihui
 * @version 1.0
 * @date 2018/12/29 14:43
 */
@Controller
@RequestMapping(value = "/personalAttendance")
public class OaCheckingAttendanceController {

    @Resource
    private DingDingAttendanceService dingDingAttendanceService;

    /**
     * 跳转考勤统计
     *
     * @return oa_personal_attendance.jsp
     */
    @RequestMapping(value = "/toAttendanceStatistics")
    public String toAttendanceStatistics(Model model) throws Exception {
        Date date = new Date();
        List<OaCheckingAttendance> oaCheckingAttendanceList = new ArrayList<>();

        //获取部门列表
        List<OapiDepartmentListResponse.Department> departmentList = DingDingUtil.getDepartmentList();
        for (OapiDepartmentListResponse.Department department : departmentList) {
            DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/listbypage");
            OapiUserListbypageRequest request = new OapiUserListbypageRequest();
            request.setDepartmentId(department.getId());
            request.setOffset(0L);
            request.setSize(100L);
            request.setOrder("entry_asc");
            request.setHttpMethod("GET");
            OapiUserListbypageResponse execute = client.execute(request, DingDingUtil.getAccessToken());
            List<OapiUserListbypageResponse.Userlist> userList = execute.getUserlist();

            for (OapiUserListbypageResponse.Userlist list : userList) {
                OaCheckingAttendance oaCheckingAttendance = new OaCheckingAttendance();
                oaCheckingAttendance.setUserId(list.getUserid());
                oaCheckingAttendance.setUserName(list.getName());
                oaCheckingAttendance.setDepartment(department.getName());
                oaCheckingAttendance.setJobnumber(list.getJobnumber());
                oaCheckingAttendance.setPosition(list.getPosition());
                oaCheckingAttendance.setDay(DingDingUtil.dateConvertDay(date));
                oaCheckingAttendance.setWeek(DingDingUtil.getWeekOfDate(date));

                //根据用户id查询打卡详情
                List<String> arrayList = new ArrayList<>();
                List<OapiAttendanceListRecordResponse.Recordresult> recordresultList = DingDingUtil.getPunchTheClockDetails(list.getUserid());
                for (OapiAttendanceListRecordResponse.Recordresult recordresult : recordresultList) {
                    arrayList.add(DateUtil.dateConvertHHMMSS(recordresult.getUserCheckTime()));
                }
                oaCheckingAttendance.setRecordresult(arrayList);
                oaCheckingAttendanceList.add(oaCheckingAttendance);
            }
        }
        model.addAttribute("oaCheckingAttendanceList", oaCheckingAttendanceList);
        return "oa/personal/oa_personal_attendance";
    }

    /**---------------个人考勤-----------------*/

    /**
     * 跳转个人考勤
     *
     * @return jsp
     */
    @RequestMapping("/toPersonalAttendance")
    public String toPersonalAttendances(Model model) {

        //获取当前用户
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        //根据当前用户名称查询考勤信息
        DingDingAttendance dingDingAttendance = dingDingAttendanceService.selectByName(userInfo.getNickname());
        model.addAttribute("dingDingAttendance", dingDingAttendance);
        if (dingDingAttendance != null) {
            //获取考勤日期表
            List<DingDingPunchDate> punchRecordList = dingDingAttendanceService.selectPunchDate();
            model.addAttribute("punchRecordList", punchRecordList);
            //获取当前用户打卡详情
            List<DingDingPunchTime> punchTimeList = dingDingAttendanceService.selectPunchTime(dingDingAttendance.getUserId());
            model.addAttribute("punchTimeList", punchTimeList);
        }
        return "oa/personal/oa_attendance_statistics";
    }
}
