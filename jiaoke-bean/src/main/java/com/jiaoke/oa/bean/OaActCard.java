package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 饭卡申请单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_card")
public class OaActCard {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    private String id;

    /**
     * 标题
     */
    private String title;

    /**
     * 申请人
     */
    private String applicant;

    /**
     * 申请时间
     */
    private Date applyTime;
    @Transient
    private String applyTimeStr;

    /**
     * 所属单位
     */
    private String company;

    /**
     * 事由
     */
    private String reason;

    /**
     * 拟使用期限(开始)
     */
    private Date startTime;
    @Transient
    private String startTimeStr;

    /**
     * 拟使用期限(结束)
     */
    private Date endTime;
    @Transient
    private String endTimeStr;

    /**
     * 部门负责人审批内容
     */
    private String principalContent;
    /**
     * 部门负责人签字
     */
    private String principalSign;

    /**
     * 部门负责人签字时间
     */
    private String principalDate;

    /**
     * 部门主管审批内容
     */
    private String supervisorContent;

    /**
     * 部门主管签字
     */
    private String supervisorSign;

    /**
     * 部门主管签字时间
     */
    private String supervisorDate;

    /**
     * 主管部门负责人审批内容
     */
    private String directorContent;

    /**
     * 主管部门负责人签字
     */
    private String directorSign;

    /**
     * 主管部门负责人签字时间
     */
    private String directorDate;

    /**
     * 附件
     */
    private String annex;

    /**
     * 创建日期
     */
    private Date createTime;
    @Transient
    private String createTimeStr;

    /**
     * 发起人
     */
    private Integer promoter;
    @Transient
    private String promoterStr;

    /**
     * 查询路径
     */
    private String url;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getApplicant() {
        return applicant;
    }

    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }

    public Date getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }

    public String getApplyTimeStr() {
        return applyTimeStr;
    }

    public void setApplyTimeStr(String applyTimeStr) {
        this.applyTimeStr = applyTimeStr;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public String getStartTimeStr() {
        return startTimeStr;
    }

    public void setStartTimeStr(String startTimeStr) {
        this.startTimeStr = startTimeStr;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getEndTimeStr() {
        return endTimeStr;
    }

    public void setEndTimeStr(String endTimeStr) {
        this.endTimeStr = endTimeStr;
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

    public Integer getPromoter() {
        return promoter;
    }

    public void setPromoter(Integer promoter) {
        this.promoter = promoter;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPrincipalContent() {
        return principalContent;
    }

    public void setPrincipalContent(String principalContent) {
        this.principalContent = principalContent;
    }

    public String getPrincipalSign() {
        return principalSign;
    }

    public void setPrincipalSign(String principalSign) {
        this.principalSign = principalSign;
    }

    public String getPrincipalDate() {
        return principalDate;
    }

    public void setPrincipalDate(String principalDate) {
        this.principalDate = principalDate;
    }

    public String getSupervisorContent() {
        return supervisorContent;
    }

    public void setSupervisorContent(String supervisorContent) {
        this.supervisorContent = supervisorContent;
    }

    public String getSupervisorSign() {
        return supervisorSign;
    }

    public void setSupervisorSign(String supervisorSign) {
        this.supervisorSign = supervisorSign;
    }

    public String getSupervisorDate() {
        return supervisorDate;
    }

    public void setSupervisorDate(String supervisorDate) {
        this.supervisorDate = supervisorDate;
    }

    public String getDirectorContent() {
        return directorContent;
    }

    public void setDirectorContent(String directorContent) {
        this.directorContent = directorContent;
    }

    public String getDirectorSign() {
        return directorSign;
    }

    public void setDirectorSign(String directorSign) {
        this.directorSign = directorSign;
    }

    public String getDirectorDate() {
        return directorDate;
    }

    public void setDirectorDate(String directorDate) {
        this.directorDate = directorDate;
    }

    public String getAnnex() {
        return annex;
    }

    public void setAnnex(String annex) {
        this.annex = annex;
    }

    public String getPromoterStr() {
        return promoterStr;
    }

    public void setPromoterStr(String promoterStr) {
        this.promoterStr = promoterStr;
    }
}
