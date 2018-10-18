package com.jiaoke.oa.bean;

import org.springframework.stereotype.Service;

import java.io.Serializable;

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
    private Integer id;

    /**
     * 访问地址
     */
    private String url;

    /**
     * 权限描述
     */
    private String description;

    private static final long serialVersionUID = 1L;

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
}