package com.jiake.utils;

import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.DingTalkClient;
import com.dingtalk.api.request.*;
import com.dingtalk.api.response.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 钉钉
 *
 * @author lihui
 * @version 1.0
 * @date 2018/12/29 14:47
 */
public class DingDingUtil {

    /**
     * 获取AccessToken(正常情况下AccessToken有效期为7200秒，有效期内重复获取返回相同结果，并自动续期)
     *
     * @return AccessToken
     * @throws Exception api
     */
    private static String getAccessToken() throws Exception {
        String appkey = "ding65fmltgg5v96gdrj";
        String corpSecret = "dLAhYyB-MdxVU6tKzMILWMiZDlo6QpkDdFA_IhASGPbPWGopF3Xa_pXjPSeJH4KK";
        DefaultDingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/gettoken");
        OapiGettokenRequest request = new OapiGettokenRequest();
        request.setAppkey(appkey);
        request.setAppsecret(corpSecret);
        request.setHttpMethod("GET");
        OapiGettokenResponse response = client.execute(request);
        return response.getAccessToken();
    }

    /**
     * 获取部门列表
     *
     * @return map
     * @throws Exception api
     */
    public static List<OapiDepartmentListResponse.Department> getDepartmentList() throws Exception {
        DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/list");
        OapiDepartmentListRequest request = new OapiDepartmentListRequest();
        //父部门id（如果不传，默认部门为根部门，根部门ID为1）
        request.setId("1");
        request.setHttpMethod("GET");
        OapiDepartmentListResponse response = client.execute(request, getAccessToken());
        return response.getDepartment();
    }

    /**
     * 获取部门用户
     *
     * @return list
     * @throws Exception api
     */
    private static List<String> getDepartmentUsers() throws Exception {

        List<String> list = new ArrayList<>();
        //获取部门id
        List<OapiDepartmentListResponse.Department> departmentList = getDepartmentList();
        for (OapiDepartmentListResponse.Department department : departmentList) {
            DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/simplelist");
            OapiUserSimplelistRequest request = new OapiUserSimplelistRequest();
            request.setDepartmentId(department.getId());
            request.setOffset(0L);
            request.setSize(10L);
            request.setHttpMethod("GET");
            OapiUserSimplelistResponse response = client.execute(request, getAccessToken());
            List<OapiUserSimplelistResponse.Userlist> userList = response.getUserlist();
            for (OapiUserSimplelistResponse.Userlist user : userList) {
                list.add(user.getUserid());
            }
        }

        return list;
    }

    /**
     * 获取部门用户详情
     *
     * @throws Exception e
     */
    public static List<OapiUserListbypageResponse.Userlist> getDepartmentalUserDetails(Long departmentId) throws Exception {

        //获取部门列表
        DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/listbypage");
        OapiUserListbypageRequest request = new OapiUserListbypageRequest();
        request.setDepartmentId(departmentId);
        request.setOffset(0L);
        request.setSize(100L);
        request.setOrder("entry_desc");
        request.setHttpMethod("GET");
        OapiUserListbypageResponse execute = client.execute(request, getAccessToken());
        return execute.getUserlist();
    }

    /**
     * 获取部门名称
     *
     * @throws Exception e
     */
    public static String getDepartmentName(String departmentId) throws Exception {
        DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/get");
        OapiDepartmentGetRequest request = new OapiDepartmentGetRequest();
        request.setId(departmentId);
        request.setHttpMethod("GET");
        OapiDepartmentGetResponse response = client.execute(request, getAccessToken());
        return response.getName();
    }

    /**
     * 获取打卡详情
     *
     * @return list
     * @throws Exception api
     */
    public static List<OapiAttendanceListRecordResponse.Recordresult> getPunchTheClockDetails() throws Exception {
        Date date = new Date();
        String dateFrom = dateConvertYYYYMMDD(new Date(date.getTime() - 7 * 24 * 60 * 60 * 1000)) + " 23:59:59";
        String dateTo = dateConvertYYYYMMDD(new Date()) + " 23:59:59";
        DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/attendance/listRecord");
        OapiAttendanceListRecordRequest request = new OapiAttendanceListRecordRequest();
        request.setCheckDateFrom(dateFrom);
        request.setCheckDateTo(dateTo);
        request.setUserIds(getDepartmentUsers());
        OapiAttendanceListRecordResponse execute = client.execute(request, getAccessToken());
        return execute.getRecordresult();
    }

    /**
     * 日期转换
     *
     * @param date data
     * @return YYYY-MM-DD
     */
    private static String dateConvertYYYYMMDD(Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(date);
    }
}
