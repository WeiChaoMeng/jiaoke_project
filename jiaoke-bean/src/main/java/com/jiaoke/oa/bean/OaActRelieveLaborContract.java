package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 解除劳动合同审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_relieve_labor_contract")
public class OaActRelieveLaborContract {

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
     * 名字
     */
    private String name;

    /**
     * 入职时间
     */
    private Date entryDate;
    @Transient
    private String entryDateStr;

    /**
     * 部门及职位
     */
    private String departmentPosition;

    /**
     * 申请离职日期
     */
    private Date applyDepartureDate;
    @Transient
    private String applyDepartureDateStr;

    /**
     * 解除类型
     */
    private Integer relieveType;

    /**
     * 解除劳动合同原因
     */
    private String reason;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(Date entryDate) {
        this.entryDate = entryDate;
    }

    public String getEntryDateStr() {
        return entryDateStr;
    }

    public void setEntryDateStr(String entryDateStr) {
        this.entryDateStr = entryDateStr;
    }

    public String getDepartmentPosition() {
        return departmentPosition;
    }

    public void setDepartmentPosition(String departmentPosition) {
        this.departmentPosition = departmentPosition;
    }

    public Date getApplyDepartureDate() {
        return applyDepartureDate;
    }

    public void setApplyDepartureDate(Date applyDepartureDate) {
        this.applyDepartureDate = applyDepartureDate;
    }

    public String getApplyDepartureDateStr() {
        return applyDepartureDateStr;
    }

    public void setApplyDepartureDateStr(String applyDepartureDateStr) {
        this.applyDepartureDateStr = applyDepartureDateStr;
    }

    public Integer getRelieveType() {
        return relieveType;
    }

    public void setRelieveType(Integer relieveType) {
        this.relieveType = relieveType;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPromoterStr() {
        return promoterStr;
    }

    public void setPromoterStr(String promoterStr) {
        this.promoterStr = promoterStr;
    }
}
