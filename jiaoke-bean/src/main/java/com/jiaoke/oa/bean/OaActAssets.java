package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 固定资产投资完成验收单（生产用）
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_assets")
public class OaActAssets {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 标题
     */
    private String title;

    /**
     * 单位
     */
    private String company;

    /**
     * 验收部门
     */
    private String acceptance;

    /**
     * 日期
     */
    private Date date;
    @Transient
    private String dateStr;

    /**
     * 编号
     */
    private String numbering;

    /**
     * 项目名称
     */
    private String projectName;

    /**
     * 制造厂/承建单位
     */
    private String factory;

    /**
     * 投资批准机关
     */
    private String approvalAuthority;

    /**
     * 规格型号
     */
    private String specifications;

    /**
     * 出厂(竣工)日期
     */
    private Date completedTime;
    @Transient
    private String completedTimeStr;

    /**
     * 存放地点
     */
    private String location;

    /**
     * 计量单位
     */
    private String measureCompany;

    /**
     * 数量
     */
    private String number;

    /**
     * 出厂编号
     */
    private String factoryNumber;

    /**
     * 附属设备（设施）价值（元）
     */
    private String affiliatedValue;

    /**
     * 全部价值总计（元）
     */
    private String totalValue;

    /**
     * 折旧年限
     */
    private String depreciation;

    /**
     * 固定资产编号
     */
    private String assetNumber;

    /**
     * 总价值（元）
     */
    private String total;

    /**
     * 附属设备（设施）名称
     */
    private String affiliatedName;

    /**
     * 规格型号
     */
    private String affiliatedSpecification;

    /**
     * 单位
     */
    private String affiliatedCompany;

    /**
     * 数量
     */
    private String affiliatedNumber;

    /**
     * 单价
     */
    private String affiliatedPrice;

    /**
     * 状态：0,已发 1,待发
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
    private String promoter;

    /**
     * 查询路径
     */
    private String url;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getAcceptance() {
        return acceptance;
    }

    public void setAcceptance(String acceptance) {
        this.acceptance = acceptance;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDateStr() {
        return dateStr;
    }

    public void setDateStr(String dateStr) {
        this.dateStr = dateStr;
    }

    public String getNumbering() {
        return numbering;
    }

    public void setNumbering(String numbering) {
        this.numbering = numbering;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getApprovalAuthority() {
        return approvalAuthority;
    }

    public void setApprovalAuthority(String approvalAuthority) {
        this.approvalAuthority = approvalAuthority;
    }

    public String getSpecifications() {
        return specifications;
    }

    public void setSpecifications(String specifications) {
        this.specifications = specifications;
    }

    public Date getCompletedTime() {
        return completedTime;
    }

    public void setCompletedTime(Date completedTime) {
        this.completedTime = completedTime;
    }

    public String getCompletedTimeStr() {
        return completedTimeStr;
    }

    public void setCompletedTimeStr(String completedTimeStr) {
        this.completedTimeStr = completedTimeStr;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getMeasureCompany() {
        return measureCompany;
    }

    public void setMeasureCompany(String measureCompany) {
        this.measureCompany = measureCompany;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getFactoryNumber() {
        return factoryNumber;
    }

    public void setFactoryNumber(String factoryNumber) {
        this.factoryNumber = factoryNumber;
    }

    public String getAffiliatedValue() {
        return affiliatedValue;
    }

    public void setAffiliatedValue(String affiliatedValue) {
        this.affiliatedValue = affiliatedValue;
    }

    public String getTotalValue() {
        return totalValue;
    }

    public void setTotalValue(String totalValue) {
        this.totalValue = totalValue;
    }

    public String getDepreciation() {
        return depreciation;
    }

    public void setDepreciation(String depreciation) {
        this.depreciation = depreciation;
    }

    public String getAssetNumber() {
        return assetNumber;
    }

    public void setAssetNumber(String assetNumber) {
        this.assetNumber = assetNumber;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
}
