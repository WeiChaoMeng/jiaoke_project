package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 经营开发部-投标管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 11:12
 */
@Table(name = "oa_operate_bid")
public class OaOperateBid {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 招标单位
     */
    private String tenderee;

    /**
     * 项目名称
     */
    private String projectName;

    /**
     * 竞标单位
     */
    private String biddingUnit;

    /**
     * 投标价格
     */
    private String tenderPrice;

    /**
     * 业主
     */
    private String proprietor;

    /**
     * 年度
     */
    private Date year;
    @Transient
    private String yearStr;

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

    public String getTenderee() {
        return tenderee;
    }

    public void setTenderee(String tenderee) {
        this.tenderee = tenderee;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getBiddingUnit() {
        return biddingUnit;
    }

    public void setBiddingUnit(String biddingUnit) {
        this.biddingUnit = biddingUnit;
    }

    public String getTenderPrice() {
        return tenderPrice;
    }

    public void setTenderPrice(String tenderPrice) {
        this.tenderPrice = tenderPrice;
    }

    public String getProprietor() {
        return proprietor;
    }

    public void setProprietor(String proprietor) {
        this.proprietor = proprietor;
    }

    public Date getYear() {
        return year;
    }

    public void setYear(Date year) {
        this.year = year;
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

    public String getYearStr() {
        return yearStr;
    }

    public void setYearStr(String yearStr) {
        this.yearStr = yearStr;
    }
}
