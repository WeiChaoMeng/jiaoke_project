package com.jiaoke.oa.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * oa_wage_statistics
 *
 * @author
 */
public class OaWageStatistics implements Serializable {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 表名称
     */
    private String name;

    /**
     * 实发总额
     */
    private String grossActualAmount;

    /**
     * 结算日期
     */
    private String settlementDate;

    /**
     * 总人数
     */
    private String overallNumberPeople;

    /**
     * 已发数
     */
    private String quantityIssued;

    /**
     * 创建日期
     */
    private Date createDate;

    /**
     * 创建日期Str
     */
    private String createDateStr;

    /**
     * 状态
     */
    private Integer state;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGrossActualAmount() {
        return grossActualAmount;
    }

    public void setGrossActualAmount(String grossActualAmount) {
        this.grossActualAmount = grossActualAmount;
    }

    public String getSettlementDate() {
        return settlementDate;
    }

    public void setSettlementDate(String settlementDate) {
        this.settlementDate = settlementDate;
    }

    public String getOverallNumberPeople() {
        return overallNumberPeople;
    }

    public void setOverallNumberPeople(String overallNumberPeople) {
        this.overallNumberPeople = overallNumberPeople;
    }

    public String getQuantityIssued() {
        return quantityIssued;
    }

    public void setQuantityIssued(String quantityIssued) {
        this.quantityIssued = quantityIssued;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getCreateDateStr() {
        return createDateStr;
    }

    public void setCreateDateStr(String createDateStr) {
        this.createDateStr = createDateStr;
    }
}