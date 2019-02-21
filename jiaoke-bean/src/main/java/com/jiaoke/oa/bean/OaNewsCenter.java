package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * oa-新闻中心
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/21 18:09
 */
public class OaNewsCenter {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 新闻标题
     */
    private String newsHeadlines;

    /**
     * 发布人
     */
    private String publisher;

    /**
     * 发布部门
     */
    private String releaseDepartment;

    /**
     * 发布日期
     */
    private Date releaseDate;

    @Transient
    private String releaseDateStr;

    /**
     * 关键字
     */
    private String keyword;

    /**
     * 摘要
     */
    private String summary;

    /**
     * 富文本
     */
    private String richText;

    /**
     * 创建时间
     */
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNewsHeadlines() {
        return newsHeadlines;
    }

    public void setNewsHeadlines(String newsHeadlines) {
        this.newsHeadlines = newsHeadlines;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getReleaseDepartment() {
        return releaseDepartment;
    }

    public void setReleaseDepartment(String releaseDepartment) {
        this.releaseDepartment = releaseDepartment;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getReleaseDateStr() {
        return releaseDateStr;
    }

    public void setReleaseDateStr(String releaseDateStr) {
        this.releaseDateStr = releaseDateStr;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getRichText() {
        return richText;
    }

    public void setRichText(String richText) {
        this.richText = richText;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
