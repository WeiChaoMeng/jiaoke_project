package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * oa-企业荣誉
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/21 18:09
 */
public class OaCorporateHonor {

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
     * 摘要
     */
    private String summary;

    /**
     * 富文本
     */
    private String richText;

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
}
