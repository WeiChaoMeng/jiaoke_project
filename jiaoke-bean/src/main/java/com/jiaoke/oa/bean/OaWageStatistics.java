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
     * 上传人
     */
    private String uploadUsers;

    /**
     * 创建日期
     */
    private String createDate;

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

    public String getUploadUsers() {
        return uploadUsers;
    }

    public void setUploadUsers(String uploadUsers) {
        this.uploadUsers = uploadUsers;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }
}