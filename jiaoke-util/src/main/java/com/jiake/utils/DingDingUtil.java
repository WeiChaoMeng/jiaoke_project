package com.jiake.utils;

import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.DingTalkClient;
import com.dingtalk.api.request.*;
import com.dingtalk.api.response.*;
import com.taobao.api.ApiException;

import java.text.SimpleDateFormat;
import java.util.*;

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
    public static String getAccessToken() throws Exception {
        /*String appkey = "ding65fmltgg5v96gdrj";
        String corpSecret = "dLAhYyB-MdxVU6tKzMILWMiZDlo6QpkDdFA_IhASGPbPWGopF3Xa_pXjPSeJH4KK";*/
        String appkey = "dingd5hzdp7s6jutu6vm";
        String corpSecret = "QUZhGHzC7c-lpGK381TeC8kokm09OPruGMePRCuvucjl0KtBJs49SFg1OXtZ7N3p";
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
        List<OapiDepartmentListResponse.Department> departmentList = new ArrayList<>();
        //添加根目录
        OapiDepartmentListResponse.Department department = new OapiDepartmentListResponse.Department();
        department.setId(1L);
        departmentList.add(department);
        //获取根目录下的所有子目录
        DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/list");
        OapiDepartmentListRequest request = new OapiDepartmentListRequest();
        //父部门id（如果不传，默认部门为根部门，根部门ID为1）
        request.setId("1");
        request.setHttpMethod("GET");
        OapiDepartmentListResponse response = client.execute(request, getAccessToken());
        departmentList.addAll(response.getDepartment());
        return departmentList;
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
    public static List<OapiAttendanceListRecordResponse.Recordresult> getPunchTheClockDetails(String str) throws Exception {
        Date date = new Date();
        String dateFrom = dateConvertYYYYMMDD(date) + " 00:00:00";
        String dateTo = dateConvertYYYYMMDD(date) + " 23:59:59";
        DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/attendance/listRecord");
        OapiAttendanceListRecordRequest request = new OapiAttendanceListRecordRequest();
        request.setCheckDateFrom(dateFrom);
        request.setCheckDateTo(dateTo);
        request.setUserIds(Arrays.asList(str));
        OapiAttendanceListRecordResponse execute = client.execute(request, getAccessToken());
        return execute.getRecordresult();
    }

    /**
     * 获取打卡结果
     *
     * @param str userId
     * @return recordResultList
     * @throws ApiException e
     */
    public static List<OapiAttendanceListResponse.Recordresult> getAttendanceListRequest(String str) throws Exception {
        String dateFrom = dateConvertYYYYMMDD(new Date()) + " 00:00:00";
        String dateTo = dateConvertYYYYMMDD(new Date()) + " 23:59:59";
        DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/attendance/list");
        OapiAttendanceListRequest request = new OapiAttendanceListRequest();
        request.setWorkDateFrom(dateFrom);
        request.setWorkDateTo(dateTo);
        request.setUserIdList(Arrays.asList(str));
        request.setOffset(0L);
        request.setLimit(50L);
        OapiAttendanceListResponse response = client.execute(request, getAccessToken());
        return response.getRecordresult();
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

    /**
     * 获取当前日期是星期几
     *
     * @param dt date
     * @return 当前日期是星期几
     */
    public static String getWeekOfDate(Date dt) {
        String[] weekDays = {"日", "一", "二", "三", "四", "五", "六"};
        Calendar cal = Calendar.getInstance();
        cal.setTime(dt);
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0) {
            w = 0;
        }
        return weekDays[w];
    }

    /**
     * 获取日期
     *
     * @param date date
     * @return day
     */
    public static String dateConvertDay(Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("d");
        return simpleDateFormat.format(date);
    }
}
