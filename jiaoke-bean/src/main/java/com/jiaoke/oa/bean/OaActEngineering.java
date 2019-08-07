package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 工程名称变更记录表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_engineering")
public class OaActEngineering {

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
     * 变更前工程名称
     */
    private String beforeName;

    /**
     * 变更后工程名称
     */
    private String afterName;

    /**
     * 变更前用料单位
     */
    private String beforeCompany;

    /**
     * 变更后用料单位
     */
    private String afterCompany;

    /**
     * 变更前所用混合料品种
     */
    private String beforeVariety;

    /**
     * 变更后所用混合料品种
     */
    private String afterVariety;

    /**
     * 变更前用料日期
     */
    private Date beforeData;
    @Transient
    private String beforeDataStr;

    /**
     * 变更后用料日期
     */
    private Date afterData;
    @Transient
    private String afterDataStr;

    /**
     * 变更前用料数量
     */
    private String beforeNumber;

    /**
     * 变更后用料数量
     */
    private String afterNumber;

    /**
     * 用料单位
     */
    private String useCompany;

    /**
     * 业务员
     */
    private String salesman;

    /**
     * 备注
     */
    private String remark;

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

    public String getBeforeName() {
        return beforeName;
    }

    public void setBeforeName(String beforeName) {
        this.beforeName = beforeName;
    }

    public String getAfterName() {
        return afterName;
    }

    public void setAfterName(String afterName) {
        this.afterName = afterName;
    }

    public String getBeforeCompany() {
        return beforeCompany;
    }

    public void setBeforeCompany(String beforeCompany) {
        this.beforeCompany = beforeCompany;
    }

    public String getAfterCompany() {
        return afterCompany;
    }

    public void setAfterCompany(String afterCompany) {
        this.afterCompany = afterCompany;
    }

    public String getBeforeVariety() {
        return beforeVariety;
    }

    public void setBeforeVariety(String beforeVariety) {
        this.beforeVariety = beforeVariety;
    }

    public String getAfterVariety() {
        return afterVariety;
    }

    public void setAfterVariety(String afterVariety) {
        this.afterVariety = afterVariety;
    }

    public Date getBeforeData() {
        return beforeData;
    }

    public void setBeforeData(Date beforeData) {
        this.beforeData = beforeData;
    }

    public String getBeforeDataStr() {
        return beforeDataStr;
    }

    public void setBeforeDataStr(String beforeDataStr) {
        this.beforeDataStr = beforeDataStr;
    }

    public Date getAfterData() {
        return afterData;
    }

    public void setAfterData(Date afterData) {
        this.afterData = afterData;
    }

    public String getAfterDataStr() {
        return afterDataStr;
    }

    public void setAfterDataStr(String afterDataStr) {
        this.afterDataStr = afterDataStr;
    }

    public String getBeforeNumber() {
        return beforeNumber;
    }

    public void setBeforeNumber(String beforeNumber) {
        this.beforeNumber = beforeNumber;
    }

    public String getAfterNumber() {
        return afterNumber;
    }

    public void setAfterNumber(String afterNumber) {
        this.afterNumber = afterNumber;
    }

    public String getUseCompany() {
        return useCompany;
    }

    public void setUseCompany(String useCompany) {
        this.useCompany = useCompany;
    }

    public String getSalesman() {
        return salesman;
    }

    public void setSalesman(String salesman) {
        this.salesman = salesman;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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
}