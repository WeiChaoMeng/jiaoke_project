package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 证照借用审批单（原件）
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_licence_borrow")
public class OaActLicenceBorrow {

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
     * 印章种类(1、路驰公章，2、路驰合同章，3、路驰党支部章，4、路驰工会章，5、大兴公章，6、大兴合同章)
     */
    private Integer seal;

    /**
     * 借用时间
     */
    private Date borrowTime;
    @Transient
    private String borrowTimeStr;

    /**
     * 用途
     */
    private String purpose;

    /**
     * 借用人
     */
    private String borrower;

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

    public Integer getSeal() {
        return seal;
    }

    public void setSeal(Integer seal) {
        this.seal = seal;
    }

    public Date getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(Date borrowTime) {
        this.borrowTime = borrowTime;
    }

    public String getBorrowTimeStr() {
        return borrowTimeStr;
    }

    public void setBorrowTimeStr(String borrowTimeStr) {
        this.borrowTimeStr = borrowTimeStr;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getBorrower() {
        return borrower;
    }

    public void setBorrower(String borrower) {
        this.borrower = borrower;
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
}
