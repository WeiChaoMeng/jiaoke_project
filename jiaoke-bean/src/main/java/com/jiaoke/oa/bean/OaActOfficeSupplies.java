package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 办公用品需求计划
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_office_supplies")
public class OaActOfficeSupplies {

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
     * 部门
     */
    private String department;

    /**
     * 序号1
     */
    private String serialOne;

    /**
     * 项目1
     */
    private String itemOne;

    /**
     * 数量1
     */
    private String numberOne;

    /**
     * 单价1
     */
    private String priceOne;

    /**
     * 金额1
     */
    private String moneyOne;

    /**
     * 序号2
     */
    private String serialTwo;

    /**
     * 项目2
     */
    private String itemTwo;

    /**
     * 数量2
     */
    private String numberTwo;

    /**
     * 单价2
     */
    private String priceTwo;

    /**
     * 金额2
     */
    private String moneyTwo;


    /**
     * 序号3
     */
    private String serialThree;

    /**
     * 项目3
     */
    private String itemThree;

    /**
     * 数量3
     */
    private String numberThree;

    /**
     * 单价3
     */
    private String priceThree;

    /**
     * 金额3
     */
    private String moneyThree;


    /**
     * 序号4
     */
    private String serialFour;

    /**
     * 项目4
     */
    private String itemFour;

    /**
     * 数量4
     */
    private String numberFour;

    /**
     * 单价4
     */
    private String priceFour;

    /**
     * 金额4
     */
    private String moneyFour;

    /**
     * 序号5
     */
    private String serialFive;

    /**
     * 项目5
     */
    private String itemFive;

    /**
     * 数量5
     */
    private String numberFive;

    /**
     * 单价5
     */
    private String priceFive;

    /**
     * 金额5
     */
    private String moneyFive;

    /**
     * 金额5
     */
    private String total;

    /**
     * 审批
     */
    private String approval;

    /**
     * 部门主管
     */
    private String supervisor;

    /**
     * 填表人
     */
    private String preparer;

    /**
     * 验收
     */
    private String acceptance;

    /**
     * 验收时间
     */
    private String acceptanceDate;

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

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getSerialOne() {
        return serialOne;
    }

    public void setSerialOne(String serialOne) {
        this.serialOne = serialOne;
    }

    public String getItemOne() {
        return itemOne;
    }

    public void setItemOne(String itemOne) {
        this.itemOne = itemOne;
    }

    public String getNumberOne() {
        return numberOne;
    }

    public void setNumberOne(String numberOne) {
        this.numberOne = numberOne;
    }

    public String getPriceOne() {
        return priceOne;
    }

    public void setPriceOne(String priceOne) {
        this.priceOne = priceOne;
    }

    public String getMoneyOne() {
        return moneyOne;
    }

    public void setMoneyOne(String moneyOne) {
        this.moneyOne = moneyOne;
    }

    public String getSerialTwo() {
        return serialTwo;
    }

    public void setSerialTwo(String serialTwo) {
        this.serialTwo = serialTwo;
    }

    public String getItemTwo() {
        return itemTwo;
    }

    public void setItemTwo(String itemTwo) {
        this.itemTwo = itemTwo;
    }

    public String getNumberTwo() {
        return numberTwo;
    }

    public void setNumberTwo(String numberTwo) {
        this.numberTwo = numberTwo;
    }

    public String getPriceTwo() {
        return priceTwo;
    }

    public void setPriceTwo(String priceTwo) {
        this.priceTwo = priceTwo;
    }

    public String getMoneyTwo() {
        return moneyTwo;
    }

    public void setMoneyTwo(String moneyTwo) {
        this.moneyTwo = moneyTwo;
    }

    public String getSerialThree() {
        return serialThree;
    }

    public void setSerialThree(String serialThree) {
        this.serialThree = serialThree;
    }

    public String getItemThree() {
        return itemThree;
    }

    public void setItemThree(String itemThree) {
        this.itemThree = itemThree;
    }

    public String getNumberThree() {
        return numberThree;
    }

    public void setNumberThree(String numberThree) {
        this.numberThree = numberThree;
    }

    public String getPriceThree() {
        return priceThree;
    }

    public void setPriceThree(String priceThree) {
        this.priceThree = priceThree;
    }

    public String getMoneyThree() {
        return moneyThree;
    }

    public void setMoneyThree(String moneyThree) {
        this.moneyThree = moneyThree;
    }

    public String getSerialFour() {
        return serialFour;
    }

    public void setSerialFour(String serialFour) {
        this.serialFour = serialFour;
    }

    public String getItemFour() {
        return itemFour;
    }

    public void setItemFour(String itemFour) {
        this.itemFour = itemFour;
    }

    public String getNumberFour() {
        return numberFour;
    }

    public void setNumberFour(String numberFour) {
        this.numberFour = numberFour;
    }

    public String getPriceFour() {
        return priceFour;
    }

    public void setPriceFour(String priceFour) {
        this.priceFour = priceFour;
    }

    public String getMoneyFour() {
        return moneyFour;
    }

    public void setMoneyFour(String moneyFour) {
        this.moneyFour = moneyFour;
    }

    public String getSerialFive() {
        return serialFive;
    }

    public void setSerialFive(String serialFive) {
        this.serialFive = serialFive;
    }

    public String getItemFive() {
        return itemFive;
    }

    public void setItemFive(String itemFive) {
        this.itemFive = itemFive;
    }

    public String getNumberFive() {
        return numberFive;
    }

    public void setNumberFive(String numberFive) {
        this.numberFive = numberFive;
    }

    public String getPriceFive() {
        return priceFive;
    }

    public void setPriceFive(String priceFive) {
        this.priceFive = priceFive;
    }

    public String getMoneyFive() {
        return moneyFive;
    }

    public void setMoneyFive(String moneyFive) {
        this.moneyFive = moneyFive;
    }

    public String getApproval() {
        return approval;
    }

    public void setApproval(String approval) {
        this.approval = approval;
    }

    public String getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(String supervisor) {
        this.supervisor = supervisor;
    }

    public String getPreparer() {
        return preparer;
    }

    public void setPreparer(String preparer) {
        this.preparer = preparer;
    }

    public String getAcceptance() {
        return acceptance;
    }

    public void setAcceptance(String acceptance) {
        this.acceptance = acceptance;
    }

    public String getAcceptanceDate() {
        return acceptanceDate;
    }

    public void setAcceptanceDate(String acceptanceDate) {
        this.acceptanceDate = acceptanceDate;
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

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
}