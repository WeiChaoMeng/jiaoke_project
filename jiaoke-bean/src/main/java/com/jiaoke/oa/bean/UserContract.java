package com.jiaoke.oa.bean;

import javax.persistence.Transient;
import java.io.Serializable;
import java.util.Date;

/**
 * 用户合同
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/10 11:00
 */
public class UserContract implements Serializable {
    /**
     * 用户信息id
     */
    private Integer id;

    /**
     * 用户id（关联id）
     */
    private String userId;

    /**
     * 合同类型：1固定期限劳动合同，2无固定期限劳动合同
     */
    private Integer type;

    /**
     * 入职日期
     */
    private Date entryDate;
    @Transient
    private String entryDateStr;

    /**
     * 转正日期
     */
    private Date positiveDate;
    @Transient
    private String positiveDateStr;

    /**
     * 签订日期
     */
    private Date singDate;
    @Transient
    private String singDateStr;

    /**
     * 合同开始日期
     */
    private Date startDate;
    @Transient
    private String startDateStr;

    /**
     * 合同结束日期
     */
    private Date endDate;
    @Transient
    private String endDateStr;

    /**
     * 合同结束日期
     */
    private Date soonLeaveDate;
    @Transient
    private String soonLeaveDateStr;

    /**
     * 合同结束日期
     */
    private Date LeaveDate;
    @Transient
    private String LeaveDateStr;

    @Transient
    private Integer expire;

    /**
     * 期限
     */
    private String term;

    /**
     * 工作性质
     */
    private String nature;

    @Transient
    private String name;

    @Transient
    private String dep;

    @Transient
    private String pos;

    @Transient
    private String job;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(Date entryDate) {
        this.entryDate = entryDate;
    }

    public String getEntryDateStr() {
        return entryDateStr;
    }

    public void setEntryDateStr(String entryDateStr) {
        this.entryDateStr = entryDateStr;
    }

    public Date getSingDate() {
        return singDate;
    }

    public void setSingDate(Date singDate) {
        this.singDate = singDate;
    }

    public String getSingDateStr() {
        return singDateStr;
    }

    public void setSingDateStr(String singDateStr) {
        this.singDateStr = singDateStr;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public String getStartDateStr() {
        return startDateStr;
    }

    public void setStartDateStr(String startDateStr) {
        this.startDateStr = startDateStr;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getEndDateStr() {
        return endDateStr;
    }

    public void setEndDateStr(String endDateStr) {
        this.endDateStr = endDateStr;
    }

    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }

    public String getNature() {
        return nature;
    }

    public void setNature(String nature) {
        this.nature = nature;
    }

    public Integer getExpire() {
        return expire;
    }

    public void setExpire(Integer expire) {
        this.expire = expire;
    }

    public Date getPositiveDate() {
        return positiveDate;
    }

    public void setPositiveDate(Date positiveDate) {
        this.positiveDate = positiveDate;
    }

    public String getPositiveDateStr() {
        return positiveDateStr;
    }

    public void setPositiveDateStr(String positiveDateStr) {
        this.positiveDateStr = positiveDateStr;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDep() {
        return dep;
    }

    public void setDep(String dep) {
        this.dep = dep;
    }

    public String getPos() {
        return pos;
    }

    public void setPos(String pos) {
        this.pos = pos;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public Date getSoonLeaveDate() {
        return soonLeaveDate;
    }

    public void setSoonLeaveDate(Date soonLeaveDate) {
        this.soonLeaveDate = soonLeaveDate;
    }

    public String getSoonLeaveDateStr() {
        return soonLeaveDateStr;
    }

    public void setSoonLeaveDateStr(String soonLeaveDateStr) {
        this.soonLeaveDateStr = soonLeaveDateStr;
    }

    public Date getLeaveDate() {
        return LeaveDate;
    }

    public void setLeaveDate(Date leaveDate) {
        LeaveDate = leaveDate;
    }

    public String getLeaveDateStr() {
        return LeaveDateStr;
    }

    public void setLeaveDateStr(String leaveDateStr) {
        LeaveDateStr = leaveDateStr;
    }
}