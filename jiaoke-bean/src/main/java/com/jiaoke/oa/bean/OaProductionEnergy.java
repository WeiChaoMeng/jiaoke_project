package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 生产管理部-能源、碳排放统计
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 11:12
 */
@Table(name = "oa_production_energy")
public class OaProductionEnergy {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 年份
     */
    private Date year;
    @Transient
    private String yearStr;

    /**
     * 产量（吨）
     */
    private String yield;

    /**
     * 产值（万元）
     */
    private String outputValue;

    /**
     * 万元产值能耗（吨标准煤/万元）
     */
    private String productionConsume;

    /**
     * 单位产品能耗（千克标准煤/吨）
     */
    private String productConsume;

    /**
     * 天然气消耗量（万立方米）
     */
    private String gasConsume;

    /**
     * 耗电量（万千瓦时）
     */
    private String powerConsumption;

    /**
     * 单位产品碳排放量（千克二氧化碳/吨）
     */
    private String carbonEmission;

    /**
     * 富文本
     */
    private String richText;

    /**
     * 创建时间
     */
    private Date createDate;
    @Transient
    private String createDateStr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getYear() {
        return year;
    }

    public void setYear(Date year) {
        this.year = year;
    }

    public String getYearStr() {
        return yearStr;
    }

    public void setYearStr(String yearStr) {
        this.yearStr = yearStr;
    }

    public String getYield() {
        return yield;
    }

    public void setYield(String yield) {
        this.yield = yield;
    }

    public String getOutputValue() {
        return outputValue;
    }

    public void setOutputValue(String outputValue) {
        this.outputValue = outputValue;
    }

    public String getProductionConsume() {
        return productionConsume;
    }

    public void setProductionConsume(String productionConsume) {
        this.productionConsume = productionConsume;
    }

    public String getProductConsume() {
        return productConsume;
    }

    public void setProductConsume(String productConsume) {
        this.productConsume = productConsume;
    }

    public String getGasConsume() {
        return gasConsume;
    }

    public void setGasConsume(String gasConsume) {
        this.gasConsume = gasConsume;
    }

    public String getPowerConsumption() {
        return powerConsumption;
    }

    public void setPowerConsumption(String powerConsumption) {
        this.powerConsumption = powerConsumption;
    }

    public String getCarbonEmission() {
        return carbonEmission;
    }

    public void setCarbonEmission(String carbonEmission) {
        this.carbonEmission = carbonEmission;
    }

    public String getRichText() {
        return richText;
    }

    public void setRichText(String richText) {
        this.richText = richText;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreateDateStr() {
        return createDateStr;
    }

    public void setCreateDateStr(String createDateStr) {
        this.createDateStr = createDateStr;
    }
}
