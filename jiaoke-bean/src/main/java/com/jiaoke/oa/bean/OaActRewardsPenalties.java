package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 奖罚意见表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_rewards_penalties")
public class OaActRewardsPenalties {

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
     * 月份
     */
    private String month;

    /**
     * 综合办公室主管领导签字
     */
    private String office;

    /**
     * 综合办公室主管领导内容
     */
    private String officeContent;

    /**
     * 综合办公室主管领导时间
     */
    private String officeDate;

    /**
     * 质量技术部主管领导签字
     */
    private String quality;

    /**
     * 质量技术部主管领导内容
     */
    private String qualityContent;

    /**
     * 质量技术部主管领导时间
     */
    private String qualityDate;

    /**
     * 经营开发部主管领导签字
     */
    private String business;

    /**
     * 经营开发部主管领导内容
     */
    private String businessContent;

    /**
     * 经营开发部主管领导时间
     */
    private String businessDate;

    /**
     * 生产管理部主管领导签字
     */
    private String production;

    /**
     * 生产管理部主管领导内容
     */
    private String productionContent;

    /**
     * 生产管理部主管领导时间
     */
    private String productionDate;

    /**
     * 财务管理部主管领导签字
     */
    private String financial;

    /**
     * 财务管理部主管领导内容
     */
    private String financialContent;

    /**
     * 财务管理部主管领导时间
     */
    private String financialDate;

    /**
     * 人事专员
     */
    private String personnelCensor;
    private String personnelCensorDate;
    private String personnelCensorContent;

    /**
     * 人事主管
     */
    private String personnel;
    private String personnelDate;
    private String personnelContent;

    /**
     * 总经理签字
     */
    private String companyPrincipal;

    /**
     * 总经理内容
     */
    private String companyPrincipalContent;

    /**
     * 总经理时间
     */
    private String companyPrincipalDate;

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

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getOffice() {
        return office;
    }

    public void setOffice(String office) {
        this.office = office;
    }

    public String getOfficeContent() {
        return officeContent;
    }

    public void setOfficeContent(String officeContent) {
        this.officeContent = officeContent;
    }

    public String getOfficeDate() {
        return officeDate;
    }

    public void setOfficeDate(String officeDate) {
        this.officeDate = officeDate;
    }

    public String getQuality() {
        return quality;
    }

    public void setQuality(String quality) {
        this.quality = quality;
    }

    public String getQualityContent() {
        return qualityContent;
    }

    public void setQualityContent(String qualityContent) {
        this.qualityContent = qualityContent;
    }

    public String getQualityDate() {
        return qualityDate;
    }

    public void setQualityDate(String qualityDate) {
        this.qualityDate = qualityDate;
    }

    public String getBusiness() {
        return business;
    }

    public void setBusiness(String business) {
        this.business = business;
    }

    public String getBusinessContent() {
        return businessContent;
    }

    public void setBusinessContent(String businessContent) {
        this.businessContent = businessContent;
    }

    public String getBusinessDate() {
        return businessDate;
    }

    public void setBusinessDate(String businessDate) {
        this.businessDate = businessDate;
    }

    public String getProduction() {
        return production;
    }

    public void setProduction(String production) {
        this.production = production;
    }

    public String getProductionContent() {
        return productionContent;
    }

    public void setProductionContent(String productionContent) {
        this.productionContent = productionContent;
    }

    public String getProductionDate() {
        return productionDate;
    }

    public void setProductionDate(String productionDate) {
        this.productionDate = productionDate;
    }

    public String getFinancial() {
        return financial;
    }

    public void setFinancial(String financial) {
        this.financial = financial;
    }

    public String getFinancialContent() {
        return financialContent;
    }

    public void setFinancialContent(String financialContent) {
        this.financialContent = financialContent;
    }

    public String getFinancialDate() {
        return financialDate;
    }

    public void setFinancialDate(String financialDate) {
        this.financialDate = financialDate;
    }

    public String getCompanyPrincipal() {
        return companyPrincipal;
    }

    public void setCompanyPrincipal(String companyPrincipal) {
        this.companyPrincipal = companyPrincipal;
    }

    public String getCompanyPrincipalContent() {
        return companyPrincipalContent;
    }

    public void setCompanyPrincipalContent(String companyPrincipalContent) {
        this.companyPrincipalContent = companyPrincipalContent;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPromoterStr() {
        return promoterStr;
    }

    public void setPromoterStr(String promoterStr) {
        this.promoterStr = promoterStr;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getPersonnelCensor() {
        return personnelCensor;
    }

    public void setPersonnelCensor(String personnelCensor) {
        this.personnelCensor = personnelCensor;
    }

    public String getPersonnelCensorDate() {
        return personnelCensorDate;
    }

    public void setPersonnelCensorDate(String personnelCensorDate) {
        this.personnelCensorDate = personnelCensorDate;
    }

    public String getPersonnelCensorContent() {
        return personnelCensorContent;
    }

    public void setPersonnelCensorContent(String personnelCensorContent) {
        this.personnelCensorContent = personnelCensorContent;
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

    public String getPersonnelContent() {
        return personnelContent;
    }

    public void setPersonnelContent(String personnelContent) {
        this.personnelContent = personnelContent;
    }
}
