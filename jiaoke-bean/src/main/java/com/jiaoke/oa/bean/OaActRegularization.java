package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 转正申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_regularization")
public class OaActRegularization {

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
     * 姓名
     */
    private String name;

    /**
     * 部门
     */
    private String department;

    /**
     * 职务
     */
    private String position;

    /**
     * 学历
     */
    private Integer education;

    /**
     * 入职时间
     */
    private Date entryDate;
    @Transient
    private String entryDateStr;

    /**
     * 试用期时间
     */
    private Date probationPeriod;
    @Transient
    private String probationPeriodStr;

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
     * 部门管理主管审批内容
     */
    private String supervisorContent;

    /**
     * 部门管理主管签字
     */
    private String supervisorSign;

    /**
     * 部门管理主管签字时间
     */
    private String supervisorDate;

    /**
     * 组织人事部审批内容
     */
    private String personnelContent;

    /**
     * 组织人事部签字
     */
    private String personnelSign;

    /**
     * 组织人事部签字时间
     */
    private String personnelDate;

    /**
     * 总经理审批内容
     */
    private String presidentContent;

    /**
     * 总经理签字
     */
    private String presidentSign;

    /**
     * 总经理签字时间
     */
    private String presidentDate;

    /**
     * 自我评价
     */
    private String selfAssessment;

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

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Integer getEducation() {
        return education;
    }

    public void setEducation(Integer education) {
        this.education = education;
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

    public Date getProbationPeriod() {
        return probationPeriod;
    }

    public void setProbationPeriod(Date probationPeriod) {
        this.probationPeriod = probationPeriod;
    }

    public String getProbationPeriodStr() {
        return probationPeriodStr;
    }

    public void setProbationPeriodStr(String probationPeriodStr) {
        this.probationPeriodStr = probationPeriodStr;
    }

    public String getSelfAssessment() {
        return selfAssessment;
    }

    public void setSelfAssessment(String selfAssessment) {
        this.selfAssessment = selfAssessment;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPromoterStr() {
        return promoterStr;
    }

    public void setPromoterStr(String promoterStr) {
        this.promoterStr = promoterStr;
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

    public String getPersonnelContent() {
        return personnelContent;
    }

    public void setPersonnelContent(String personnelContent) {
        this.personnelContent = personnelContent;
    }

    public String getPersonnelSign() {
        return personnelSign;
    }

    public void setPersonnelSign(String personnelSign) {
        this.personnelSign = personnelSign;
    }

    public String getPersonnelDate() {
        return personnelDate;
    }

    public void setPersonnelDate(String personnelDate) {
        this.personnelDate = personnelDate;
    }

    public String getPresidentContent() {
        return presidentContent;
    }

    public void setPresidentContent(String presidentContent) {
        this.presidentContent = presidentContent;
    }

    public String getPresidentSign() {
        return presidentSign;
    }

    public void setPresidentSign(String presidentSign) {
        this.presidentSign = presidentSign;
    }

    public String getPresidentDate() {
        return presidentDate;
    }

    public void setPresidentDate(String presidentDate) {
        this.presidentDate = presidentDate;
    }
}
