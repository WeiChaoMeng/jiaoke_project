package com.jiaoke.controller;

import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.DingTalkClient;
import com.dingtalk.api.request.OapiUserListbypageRequest;
import com.dingtalk.api.response.OapiDepartmentListResponse;
import com.dingtalk.api.response.OapiUserListbypageResponse;
import com.jiake.utils.DingDingUtil;
import com.jiaoke.oa.bean.DingDingAttendance;
import com.jiaoke.oa.service.DingDingAttendanceService;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
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

    @Scheduled(cron = "59 59 23 * * ?")
    public void timingTask() throws Exception {
        long start = System.currentTimeMillis();
        System.out.println("------------------定时任务执行----------------------");

        List<DingDingAttendance> arrayList = new ArrayList<>();
        //获取部门列表
        List<OapiDepartmentListResponse.Department> departmentList = DingDingUtil.getDepartmentList();

        for (int i = departmentList.size() - 1; i > 0; i--) {
            DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/listbypage");
            OapiUserListbypageRequest request = new OapiUserListbypageRequest();
            request.setDepartmentId(departmentList.get(i).getId());
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
                dingDingAttendance.setDepartmentName(departmentList.get(i).getName());
                dingDingAttendance.setJobnumber(list.getJobnumber());
                dingDingAttendance.setPosition(list.getPosition());
                arrayList.add(dingDingAttendance);
            }
        }

        int i = dingDingAttendanceService.emptyTable();
        System.out.println(i);

        //批量插入
        int i1 = dingDingAttendanceService.batchInsertion(arrayList);
        System.out.println(i1);

        long end = System.currentTimeMillis();
        System.out.println("程序运行时间： " + (end - start) + "ms");
    }
}
