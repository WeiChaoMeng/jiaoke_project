package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 权限
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/10 11:00
 */
public class Permission implements Serializable {
    /**
     * 权限id
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 访问地址
     */
    private String url;

    /**
     * 权限描述
     */
    private String description;

    /**
     * 创建时间
     */
    private Date createTime;

    private String createTimeStr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
}