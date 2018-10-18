package com.jiaoke.oa.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * oa_contract_archives
 * @author 
 */
public class OaContractArchives implements Serializable {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 合同编号
     */
    private String serialNumber;

    /**
     * 标题
     */
    private String title;

    /**
     * 摘要
     */
    private String archivesAbstract;

    /**
     * 经办人
     */
    private String operator;

    /**
     * 签署单位
     */
    private String signingUnit;

    /**
     * 签署日期
     */
    private String signingDate;

    /**
     * 建档日期
     */
    private Date createdDate;

    private String createdDateStr;

    /**
     * 富文本
     */
    private String richText;

    /**
     * 状态
     */
    private Integer state;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getArchivesAbstract() {
        return archivesAbstract;
    }

    public void setArchivesAbstract(String archivesAbstract) {
        this.archivesAbstract = archivesAbstract;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getSigningUnit() {
        return signingUnit;
    }

    public void setSigningUnit(String signingUnit) {
        this.signingUnit = signingUnit;
    }

    public String getSigningDate() {
        return signingDate;
    }

    public void setSigningDate(String signingDate) {
        this.signingDate = signingDate;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getRichText() {
        return richText;
    }

    public void setRichText(String richText) {
        this.richText = richText;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getCreatedDateStr() {
        return createdDateStr;
    }

    public void setCreatedDateStr(String createdDateStr) {
        this.createdDateStr = createdDateStr;
    }
}