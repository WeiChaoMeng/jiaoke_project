package com.jiaoke.oa.bean;

import javax.persistence.Table;

/**
 * 办公用品需求计划 - 内容
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_office_supplies")
public class OaOfficeSupplies {

    /**
     * 主键
     */
    private String id;

    /**
     * 项目
     */
    private String item;

    /**
     * 数量
     */
    private String number;

    /**
     * 单价
     */
    private String price;

    /**
     * 金额
     */
    private String money;

    /**
     * 办公用品表ID
     */
    private String officeSuppliesId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getOfficeSuppliesId() {
        return officeSuppliesId;
    }

    public void setOfficeSuppliesId(String officeSuppliesId) {
        this.officeSuppliesId = officeSuppliesId;
    }
}
