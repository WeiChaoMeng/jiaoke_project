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
    private String applyTime;

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
    private String startTime;

    /**
     * 拟使用期限(结束)
     */
    private String endTime;

    /**
     * 部门负责人审批内容
     */
    private String principalContent;

    /**
     * 部门负责人签字
     */
    private String principal;

    /**
     * 部门负责人签字时间
     */
    private String principalDate;

    /**
     * 部门负责人审批内容
     */
    private String principalContentT;

    /**
     * 部门负责人签字
     */
    private String principalT;

    /**
     * 部门负责人签字时间
     */
    private String principalDateT;

    /**
     * 部门主管审批内容
     */
    private String supervisorContent;

    /**
     * 部门主管签字
     */
    private String supervisor;

    /**
     * 部门主管签字时间
     */
    private String supervisorDate;

    /**
     * 主管部门负责人审批内容
     */
    private String cardApprovalContent;

    /**
     * 主管部门负责人签字
     */
    private String cardApproval;

    /**
     * 主管部门负责人签字时间
     */
    private String cardApprovalDate;

    /**
     * 部门负责人
     */
    private String departmentPrincipal;

    /**
     * 状态
     */
    private Integer state;

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

    public String getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(String applyTime) {
        this.applyTime = applyTime;
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

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getPrincipalContent() {
        return principalContent;
    }

    public void setPrincipalContent(String principalContent) {
        this.principalContent = principalContent;
    }

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
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

    public String getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(String supervisor) {
        this.supervisor = supervisor;
    }

    public String getSupervisorDate() {
        return supervisorDate;
    }

    public void setSupervisorDate(String supervisorDate) {
        this.supervisorDate = supervisorDate;
    }

    public String getCardApprovalContent() {
        return cardApprovalContent;
    }

    public void setCardApprovalContent(String cardApprovalContent) {
        this.cardApprovalContent = cardApprovalContent;
    }

    public String getCardApproval() {
        return cardApproval;
    }

    public void setCardApproval(String cardApproval) {
        this.cardApproval = cardApproval;
    }

    public String getCardApprovalDate() {
        return cardApprovalDate;
    }

    public void setCardApprovalDate(String cardApprovalDate) {
        this.cardApprovalDate = cardApprovalDate;
    }

    public String getAnnex() {
        return annex;
    }

    public void setAnnex(String annex) {
        this.annex = annex;
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

    public String getPromoterStr() {
        return promoterStr;
    }

    public void setPromoterStr(String promoterStr) {
        this.promoterStr = promoterStr;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }


    public String getDepartmentPrincipal() {
        return departmentPrincipal;
    }

    public void setDepartmentPrincipal(String departmentPrincipal) {
        this.departmentPrincipal = departmentPrincipal;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getPrincipalContentT() {
        return principalContentT;
    }

    public void setPrincipalContentT(String principalContentT) {
        this.principalContentT = principalContentT;
    }

    public String getPrincipalT() {
        return principalT;
    }

    public void setPrincipalT(String principalT) {
        this.principalT = principalT;
    }

    public String getPrincipalDateT() {
        return principalDateT;
    }

    public void setPrincipalDateT(String principalDateT) {
        this.principalDateT = principalDateT;
    }
}
