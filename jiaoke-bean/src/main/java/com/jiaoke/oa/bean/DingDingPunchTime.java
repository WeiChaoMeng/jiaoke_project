package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 钉钉考勤-打卡时间
 *
 * @author lihui
 * @version 1.0
 * @date 2019/3/7 23:09
 */
@Table(name = "ding_ding_punch_time")
public class DingDingPunchTime {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 考勤id
     */
    private String attendanceId;

    /**
     * 打卡时间
     */
    private String time;

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

    public String getAttendanceId() {
        return attendanceId;
    }

    public void setAttendanceId(String attendanceId) {
        this.attendanceId = attendanceId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
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
