package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 用车审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_car")
public class OaActCar {

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
     * 使用人
     */
    private String user;

    /**
     * 车牌号
     */
    private String licensePlate;

    /**
     * 车辆性质:0、私家车，1、享车补车
     */
    private Integer properties;

    /**
     * 事由
     */
    private String cause;

    /**
     * 目的地
     */
    private String destination;

    /**
     * 开始时间
     */
    private Date startTime;
    @Transient
    private String startTimeStr;

    /**
     * 结束时间
     */
    private Date endTime;
    @Transient
    private String endTimeStr;

    /**
     * 公里基数
     */
    private String cardinalNumber;

    /**
     * 使用后数
     */
    private String after;

    /**
     * 行驶数
     */
    private String drivingNumber;

    /**
     * 计费(元)
     */
    private String billing;

    /**
     * 附件
     */
    private String annex;

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

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    public Integer getProperties() {
        return properties;
    }

    public void setProperties(Integer properties) {
        this.properties = properties;
    }

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public String getStartTimeStr() {
        return startTimeStr;
    }

    public void setStartTimeStr(String startTimeStr) {
        this.startTimeStr = startTimeStr;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getEndTimeStr() {
        return endTimeStr;
    }

    public void setEndTimeStr(String endTimeStr) {
        this.endTimeStr = endTimeStr;
    }

    public String getCardinalNumber() {
        return cardinalNumber;
    }

    public void setCardinalNumber(String cardinalNumber) {
        this.cardinalNumber = cardinalNumber;
    }

    public String getAfter() {
        return after;
    }

    public void setAfter(String after) {
        this.after = after;
    }

    public String getDrivingNumber() {
        return drivingNumber;
    }

    public void setDrivingNumber(String drivingNumber) {
        this.drivingNumber = drivingNumber;
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

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getBilling() {
        return billing;
    }

    public void setBilling(String billing) {
        this.billing = billing;
    }

    public String getAnnex() {
        return annex;
    }

    public void setAnnex(String annex) {
        this.annex = annex;
    }

    public String getPromoterStr() {
        return promoterStr;
    }

    public void setPromoterStr(String promoterStr) {
        this.promoterStr = promoterStr;
    }
}