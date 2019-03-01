package com.jiaoke.oa.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author lihui
 * @version 1.0
 * @date 2019/1/2 21:42
 */
public class OaCheckingAttendance implements Serializable {
    private String userId;
    private String userName;
    private String department;
    private String jobnumber;
    private String position;
    private String day;
    private String week;
    private Date workDate;
    private List<String> recordresult;

    public Date getWorkDate() {
        return workDate;
    }

    public void setWorkDate(Date workDate) {
        this.workDate = workDate;
    }

    public List<String> getRecordresult() {
        return recordresult;
    }

    public void setRecordresult(List<String> recordresult) {
        this.recordresult = recordresult;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getJobnumber() {
        return jobnumber;
    }

    public void setJobnumber(String jobnumber) {
        this.jobnumber = jobnumber;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week;
    }
}
