package com.jiaoke.oa.bean;

import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.Date;

/**
 * OA-公文
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/15 11:00
 */

public class OaDocument implements Serializable {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 表单标题
     */
    private String formTitle;

    /**
     * 重要级别：0普通，1重要，2非常重要
     */
    private Integer importance;

    /**
     * 关联项目
     */
    private String associatedProject;

    /**
     * 预归档
     */
    private String preArchiving;

    /**
     * 表单流程
     */
    private String flow;

    /**
     * 流程期限
     */
    private String processDeadline;
    /**
     * 跟踪：1全部，2指定
     */
    private Integer track;

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
    private Integer rank;

    /**
     * 标识
     */
    private Integer identification;

    /**
     * 拟稿部门
     */
    private String draftingDepartment;

    /**
     * 拟稿人
     */
    private String draftedPerson;

    /**
     * 核稿人
     */
    private String nuclearDrafts;

    /**
     * 签发
     */
    private String issue;

    /**
     * 会签
     */
    private String countersign;

    /**
     * 保存期限
     */
    private Integer storageLife;

    /**
     * 发文类型
     */
    private String docType;

    /**
     * 发文时间
     */
    private String writingTime;

    /**
     * 抄送
     */
    private String copyGive;

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
    private String attachment;

    /**
     * 创建时间
     */
    private Date createTime;

    private String createTimeStr;

    /**
     * 流程状态
     */
    private String processState;

    /**
     * 表单状态：0已发，1待发，2已办，3待办，4草稿
     */
    private Integer formState;

    /**
     * 发布人id
     */
    private String userInfoId;

    /**
     * 处理状态：1未读，2已读
     */
    private Integer processingState;

    /**
     * 催办次数
     */
    private Integer urgingNumber;

    /**
     * 任务id
     */
    private String taskId;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFormTitle() {
        return formTitle;
    }

    public void setFormTitle(String formTitle) {
        this.formTitle = formTitle;
    }

    public Integer getImportance() {
        return importance;
    }

    public void setImportance(Integer importance) {
        this.importance = importance;
    }

    public String getAssociatedProject() {
        return associatedProject;
    }

    public void setAssociatedProject(String associatedProject) {
        this.associatedProject = associatedProject;
    }

    public String getPreArchiving() {
        return preArchiving;
    }

    public void setPreArchiving(String preArchiving) {
        this.preArchiving = preArchiving;
    }

    public String getFlow() {
        return flow;
    }

    public void setFlow(String flow) {
        this.flow = flow;
    }

    public String getProcessDeadline() {
        return processDeadline;
    }

    public void setProcessDeadline(String processDeadline) {
        this.processDeadline = processDeadline;
    }

    public Integer getTrack() {
        return track;
    }

    public void setTrack(Integer track) {
        this.track = track;
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

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    public Integer getIdentification() {
        return identification;
    }

    public void setIdentification(Integer identification) {
        this.identification = identification;
    }

    public String getDraftingDepartment() {
        return draftingDepartment;
    }

    public void setDraftingDepartment(String draftingDepartment) {
        this.draftingDepartment = draftingDepartment;
    }

    public String getDraftedPerson() {
        return draftedPerson;
    }

    public void setDraftedPerson(String draftedPerson) {
        this.draftedPerson = draftedPerson;
    }

    public String getNuclearDrafts() {
        return nuclearDrafts;
    }

    public void setNuclearDrafts(String nuclearDrafts) {
        this.nuclearDrafts = nuclearDrafts;
    }

    public String getIssue() {
        return issue;
    }

    public void setIssue(String issue) {
        this.issue = issue;
    }

    public String getCountersign() {
        return countersign;
    }

    public void setCountersign(String countersign) {
        this.countersign = countersign;
    }

    public Integer getStorageLife() {
        return storageLife;
    }

    public void setStorageLife(Integer storageLife) {
        this.storageLife = storageLife;
    }

    public String getDocType() {
        return docType;
    }

    public void setDocType(String docType) {
        this.docType = docType;
    }

    public String getWritingTime() {
        return writingTime;
    }

    public void setWritingTime(String writingTime) {
        this.writingTime = writingTime;
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

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
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

    public String getProcessState() {
        return processState;
    }

    public void setProcessState(String processState) {
        this.processState = processState;
    }

    public Integer getFormState() {
        return formState;
    }

    public void setFormState(Integer formState) {
        this.formState = formState;
    }

    public String getUserInfoId() {
        return userInfoId;
    }

    public void setUserInfoId(String userInfoId) {
        this.userInfoId = userInfoId;
    }

    public Integer getProcessingState() {
        return processingState;
    }

    public void setProcessingState(Integer processingState) {
        this.processingState = processingState;
    }

    public Integer getUrgingNumber() {
        return urgingNumber;
    }

    public void setUrgingNumber(Integer urgingNumber) {
        this.urgingNumber = urgingNumber;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }
}