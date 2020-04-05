package com.jiaoke.oa.bean;

import javax.persistence.Table;

/**
 * 单价审批表-详情
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_unit_price")
public class OaUnitPrice {

    /**
     * 主键
     */
    private String id;

    /**
     * 产品名称
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
     * 单价审批表id
     */
    private String unitPriceId;

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

    public String getUnitPriceId() {
        return unitPriceId;
    }

    public void setUnitPriceId(String unitPriceId) {
        this.unitPriceId = unitPriceId;
    }
}
