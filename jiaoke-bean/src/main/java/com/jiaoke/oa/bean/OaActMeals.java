package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 客饭审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_meals")
public class OaActMeals {

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
     * 点菜人
     */
    private String applicant;

    /**
     * 招待事由
     */
    private String entertain;

    /**
     * 用餐时间
     */
    private Date diningTime;
    @Transient
    private String diningTimeStr;

    /**
     * 标准:0、10元，1、20元等
     */
    private Integer standard;

    /**
     * 厨师选择：0、大厨，1、二厨
     */
    private Integer chef;

    /**
     * 人数
     */
    private String number;

    /**
     * 地点
     */
    private String place;

    /**
     * 桌数
     */
    private String tableNumber;

    /**
     * 菜品：0、A类，1、B类等
     */
    private Integer dishes;

    /**
     * 菜品内容
     */
    private String dishesContent;

    /**
     * 备份
     */
    private String remarks;

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

    public String getApplicant() {
        return applicant;
    }

    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }

    public String getEntertain() {
        return entertain;
    }

    public void setEntertain(String entertain) {
        this.entertain = entertain;
    }

    public Date getDiningTime() {
        return diningTime;
    }

    public void setDiningTime(Date diningTime) {
        this.diningTime = diningTime;
    }

    public String getDiningTimeStr() {
        return diningTimeStr;
    }

    public void setDiningTimeStr(String diningTimeStr) {
        this.diningTimeStr = diningTimeStr;
    }

    public Integer getStandard() {
        return standard;
    }

    public void setStandard(Integer standard) {
        this.standard = standard;
    }

    public Integer getChef() {
        return chef;
    }

    public void setChef(Integer chef) {
        this.chef = chef;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getTableNumber() {
        return tableNumber;
    }

    public void setTableNumber(String tableNumber) {
        this.tableNumber = tableNumber;
    }

    public Integer getDishes() {
        return dishes;
    }

    public void setDishes(Integer dishes) {
        this.dishes = dishes;
    }

    public String getDishesContent() {
        return dishesContent;
    }

    public void setDishesContent(String dishesContent) {
        this.dishesContent = dishesContent;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
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
}
