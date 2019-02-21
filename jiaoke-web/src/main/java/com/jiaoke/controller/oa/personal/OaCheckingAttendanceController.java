package com.jiaoke.controller.oa.personal;

import com.dingtalk.api.response.OapiAttendanceListRecordResponse;
import com.dingtalk.api.response.OapiDepartmentListResponse;
import com.dingtalk.api.response.OapiUserListbypageResponse;
import com.jiake.utils.DingDingUtil;
import com.jiake.utils.JsonHelper;
import com.jiaoke.oa.bean.OaCheckingAttendance;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
     * @return  oa_personal_attendance.jsp
     */
    @RequestMapping("/toPersonalAttendance")
    public String toPersonalAttendance() {
        return "oa/personal/oa_personal_attendance";
    }

    /**
     * 获取打卡详情(POST)
     *
     * @throws Exception e
     */
    @RequestMapping(value = "/attendanceDetails")
    @ResponseBody
    public String attendanceDetails() throws Exception {
        Map<String, Object> map = new HashMap<>(16);
        List<OaCheckingAttendance> list = new ArrayList<>();
        //获取部门列表
        List<OapiDepartmentListResponse.Department> departmentList = DingDingUtil.getDepartmentList();
        for (OapiDepartmentListResponse.Department department : departmentList) {
            OaCheckingAttendance oaCheckingAttendance = new OaCheckingAttendance();
            //获取部门用户详细信息
            List<OapiUserListbypageResponse.Userlist> departmentalUserDetails = DingDingUtil.getDepartmentalUserDetails(department.getId());
            for (OapiUserListbypageResponse.Userlist userList : departmentalUserDetails) {
                oaCheckingAttendance.setUserId(userList.getUserid());
                oaCheckingAttendance.setUserName(userList.getName());
                //根据部门id获取部门name
                String departmentId = userList.getDepartment().replace("[", "").replace("]", "");
                oaCheckingAttendance.setDepartment(DingDingUtil.getDepartmentName(departmentId));
                oaCheckingAttendance.setJobnumber(userList.getJobnumber());
                oaCheckingAttendance.setPosition(userList.getPosition());
            }
            list.add(oaCheckingAttendance);
        }

        //获取打卡时间
        List<OapiAttendanceListRecordResponse.Recordresult> recordResultList = DingDingUtil.getPunchTheClockDetails();
        map.put("list",list);
        map.put("recordResultList",recordResultList);

        return JsonHelper.toJSONString(map);
    }

    /**
     * 获取打卡详情(GET)
     *
     * @throws Exception e
     */
    @RequestMapping(value = "/toAttendance")
    public String attendanceDetails(Model model) throws Exception {
        /*List<OaCheckingAttendance> oaCheckingAttendanceList = new ArrayList<>();
        //获取部门列表
        List<OapiDepartmentListResponse.Department> departmentList = DingDingUtil.getDepartmentList();
        for (OapiDepartmentListResponse.Department department : departmentList) {
            OaCheckingAttendance oaCheckingAttendance = new OaCheckingAttendance();
            //获取部门用户详细信息
            List<OapiUserListbypageResponse.Userlist> departmentalUserDetails = DingDingUtil.getDepartmentalUserDetails(department.getId());
            for (OapiUserListbypageResponse.Userlist userList : departmentalUserDetails) {
                oaCheckingAttendance.setUserId(userList.getUserid());
                oaCheckingAttendance.setUserName(userList.getName());
                //根据部门id获取部门name
                String departmentId = userList.getDepartment().replace("[", "").replace("]", "");
                oaCheckingAttendance.setDepartment(DingDingUtil.getDepartmentName(departmentId));
                oaCheckingAttendance.setJobnumber(userList.getJobnumber());
                oaCheckingAttendance.setPosition(userList.getPosition());
            }
            oaCheckingAttendanceList.add(oaCheckingAttendance);
        }

        //获取打卡时间
        List<OapiAttendanceListRecordResponse.Recordresult> recordResultList = DingDingUtil.getPunchTheClockDetails();
        model.addAttribute("oaCheckingAttendanceList",oaCheckingAttendanceList);
        model.addAttribute("recordResultList",recordResultList);*/
        return "oa/personal/oa_personal_attendance";
    }
}
