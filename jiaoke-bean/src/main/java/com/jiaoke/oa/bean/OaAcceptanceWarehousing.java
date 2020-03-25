package com.jiaoke.oa.bean;

import javax.persistence.Table;

/**
 * 验收入库单 - 内容
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_acceptance_warehousing")
public class OaAcceptanceWarehousing {

    /**
     * 主键
     */
    private String id;

    /**
     * 物品名称
     */
    private String name;

    /**
     * 数量
     */
    private String number;

    /**
     * 验收时间
     */
    private String date;

    /**
     * 备注
     */
    private String remark;

    /**
     * 验收入库单ID
     */
    private String acceptanceWarehousingId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getAcceptanceWarehousingId() {
        return acceptanceWarehousingId;
    }

    public void setAcceptanceWarehousingId(String acceptanceWarehousingId) {
        this.acceptanceWarehousingId = acceptanceWarehousingId;
    }
}
