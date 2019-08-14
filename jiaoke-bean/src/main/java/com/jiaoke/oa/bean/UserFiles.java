package com.jiaoke.oa.bean;

import javax.persistence.Transient;
import java.io.Serializable;
import java.util.Date;

/**
 * 员工档案
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/10 11:00
 */
public class UserFiles implements Serializable {
    /**
     * 用户信息id
     */
    private Integer id;

    /**
     * 用户id（关联id）
     */
    private String userId;

    /**
     * 身份证
     */
    private String idCard;

    /**
     * 学历
     */
    private String educatio;

    /**
     * 合同
     */
    private String contract;

    /**
     * 简历
     */
    private String resume;

    /**
     * 入职登记
     */
    private String entry;

    /**
     * 体检
     */
    private String medical;

    /**
     * 离职证明
     */
    private String leave;

    /**
     * 更新时间
     */
    private Date updateDate;
    @Transient
    private String updateDateStr;

    @Transient
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getEducatio() {
        return educatio;
    }

    public void setEducatio(String educatio) {
        this.educatio = educatio;
    }

    public String getContract() {
        return contract;
    }

    public void setContract(String contract) {
        this.contract = contract;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

    public String getEntry() {
        return entry;
    }

    public void setEntry(String entry) {
        this.entry = entry;
    }

    public String getMedical() {
        return medical;
    }

    public void setMedical(String medical) {
        this.medical = medical;
    }

    public String getLeave() {
        return leave;
    }

    public void setLeave(String leave) {
        this.leave = leave;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getUpdateDateStr() {
        return updateDateStr;
    }

    public void setUpdateDateStr(String updateDateStr) {
        this.updateDateStr = updateDateStr;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}