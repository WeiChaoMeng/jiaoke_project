package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 印章使用审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_seals_use")
public class OaActSealsUse {

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
     * 编号
     */
    private String number;

    /**
     * 申请人
     */
    private String applicant;

    /**
     * 印章种类印章种类(0、路驰公章，1、路驰合同章，2、路驰党支部章，3、路驰工会章，4、大兴公章，5、大兴合同章)
     */
    private Integer seal;

    /**
     * 申请文件名称
     */
    private String name;

    /**
     * 部门负责人
     */
    private String principal;

    /**
     * 部门负责人审批时间
     */
    private String principalDate;

    /**
     * 部门主管领导
     */
    private String supervisor;

    /**
     * 部门主管领导审批时间
     */
    private String supervisorDate;

    /**
     * 印章管理部门主管领导
     */
    private String sealSupervisor;

    /**
     * 印章管理部门主管领导审批时间
     */
    private String sealSupervisorDate;

    /**
     * 盖章人
     */
    private String sealOperator;

    /**
     * 盖章人审批时间
     */
    private String sealOperatorDate;

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

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getApplicant() {
        return applicant;
    }

    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }

    public Integer getSeal() {
        return seal;
    }

    public void setSeal(Integer seal) {
        this.seal = seal;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getSealSupervisor() {
        return sealSupervisor;
    }

    public void setSealSupervisor(String sealSupervisor) {
        this.sealSupervisor = sealSupervisor;
    }

    public String getSealSupervisorDate() {
        return sealSupervisorDate;
    }

    public void setSealSupervisorDate(String sealSupervisorDate) {
        this.sealSupervisorDate = sealSupervisorDate;
    }

    public String getSealOperator() {
        return sealOperator;
    }

    public void setSealOperator(String sealOperator) {
        this.sealOperator = sealOperator;
    }

    public String getSealOperatorDate() {
        return sealOperatorDate;
    }

    public void setSealOperatorDate(String sealOperatorDate) {
        this.sealOperatorDate = sealOperatorDate;
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
