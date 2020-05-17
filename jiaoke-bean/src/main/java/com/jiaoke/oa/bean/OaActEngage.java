package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 职称（技术等级）评聘申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_engage")
public class OaActEngage {

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
     * 申请人姓名
     */
    private String applicant;

    /**
     * 所在部门及岗位
     */
    private String department;

    /**
     * 拟评聘职称（技术等级）名称
     */
    private String undoutedly;

    /**
     * 考试时间
     */
    private String examTime;

    /**
     * 证书取得时间
     */
    private String certificate;

    /**
     * 本人签字
     */
    private String signature;

    /**
     * 人事审查
     */
    private String personnelCensor;

    /**
     * 部门负责人
     */
    private String principal;

    /**
     * 部门负责人审批时间
     */
    private String principalDate;

    /**
     * 部门负责人审批内容
     */
    private String principalContent;

    /**
     * 部门主管领导
     */
    private String supervisor;

    /**
     * 部门主管领导审批时间
     */
    private String supervisorDate;

    /**
     * 部门主管领导审批内容
     */
    private String supervisorContent;

    /**
     * 人事主管
     */
    private String personnel;

    /**
     * 人事主管审批时间
     */
    private String personnelDate;

    /**
     * 人事主管审批内容
     */
    private String personnelContent;

    /**
     * 总经理
     */
    private String companyPrincipal;

    /**
     * 总经理审批时间
     */
    private String companyPrincipalDate;

    /**
     * 总经理审批内容
     */
    private String companyPrincipalContent;

    /**
     * 评聘小组意见
     */
    private String undoutedlyTeam;
    private String undoutedlyTeamDate;

    /**
     * 聘用职称（技术等级）名称
     */
    private String rankName;

    /**
     * 享受职称（技术等级）津贴时间
     */
    private String rankAllowance;
    private String rankDate;

    private String principalContentT;
    private String principalT;
    private String principalDateT;
    private String personnelCensorT;
    private String personnelCommissioner;

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

    public String getApplicant() {
        return applicant;
    }

    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPersonnelCensor() {
        return personnelCensor;
    }

    public void setPersonnelCensor(String personnelCensor) {
        this.personnelCensor = personnelCensor;
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

    public String getPrincipalContent() {
        return principalContent;
    }

    public void setPrincipalContent(String principalContent) {
        this.principalContent = principalContent;
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

    public String getSupervisorContent() {
        return supervisorContent;
    }

    public void setSupervisorContent(String supervisorContent) {
        this.supervisorContent = supervisorContent;
    }

    public String getPersonnel() {
        return personnel;
    }

    public void setPersonnel(String personnel) {
        this.personnel = personnel;
    }

    public String getPersonnelDate() {
        return personnelDate;
    }

    public void setPersonnelDate(String personnelDate) {
        this.personnelDate = personnelDate;
    }

    public String getPersonnelContent() {
        return personnelContent;
    }

    public void setPersonnelContent(String personnelContent) {
        this.personnelContent = personnelContent;
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

    public String getCompanyPrincipalContent() {
        return companyPrincipalContent;
    }

    public void setCompanyPrincipalContent(String companyPrincipalContent) {
        this.companyPrincipalContent = companyPrincipalContent;
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

    public String getPersonnelCensorT() {
        return personnelCensorT;
    }

    public void setPersonnelCensorT(String personnelCensorT) {
        this.personnelCensorT = personnelCensorT;
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

    public String getUndoutedly() {
        return undoutedly;
    }

    public void setUndoutedly(String undoutedly) {
        this.undoutedly = undoutedly;
    }

    public String getExamTime() {
        return examTime;
    }

    public void setExamTime(String examTime) {
        this.examTime = examTime;
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getUndoutedlyTeam() {
        return undoutedlyTeam;
    }

    public void setUndoutedlyTeam(String undoutedlyTeam) {
        this.undoutedlyTeam = undoutedlyTeam;
    }

    public String getRankName() {
        return rankName;
    }

    public void setRankName(String rankName) {
        this.rankName = rankName;
    }

    public String getRankAllowance() {
        return rankAllowance;
    }

    public void setRankAllowance(String rankAllowance) {
        this.rankAllowance = rankAllowance;
    }

    public String getRankDate() {
        return rankDate;
    }

    public void setRankDate(String rankDate) {
        this.rankDate = rankDate;
    }

    public String getUndoutedlyTeamDate() {
        return undoutedlyTeamDate;
    }

    public void setUndoutedlyTeamDate(String undoutedlyTeamDate) {
        this.undoutedlyTeamDate = undoutedlyTeamDate;
    }

    public String getPersonnelCommissioner() {
        return personnelCommissioner;
    }

    public void setPersonnelCommissioner(String personnelCommissioner) {
        this.personnelCommissioner = personnelCommissioner;
    }
}
