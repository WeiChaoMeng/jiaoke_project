package com.jiaoke.controller.oa.personal;

import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.DingTalkClient;
import com.dingtalk.api.request.OapiUserListbypageRequest;
import com.dingtalk.api.response.OapiAttendanceListRecordResponse;
import com.dingtalk.api.response.OapiAttendanceListResponse;
import com.dingtalk.api.response.OapiDepartmentListResponse;
import com.dingtalk.api.response.OapiUserListbypageResponse;
import com.jiake.utils.DingDingUtil;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaCheckingAttendance;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.*;

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


    /**
     * 个人考勤
     *
     * @return oa_personal_attendance.jsp
     */
    @RequestMapping("/toPersonalAttendance")
    public String toPersonalAttendances(Model model) throws Exception {
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
            request.setOrder("entry_desc");
            request.setHttpMethod("GET");
            OapiUserListbypageResponse execute = client.execute(request, DingDingUtil.getAccessToken());
            List<OapiUserListbypageResponse.Userlist> userList = execute.getUserlist();

            //日期格式
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm:ss");

            for (OapiUserListbypageResponse.Userlist list : userList) {
                OaCheckingAttendance oaCheckingAttendance = new OaCheckingAttendance();
                oaCheckingAttendance.setUserId(list.getUserid());
                oaCheckingAttendance.setUserName(list.getName());
                oaCheckingAttendance.setDepartment(department.getName());
                oaCheckingAttendance.setJobnumber(list.getJobnumber());
                oaCheckingAttendance.setPosition(list.getPosition());
                oaCheckingAttendance.setDay(DingDingUtil.dateConvertDay(date));
                oaCheckingAttendance.setWeek(DingDingUtil.getWeekOfDate(date));

                List<String> arrayList = new ArrayList<>();
                List<OapiAttendanceListResponse.Recordresult> recordResultList = DingDingUtil.getAttendanceListRequest(list.getUserid());
                for (OapiAttendanceListResponse.Recordresult recordResult : recordResultList) {
                    arrayList.add(simpleDateFormat.format(recordResult.getUserCheckTime()));
                }
                oaCheckingAttendance.setRecordresult(arrayList);
                oaCheckingAttendanceList.add(oaCheckingAttendance);
            }
        }
        model.addAttribute("oaCheckingAttendanceList", oaCheckingAttendanceList);
        return "oa/personal/oa_personal_attendance";
    }
}
