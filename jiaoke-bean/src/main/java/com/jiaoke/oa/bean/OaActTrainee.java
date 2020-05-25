package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 毕业生见习期满考核鉴定表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_trainee")
public class OaActTrainee {

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
     * 单位
     */
    private String corporation;

    /**
     * 填表时间
     */
    private String fillingTime;

    /**
     * 姓名
     */
    private String name;

    /**
     * 性别
     */
    private String sex;

    /**
     * 出生年月
     */
    private String birthday;

    /**
     * 参加工作时间
     */
    private String workingHours;

    /**
     * 学历
     */
    private String education;

    /**
     * 何时毕业于何校
     */
    private String school;

    /**
     * 学制
     */
    private String schoolSystem;

    /**
     * 本人简（学）历
     */
    private String resume;

    /**
     * 大中专院校毕业见习期时间
     */
    private String internship;

    /**
     * 见习期工资
     */
    private String wages;

    /**
     * 自我鉴定
     */
    private String selfAccreditation;

    /**
     * 人事审查
     */
    private String personnelCensor;

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
     * 备注
     */
    private String remarks;

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

    public String getCorporation() {
        return corporation;
    }

    public void setCorporation(String corporation) {
        this.corporation = corporation;
    }

    public String getFillingTime() {
        return fillingTime;
    }

    public void setFillingTime(String fillingTime) {
        this.fillingTime = fillingTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getWorkingHours() {
        return workingHours;
    }

    public void setWorkingHours(String workingHours) {
        this.workingHours = workingHours;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getSchoolSystem() {
        return schoolSystem;
    }

    public void setSchoolSystem(String schoolSystem) {
        this.schoolSystem = schoolSystem;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

    public String getInternship() {
        return internship;
    }

    public void setInternship(String internship) {
        this.internship = internship;
    }

    public String getWages() {
        return wages;
    }

    public void setWages(String wages) {
        this.wages = wages;
    }

    public String getSelfAccreditation() {
        return selfAccreditation;
    }

    public void setSelfAccreditation(String selfAccreditation) {
        this.selfAccreditation = selfAccreditation;
    }

    public String getPersonnelCensor() {
        return personnelCensor;
    }

    public void setPersonnelCensor(String personnelCensor) {
        this.personnelCensor = personnelCensor;
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

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
