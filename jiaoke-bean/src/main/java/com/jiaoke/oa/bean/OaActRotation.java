package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 员工轮岗审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_rotation")
public class OaActRotation {

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
     * 性别
     */
    private Integer sex;

    /**
     * 出生日期
     */
    private String birthday;

    /**
     * 名族
     */
    private String ethnic;

    /**
     * 学历
     */
    private Integer education;

    /**
     * 专业
     */
    private String major;

    /**
     * 所在部门
     */
    private String department;

    /**
     * 现工作单位
     */
    private String presentPost;

    /**
     * 担任本岗位起始时间
     */
    private String startingTime;

    /**
     * 拟转入部门
     */
    private String newDepartment;
    @Transient
    private String newDepartmentStr;

    /**
     * 调整原因
     */
    private Integer adjust;

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

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getEthnic() {
        return ethnic;
    }

    public void setEthnic(String ethnic) {
        this.ethnic = ethnic;
    }

    public Integer getEducation() {
        return education;
    }

    public void setEducation(Integer education) {
        this.education = education;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPresentPost() {
        return presentPost;
    }

    public void setPresentPost(String presentPost) {
        this.presentPost = presentPost;
    }

    public String getStartingTime() {
        return startingTime;
    }

    public void setStartingTime(String startingTime) {
        this.startingTime = startingTime;
    }

    public String getNewDepartment() {
        return newDepartment;
    }

    public void setNewDepartment(String newDepartment) {
        this.newDepartment = newDepartment;
    }

    public String getNewDepartmentStr() {
        return newDepartmentStr;
    }

    public void setNewDepartmentStr(String newDepartmentStr) {
        this.newDepartmentStr = newDepartmentStr;
    }

    public Integer getAdjust() {
        return adjust;
    }

    public void setAdjust(Integer adjust) {
        this.adjust = adjust;
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
}
