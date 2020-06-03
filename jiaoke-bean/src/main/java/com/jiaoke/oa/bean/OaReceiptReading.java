package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 参数管理-收文阅办单-部门意见
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/10 11:00
 */
@Table(name = "oa_receipt_reading")
public class OaReceiptReading implements Serializable {
    /**
     * id
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
     * 说明
     */
    private String description;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}