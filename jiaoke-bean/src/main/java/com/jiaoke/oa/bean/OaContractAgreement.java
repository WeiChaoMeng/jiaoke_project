package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * oa-综合办公室档案-合同/协议
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 11:12
 */
@Table(name = "oa_contract_agreement")
public class OaContractAgreement {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 日期
     */
    private Date date;

    @Transient
    private String dateStr;

    /**
     * 合同标号
     */
    private String contractLabel;
    /**
     * 合同/协议名称
     */
    private String contractAgreementName;

    /**
     * 类型
     */
    private String type;

    /**
     * 年限
     */
    private String years;

    /**
     * 备注
     */
    private String remarks;

    /**
     * 富文本
     */
    private String richText;

    /**
     * 创建日期
     */
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDateStr() {
        return dateStr;
    }

    public void setDateStr(String dateStr) {
        this.dateStr = dateStr;
    }

    public String getContractLabel() {
        return contractLabel;
    }

    public void setContractLabel(String contractLabel) {
        this.contractLabel = contractLabel;
    }

    public String getContractAgreementName() {
        return contractAgreementName;
    }

    public void setContractAgreementName(String contractAgreementName) {
        this.contractAgreementName = contractAgreementName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getYears() {
        return years;
    }

    public void setYears(String years) {
        this.years = years;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getRichText() {
        return richText;
    }

    public void setRichText(String richText) {
        this.richText = richText;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
