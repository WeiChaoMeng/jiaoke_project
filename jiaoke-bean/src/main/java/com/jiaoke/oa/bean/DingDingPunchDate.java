package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 钉钉考勤-打卡日期
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/7 23:09
 */
@Table(name = "ding_ding_punch_date")
public class DingDingPunchDate {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 日期
     */
    private String day;

    /**
     * 星期
     */
    private String week;

    /**
     * 创建日期
     */
    private Date createTime;
    private String createTimeStr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateTimeStr() {
        return createTimeStr;
    }

    public void setCreateTimeStr(String createTimeStr) {
        this.createTimeStr = createTimeStr;
    }
}
