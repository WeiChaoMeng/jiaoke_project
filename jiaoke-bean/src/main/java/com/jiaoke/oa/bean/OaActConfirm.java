package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 确认单审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_confirm")
public class OaActConfirm {

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
     * 盖章文件内容
     */
    private String content;

    /**
     * 借章人
     */
    private String borrower;

    /**
     * 状态：0,已发 1,待发
     */
    private Integer state;

    /**
     * 创建日期
     */
    private Date createTime;
    @Transient
    private String createTimeStr;

    /**
     * 发起人
     */
    private String promoter;

    /**
     * 查询路径
     */
    private String url;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getBorrower() {
        return borrower;
    }

    public void setBorrower(String borrower) {
        this.borrower = borrower;
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
}
