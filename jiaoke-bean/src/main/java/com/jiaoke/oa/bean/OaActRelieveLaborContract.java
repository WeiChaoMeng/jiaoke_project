package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 解除劳动合同审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_relieve_labor_contract")
public class OaActRelieveLaborContract {

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
     * 名字
     */
    private String name;

    /**
     * 入职时间
     */
    private String entryDate;

    /**
     * 部门及职位
     */
    private String departmentPosition;

    /**
     * 申请离职日期
     */
    private String applyDepartureDate;

    /**
     * 解除类型
     */
    private Integer relieveType;

    /**
     * 解除劳动合同原因
     */
    private String reason;

    /**
     * 人事审查（不做审批处理）
     */
    private String personnelCensor;

    /**
     * 部门负责人
     */
    private String principal;

    /**
     * 部门负责人审批内容
     */
    private String principalContent;

    /**
     * 部门负责人审批时间
     */
    private String principalDate;

    /**
     * 部门负责人
     */
    private String principalT;

    /**
     * 部门负责人审批内容
     */
    private String principalContentT;

    /**
     * 部门负责人审批时间
     */
    private String principalDateT;

    /**
     * 部门主管领导
     */
    private String supervisor;

    /**
     * 部门主管领导审批内容
     */
    private String supervisorContent;

    /**
     * 部门主管领导审批时间
     */
    private String supervisorDate;

    /**
     * 人事部门
     */
    private String personnel;

    /**
     * 人事部门审批内容
     */
    private String personnelContent;

    /**
     * 人事部门审批时间
     */
    private String personnelDate;

    /**
     * 总经理
     */
    private String companyPrincipal;

    /**
     * 总经理审批内容
     */
    private String companyPrincipalContent;

    /**
     * 总经理审批时间
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(String entryDate) {
        this.entryDate = entryDate;
    }

    public String getDepartmentPosition() {
        return departmentPosition;
    }

    public void setDepartmentPosition(String departmentPosition) {
        this.departmentPosition = departmentPosition;
    }

    public String getApplyDepartureDate() {
        return applyDepartureDate;
    }

    public void setApplyDepartureDate(String applyDepartureDate) {
        this.applyDepartureDate = applyDepartureDate;
    }

    public Integer getRelieveType() {
        return relieveType;
    }

    public void setRelieveType(Integer relieveType) {
        this.relieveType = relieveType;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public String getPrincipalContent() {
        return principalContent;
    }

    public void setPrincipalContent(String principalContent) {
        this.principalContent = principalContent;
    }

    public String getPrincipalDate() {
        return principalDate;
    }

    public void setPrincipalDate(String principalDate) {
        this.principalDate = principalDate;
    }

    public String getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(String supervisor) {
        this.supervisor = supervisor;
    }

    public String getSupervisorContent() {
        return supervisorContent;
    }

    public void setSupervisorContent(String supervisorContent) {
        this.supervisorContent = supervisorContent;
    }

    public String getSupervisorDate() {
        return supervisorDate;
    }

    public void setSupervisorDate(String supervisorDate) {
        this.supervisorDate = supervisorDate;
    }

    public String getPersonnel() {
        return personnel;
    }

    public void setPersonnel(String personnel) {
        this.personnel = personnel;
    }

    public String getPersonnelContent() {
        return personnelContent;
    }

    public void setPersonnelContent(String personnelContent) {
        this.personnelContent = personnelContent;
    }

    public String getPersonnelDate() {
        return personnelDate;
    }

    public void setPersonnelDate(String personnelDate) {
        this.personnelDate = personnelDate;
    }

    public String getCompanyPrincipal() {
        return companyPrincipal;
    }

    public void setCompanyPrincipal(String companyPrincipal) {
        this.companyPrincipal = companyPrincipal;
    }

    public String getCompanyPrincipalContent() {
        return companyPrincipalContent;
    }

    public void setCompanyPrincipalContent(String companyPrincipalContent) {
        this.companyPrincipalContent = companyPrincipalContent;
    }

    public String getCompanyPrincipalDate() {
        return companyPrincipalDate;
    }

    public void setCompanyPrincipalDate(String companyPrincipalDate) {
        this.companyPrincipalDate = companyPrincipalDate;
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

    public String getPersonnelCensor() {
        return personnelCensor;
    }

    public void setPersonnelCensor(String personnelCensor) {
        this.personnelCensor = personnelCensor;
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

    public String getPrincipalT() {
        return principalT;
    }

    public void setPrincipalT(String principalT) {
        this.principalT = principalT;
    }

    public String getPrincipalContentT() {
        return principalContentT;
    }

    public void setPrincipalContentT(String principalContentT) {
        this.principalContentT = principalContentT;
    }

    public String getPrincipalDateT() {
        return principalDateT;
    }

    public void setPrincipalDateT(String principalDateT) {
        this.principalDateT = principalDateT;
    }
}
