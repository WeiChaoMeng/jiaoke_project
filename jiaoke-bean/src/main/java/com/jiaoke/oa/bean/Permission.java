package com.jiaoke.oa.bean;

import com.alibaba.fastjson.annotation.JSONField;

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

    /**
     * 父id
     */
    private Integer pid;

    /**
     * tree选中必要字段
     */
    @Transient
    private String LAY_CHECKED;

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

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    @JSONField(name = "LAY_CHECKED")
    public String getLAY_CHECKED() {
        return LAY_CHECKED;
    }

    public void setLAY_CHECKED(String LAY_CHECKED) {
        this.LAY_CHECKED = LAY_CHECKED;
    }
}