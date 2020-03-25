package com.jiaoke.oa.bean;

import javax.persistence.Table;

/**
 * oa-资产领用记录
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_asset_use")
public class OaAssetUse {

    /**
     * 主键
     */
    private String id;

    /**
     * 资产名称
     */
    private String assetName;

    /**
     * 领用前数量
     */
    private String useBeforeNumber;

    /**
     * 领用数量
     */
    private String useNumber;

    /**
     * 领用后数量
     */
    private String useAfterNumber;

    /**
     * 领用部门
     */
    private String useDepartment;

    /**
     * 领用人
     */
    private String usePerson;

    /**
     * 领用时间
     */
    private String useDate;

    /**
     * 保管人
     */
    private String custodian;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAssetName() {
        return assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }

    public String getUseBeforeNumber() {
        return useBeforeNumber;
    }

    public void setUseBeforeNumber(String useBeforeNumber) {
        this.useBeforeNumber = useBeforeNumber;
    }

    public String getUseNumber() {
        return useNumber;
    }

    public void setUseNumber(String useNumber) {
        this.useNumber = useNumber;
    }

    public String getUseAfterNumber() {
        return useAfterNumber;
    }

    public void setUseAfterNumber(String useAfterNumber) {
        this.useAfterNumber = useAfterNumber;
    }

    public String getUseDepartment() {
        return useDepartment;
    }

    public void setUseDepartment(String useDepartment) {
        this.useDepartment = useDepartment;
    }

    public String getUsePerson() {
        return usePerson;
    }

    public void setUsePerson(String usePerson) {
        this.usePerson = usePerson;
    }

    public String getUseDate() {
        return useDate;
    }

    public void setUseDate(String useDate) {
        this.useDate = useDate;
    }

    public String getCustodian() {
        return custodian;
    }

    public void setCustodian(String custodian) {
        this.custodian = custodian;
    }
}
