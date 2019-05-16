package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 物资管理部-砂石料招投标资料
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 11:12
 */
@Table(name = "oa_material_bidding")
public class OaMaterialBidding {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 招标文件
     */
    private String file;

    /**
     * 标书发放登记表
     */
    private String issue;

    /**
     * 投标登记表
     */
    private String registrationForm;

    /**
     * 投标报价汇总表
     */
    private String quote;

    /**
     * 招标评分标准
     */
    private String tenderingScore;

    /**
     * 招标费
     */
    private String biddingFee;

    /**
     * 评分表
     */
    private String score;

    /**
     * 招标评分汇总表
     */
    private String scoreSummary;

    /**
     * 招标评审意见表
     */
    private String reviewOpinion;

    /**
     * 富文本
     */
    private String richText;

    /**
     * 创建时间
     */
    private Date createDate;
    @Transient
    private String createDateStr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public String getIssue() {
        return issue;
    }

    public void setIssue(String issue) {
        this.issue = issue;
    }

    public String getRegistrationForm() {
        return registrationForm;
    }

    public void setRegistrationForm(String registrationForm) {
        this.registrationForm = registrationForm;
    }

    public String getQuote() {
        return quote;
    }

    public void setQuote(String quote) {
        this.quote = quote;
    }

    public String getTenderingScore() {
        return tenderingScore;
    }

    public void setTenderingScore(String tenderingScore) {
        this.tenderingScore = tenderingScore;
    }

    public String getBiddingFee() {
        return biddingFee;
    }

    public void setBiddingFee(String biddingFee) {
        this.biddingFee = biddingFee;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getScoreSummary() {
        return scoreSummary;
    }

    public void setScoreSummary(String scoreSummary) {
        this.scoreSummary = scoreSummary;
    }

    public String getReviewOpinion() {
        return reviewOpinion;
    }

    public void setReviewOpinion(String reviewOpinion) {
        this.reviewOpinion = reviewOpinion;
    }

    public String getRichText() {
        return richText;
    }

    public void setRichText(String richText) {
        this.richText = richText;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreateDateStr() {
        return createDateStr;
    }

    public void setCreateDateStr(String createDateStr) {
        this.createDateStr = createDateStr;
    }
}
