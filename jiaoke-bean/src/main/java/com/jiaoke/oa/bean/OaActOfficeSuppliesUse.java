package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;
import java.util.List;

/**
 * 办公用品领用
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_office_supplies_use")
public class OaActOfficeSuppliesUse {

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
     * 办公用品领用详情
     */
    @Transient
    private List<OaOfficeSuppliesUse> oaOfficeSuppliesUseList;

    /**
     * 领用部门
     */
    private String recipientsDepartment;

    /**
     * 领用人
     */
    private String recipientsPreparer;

    /**
     * 领用时间
     */
    private String recipientsDate;

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

    /**
     * 附件
     */
    private String annex;

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

    public List<OaOfficeSuppliesUse> getOaOfficeSuppliesUseList() {
        return oaOfficeSuppliesUseList;
    }

    public void setOaOfficeSuppliesUseList(List<OaOfficeSuppliesUse> oaOfficeSuppliesUseList) {
        this.oaOfficeSuppliesUseList = oaOfficeSuppliesUseList;
    }

    public String getRecipientsDepartment() {
        return recipientsDepartment;
    }

    public void setRecipientsDepartment(String recipientsDepartment) {
        this.recipientsDepartment = recipientsDepartment;
    }

    public String getRecipientsPreparer() {
        return recipientsPreparer;
    }

    public void setRecipientsPreparer(String recipientsPreparer) {
        this.recipientsPreparer = recipientsPreparer;
    }

    public String getRecipientsDate() {
        return recipientsDate;
    }

    public void setRecipientsDate(String recipientsDate) {
        this.recipientsDate = recipientsDate;
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

    public String getAnnex() {
        return annex;
    }

    public void setAnnex(String annex) {
        this.annex = annex;
    }
}
