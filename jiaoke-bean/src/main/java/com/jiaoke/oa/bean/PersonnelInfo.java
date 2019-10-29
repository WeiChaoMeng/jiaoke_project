package com.jiaoke.oa.bean;

import javax.persistence.*;

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
     * 岗位类别：0.领导班子，1.中层管理人员，2.一般管理人员，3.一线生产工人，4.其它
     */
    private Integer jobCategory;

    /**
     * 职务（岗位）
     */
    private String job;

    /**
     * 副职
     */
    private String viceJob;

    /**
     * 姓名
     */
    private String name;

    /**
     * 性别
     */
    private String sex;

    /**
     * 身份证号
     */
    private String idCard;

    /**
     * 出生日期
     */
    private String birthday;

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
     * 户口性质0.本埠城镇，1.本埠农村，2.外埠城镇，3.外埠农村
     */
    private Integer accountNature;

    /**
     * 联系电话
     */
    private String phone;

    /**
     * 政治面貌: 0.群众、1.团员、2.中共党员
     */
    private Integer politicCountenance;

    /**
     * 入党时间（年月）
     */
    private String joinPartyDate;

    /**
     * 参加工作时间（年月）
     */
    private String joinWorkDate;

    /**
     * 工作年限
     */
    private Integer workingYears;

    /**
     * 职称级别0.未取得职称，1.员级，2.助理，3.中级，4.副高级，5.正高级
     */
    private Integer titleLevel;

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
     * 工人技术等级0.未取证，1.初级，2.中级，3.高级，4.技师，5.高级技师
     */
    private Integer technologyGrade;

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
    private String originalGraduationDate;

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
    private String nowGraduationDate;

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
    private String correctionDate;

    /**
     * 预计退休时间
     */
    private String estimateRetirementDate;

    /**
     * 退休时间
     */
    private String retirementDate;

    /**
     * 身体情况
     */
    private String physicalCondition;

    /**
     * 退休单位
     */
    private String retirementCompany;
    /**
     * 原职务
     */
    private String originalPosition;

    /**
     * 原岗位
     */
    private String originalPost;

    /**
     * 现岗位任职时间
     */
    private String currentPosition;

    /**
     * 转岗时间
     */
    private String transfer;

    /**
     * 提交离职申请日期
     */
    private String submissionApply;

    /**
     * 申请离职日期
     */
    private String applyLeave;

    /**
     * 离职日期
     */
    private String leaveDate;

    /**
     * 入职日期
     */
    private String joinedDate;

    /**
     * 合同标识0.未开通，1.已开通
     */
    private Integer contractFlag;

    /**
     * 标识（与数据库无关）
     */
    @Transient
    private Integer flag;

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

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

    public String getViceJob() {
        return viceJob;
    }

    public void setViceJob(String viceJob) {
        this.viceJob = viceJob;
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

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
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

    public Integer getAccountNature() {
        return accountNature;
    }

    public void setAccountNature(Integer accountNature) {
        this.accountNature = accountNature;
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

    public String getJoinPartyDate() {
        return joinPartyDate;
    }

    public void setJoinPartyDate(String joinPartyDate) {
        this.joinPartyDate = joinPartyDate;
    }

    public String getJoinWorkDate() {
        return joinWorkDate;
    }

    public void setJoinWorkDate(String joinWorkDate) {
        this.joinWorkDate = joinWorkDate;
    }

    public Integer getWorkingYears() {
        return workingYears;
    }

    public void setWorkingYears(Integer workingYears) {
        this.workingYears = workingYears;
    }

    public Integer getTitleLevel() {
        return titleLevel;
    }

    public void setTitleLevel(Integer titleLevel) {
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

    public Integer getTechnologyGrade() {
        return technologyGrade;
    }

    public void setTechnologyGrade(Integer technologyGrade) {
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

    public String getOriginalGraduationDate() {
        return originalGraduationDate;
    }

    public void setOriginalGraduationDate(String originalGraduationDate) {
        this.originalGraduationDate = originalGraduationDate;
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

    public String getNowGraduationDate() {
        return nowGraduationDate;
    }

    public void setNowGraduationDate(String nowGraduationDate) {
        this.nowGraduationDate = nowGraduationDate;
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

    public String getCorrectionDate() {
        return correctionDate;
    }

    public void setCorrectionDate(String correctionDate) {
        this.correctionDate = correctionDate;
    }

    public String getEstimateRetirementDate() {
        return estimateRetirementDate;
    }

    public void setEstimateRetirementDate(String estimateRetirementDate) {
        this.estimateRetirementDate = estimateRetirementDate;
    }

    public String getRetirementDate() {
        return retirementDate;
    }

    public void setRetirementDate(String retirementDate) {
        this.retirementDate = retirementDate;
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

    public String getOriginalPosition() {
        return originalPosition;
    }

    public void setOriginalPosition(String originalPosition) {
        this.originalPosition = originalPosition;
    }

    public String getOriginalPost() {
        return originalPost;
    }

    public void setOriginalPost(String originalPost) {
        this.originalPost = originalPost;
    }

    public String getCurrentPosition() {
        return currentPosition;
    }

    public void setCurrentPosition(String currentPosition) {
        this.currentPosition = currentPosition;
    }

    public String getTransfer() {
        return transfer;
    }

    public void setTransfer(String transfer) {
        this.transfer = transfer;
    }

    public String getSubmissionApply() {
        return submissionApply;
    }

    public void setSubmissionApply(String submissionApply) {
        this.submissionApply = submissionApply;
    }

    public String getApplyLeave() {
        return applyLeave;
    }

    public void setApplyLeave(String applyLeave) {
        this.applyLeave = applyLeave;
    }

    public String getLeaveDate() {
        return leaveDate;
    }

    public void setLeaveDate(String leaveDate) {
        this.leaveDate = leaveDate;
    }

    public String getJoinedDate() {
        return joinedDate;
    }

    public void setJoinedDate(String joinedDate) {
        this.joinedDate = joinedDate;
    }

    public Integer getContractFlag() {
        return contractFlag;
    }

    public void setContractFlag(Integer contractFlag) {
        this.contractFlag = contractFlag;
    }
}
