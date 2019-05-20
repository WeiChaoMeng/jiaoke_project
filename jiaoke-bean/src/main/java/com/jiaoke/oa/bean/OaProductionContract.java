package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 生产管理部-合同
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 11:12
 */
@Table(name = "oa_production_contract")
public class OaProductionContract {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 合同编号
     */
    private String numbering;

    /**
     * 合同名称
     */
    private String name;

    /**
     * 合同相对人
     */
    private String relativePerson;

    /**
     * 合同内容
     */
    private String content;

    /**
     * 合同金额
     */
    private String amount;

    /**
     * 存放地点
     */
    private String storageLocation;

    /**
     * 备注
     */
    private String remark;

    /**
     * 富文本
     */
    private String richText;

    /**
     * 创建时间
     */
    private Date createDate;
    @Transient
    private String createDateStr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumbering() {
        return numbering;
    }

    public void setNumbering(String numbering) {
        this.numbering = numbering;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRelativePerson() {
        return relativePerson;
    }

    public void setRelativePerson(String relativePerson) {
        this.relativePerson = relativePerson;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getStorageLocation() {
        return storageLocation;
    }

    public void setStorageLocation(String storageLocation) {
        this.storageLocation = storageLocation;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getRichText() {
        return richText;
    }

    public void setRichText(String richText) {
        this.richText = richText;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreateDateStr() {
        return createDateStr;
    }

    public void setCreateDateStr(String createDateStr) {
        this.createDateStr = createDateStr;
    }
}
