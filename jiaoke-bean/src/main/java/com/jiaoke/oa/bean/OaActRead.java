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
     * 部门编号
     */
    private String departmentNumbering;

    /**
     * 编号
     */
    private String numbering;

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
    private String receiptTime;

    /**
     * 文件标题
     */
    private String fileTitle;

    /**
     * 拟办部门0.领导班子，1.各部门负责人
     */
    private Integer receiptDepartment;

    /**
     * 拟办意见
     */
    private String receiptProposed;

    /**
     * 拟办意见内容
     */
    private String receiptProposedContent;

    /**
     * 拟办意见时间
     */
    private String receiptProposedDate;

    /**
     * 领导批示
     */
    private String companyPrincipal;

    /**
     * 领导批示内容
     */
    private String companyPrincipalContent;

    /**
     * 领导批示时间
     */
    private String companyPrincipalDate;

    /**
     * 办理结果
     */
    private String outcome;
    private String outcomeContent;
    private String outcomeDate;

    /**
     * 保存期限（10年，30年，永久）
     */
    private Integer deadline;

    /**
     * 状态
     */
    private Integer state;

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

    public String getDepartmentNumbering() {
        return departmentNumbering;
    }

    public void setDepartmentNumbering(String departmentNumbering) {
        this.departmentNumbering = departmentNumbering;
    }

    public String getNumbering() {
        return numbering;
    }

    public void setNumbering(String numbering) {
        this.numbering = numbering;
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

    public String getReceiptTime() {
        return receiptTime;
    }

    public void setReceiptTime(String receiptTime) {
        this.receiptTime = receiptTime;
    }

    public String getFileTitle() {
        return fileTitle;
    }

    public void setFileTitle(String fileTitle) {
        this.fileTitle = fileTitle;
    }

    public String getOutcome() {
        return outcome;
    }

    public void setOutcome(String outcome) {
        this.outcome = outcome;
    }

    public Integer getDeadline() {
        return deadline;
    }

    public void setDeadline(Integer deadline) {
        this.deadline = deadline;
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

    public String getReceiptProposed() {
        return receiptProposed;
    }

    public void setReceiptProposed(String receiptProposed) {
        this.receiptProposed = receiptProposed;
    }

    public String getCompanyPrincipal() {
        return companyPrincipal;
    }

    public void setCompanyPrincipal(String companyPrincipal) {
        this.companyPrincipal = companyPrincipal;
    }

    public String getReceiptProposedDate() {
        return receiptProposedDate;
    }

    public void setReceiptProposedDate(String receiptProposedDate) {
        this.receiptProposedDate = receiptProposedDate;
    }

    public String getCompanyPrincipalDate() {
        return companyPrincipalDate;
    }

    public void setCompanyPrincipalDate(String companyPrincipalDate) {
        this.companyPrincipalDate = companyPrincipalDate;
    }

    public String getReceiptProposedContent() {
        return receiptProposedContent;
    }

    public void setReceiptProposedContent(String receiptProposedContent) {
        this.receiptProposedContent = receiptProposedContent;
    }

    public String getCompanyPrincipalContent() {
        return companyPrincipalContent;
    }

    public void setCompanyPrincipalContent(String companyPrincipalContent) {
        this.companyPrincipalContent = companyPrincipalContent;
    }

    public Integer getReceiptDepartment() {
        return receiptDepartment;
    }

    public void setReceiptDepartment(Integer receiptDepartment) {
        this.receiptDepartment = receiptDepartment;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getOutcomeContent() {
        return outcomeContent;
    }

    public void setOutcomeContent(String outcomeContent) {
        this.outcomeContent = outcomeContent;
    }

    public String getOutcomeDate() {
        return outcomeDate;
    }

    public void setOutcomeDate(String outcomeDate) {
        this.outcomeDate = outcomeDate;
    }
}
