package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * 质量技术部-设计文件
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 11:12
 */
@Table(name = "oa_quality_devise")
public class OaQualityDevise {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 名称
     */
    private String name;

    /**
     * 版本日期
     */
    private Date versionDate;
    @Transient
    private String versionDateStr;

    /**
     * 备注
     */
    private String remarks;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getVersionDate() {
        return versionDate;
    }

    public void setVersionDate(Date versionDate) {
        this.versionDate = versionDate;
    }

    public String getVersionDateStr() {
        return versionDateStr;
    }

    public void setVersionDateStr(String versionDateStr) {
        this.versionDateStr = versionDateStr;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
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
