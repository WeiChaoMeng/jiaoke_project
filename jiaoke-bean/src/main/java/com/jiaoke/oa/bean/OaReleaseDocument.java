package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * oa-综合办公室档案-公司发文
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 11:12
 */
@Table(name = "oa_release_document")
public class OaReleaseDocument {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 发文编号
     */
    private String documentNumber;

    /**
     * 文件类型
     */
    private Integer documentType;

    /**
     * 文件名称
     */
    private String documentName;

    /**
     * 访问日期
     */
    private Date visitDate;

    @Transient
    private String visitDateStr;

    /**
     * 主送部门
     */
    private String mainDeliveryDepartment;

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

    public String getDocumentNumber() {
        return documentNumber;
    }

    public void setDocumentNumber(String documentNumber) {
        this.documentNumber = documentNumber;
    }

    public Integer getDocumentType() {
        return documentType;
    }

    public void setDocumentType(Integer documentType) {
        this.documentType = documentType;
    }

    public String getDocumentName() {
        return documentName;
    }

    public void setDocumentName(String documentName) {
        this.documentName = documentName;
    }

    public Date getVisitDate() {
        return visitDate;
    }

    public void setVisitDate(Date visitDate) {
        this.visitDate = visitDate;
    }

    public String getMainDeliveryDepartment() {
        return mainDeliveryDepartment;
    }

    public void setMainDeliveryDepartment(String mainDeliveryDepartment) {
        this.mainDeliveryDepartment = mainDeliveryDepartment;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getVisitDateStr() {
        return visitDateStr;
    }

    public void setVisitDateStr(String visitDateStr) {
        this.visitDateStr = visitDateStr;
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
