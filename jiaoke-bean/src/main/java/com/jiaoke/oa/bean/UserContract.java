package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 用户合同管理
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/10 11:00
 */
@Table(name = "user_contract")
public class UserContract implements Serializable {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 人员信息ID（G管理Id）
     */
    private Integer personnelId;

    /**
     * 首次签订期限（0.—，1.三年，2.五年，无固定，4其他）
     */
    private Integer firstTerm;

    /**
     * 首次签订日期
     */
    private String firstSign;

    /**
     * 首次签订终止日期
     */
    private String firstStop;

    /**
     * 续签期限
     */
    private Integer renewTerm;

    /**
     * 续签日期
     */
    private String renewSign;

    /**
     * 续签终止日期
     */
    private String renewStop;

    /**
     * 最后续签期限
     */
    private Integer lastTerm;

    /**
     * 最后续签日期
     */
    private String lastSign;

    /**
     * 最后续签终止日期
     */
    private String lastStop;

    /**
     * 合同期限
     */
    private Integer contractTerm;

    /**
     * 合同签订日期
     */
    private String contractSign;

    /**
     * 合同终止日期
     */
    private String contractStop;

    /*临时使用*/
    /**
     * 名字
     */
    @Transient
    private String name;

    /**
     * 性别
     */
    @Transient
    private String sex;

    /**
     * 入职日期
     */
    @Transient
    private String joinedDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPersonnelId() {
        return personnelId;
    }

    public void setPersonnelId(Integer personnelId) {
        this.personnelId = personnelId;
    }

    public Integer getFirstTerm() {
        return firstTerm;
    }

    public void setFirstTerm(Integer firstTerm) {
        this.firstTerm = firstTerm;
    }

    public String getFirstSign() {
        return firstSign;
    }

    public void setFirstSign(String firstSign) {
        this.firstSign = firstSign;
    }

    public String getFirstStop() {
        return firstStop;
    }

    public void setFirstStop(String firstStop) {
        this.firstStop = firstStop;
    }

    public Integer getRenewTerm() {
        return renewTerm;
    }

    public void setRenewTerm(Integer renewTerm) {
        this.renewTerm = renewTerm;
    }

    public String getRenewSign() {
        return renewSign;
    }

    public void setRenewSign(String renewSign) {
        this.renewSign = renewSign;
    }

    public String getRenewStop() {
        return renewStop;
    }

    public void setRenewStop(String renewStop) {
        this.renewStop = renewStop;
    }

    public Integer getLastTerm() {
        return lastTerm;
    }

    public void setLastTerm(Integer lastTerm) {
        this.lastTerm = lastTerm;
    }

    public String getLastSign() {
        return lastSign;
    }

    public void setLastSign(String lastSign) {
        this.lastSign = lastSign;
    }

    public String getLastStop() {
        return lastStop;
    }

    public void setLastStop(String lastStop) {
        this.lastStop = lastStop;
    }

    public Integer getContractTerm() {
        return contractTerm;
    }

    public void setContractTerm(Integer contractTerm) {
        this.contractTerm = contractTerm;
    }

    public String getContractSign() {
        return contractSign;
    }

    public void setContractSign(String contractSign) {
        this.contractSign = contractSign;
    }

    public String getContractStop() {
        return contractStop;
    }

    public void setContractStop(String contractStop) {
        this.contractStop = contractStop;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getJoinedDate() {
        return joinedDate;
    }

    public void setJoinedDate(String joinedDate) {
        this.joinedDate = joinedDate;
    }
}