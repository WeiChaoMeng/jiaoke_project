package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 合同审查表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_review")
public class OaActReview {

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
     * 合同名称
     */
    private String name;

    /**
     * 编号
     */
    private String numbering;

    /**
     * 合同相对人
     */
    private String relative;

    /**
     * 合同金额
     */
    private String amount;

    /**
     * 合同编号
     */
    private String number;

    /**
     * 部门负责人
     */
    private String principal;

    /**
     * 部门负责人审批时间
     */
    private String principalDate;

    /**
     * 法务审查内容
     */
    private String legalAffairsContent;

    /**
     * 法务审查签字
     */
    private String legalAffairs;

    /**
     * 法务审查时间
     */
    private String legalAffairsDate;

    /**
     * 财务部门审查内容
     */
    private String financeContent;

    /**
     * 财务部门审查签字
     */
    private String finance;

    /**
     * 财务部门审查时间
     */
    private String financeDate;

    /**
     * 主管领导审查内容
     */
    private String supervisorContent;

    /**
     * 主管领导审查签字
     */
    private String supervisor;

    /**
     * 主管领导审查时间
     */
    private String supervisorDate;

    /**
     * 主要领导审查内容
     */
    private String companyPrincipalContent;

    /**
     * 主要领导审查签字
     */
    private String companyPrincipal;

    /**
     * 主要领导审查时间
     */
    private String companyPrincipalDate;

    /**
     * 部门负责人
     */
    private String departmentPrincipal;

    /**
     * 状态
     */
    private Integer state;

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

    /**
     * 附件
     */
    private String annex;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumbering() {
        return numbering;
    }

    public void setNumbering(String numbering) {
        this.numbering = numbering;
    }

    public String getRelative() {
        return relative;
    }

    public void setRelative(String relative) {
        this.relative = relative;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
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

    public String getLegalAffairsContent() {
        return legalAffairsContent;
    }

    public void setLegalAffairsContent(String legalAffairsContent) {
        this.legalAffairsContent = legalAffairsContent;
    }

    public String getLegalAffairs() {
        return legalAffairs;
    }

    public void setLegalAffairs(String legalAffairs) {
        this.legalAffairs = legalAffairs;
    }

    public String getLegalAffairsDate() {
        return legalAffairsDate;
    }

    public void setLegalAffairsDate(String legalAffairsDate) {
        this.legalAffairsDate = legalAffairsDate;
    }

    public String getFinanceContent() {
        return financeContent;
    }

    public void setFinanceContent(String financeContent) {
        this.financeContent = financeContent;
    }

    public String getFinance() {
        return finance;
    }

    public void setFinance(String finance) {
        this.finance = finance;
    }

    public String getFinanceDate() {
        return financeDate;
    }

    public void setFinanceDate(String financeDate) {
        this.financeDate = financeDate;
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

    public String getCompanyPrincipalContent() {
        return companyPrincipalContent;
    }

    public void setCompanyPrincipalContent(String companyPrincipalContent) {
        this.companyPrincipalContent = companyPrincipalContent;
    }

    public String getCompanyPrincipal() {
        return companyPrincipal;
    }

    public void setCompanyPrincipal(String companyPrincipal) {
        this.companyPrincipal = companyPrincipal;
    }

    public String getCompanyPrincipalDate() {
        return companyPrincipalDate;
    }

    public void setCompanyPrincipalDate(String companyPrincipalDate) {
        this.companyPrincipalDate = companyPrincipalDate;
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

    public String getAnnex() {
        return annex;
    }

    public void setAnnex(String annex) {
        this.annex = annex;
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
}
