package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 确认单审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_confirm")
public class OaActConfirm {

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
     * 经办部门
     */
    private String department;

    /**
     * 经办人
     */
    private String operator;

    /**
     * 确认名称
     */
    private String name;

    /**
     * 确认金额（元）
     */
    private String money;

    /**
     * 品种
     */
    private String variety;

    /**
     * 单价
     */
    private String univalent;

    /**
     * 数量
     */
    private String number;

    /**
     * 是否与ERP一致
     */
    private String erp;

    /**
     * 是否与合同一致
     */
    private String contract;

    /**
     * 单位（全称）
     */
    private String unit;

    /**
     * 工程名称（全称）
     */
    private String projectName;

    /**
     * 审批时间
     */
    private String approvalTime;

    /**
     * 总经理
     */
    private String companyPrincipal;

    /**
     * 经营主管
     */
    private String businessSupervisor;

    /**
     * 财务主管
     */
    private String financeSupervisor;

    /**
     * 财务审核
     */
    private String financialAudit;

    /**
     * 经营统计
     */
    private String operatingStatistics;

    /**
     * 业务
     */
    private String business;

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

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getVariety() {
        return variety;
    }

    public void setVariety(String variety) {
        this.variety = variety;
    }

    public String getUnivalent() {
        return univalent;
    }

    public void setUnivalent(String univalent) {
        this.univalent = univalent;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getErp() {
        return erp;
    }

    public void setErp(String erp) {
        this.erp = erp;
    }

    public String getContract() {
        return contract;
    }

    public void setContract(String contract) {
        this.contract = contract;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getApprovalTime() {
        return approvalTime;
    }

    public void setApprovalTime(String approvalTime) {
        this.approvalTime = approvalTime;
    }

    public String getCompanyPrincipal() {
        return companyPrincipal;
    }

    public void setCompanyPrincipal(String companyPrincipal) {
        this.companyPrincipal = companyPrincipal;
    }

    public String getBusinessSupervisor() {
        return businessSupervisor;
    }

    public void setBusinessSupervisor(String businessSupervisor) {
        this.businessSupervisor = businessSupervisor;
    }

    public String getFinanceSupervisor() {
        return financeSupervisor;
    }

    public void setFinanceSupervisor(String financeSupervisor) {
        this.financeSupervisor = financeSupervisor;
    }

    public String getFinancialAudit() {
        return financialAudit;
    }

    public void setFinancialAudit(String financialAudit) {
        this.financialAudit = financialAudit;
    }

    public String getOperatingStatistics() {
        return operatingStatistics;
    }

    public void setOperatingStatistics(String operatingStatistics) {
        this.operatingStatistics = operatingStatistics;
    }

    public String getBusiness() {
        return business;
    }

    public void setBusiness(String business) {
        this.business = business;
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
}
