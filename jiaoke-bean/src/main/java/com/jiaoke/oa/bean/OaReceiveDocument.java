package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * oa-综合办公室档案-公司收文
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 11:12
 */
@Table(name = "oa_receive_document")
public class OaReceiveDocument {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 收文时间
     */
    private Date receiveDate;

    @Transient
    private String receiveDateStr;

    /**
     * 收文编号
     */
    private String documentNumber;

    /**
     * 来文字号
     */
    private String documentReceivedNumber;

    /**
     * 标题
     */
    private String documentName;

    /**
     * 备注
     */
    private String remarks;

    /**
     * 发文部室
     */
    private Integer publishingDepartment;

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

    public Date getReceiveDate() {
        return receiveDate;
    }

    public void setReceiveDate(Date receiveDate) {
        this.receiveDate = receiveDate;
    }

    public String getReceiveDateStr() {
        return receiveDateStr;
    }

    public void setReceiveDateStr(String receiveDateStr) {
        this.receiveDateStr = receiveDateStr;
    }

    public String getDocumentNumber() {
        return documentNumber;
    }

    public void setDocumentNumber(String documentNumber) {
        this.documentNumber = documentNumber;
    }

    public String getDocumentReceivedNumber() {
        return documentReceivedNumber;
    }

    public void setDocumentReceivedNumber(String documentReceivedNumber) {
        this.documentReceivedNumber = documentReceivedNumber;
    }

    public String getDocumentName() {
        return documentName;
    }

    public void setDocumentName(String documentName) {
        this.documentName = documentName;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Integer getPublishingDepartment() {
        return publishingDepartment;
    }

    public void setPublishingDepartment(Integer publishingDepartment) {
        this.publishingDepartment = publishingDepartment;
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
