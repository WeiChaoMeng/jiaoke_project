package com.jiaoke.oa.bean;

import java.io.Serializable;

/**
 * 外包工资表
 *
 * @author li
 */
public class OaOutsourcedStaff implements Serializable {
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
     * 现岗位工资
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
     * 通讯费
     */
    private String ceynXjm;

    /**
     * 交通补助
     */
    private String travelAllowance;

    /**
     * 交通油费补助
     */
    private String oilFilling;

    /**
     * 值班费
     */
    private String dutyFee;

    /**
     * 预支工资
     */
    private String advanceWages;

    /**
     * 月奖
     */
    private String monthlyAward;

    /**
     * 高温津贴
     */
    private String megathermalAllowance;

    /**
     * 超时服务费
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
     * 个人保险公积金
     */
    private String accumulationFund;

    /**
     * 个人所得税款
     */
    private String individualIncometax;

    /**
     * 实发工资
     */
    private String actualAmount;

    /**
     * 公司保险公积金
     */
    private String companyGold;

    /**
     * 服务费
     */
    private String serviceFee;

    /**
     * 其他
     */
    private String other;

    /**
     * 费用合计
     */
    private String totalExpenses;

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

    public String getCeynXjm() {
        return ceynXjm;
    }

    public void setCeynXjm(String ceynXjm) {
        this.ceynXjm = ceynXjm;
    }

    public String getTravelAllowance() {
        return travelAllowance;
    }

    public void setTravelAllowance(String travelAllowance) {
        this.travelAllowance = travelAllowance;
    }

    public String getOilFilling() {
        return oilFilling;
    }

    public void setOilFilling(String oilFilling) {
        this.oilFilling = oilFilling;
    }

    public String getDutyFee() {
        return dutyFee;
    }

    public void setDutyFee(String dutyFee) {
        this.dutyFee = dutyFee;
    }

    public String getAdvanceWages() {
        return advanceWages;
    }

    public void setAdvanceWages(String advanceWages) {
        this.advanceWages = advanceWages;
    }

    public String getMonthlyAward() {
        return monthlyAward;
    }

    public void setMonthlyAward(String monthlyAward) {
        this.monthlyAward = monthlyAward;
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

    public String getAccumulationFund() {
        return accumulationFund;
    }

    public void setAccumulationFund(String accumulationFund) {
        this.accumulationFund = accumulationFund;
    }

    public String getIndividualIncometax() {
        return individualIncometax;
    }

    public void setIndividualIncometax(String individualIncometax) {
        this.individualIncometax = individualIncometax;
    }

    public String getActualAmount() {
        return actualAmount;
    }

    public void setActualAmount(String actualAmount) {
        this.actualAmount = actualAmount;
    }

    public String getCompanyGold() {
        return companyGold;
    }

    public void setCompanyGold(String companyGold) {
        this.companyGold = companyGold;
    }

    public String getServiceFee() {
        return serviceFee;
    }

    public void setServiceFee(String serviceFee) {
        this.serviceFee = serviceFee;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }

    public String getTotalExpenses() {
        return totalExpenses;
    }

    public void setTotalExpenses(String totalExpenses) {
        this.totalExpenses = totalExpenses;
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