package com.jiaoke.oa.bean;

import javax.persistence.Table;

/**
 * 办公用品领用-详情
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_office_supplies_use")
public class OaOfficeSuppliesUse {

    /**
     * 主键
     */
    private String id;

    /**
     * 资产id
     */
    private String assetId;

    /**
     * 资产名称
     */
    private String name;

    /**
     * 领用数量
     */
    private String number;

    /**
     * 办公用品领用ID
     */
    private String officeSuppliesUseId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAssetId() {
        return assetId;
    }

    public void setAssetId(String assetId) {
        this.assetId = assetId;
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

    public String getOfficeSuppliesUseId() {
        return officeSuppliesUseId;
    }

    public void setOfficeSuppliesUseId(String officeSuppliesUseId) {
        this.officeSuppliesUseId = officeSuppliesUseId;
    }
}
