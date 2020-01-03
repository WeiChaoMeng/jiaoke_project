package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 劳动合同终止通知书
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_labor_contract_stop")
public class OaActLaborContractStop {

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
     * 被通知人
     */
    private Integer notifiedPerson;
    @Transient
    private String notifiedPersonStr;

    /**
     * 开始时间
     */
    private String startDate;

    /**
     * 结束时间
     */
    private String endDate;

    /**
     * 通知时间
     */
    private String noticeDate;


    /**
     * 接收时间
     */
    private String receivingDate;

    /**
     * 接收人签字
     */
    private String receivingSign;

    /**
     * 天数
     */
    private Integer number;

    /**
     * 是否续签
     */
    private Integer renewal;

    /**
     * 补充内容
     */
    private String supplementDetails;

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

    public Integer getNotifiedPerson() {
        return notifiedPerson;
    }

    public void setNotifiedPerson(Integer notifiedPerson) {
        this.notifiedPerson = notifiedPerson;
    }

    public String getNotifiedPersonStr() {
        return notifiedPersonStr;
    }

    public void setNotifiedPersonStr(String notifiedPersonStr) {
        this.notifiedPersonStr = notifiedPersonStr;
    }

    public String getReceivingDate() {
        return receivingDate;
    }

    public void setReceivingDate(String receivingDate) {
        this.receivingDate = receivingDate;
    }

    public String getReceivingSign() {
        return receivingSign;
    }

    public void setReceivingSign(String receivingSign) {
        this.receivingSign = receivingSign;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getNoticeDate() {
        return noticeDate;
    }

    public void setNoticeDate(String noticeDate) {
        this.noticeDate = noticeDate;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getRenewal() {
        return renewal;
    }

    public void setRenewal(Integer renewal) {
        this.renewal = renewal;
    }

    public String getSupplementDetails() {
        return supplementDetails;
    }

    public void setSupplementDetails(String supplementDetails) {
        this.supplementDetails = supplementDetails;
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
}
