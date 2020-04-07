package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 合同评审表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_contract_review")
public class OaActContractReview {

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
     * 合同编号
     */
    private String contractNumber;

    /**
     * 合同名称
     */
    private String contractName;

    /**
     * 客户名称
     */
    private String customerName;

    /**
     * 工程名称
     */
    private String engineeringName;

    /**
     * 材料型号，品种数量
     */
    private String modelNumber;

    /**
     * 供料时间
     */
    private String feedingTime;

    /**
     * 结算条款
     */
    private String settlementTerms;

    /**
     * 合同总价
     */
    private String contractPrice;

    /**
     * 物资部门负责人
     */
    private String materialPrincipal;

    /**
     * 物资部门负责人审批时间
     */
    private String materialPrincipalDate;

    /**
     * 物资部门负责人审批内容
     */
    private String materialPrincipalContent;

    /**
     * 财务部门负责人
     */
    private String financePrincipal;

    /**
     * 财务部门负责人审批时间
     */
    private String financePrincipalDate;

    /**
     * 财务部门负责人审批内容
     */
    private String financePrincipalContent;

    /**
     * 质量技术部门负责人
     */
    private String qualityPrincipal;

    /**
     * 质量技术部门负责人审批时间
     */
    private String qualityPrincipalDate;

    /**
     * 质量技术部门负责人审批内容
     */
    private String qualityPrincipalContent;

    /**
     * 经营部门负责人
     */
    private String operatingPrincipal;

    /**
     * 经营部门负责人审批时间
     */
    private String operatingPrincipalDate;

    /**
     * 经营部门负责人审批内容
     */
    private String operatingPrincipalContent;

    /**
     * 法务
     */
    private String legalAffairs;

    /**
     * 法务审批时间
     */
    private String legalAffairsDate;

    /**
     * 法务审批内容
     */
    private String legalAffairsContent;

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
     * 利润中心
     */
    private String profitCenter;

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

    public String getContractNumber() {
        return contractNumber;
    }

    public void setContractNumber(String contractNumber) {
        this.contractNumber = contractNumber;
    }

    public String getContractName() {
        return contractName;
    }

    public void setContractName(String contractName) {
        this.contractName = contractName;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getEngineeringName() {
        return engineeringName;
    }

    public void setEngineeringName(String engineeringName) {
        this.engineeringName = engineeringName;
    }

    public String getModelNumber() {
        return modelNumber;
    }

    public void setModelNumber(String modelNumber) {
        this.modelNumber = modelNumber;
    }

    public String getFeedingTime() {
        return feedingTime;
    }

    public void setFeedingTime(String feedingTime) {
        this.feedingTime = feedingTime;
    }

    public String getSettlementTerms() {
        return settlementTerms;
    }

    public void setSettlementTerms(String settlementTerms) {
        this.settlementTerms = settlementTerms;
    }

    public String getContractPrice() {
        return contractPrice;
    }

    public void setContractPrice(String contractPrice) {
        this.contractPrice = contractPrice;
    }

    public String getMaterialPrincipal() {
        return materialPrincipal;
    }

    public void setMaterialPrincipal(String materialPrincipal) {
        this.materialPrincipal = materialPrincipal;
    }

    public String getMaterialPrincipalDate() {
        return materialPrincipalDate;
    }

    public void setMaterialPrincipalDate(String materialPrincipalDate) {
        this.materialPrincipalDate = materialPrincipalDate;
    }

    public String getMaterialPrincipalContent() {
        return materialPrincipalContent;
    }

    public void setMaterialPrincipalContent(String materialPrincipalContent) {
        this.materialPrincipalContent = materialPrincipalContent;
    }

    public String getFinancePrincipal() {
        return financePrincipal;
    }

    public void setFinancePrincipal(String financePrincipal) {
        this.financePrincipal = financePrincipal;
    }

    public String getFinancePrincipalDate() {
        return financePrincipalDate;
    }

    public void setFinancePrincipalDate(String financePrincipalDate) {
        this.financePrincipalDate = financePrincipalDate;
    }

    public String getFinancePrincipalContent() {
        return financePrincipalContent;
    }

    public void setFinancePrincipalContent(String financePrincipalContent) {
        this.financePrincipalContent = financePrincipalContent;
    }

    public String getQualityPrincipal() {
        return qualityPrincipal;
    }

    public void setQualityPrincipal(String qualityPrincipal) {
        this.qualityPrincipal = qualityPrincipal;
    }

    public String getQualityPrincipalDate() {
        return qualityPrincipalDate;
    }

    public void setQualityPrincipalDate(String qualityPrincipalDate) {
        this.qualityPrincipalDate = qualityPrincipalDate;
    }

    public String getQualityPrincipalContent() {
        return qualityPrincipalContent;
    }

    public void setQualityPrincipalContent(String qualityPrincipalContent) {
        this.qualityPrincipalContent = qualityPrincipalContent;
    }

    public String getOperatingPrincipal() {
        return operatingPrincipal;
    }

    public void setOperatingPrincipal(String operatingPrincipal) {
        this.operatingPrincipal = operatingPrincipal;
    }

    public String getOperatingPrincipalDate() {
        return operatingPrincipalDate;
    }

    public void setOperatingPrincipalDate(String operatingPrincipalDate) {
        this.operatingPrincipalDate = operatingPrincipalDate;
    }

    public String getOperatingPrincipalContent() {
        return operatingPrincipalContent;
    }

    public void setOperatingPrincipalContent(String operatingPrincipalContent) {
        this.operatingPrincipalContent = operatingPrincipalContent;
    }

    public String getLegalAffairs() {
        return legalAffairs;
    }

    public void setLegalAffairs(String legalAffairs) {
        this.legalAffairs = legalAffairs;
    }

    public String getLegalAffairsDate() {
        return legalAffairsDate;
    }

    public void setLegalAffairsDate(String legalAffairsDate) {
        this.legalAffairsDate = legalAffairsDate;
    }

    public String getLegalAffairsContent() {
        return legalAffairsContent;
    }

    public void setLegalAffairsContent(String legalAffairsContent) {
        this.legalAffairsContent = legalAffairsContent;
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

    public String getProfitCenter() {
        return profitCenter;
    }

    public void setProfitCenter(String profitCenter) {
        this.profitCenter = profitCenter;
    }
}
