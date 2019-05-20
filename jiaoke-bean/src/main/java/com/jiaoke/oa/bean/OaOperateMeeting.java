package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 经营开发部-会议纪要
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 11:12
 */
@Table(name = "oa_operate_meeting")
public class OaOperateMeeting {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 编号
     */
    private String numbering;

    /**
     * 会议主题
     */
    private String theme;

    /**
     * 摘要
     */
    private String summary;

    /**
     * 会议日期
     */
    private Date meetingDate;
    @Transient
    private String meetingDateStr;

    /**
     * 富文本
     */
    private String richText;

    /**
     * 创建时间
     */
    private Date createDate;
    @Transient
    private String createDateStr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumbering() {
        return numbering;
    }

    public void setNumbering(String numbering) {
        this.numbering = numbering;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Date getMeetingDate() {
        return meetingDate;
    }

    public void setMeetingDate(Date meetingDate) {
        this.meetingDate = meetingDate;
    }

    public String getMeetingDateStr() {
        return meetingDateStr;
    }

    public void setMeetingDateStr(String meetingDateStr) {
        this.meetingDateStr = meetingDateStr;
    }

    public String getRichText() {
        return richText;
    }

    public void setRichText(String richText) {
        this.richText = richText;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreateDateStr() {
        return createDateStr;
    }

    public void setCreateDateStr(String createDateStr) {
        this.createDateStr = createDateStr;
    }
}
