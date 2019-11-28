package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;
import java.util.Date;

/**
 * OA-公文
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/15 11:00
 */
@Table(name = "oa_act_document")
public class OaActDocument implements Serializable {

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
     * 文本标题
     */
    private String textTitle;

    /**
     * 文号
     */
    private String textNumber;

    /**
     * 密级
     */
    private Integer secretLevel;

    /**
     * 标识
     */
    private Integer identification;

    /**
     * 公文类型
     */
    private Integer docType;

    /**
     * 发文时间
     */
    private String writingTime;

    /**
     * 保存期限
     */
    private Integer storageLife;

    /**
     * 拟稿部门
     */
    private Integer draftingDepartment;

    /**
     * 拟稿人
     */
    private String draftedPerson;

    /**
     * 核稿人
     */
    private String supervisor;

    /**
     * 签发
     */
    private String companyPrincipal;

    /**
     * 会签
     */
    private String countersign;

    /**
     * 抄送
     */
    private String copyGive;

    /**
     * 抄送人员id
     */
    private String copyGiveId;

    /**
     * 内容
     */
    private String content;

    /**
     * 印制
     */
    private String print;

    /**
     * 校对
     */
    private String proofreading;

    /**
     * 附件份数
     */
    private Integer attachmentNumber;

    /**
     * 附件
     */
    private String annex;

    /**
     * 创建时间
     */
    private Date createTime;
    @Transient
    private String createTimeStr;

    /**
     * 发起人
     */
    private Integer promoter;
    @Transient
    private String promoterStr;

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

    public String getTextTitle() {
        return textTitle;
    }

    public void setTextTitle(String textTitle) {
        this.textTitle = textTitle;
    }

    public String getTextNumber() {
        return textNumber;
    }

    public void setTextNumber(String textNumber) {
        this.textNumber = textNumber;
    }

    public Integer getSecretLevel() {
        return secretLevel;
    }

    public void setSecretLevel(Integer secretLevel) {
        this.secretLevel = secretLevel;
    }

    public Integer getIdentification() {
        return identification;
    }

    public void setIdentification(Integer identification) {
        this.identification = identification;
    }

    public Integer getDocType() {
        return docType;
    }

    public void setDocType(Integer docType) {
        this.docType = docType;
    }

    public String getWritingTime() {
        return writingTime;
    }

    public void setWritingTime(String writingTime) {
        this.writingTime = writingTime;
    }

    public Integer getStorageLife() {
        return storageLife;
    }

    public void setStorageLife(Integer storageLife) {
        this.storageLife = storageLife;
    }

    public Integer getDraftingDepartment() {
        return draftingDepartment;
    }

    public void setDraftingDepartment(Integer draftingDepartment) {
        this.draftingDepartment = draftingDepartment;
    }

    public String getDraftedPerson() {
        return draftedPerson;
    }

    public void setDraftedPerson(String draftedPerson) {
        this.draftedPerson = draftedPerson;
    }

    public String getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(String supervisor) {
        this.supervisor = supervisor;
    }

    public String getCompanyPrincipal() {
        return companyPrincipal;
    }

    public void setCompanyPrincipal(String companyPrincipal) {
        this.companyPrincipal = companyPrincipal;
    }

    public String getCountersign() {
        return countersign;
    }

    public void setCountersign(String countersign) {
        this.countersign = countersign;
    }

    public String getCopyGive() {
        return copyGive;
    }

    public void setCopyGive(String copyGive) {
        this.copyGive = copyGive;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPrint() {
        return print;
    }

    public void setPrint(String print) {
        this.print = print;
    }

    public String getProofreading() {
        return proofreading;
    }

    public void setProofreading(String proofreading) {
        this.proofreading = proofreading;
    }

    public Integer getAttachmentNumber() {
        return attachmentNumber;
    }

    public void setAttachmentNumber(Integer attachmentNumber) {
        this.attachmentNumber = attachmentNumber;
    }

    public String getAnnex() {
        return annex;
    }

    public void setAnnex(String annex) {
        this.annex = annex;
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

    public String getPromoterStr() {
        return promoterStr;
    }

    public void setPromoterStr(String promoterStr) {
        this.promoterStr = promoterStr;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getCopyGiveId() {
        return copyGiveId;
    }

    public void setCopyGiveId(String copyGiveId) {
        this.copyGiveId = copyGiveId;
    }
}