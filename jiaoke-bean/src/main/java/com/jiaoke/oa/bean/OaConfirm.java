package com.jiaoke.oa.bean;

import javax.persistence.Table;

/**
 * 确认单审批单-详情
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_confirm")
public class OaConfirm {

    /**
     * 主键
     */
    private String id;

    /**
     * 品种
     */
    private String variety;

    /**
     * 单价
     */
    private String univalent;

    /**
     * 数量
     */
    private String number;

    /**
     * 金额
     */
    private String money;

    /**
     * 确认单审id
     */
    private String confirmId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getVariety() {
        return variety;
    }

    public void setVariety(String variety) {
        this.variety = variety;
    }

    public String getUnivalent() {
        return univalent;
    }

    public void setUnivalent(String univalent) {
        this.univalent = univalent;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getConfirmId() {
        return confirmId;
    }

    public void setConfirmId(String confirmId) {
        this.confirmId = confirmId;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }
}
