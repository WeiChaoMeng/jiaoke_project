package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 生产管理部-环保改造台账
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 11:12
 */
@Table(name = "oa_production_environment")
public class OaProductionEnvironment {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 编号
     */
    private String numbering;

    /**
     * 年份
     */
    private Date year;
    @Transient
    private String yearStr;

    /**
     * 项目名称
     */
    private String projectName;

    /**
     * 施工单位
     */
    private String constructionUnit;

    /**
     * 治理措施
     */
    private String controlMeasures;

    /**
     * 数量
     */
    private String number;

    /**
     * 型号
     */
    private String type;

    /**
     * 改造费用
     */
    private String retrofitCost;

    /**
     * 对应合同编号
     */
    private String correspondingContract;

    /**
     * 污染物去向
     */
    private String contaminants;

    /**
     * 资料存放地点
     */
    private String storageLocation;

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

    public String getNumbering() {
        return numbering;
    }

    public void setNumbering(String numbering) {
        this.numbering = numbering;
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

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getConstructionUnit() {
        return constructionUnit;
    }

    public void setConstructionUnit(String constructionUnit) {
        this.constructionUnit = constructionUnit;
    }

    public String getControlMeasures() {
        return controlMeasures;
    }

    public void setControlMeasures(String controlMeasures) {
        this.controlMeasures = controlMeasures;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getRetrofitCost() {
        return retrofitCost;
    }

    public void setRetrofitCost(String retrofitCost) {
        this.retrofitCost = retrofitCost;
    }

    public String getCorrespondingContract() {
        return correspondingContract;
    }

    public void setCorrespondingContract(String correspondingContract) {
        this.correspondingContract = correspondingContract;
    }

    public String getContaminants() {
        return contaminants;
    }

    public void setContaminants(String contaminants) {
        this.contaminants = contaminants;
    }

    public String getStorageLocation() {
        return storageLocation;
    }

    public void setStorageLocation(String storageLocation) {
        this.storageLocation = storageLocation;
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
