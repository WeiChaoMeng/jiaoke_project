package com.jiaoke.controller;

import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.DingTalkClient;
import com.dingtalk.api.request.OapiUserListbypageRequest;
import com.dingtalk.api.response.OapiAttendanceListRecordResponse;
import com.dingtalk.api.response.OapiAttendanceListResponse;
import com.dingtalk.api.response.OapiDepartmentListResponse;
import com.dingtalk.api.response.OapiUserListbypageResponse;
import com.jiake.utils.DateUtil;
import com.jiake.utils.DingDingUtil;
import com.jiaoke.oa.bean.DingDingAttendance;
import com.jiaoke.oa.bean.DingDingPunchDate;
import com.jiaoke.oa.bean.DingDingPunchTime;
import com.jiaoke.oa.service.DingDingAttendanceService;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 考勤
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/5 9:48
 */
@Component
public class Task {

    @Resource
    private DingDingAttendanceService dingDingAttendanceService;

    //    @Scheduled(cron = "59 59 23 * * ?")
    @Scheduled(cron = "00 50 20 * * ?")
    public void timingTask() throws Exception {
        long start = System.currentTimeMillis();
        System.out.println("------------------定时任务执行----------------------");

        List<DingDingAttendance> arrayList = new ArrayList<>();
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

            //封装
            for (OapiUserListbypageResponse.Userlist list : userList) {
                DingDingAttendance dingDingAttendance = new DingDingAttendance();
                dingDingAttendance.setUserId(list.getUserid());
                dingDingAttendance.setName(list.getName());
                dingDingAttendance.setDepartmentName(department.getName());
                dingDingAttendance.setJobnumber(list.getJobnumber());
                dingDingAttendance.setPosition(list.getPosition());
                arrayList.add(dingDingAttendance);

                //获取打卡时间
                List<OapiAttendanceListRecordResponse.Recordresult> recordresultList = DingDingUtil.getPunchTheClockDetails(list.getUserid());
                for (OapiAttendanceListRecordResponse.Recordresult recordresult : recordresultList) {
                    DingDingPunchTime dingDingPunchTime = new DingDingPunchTime();
                    dingDingPunchTime.setAttendanceId(list.getUserid());
                    dingDingPunchTime.setTime(DateUtil.dateConvertHHMMSS(recordresult.getUserCheckTime()));
                    dingDingPunchTime.setCreateTime(new Date());
                    //插入打卡时间表
                    dingDingAttendanceService.insertPunchTime(dingDingPunchTime);
                }
            }
        }

        //清空考勤用户表
        dingDingAttendanceService.emptyTable();

        //批量插入考勤用户
        dingDingAttendanceService.batchInsertion(arrayList);

        //插入DingDingPunchRecord表
        Date date = new Date();
        DingDingPunchDate record = new DingDingPunchDate();
        record.setDay(DateUtil.getDay(date));
        record.setWeek(DateUtil.getWeek(date));
        record.setCreateTime(date);

        //插入打卡日期表
        dingDingAttendanceService.insertPunchRecord(record);

        long end = System.currentTimeMillis();
        System.out.println("程序运行时间(钉钉)： " + (end - start) + "ms");
    }
}
