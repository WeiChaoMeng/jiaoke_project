package com.jiaoke.oa.bean;

import java.util.Date;

/**
 * 审批表单临时存储表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
public class OaActTemporary {

    /**
     * 主键
     */
    private String id;

    /**
     * 标题
     */
    private String title;

    /**
     * 创建日期
     */
    private Date createTime;
    private String createTimeStr;

    /**
     * 发起人
     */
    private String promoter;

    /**
     * 查询路径
     */
    private String url;

    /**
     * 任务id
     */
    private String taskId;

    /**
     * 流程实例Id
     */
    private String processInstanceId;

    /**
     * 当前待办人
     */
    private String currentExecutor;

    /**
     * 发起时间
     */
    private Date startTime;
    private String startTimeStr;

    /**
     * 接收时间
     */
    private Date receiptTime;
    private String receiptTimeStr;

    /**
     * 业务关键
     */
    private String businessKey;

    /**
     * 上一处理人
     */
    private String previousApprover;

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

    public String getPromoter() {
        return promoter;
    }

    public void setPromoter(String promoter) {
        this.promoter = promoter;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }

    public String getCurrentExecutor() {
        return currentExecutor;
    }

    public void setCurrentExecutor(String currentExecutor) {
        this.currentExecutor = currentExecutor;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public String getStartTimeStr() {
        return startTimeStr;
    }

    public void setStartTimeStr(String startTimeStr) {
        this.startTimeStr = startTimeStr;
    }

    public String getBusinessKey() {
        return businessKey;
    }

    public void setBusinessKey(String businessKey) {
        this.businessKey = businessKey;
    }

    public String getPreviousApprover() {
        return previousApprover;
    }

    public void setPreviousApprover(String previousApprover) {
        this.previousApprover = previousApprover;
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
}
