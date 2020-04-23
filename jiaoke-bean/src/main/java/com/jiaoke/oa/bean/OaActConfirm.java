package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;
import java.util.List;

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
     * 确认单详情
     */
    private List<OaConfirm> oaConfirmList;

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
     * 总经理审批时间
     */
    private String companyPrincipalDate;

    /**
     * 经营主管
     */
    private String businessSupervisor;

    /**
     * 经营主管审批时间
     */
    private String businessSupervisorDate;

    /**
     * 财务主管
     */
    private String financeSupervisor;

    /**
     * 财务主管审批时间
     */
    private String financeSupervisorDate;

    /**
     * 财务审核
     */
    private String financialAudit;

    /**
     * 财务审核时间
     */
    private String financialAuditDate;

    /**
     * 经营统计
     */
    private String operatingStatistics;

    /**
     * 经营统计时间
     */
    private String operatingStatisticsDate;

    /**
     * 状态
     */
    private Integer state;

    /**
     * 备注
     */
    private String remarks;

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

    public String getCompanyPrincipalDate() {
        return companyPrincipalDate;
    }

    public void setCompanyPrincipalDate(String companyPrincipalDate) {
        this.companyPrincipalDate = companyPrincipalDate;
    }

    public String getBusinessSupervisor() {
        return businessSupervisor;
    }

    public void setBusinessSupervisor(String businessSupervisor) {
        this.businessSupervisor = businessSupervisor;
    }

    public String getBusinessSupervisorDate() {
        return businessSupervisorDate;
    }

    public void setBusinessSupervisorDate(String businessSupervisorDate) {
        this.businessSupervisorDate = businessSupervisorDate;
    }

    public String getFinanceSupervisor() {
        return financeSupervisor;
    }

    public void setFinanceSupervisor(String financeSupervisor) {
        this.financeSupervisor = financeSupervisor;
    }

    public String getFinanceSupervisorDate() {
        return financeSupervisorDate;
    }

    public void setFinanceSupervisorDate(String financeSupervisorDate) {
        this.financeSupervisorDate = financeSupervisorDate;
    }

    public String getFinancialAudit() {
        return financialAudit;
    }

    public void setFinancialAudit(String financialAudit) {
        this.financialAudit = financialAudit;
    }

    public String getFinancialAuditDate() {
        return financialAuditDate;
    }

    public void setFinancialAuditDate(String financialAuditDate) {
        this.financialAuditDate = financialAuditDate;
    }

    public String getOperatingStatistics() {
        return operatingStatistics;
    }

    public void setOperatingStatistics(String operatingStatistics) {
        this.operatingStatistics = operatingStatistics;
    }

    public String getOperatingStatisticsDate() {
        return operatingStatisticsDate;
    }

    public void setOperatingStatisticsDate(String operatingStatisticsDate) {
        this.operatingStatisticsDate = operatingStatisticsDate;
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

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public List<OaConfirm> getOaConfirmList() {
        return oaConfirmList;
    }

    public void setOaConfirmList(List<OaConfirm> oaConfirmList) {
        this.oaConfirmList = oaConfirmList;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
