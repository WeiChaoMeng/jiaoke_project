package com.jiaoke.oa.bean;

import java.io.Serializable;

/**
 * oa_personal_wages
 *
 * @author
 */
public class OaPersonalWages implements Serializable {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 序号
     */
    private Integer serialNumber;

    /**
     * 部门
     */
    private String department;

    /**
     * 姓名
     */
    private String name;

    /**
     * 岗位
     */
    private String position;

    /**
     * 岗位工资
     */
    private String positionSalary;

    /**
     * 技术职称津贴
     */
    private String technicalTitleAllowance;

    /**
     * 特殊工种津贴
     */
    private String specialWorkAllowance;

    /**
     * 补发工资
     */
    private String reissueWages;

    /**
     * 奖金
     */
    private String bonus;

    /**
     * 月奖
     */
    private String monthlyAward;

    /**
     * 补助
     */
    private String subsidy;

    /**
     * 高温津贴
     */
    private String megathermalAllowance;

    /**
     * 加班费
     */
    private String overtimePay;

    /**
     * 扣发工资
     */
    private String withholdingWages;

    /**
     * 应发工资
     */
    private String wagesPayable;

    /**
     * 养老险
     */
    private String endowmentInsurance;

    /**
     * 失业险
     */
    private String unemploymentInsurance;

    /**
     * 医保
     */
    private String medicalInsurance;

    /**
     * 大额
     */
    private String largeMedicalInsurance;

    /**
     * 公积金
     */
    private String accumulationFund;

    /**
     * 应扣三险一金合计
     */
    private String deductibleExpenses;

    /**
     * 扣三险及公积金后工资
     */
    private String feeAfterDeduction;

    /**
     * 个人所得税款
     */
    private String individualIncomeTax;

    /**
     * 会费
     */
    private String membershipFee;

    /**
     * 实发金额
     */
    private String actualAmount;

    /**
     * 结算日期
     */
    private String settlementDate;

    /**
     * 收发状态：0、为发送 1、已发送
     */
    private Integer state;

    /**
     * 工资统计id
     */
    private Integer wageStatisticsId;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(Integer serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getPositionSalary() {
        return positionSalary;
    }

    public void setPositionSalary(String positionSalary) {
        this.positionSalary = positionSalary;
    }

    public String getTechnicalTitleAllowance() {
        return technicalTitleAllowance;
    }

    public void setTechnicalTitleAllowance(String technicalTitleAllowance) {
        this.technicalTitleAllowance = technicalTitleAllowance;
    }

    public String getSpecialWorkAllowance() {
        return specialWorkAllowance;
    }

    public void setSpecialWorkAllowance(String specialWorkAllowance) {
        this.specialWorkAllowance = specialWorkAllowance;
    }

    public String getReissueWages() {
        return reissueWages;
    }

    public void setReissueWages(String reissueWages) {
        this.reissueWages = reissueWages;
    }

    public String getBonus() {
        return bonus;
    }

    public void setBonus(String bonus) {
        this.bonus = bonus;
    }

    public String getMonthlyAward() {
        return monthlyAward;
    }

    public void setMonthlyAward(String monthlyAward) {
        this.monthlyAward = monthlyAward;
    }

    public String getSubsidy() {
        return subsidy;
    }

    public void setSubsidy(String subsidy) {
        this.subsidy = subsidy;
    }

    public String getMegathermalAllowance() {
        return megathermalAllowance;
    }

    public void setMegathermalAllowance(String megathermalAllowance) {
        this.megathermalAllowance = megathermalAllowance;
    }

    public String getOvertimePay() {
        return overtimePay;
    }

    public void setOvertimePay(String overtimePay) {
        this.overtimePay = overtimePay;
    }

    public String getWithholdingWages() {
        return withholdingWages;
    }

    public void setWithholdingWages(String withholdingWages) {
        this.withholdingWages = withholdingWages;
    }

    public String getWagesPayable() {
        return wagesPayable;
    }

    public void setWagesPayable(String wagesPayable) {
        this.wagesPayable = wagesPayable;
    }

    public String getEndowmentInsurance() {
        return endowmentInsurance;
    }

    public void setEndowmentInsurance(String endowmentInsurance) {
        this.endowmentInsurance = endowmentInsurance;
    }

    public String getUnemploymentInsurance() {
        return unemploymentInsurance;
    }

    public void setUnemploymentInsurance(String unemploymentInsurance) {
        this.unemploymentInsurance = unemploymentInsurance;
    }

    public String getMedicalInsurance() {
        return medicalInsurance;
    }

    public void setMedicalInsurance(String medicalInsurance) {
        this.medicalInsurance = medicalInsurance;
    }

    public String getLargeMedicalInsurance() {
        return largeMedicalInsurance;
    }

    public void setLargeMedicalInsurance(String largeMedicalInsurance) {
        this.largeMedicalInsurance = largeMedicalInsurance;
    }

    public String getAccumulationFund() {
        return accumulationFund;
    }

    public void setAccumulationFund(String accumulationFund) {
        this.accumulationFund = accumulationFund;
    }

    public String getDeductibleExpenses() {
        return deductibleExpenses;
    }

    public void setDeductibleExpenses(String deductibleExpenses) {
        this.deductibleExpenses = deductibleExpenses;
    }

    public String getFeeAfterDeduction() {
        return feeAfterDeduction;
    }

    public void setFeeAfterDeduction(String feeAfterDeduction) {
        this.feeAfterDeduction = feeAfterDeduction;
    }

    public String getIndividualIncomeTax() {
        return individualIncomeTax;
    }

    public void setIndividualIncomeTax(String individualIncomeTax) {
        this.individualIncomeTax = individualIncomeTax;
    }

    public String getMembershipFee() {
        return membershipFee;
    }

    public void setMembershipFee(String membershipFee) {
        this.membershipFee = membershipFee;
    }

    public String getActualAmount() {
        return actualAmount;
    }

    public void setActualAmount(String actualAmount) {
        this.actualAmount = actualAmount;
    }

    public String getSettlementDate() {
        return settlementDate;
    }

    public void setSettlementDate(String settlementDate) {
        this.settlementDate = settlementDate;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getWageStatisticsId() {
        return wageStatisticsId;
    }

    public void setWageStatisticsId(Integer wageStatisticsId) {
        this.wageStatisticsId = wageStatisticsId;
    }
}