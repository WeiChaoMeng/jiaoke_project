package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * oa-资产补货
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:17
 */

public class OaAssetReplenishment {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 资产名称
     */
    private String assetsName;

    /**
     * 资产保管人
     */
    private String assetsCustodian;

    /**
     * 补货前剩余数量
     */
    private Integer replenishmentBeforeQuantity;

    /**
     * 补货数量
     */
    private Integer replenishmentQuantity;

    /**
     * 补货人员
     */
    private String replenishmentPerson;

    /**
     * 补货存放地点
     */
    private String replenishmentStorageLocation;

    /**
     * 补货备注
     */
    private String replenishmentRemarks;

    /**
     * 补货时间
     */
    private Date createTime;

    @Transient
    private String createTimeStr;

    /**
     * 资产管理id
     */
    private Integer assetManagementId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAssetsName() {
        return assetsName;
    }

    public void setAssetsName(String assetsName) {
        this.assetsName = assetsName;
    }

    public String getAssetsCustodian() {
        return assetsCustodian;
    }

    public void setAssetsCustodian(String assetsCustodian) {
        this.assetsCustodian = assetsCustodian;
    }

    public Integer getReplenishmentBeforeQuantity() {
        return replenishmentBeforeQuantity;
    }

    public void setReplenishmentBeforeQuantity(Integer replenishmentBeforeQuantity) {
        this.replenishmentBeforeQuantity = replenishmentBeforeQuantity;
    }

    public Integer getReplenishmentQuantity() {
        return replenishmentQuantity;
    }

    public void setReplenishmentQuantity(Integer replenishmentQuantity) {
        this.replenishmentQuantity = replenishmentQuantity;
    }

    public String getReplenishmentPerson() {
        return replenishmentPerson;
    }

    public void setReplenishmentPerson(String replenishmentPerson) {
        this.replenishmentPerson = replenishmentPerson;
    }

    public String getReplenishmentStorageLocation() {
        return replenishmentStorageLocation;
    }

    public void setReplenishmentStorageLocation(String replenishmentStorageLocation) {
        this.replenishmentStorageLocation = replenishmentStorageLocation;
    }

    public String getReplenishmentRemarks() {
        return replenishmentRemarks;
    }

    public void setReplenishmentRemarks(String replenishmentRemarks) {
        this.replenishmentRemarks = replenishmentRemarks;
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

    public Integer getAssetManagementId() {
        return assetManagementId;
    }

    public void setAssetManagementId(Integer assetManagementId) {
        this.assetManagementId = assetManagementId;
    }
}
