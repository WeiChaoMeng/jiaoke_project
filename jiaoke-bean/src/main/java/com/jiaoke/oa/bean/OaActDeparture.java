package com.jiaoke.oa.bean;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 离职会签表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_departure")
public class OaActDeparture {

    /**
     * 主键
     */
    @Id
    private String id;

    /**
     * 标题
     */
    private String title;

    /**
     * 姓名
     */
    private String name;

    /**
     * 离职日期
     */
    private String departureDate;

    private String resignationCountersign;

    /**
     *办公室负责人和主管领导
     */
    private String officePrincipal;
    private String officePrincipalT;
    private String officeSupervisor;
    private String officePrincipalRemark;
    private String officePrincipalRemarkT;
    private String officeSupervisorRemark;

    /**
     *经营开发部负责人和主管领导
     */
    private String operatingPrincipal;
    private String operatingSupervisor;
    private String operatingPrincipalRemark;
    private String operatingSupervisorRemark;

    /**
     *生产管理部负责人和主管领导
     */
    private String producePrincipal;
    private String produceSupervisor;
    private String producePrincipalRemark;
    private String produceSupervisorRemark;

    /**
     *质量技术部负责人和主管领导
     */
    private String qualityPrincipal;
    private String qualityPrincipalT;
    private String qualitySupervisor;
    private String qualityPrincipalRemark;
    private String qualityPrincipalRemarkT;
    private String qualitySupervisorRemark;

    /**
     *物资管理部负责人和主管领导
     */
    private String materialPrincipal;
    private String materialSupervisor;
    private String materialPrincipalRemark;
    private String materialSupervisorRemark;

    /**
     *财务管理部负责人和主管领导
     */
    private String financePrincipal;
    private String financeSupervisor;
    private String financePrincipalRemark;
    private String financeSupervisorRemark;

    /**
     *总经理
     */
    private String companyPrincipal;
    private String companyPrincipalRemark;


    private String humanAffairs;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(String departureDate) {
        this.departureDate = departureDate;
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

    public String getOfficePrincipal() {
        return officePrincipal;
    }

    public void setOfficePrincipal(String officePrincipal) {
        this.officePrincipal = officePrincipal;
    }

    public String getOfficeSupervisor() {
        return officeSupervisor;
    }

    public void setOfficeSupervisor(String officeSupervisor) {
        this.officeSupervisor = officeSupervisor;
    }

    public String getOfficePrincipalRemark() {
        return officePrincipalRemark;
    }

    public void setOfficePrincipalRemark(String officePrincipalRemark) {
        this.officePrincipalRemark = officePrincipalRemark;
    }

    public String getOfficeSupervisorRemark() {
        return officeSupervisorRemark;
    }

    public void setOfficeSupervisorRemark(String officeSupervisorRemark) {
        this.officeSupervisorRemark = officeSupervisorRemark;
    }

    public String getOperatingPrincipal() {
        return operatingPrincipal;
    }

    public void setOperatingPrincipal(String operatingPrincipal) {
        this.operatingPrincipal = operatingPrincipal;
    }

    public String getOperatingSupervisor() {
        return operatingSupervisor;
    }

    public void setOperatingSupervisor(String operatingSupervisor) {
        this.operatingSupervisor = operatingSupervisor;
    }

    public String getOperatingPrincipalRemark() {
        return operatingPrincipalRemark;
    }

    public void setOperatingPrincipalRemark(String operatingPrincipalRemark) {
        this.operatingPrincipalRemark = operatingPrincipalRemark;
    }

    public String getOperatingSupervisorRemark() {
        return operatingSupervisorRemark;
    }

    public void setOperatingSupervisorRemark(String operatingSupervisorRemark) {
        this.operatingSupervisorRemark = operatingSupervisorRemark;
    }

    public String getProducePrincipal() {
        return producePrincipal;
    }

    public void setProducePrincipal(String producePrincipal) {
        this.producePrincipal = producePrincipal;
    }

    public String getProduceSupervisor() {
        return produceSupervisor;
    }

    public void setProduceSupervisor(String produceSupervisor) {
        this.produceSupervisor = produceSupervisor;
    }

    public String getProducePrincipalRemark() {
        return producePrincipalRemark;
    }

    public void setProducePrincipalRemark(String producePrincipalRemark) {
        this.producePrincipalRemark = producePrincipalRemark;
    }

    public String getProduceSupervisorRemark() {
        return produceSupervisorRemark;
    }

    public void setProduceSupervisorRemark(String produceSupervisorRemark) {
        this.produceSupervisorRemark = produceSupervisorRemark;
    }

    public String getQualityPrincipal() {
        return qualityPrincipal;
    }

    public void setQualityPrincipal(String qualityPrincipal) {
        this.qualityPrincipal = qualityPrincipal;
    }

    public String getQualitySupervisor() {
        return qualitySupervisor;
    }

    public void setQualitySupervisor(String qualitySupervisor) {
        this.qualitySupervisor = qualitySupervisor;
    }

    public String getQualityPrincipalRemark() {
        return qualityPrincipalRemark;
    }

    public void setQualityPrincipalRemark(String qualityPrincipalRemark) {
        this.qualityPrincipalRemark = qualityPrincipalRemark;
    }

    public String getQualitySupervisorRemark() {
        return qualitySupervisorRemark;
    }

    public void setQualitySupervisorRemark(String qualitySupervisorRemark) {
        this.qualitySupervisorRemark = qualitySupervisorRemark;
    }

    public String getMaterialPrincipal() {
        return materialPrincipal;
    }

    public void setMaterialPrincipal(String materialPrincipal) {
        this.materialPrincipal = materialPrincipal;
    }

    public String getMaterialSupervisor() {
        return materialSupervisor;
    }

    public void setMaterialSupervisor(String materialSupervisor) {
        this.materialSupervisor = materialSupervisor;
    }

    public String getMaterialPrincipalRemark() {
        return materialPrincipalRemark;
    }

    public void setMaterialPrincipalRemark(String materialPrincipalRemark) {
        this.materialPrincipalRemark = materialPrincipalRemark;
    }

    public String getMaterialSupervisorRemark() {
        return materialSupervisorRemark;
    }

    public void setMaterialSupervisorRemark(String materialSupervisorRemark) {
        this.materialSupervisorRemark = materialSupervisorRemark;
    }

    public String getFinancePrincipal() {
        return financePrincipal;
    }

    public void setFinancePrincipal(String financePrincipal) {
        this.financePrincipal = financePrincipal;
    }

    public String getFinanceSupervisor() {
        return financeSupervisor;
    }

    public void setFinanceSupervisor(String financeSupervisor) {
        this.financeSupervisor = financeSupervisor;
    }

    public String getFinancePrincipalRemark() {
        return financePrincipalRemark;
    }

    public void setFinancePrincipalRemark(String financePrincipalRemark) {
        this.financePrincipalRemark = financePrincipalRemark;
    }

    public String getFinanceSupervisorRemark() {
        return financeSupervisorRemark;
    }

    public void setFinanceSupervisorRemark(String financeSupervisorRemark) {
        this.financeSupervisorRemark = financeSupervisorRemark;
    }

    public String getCompanyPrincipal() {
        return companyPrincipal;
    }

    public void setCompanyPrincipal(String companyPrincipal) {
        this.companyPrincipal = companyPrincipal;
    }

    public String getCompanyPrincipalRemark() {
        return companyPrincipalRemark;
    }

    public void setCompanyPrincipalRemark(String companyPrincipalRemark) {
        this.companyPrincipalRemark = companyPrincipalRemark;
    }

    public String getOfficePrincipalT() {
        return officePrincipalT;
    }

    public void setOfficePrincipalT(String officePrincipalT) {
        this.officePrincipalT = officePrincipalT;
    }

    public String getOfficePrincipalRemarkT() {
        return officePrincipalRemarkT;
    }

    public void setOfficePrincipalRemarkT(String officePrincipalRemarkT) {
        this.officePrincipalRemarkT = officePrincipalRemarkT;
    }

    public String getQualityPrincipalT() {
        return qualityPrincipalT;
    }

    public void setQualityPrincipalT(String qualityPrincipalT) {
        this.qualityPrincipalT = qualityPrincipalT;
    }

    public String getQualityPrincipalRemarkT() {
        return qualityPrincipalRemarkT;
    }

    public void setQualityPrincipalRemarkT(String qualityPrincipalRemarkT) {
        this.qualityPrincipalRemarkT = qualityPrincipalRemarkT;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getResignationCountersign() {
        return resignationCountersign;
    }

    public void setResignationCountersign(String resignationCountersign) {
        this.resignationCountersign = resignationCountersign;
    }

    public String getHumanAffairs() {
        return humanAffairs;
    }

    public void setHumanAffairs(String humanAffairs) {
        this.humanAffairs = humanAffairs;
    }
}
