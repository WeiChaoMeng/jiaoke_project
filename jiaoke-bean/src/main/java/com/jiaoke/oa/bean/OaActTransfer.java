package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 转岗申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_transfer")
public class OaActTransfer {

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
     * 申请日期
     */
    private String fillingDate;

    /**
     * 姓名
     */
    private String name;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 入职时间
     */
    private String entryDate;

    /**
     * 现部门
     */
    private String presentDepartment;

    /**
     * 现岗位
     */
    private String presentPost;

    /**
     * 拟转入部门
     */
    private String newDepartment;
    @Transient
    private String newDepartmentStr;


    /**
     * 拟转入岗位
     */
    private String newPost;

    /**
     * 转岗事由
     */
    private String cause;

    /**
     * 人事审查（不做审批处理）
     */
    private String personnelCensor;

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
     * 转入部门负责人审批内容
     */
    private String transferPrincipalContent;

    /**
     * 转入部门负责人签字
     */
    private String transferPrincipal;

    /**
     * 转入部门负责人签字时间
     */
    private String transferPrincipalDate;

    /**
     * 转入部门负责人审批内容
     */
    private String transferPrincipalContentT;

    /**
     * 转入部门负责人签字
     */
    private String transferPrincipalT;

    /**
     * 转入部门负责人签字时间
     */
    private String transferPrincipalDateT;

    /**
     * 转入部门主管审批内容
     */
    private String transferSupervisorContent;

    /**
     * 转入部门主管签字
     */
    private String transferSupervisor;

    /**
     * 转入部门主管签字时间
     */
    private String transferSupervisorDate;

    /**
     * 组织人事部审批内容
     */
    private String personnelContent;

    /**
     * 组织人事部签字
     */
    private String personnel;

    /**
     * 组织人事部签字时间
     */
    private String personnelDate;

    /**
     * 总经理审批内容
     */
    private String companyPrincipalContent;

    /**
     * 总经理签字
     */
    private String companyPrincipal;

    /**
     * 总经理签字时间
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

    public String getFillingDate() {
        return fillingDate;
    }

    public void setFillingDate(String fillingDate) {
        this.fillingDate = fillingDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(String entryDate) {
        this.entryDate = entryDate;
    }

    public String getPresentDepartment() {
        return presentDepartment;
    }

    public void setPresentDepartment(String presentDepartment) {
        this.presentDepartment = presentDepartment;
    }

    public String getPresentPost() {
        return presentPost;
    }

    public void setPresentPost(String presentPost) {
        this.presentPost = presentPost;
    }

    public String getNewDepartment() {
        return newDepartment;
    }

    public void setNewDepartment(String newDepartment) {
        this.newDepartment = newDepartment;
    }

    public String getNewPost() {
        return newPost;
    }

    public void setNewPost(String newPost) {
        this.newPost = newPost;
    }

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
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

    public String getTransferPrincipalContent() {
        return transferPrincipalContent;
    }

    public void setTransferPrincipalContent(String transferPrincipalContent) {
        this.transferPrincipalContent = transferPrincipalContent;
    }

    public String getTransferPrincipal() {
        return transferPrincipal;
    }

    public void setTransferPrincipal(String transferPrincipal) {
        this.transferPrincipal = transferPrincipal;
    }

    public String getTransferPrincipalDate() {
        return transferPrincipalDate;
    }

    public void setTransferPrincipalDate(String transferPrincipalDate) {
        this.transferPrincipalDate = transferPrincipalDate;
    }

    public String getTransferSupervisorContent() {
        return transferSupervisorContent;
    }

    public void setTransferSupervisorContent(String transferSupervisorContent) {
        this.transferSupervisorContent = transferSupervisorContent;
    }

    public String getTransferSupervisor() {
        return transferSupervisor;
    }

    public void setTransferSupervisor(String transferSupervisor) {
        this.transferSupervisor = transferSupervisor;
    }

    public String getTransferSupervisorDate() {
        return transferSupervisorDate;
    }

    public void setTransferSupervisorDate(String transferSupervisorDate) {
        this.transferSupervisorDate = transferSupervisorDate;
    }

    public String getPersonnelContent() {
        return personnelContent;
    }

    public void setPersonnelContent(String personnelContent) {
        this.personnelContent = personnelContent;
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

    public String getNewDepartmentStr() {
        return newDepartmentStr;
    }

    public void setNewDepartmentStr(String newDepartmentStr) {
        this.newDepartmentStr = newDepartmentStr;
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

    public String getTransferPrincipalContentT() {
        return transferPrincipalContentT;
    }

    public void setTransferPrincipalContentT(String transferPrincipalContentT) {
        this.transferPrincipalContentT = transferPrincipalContentT;
    }

    public String getTransferPrincipalT() {
        return transferPrincipalT;
    }

    public void setTransferPrincipalT(String transferPrincipalT) {
        this.transferPrincipalT = transferPrincipalT;
    }

    public String getTransferPrincipalDateT() {
        return transferPrincipalDateT;
    }

    public void setTransferPrincipalDateT(String transferPrincipalDateT) {
        this.transferPrincipalDateT = transferPrincipalDateT;
    }
}
