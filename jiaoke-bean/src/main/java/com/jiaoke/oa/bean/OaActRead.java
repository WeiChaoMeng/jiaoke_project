package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 收文阅办审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_read")
public class OaActRead {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    private String id;

    /**
     * 标题
     */
    private String title;

    /**
     * 编号
     */
    private String number;

    /**
     * 来文机关
     */
    private String organ;

    /**
     * 来文字号
     */
    private String fontSize;

    /**
     * 份数
     */
    private String copies;

    /**
     * 收文日期
     */
    private Date receiptTime;
    @Transient
    private String receiptTimeStr;

    /**
     * 保存期限（10年，30年，永久）
     */
    private Integer deadline;

    /**
     * 附件
     */
    private String annex;
    /**
     * 创建日期
     */
    private Date createTime;
    @Transient
    private String createTimeStr;

    /**
     * 发起人
     */
    private Integer promoter;

    /**
     * 查询路径
     */
    private String url;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getOrgan() {
        return organ;
    }

    public void setOrgan(String organ) {
        this.organ = organ;
    }

    public String getFontSize() {
        return fontSize;
    }

    public void setFontSize(String fontSize) {
        this.fontSize = fontSize;
    }

    public String getCopies() {
        return copies;
    }

    public void setCopies(String copies) {
        this.copies = copies;
    }

    public Date getReceiptTime() {
        return receiptTime;
    }

    public void setReceiptTime(Date receiptTime) {
        this.receiptTime = receiptTime;
    }

    public String getReceiptTimeStr() {
        return receiptTimeStr;
    }

    public void setReceiptTimeStr(String receiptTimeStr) {
        this.receiptTimeStr = receiptTimeStr;
    }

    public Integer getDeadline() {
        return deadline;
    }

    public void setDeadline(Integer deadline) {
        this.deadline = deadline;
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

    public Integer getPromoter() {
        return promoter;
    }

    public void setPromoter(Integer promoter) {
        this.promoter = promoter;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getAnnex() {
        return annex;
    }

    public void setAnnex(String annex) {
        this.annex = annex;
    }
}
