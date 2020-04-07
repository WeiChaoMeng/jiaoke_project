package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * oa-资产操作记录
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:17
 */
@Table(name = "oa_asset_operating_record")
public class OaAssetOperatingRecord {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 操作前资产名字
     */
    private String beforeAssetsName;

    /**
     * 操作后资产名字
     */
    private String afterAssetsName;

    /**
     * 操作前资产数量
     */
    private String beforeAssetsNumber;

    /**
     * 操作后资产数量
     */
    private String afterAssetsNumber;

    /**
     * 操作类型
     */
    private String operatorType;

    /**
     * 操作说明
     */
    private String operatorDescription;

    /**
     * 操作人
     */
    private String operatorPerson;

    /**
     * 操作时间
     */
    private Date operatorTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBeforeAssetsName() {
        return beforeAssetsName;
    }

    public void setBeforeAssetsName(String beforeAssetsName) {
        this.beforeAssetsName = beforeAssetsName;
    }

    public String getAfterAssetsName() {
        return afterAssetsName;
    }

    public void setAfterAssetsName(String afterAssetsName) {
        this.afterAssetsName = afterAssetsName;
    }

    public String getBeforeAssetsNumber() {
        return beforeAssetsNumber;
    }

    public void setBeforeAssetsNumber(String beforeAssetsNumber) {
        this.beforeAssetsNumber = beforeAssetsNumber;
    }

    public String getAfterAssetsNumber() {
        return afterAssetsNumber;
    }

    public void setAfterAssetsNumber(String afterAssetsNumber) {
        this.afterAssetsNumber = afterAssetsNumber;
    }

    public String getOperatorType() {
        return operatorType;
    }

    public void setOperatorType(String operatorType) {
        this.operatorType = operatorType;
    }

    public String getOperatorDescription() {
        return operatorDescription;
    }

    public void setOperatorDescription(String operatorDescription) {
        this.operatorDescription = operatorDescription;
    }

    public String getOperatorPerson() {
        return operatorPerson;
    }

    public void setOperatorPerson(String operatorPerson) {
        this.operatorPerson = operatorPerson;
    }

    public Date getOperatorTime() {
        return operatorTime;
    }

    public void setOperatorTime(Date operatorTime) {
        this.operatorTime = operatorTime;
    }
}
