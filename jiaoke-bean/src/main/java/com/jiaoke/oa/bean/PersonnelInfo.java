package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 人员信息表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "personnel_info")
public class PersonnelInfo {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 部门
     */
    private String department;

    /**
     * 岗位类别：0.高层经营管理人员、1.中层经营管理人员、2.一般经营管理人员、3.专业技术人员、4.技能操作人员
     */
    private Integer jobCategory;

    /**
     * 职务（岗位）
     */
    private String job;

    /**
     * 姓名
     */
    private String name;

    /**
     * 性别：0.男、1.女
     */
    private Integer sex;

    /**
     * 身份证号
     */
    private String idCard;

    /**
     * 出生日期
     */
    private Date birthday;
    @Transient
    private String birthdayStr;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 名族
     */
    private String nation;

    /**
     * 籍贯
     */
    private String nativePlace;

    /**
     * 户口所在地
     */
    private String registeredResidence;

    /**
     * 联系电话
     */
    private String phone;

    /**
     * 政治面貌: 0.中共党员、1.团员、2.群众
     */
    private Integer politicCountenance;

    /**
     * 入党时间（年月）
     */
    private Date joinPartyDate;
    @Transient
    private String joinPartyDateStr;

    /**
     * 参加工作时间（年月）
     */
    private Date joinWorkDate;
    @Transient
    private String joinWorkDateStr;

    /**
     * 工作年限
     */
    private String workingYears;

    /**
     * 职称级别
     */
    private String titleLevel;

    /**
     * 职称系列
     */
    private String titleSeries;

    /**
     * 职称名称
     */
    private String titleName;

    /**
     * 工种名称
     */
    private String professionName;

    /**
     * 工人技术等级
     */
    private String technologyGrade;

    /**
     * 原学历:0.初中及以下，1.高中，2.技校，3.中专，4.专科，5.本科，6.硕士，7.博士
     */
    private Integer originalEducation;

    /**
     * 原学位:0.学士，1.硕士，2.博士、3.博士后
     */
    private Integer originalDegree;

    /**
     * 原毕业学校
     */
    private String originalGraduationSchool;

    /**
     * 原专业
     */
    private String originalProfession;

    /**
     * 原毕业时间
     */
    private Date originalGraduationDate;
    @Transient
    private String originalGraduationDateStr;

    /**
     * 现学历:0.初中及以下，1.高中，2.技校，3.中专，4.专科，5.本科，6.硕士，7.博士
     */
    private Integer nowEducation;

    /**
     * 现学位:0.学士，1.硕士，2.博士、3.博士后
     */
    private Integer nowDegree;

    /**
     * 现毕业学校
     */
    private String nowGraduationSchool;

    /**
     * 现专业
     */
    private String nowProfession;

    /**
     * 现毕业时间
     */
    private Date nowGraduationDate;
    @Transient
    private String nowGraduationDateStr;

    /**
     * 其他证书
     */
    private String otherCertificates;

    /**
     * 在岗情况
     */
    private String postSituation;

    /**
     * 用工类型:0.自由职工，1.外包职工
     */
    private Integer workType;

    /**
     * 转正时间
     */
    private Date correctionDate;
    @Transient
    private String correctionDateStr;

    /**
     * 预计退休时间
     */
    private Date estimateRetirementDate;
    @Transient
    private String estimateRetirementDateStr;

    /**
     * 退休时间
     */
    private Date retirementDate;
    @Transient
    private String retirementDateStr;

    /**
     * 身体情况
     */
    private String physicalCondition;

    /**
     * 退休单位
     */
    private String retirementCompany;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public Integer getJobCategory() {
        return jobCategory;
    }

    public void setJobCategory(Integer jobCategory) {
        this.jobCategory = jobCategory;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
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

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getBirthdayStr() {
        return birthdayStr;
    }

    public void setBirthdayStr(String birthdayStr) {
        this.birthdayStr = birthdayStr;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getNativePlace() {
        return nativePlace;
    }

    public void setNativePlace(String nativePlace) {
        this.nativePlace = nativePlace;
    }

    public String getRegisteredResidence() {
        return registeredResidence;
    }

    public void setRegisteredResidence(String registeredResidence) {
        this.registeredResidence = registeredResidence;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getPoliticCountenance() {
        return politicCountenance;
    }

    public void setPoliticCountenance(Integer politicCountenance) {
        this.politicCountenance = politicCountenance;
    }

    public Date getJoinPartyDate() {
        return joinPartyDate;
    }

    public void setJoinPartyDate(Date joinPartyDate) {
        this.joinPartyDate = joinPartyDate;
    }

    public String getJoinPartyDateStr() {
        return joinPartyDateStr;
    }

    public void setJoinPartyDateStr(String joinPartyDateStr) {
        this.joinPartyDateStr = joinPartyDateStr;
    }

    public Date getJoinWorkDate() {
        return joinWorkDate;
    }

    public void setJoinWorkDate(Date joinWorkDate) {
        this.joinWorkDate = joinWorkDate;
    }

    public String getJoinWorkDateStr() {
        return joinWorkDateStr;
    }

    public void setJoinWorkDateStr(String joinWorkDateStr) {
        this.joinWorkDateStr = joinWorkDateStr;
    }

    public String getWorkingYears() {
        return workingYears;
    }

    public void setWorkingYears(String workingYears) {
        this.workingYears = workingYears;
    }

    public String getTitleLevel() {
        return titleLevel;
    }

    public void setTitleLevel(String titleLevel) {
        this.titleLevel = titleLevel;
    }

    public String getTitleSeries() {
        return titleSeries;
    }

    public void setTitleSeries(String titleSeries) {
        this.titleSeries = titleSeries;
    }

    public String getTitleName() {
        return titleName;
    }

    public void setTitleName(String titleName) {
        this.titleName = titleName;
    }

    public String getProfessionName() {
        return professionName;
    }

    public void setProfessionName(String professionName) {
        this.professionName = professionName;
    }

    public String getTechnologyGrade() {
        return technologyGrade;
    }

    public void setTechnologyGrade(String technologyGrade) {
        this.technologyGrade = technologyGrade;
    }

    public Integer getOriginalEducation() {
        return originalEducation;
    }

    public void setOriginalEducation(Integer originalEducation) {
        this.originalEducation = originalEducation;
    }

    public Integer getOriginalDegree() {
        return originalDegree;
    }

    public void setOriginalDegree(Integer originalDegree) {
        this.originalDegree = originalDegree;
    }

    public String getOriginalGraduationSchool() {
        return originalGraduationSchool;
    }

    public void setOriginalGraduationSchool(String originalGraduationSchool) {
        this.originalGraduationSchool = originalGraduationSchool;
    }

    public String getOriginalProfession() {
        return originalProfession;
    }

    public void setOriginalProfession(String originalProfession) {
        this.originalProfession = originalProfession;
    }

    public Date getOriginalGraduationDate() {
        return originalGraduationDate;
    }

    public void setOriginalGraduationDate(Date originalGraduationDate) {
        this.originalGraduationDate = originalGraduationDate;
    }

    public String getOriginalGraduationDateStr() {
        return originalGraduationDateStr;
    }

    public void setOriginalGraduationDateStr(String originalGraduationDateStr) {
        this.originalGraduationDateStr = originalGraduationDateStr;
    }

    public Integer getNowEducation() {
        return nowEducation;
    }

    public void setNowEducation(Integer nowEducation) {
        this.nowEducation = nowEducation;
    }

    public Integer getNowDegree() {
        return nowDegree;
    }

    public void setNowDegree(Integer nowDegree) {
        this.nowDegree = nowDegree;
    }

    public String getNowGraduationSchool() {
        return nowGraduationSchool;
    }

    public void setNowGraduationSchool(String nowGraduationSchool) {
        this.nowGraduationSchool = nowGraduationSchool;
    }

    public String getNowProfession() {
        return nowProfession;
    }

    public void setNowProfession(String nowProfession) {
        this.nowProfession = nowProfession;
    }

    public Date getNowGraduationDate() {
        return nowGraduationDate;
    }

    public void setNowGraduationDate(Date nowGraduationDate) {
        this.nowGraduationDate = nowGraduationDate;
    }

    public String getNowGraduationDateStr() {
        return nowGraduationDateStr;
    }

    public void setNowGraduationDateStr(String nowGraduationDateStr) {
        this.nowGraduationDateStr = nowGraduationDateStr;
    }

    public String getOtherCertificates() {
        return otherCertificates;
    }

    public void setOtherCertificates(String otherCertificates) {
        this.otherCertificates = otherCertificates;
    }

    public String getPostSituation() {
        return postSituation;
    }

    public void setPostSituation(String postSituation) {
        this.postSituation = postSituation;
    }

    public Integer getWorkType() {
        return workType;
    }

    public void setWorkType(Integer workType) {
        this.workType = workType;
    }

    public Date getCorrectionDate() {
        return correctionDate;
    }

    public void setCorrectionDate(Date correctionDate) {
        this.correctionDate = correctionDate;
    }

    public String getCorrectionDateStr() {
        return correctionDateStr;
    }

    public void setCorrectionDateStr(String correctionDateStr) {
        this.correctionDateStr = correctionDateStr;
    }

    public Date getEstimateRetirementDate() {
        return estimateRetirementDate;
    }

    public void setEstimateRetirementDate(Date estimateRetirementDate) {
        this.estimateRetirementDate = estimateRetirementDate;
    }

    public String getEstimateRetirementDateStr() {
        return estimateRetirementDateStr;
    }

    public void setEstimateRetirementDateStr(String estimateRetirementDateStr) {
        this.estimateRetirementDateStr = estimateRetirementDateStr;
    }

    public Date getRetirementDate() {
        return retirementDate;
    }

    public void setRetirementDate(Date retirementDate) {
        this.retirementDate = retirementDate;
    }

    public String getRetirementDateStr() {
        return retirementDateStr;
    }

    public void setRetirementDateStr(String retirementDateStr) {
        this.retirementDateStr = retirementDateStr;
    }

    public String getPhysicalCondition() {
        return physicalCondition;
    }

    public void setPhysicalCondition(String physicalCondition) {
        this.physicalCondition = physicalCondition;
    }

    public String getRetirementCompany() {
        return retirementCompany;
    }

    public void setRetirementCompany(String retirementCompany) {
        this.retirementCompany = retirementCompany;
    }
}
