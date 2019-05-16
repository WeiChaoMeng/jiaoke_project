package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 财务管理部-票据
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 11:12
 */
@Table(name = "oa_finance_bill")
public class OaFinanceBill {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 号段
     */
    private String numberSegment;

    /**
     * 张数
     */
    private String number;

    /**
     * 开票日期
     */
    private Date invoiceDate;
    @Transient
    private String invoiceDateStr;

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

    public String getNumberSegment() {
        return numberSegment;
    }

    public void setNumberSegment(String numberSegment) {
        this.numberSegment = numberSegment;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Date getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public String getInvoiceDateStr() {
        return invoiceDateStr;
    }

    public void setInvoiceDateStr(String invoiceDateStr) {
        this.invoiceDateStr = invoiceDateStr;
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
