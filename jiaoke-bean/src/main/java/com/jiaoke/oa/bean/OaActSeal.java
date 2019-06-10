package com.jiaoke.oa.bean;

import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 印章使用审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_seal")
public class OaActSeal {

    /**
     * 标题
     */
    private String title;

    /**
     * 公司名称(1、路驰分公司，2、大兴分公司)
     */
    private Integer name;

    /**
     * 日期
     */
    private Date date;
    @Transient
    private String dateStr;

    /**
     * 印章种类(1、路驰公章，2、路驰合同章，3、路驰党支部章，4、路驰工会章，5、大兴公章，6、大兴合同章)
     */
    private Integer seal;

    /**
     * 盖印文件内容
     */
    private String content;

    /**
     * 份数
     */
    private String number;

    /**
     * 用印人
     */
    private String user;

    /**
     * 备份
     */
    private String remarks;

    /**
     * 使用性质（1、个人，2、借出，3、内部）
     */
    private Integer properties;

    /**
     * 创建日期
     */
    private Date createTime;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getName() {
        return name;
    }

    public void setName(Integer name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDateStr() {
        return dateStr;
    }

    public void setDateStr(String dateStr) {
        this.dateStr = dateStr;
    }

    public Integer getSeal() {
        return seal;
    }

    public void setSeal(Integer seal) {
        this.seal = seal;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Integer getProperties() {
        return properties;
    }

    public void setProperties(Integer properties) {
        this.properties = properties;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
