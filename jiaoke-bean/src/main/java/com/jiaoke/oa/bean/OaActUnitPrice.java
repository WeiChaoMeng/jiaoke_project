package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;
import java.util.List;

/**
 * 单价审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_unit_price")
public class OaActUnitPrice {

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
     * 客户名称
     */
    private String customer;

    /**
     * 工程名称
     */
    private String engineering;

    /**
     * 单价审批单详情
     */
    private List<OaUnitPrice> oaUnitPriceList;

    /**
     * 信用等级，0一级客户，1二级客户，2三级客户
     */
    private String creditRating;

    /**
     * 单位性质，0内部单位，1外部单位
     */
    private String unitNature;

    /**
     * 支付方式，0预付全款，1当年支付全款，2当年支付80%及以上
     */
    private String paymentMethod;

    /**
     * 数量，0、50000吨以上，1、10000吨-50000吨，2、5000吨-10000吨
     */
    private String number;

    /**
     * 投标，0重大工程
     */
    private String tender;

    /**
     * 合同总价
     */
    private String contractValue;

    /**
     * 结清时间
     */
    private String settleTime;

    /**
     * 预付款
     */
    private String advanceCharge;

    /**
     * 联系人及电话
     */
    private String contactNumber;

    /**
     * 利润中心
     */
    private String profitCenter;

    /**
     * 运输方式及运距
     */
    private String modeShipping;

    /**
     * 经营部长
     */
    private String businessPrincipal;

    /**
     * 经营部长审批时间
     */
    private String businessPrincipalDate;

    /**
     * 经营主管
     */
    private String businessSupervisor;

    /**
     * 经营主管审批时间
     */
    private String businessSupervisorDate;

    /**
     * 总经理
     */
    private String companyPrincipal;

    /**
     * 总经理审批时间
     */
    private String companyPrincipalDate;

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

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getEngineering() {
        return engineering;
    }

    public void setEngineering(String engineering) {
        this.engineering = engineering;
    }

    public List<OaUnitPrice> getOaUnitPriceList() {
        return oaUnitPriceList;
    }

    public void setOaUnitPriceList(List<OaUnitPrice> oaUnitPriceList) {
        this.oaUnitPriceList = oaUnitPriceList;
    }

    public String getCreditRating() {
        return creditRating;
    }

    public void setCreditRating(String creditRating) {
        this.creditRating = creditRating;
    }

    public String getUnitNature() {
        return unitNature;
    }

    public void setUnitNature(String unitNature) {
        this.unitNature = unitNature;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getTender() {
        return tender;
    }

    public void setTender(String tender) {
        this.tender = tender;
    }

    public String getContractValue() {
        return contractValue;
    }

    public void setContractValue(String contractValue) {
        this.contractValue = contractValue;
    }

    public String getSettleTime() {
        return settleTime;
    }

    public void setSettleTime(String settleTime) {
        this.settleTime = settleTime;
    }

    public String getAdvanceCharge() {
        return advanceCharge;
    }

    public void setAdvanceCharge(String advanceCharge) {
        this.advanceCharge = advanceCharge;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getProfitCenter() {
        return profitCenter;
    }

    public void setProfitCenter(String profitCenter) {
        this.profitCenter = profitCenter;
    }

    public String getModeShipping() {
        return modeShipping;
    }

    public void setModeShipping(String modeShipping) {
        this.modeShipping = modeShipping;
    }

    public String getBusinessPrincipal() {
        return businessPrincipal;
    }

    public void setBusinessPrincipal(String businessPrincipal) {
        this.businessPrincipal = businessPrincipal;
    }

    public String getBusinessPrincipalDate() {
        return businessPrincipalDate;
    }

    public void setBusinessPrincipalDate(String businessPrincipalDate) {
        this.businessPrincipalDate = businessPrincipalDate;
    }

    public String getBusinessSupervisor() {
        return businessSupervisor;
    }

    public void setBusinessSupervisor(String businessSupervisor) {
        this.businessSupervisor = businessSupervisor;
    }

    public String getBusinessSupervisorDate() {
        return businessSupervisorDate;
    }

    public void setBusinessSupervisorDate(String businessSupervisorDate) {
        this.businessSupervisorDate = businessSupervisorDate;
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

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
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

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
