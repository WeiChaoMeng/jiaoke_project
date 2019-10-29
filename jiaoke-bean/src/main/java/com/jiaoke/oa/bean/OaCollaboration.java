package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * OA协同
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 16:54
 */
@Table(name = "oa_collaboration")
public class OaCollaboration {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 标题
     */
    private String title;

    /**
     * 表名称
     */
    private String table;

    /**
     * 关联id
     */
    private String correlationId;

    /**
     * 访问路径
     */
    private String url;

    /**
     * 状态
     */
    private Integer state;

    /**
     * 创建时间
     */
    private Date createTime;
    @Transient
    private String createTimeStr;

    //临时
    /**
     * 开始时间
     */
    private String startTimeStr;

    /**
     * 当前待办人
     */
    private String currentExecutor;

    /**
     * 流程实例Id
     */
    private String processInstanceId;

    /**
     * 任务Id
     */
    private String taskId;

    /**
     * 发起人
     */
    private Integer promoter;
    private String promoterStr;

    /**
     * 接收时间
     */
    private String receiptTimeStr;

    /**
     * 上一审批人
     */
    private String previousApprover;


    /**
     * 当前待办人
     */
    private List<String> currentExecutorList;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTable() {
        return table;
    }

    public void setTable(String table) {
        this.table = table;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
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

    public String getCorrelationId() {
        return correlationId;
    }

    public void setCorrelationId(String correlationId) {
        this.correlationId = correlationId;
    }

    public String getStartTimeStr() {
        return startTimeStr;
    }

    public void setStartTimeStr(String startTimeStr) {
        this.startTimeStr = startTimeStr;
    }

    public String getCurrentExecutor() {
        return currentExecutor;
    }

    public void setCurrentExecutor(String currentExecutor) {
        this.currentExecutor = currentExecutor;
    }

    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }

    public Integer getPromoter() {
        return promoter;
    }

    public void setPromoter(Integer promoter) {
        this.promoter = promoter;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getReceiptTimeStr() {
        return receiptTimeStr;
    }

    public void setReceiptTimeStr(String receiptTimeStr) {
        this.receiptTimeStr = receiptTimeStr;
    }

    public String getPreviousApprover() {
        return previousApprover;
    }

    public void setPreviousApprover(String previousApprover) {
        this.previousApprover = previousApprover;
    }

    public String getPromoterStr() {
        return promoterStr;
    }

    public void setPromoterStr(String promoterStr) {
        this.promoterStr = promoterStr;
    }

    public List<String> getCurrentExecutorList() {
        return currentExecutorList;
    }

    public void setCurrentExecutorList(List<String> currentExecutorList) {
        this.currentExecutorList = currentExecutorList;
    }
}
