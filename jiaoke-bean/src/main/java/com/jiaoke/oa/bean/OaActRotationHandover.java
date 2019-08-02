package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 轮岗交接表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_act_rotation_handover")
public class OaActRotationHandover {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    private String id;

    /**
     * 标题
     */
    private String title;

    /**
     * 离岗人姓名
     */
    private String departure;

    /**
     * 接岗人姓名
     */
    private String receive;

    /**
     * 离岗前岗位
     */
    private String departureBefore;

    /**
     * 接岗前岗位
     */
    private String receiveBefore;

    /**
     * 离岗后岗位
     */
    private String departureAfter;

    /**
     * 接岗后岗位
     */
    private String receiveAfter;

    /**
     * 交接事项
     */
    private String matter;

    /**
     * 交接中存在的问题
     */
    private String problem;

    /**
     * 附件
     */
    private String annex;

    /**
     * 创建日期
     */
    private Date createTime;
    @Transient
    private String createTimeStr;

    /**
     * 发起人
     */
    private Integer promoter;
    @Transient
    private String promoterStr;

    /**
     * 查询路径
     */
    private String url;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getReceive() {
        return receive;
    }

    public void setReceive(String receive) {
        this.receive = receive;
    }

    public String getDepartureBefore() {
        return departureBefore;
    }

    public void setDepartureBefore(String departureBefore) {
        this.departureBefore = departureBefore;
    }

    public String getReceiveBefore() {
        return receiveBefore;
    }

    public void setReceiveBefore(String receiveBefore) {
        this.receiveBefore = receiveBefore;
    }

    public String getDepartureAfter() {
        return departureAfter;
    }

    public void setDepartureAfter(String departureAfter) {
        this.departureAfter = departureAfter;
    }

    public String getReceiveAfter() {
        return receiveAfter;
    }

    public void setReceiveAfter(String receiveAfter) {
        this.receiveAfter = receiveAfter;
    }

    public String getMatter() {
        return matter;
    }

    public void setMatter(String matter) {
        this.matter = matter;
    }

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem;
    }

    public String getAnnex() {
        return annex;
    }

    public void setAnnex(String annex) {
        this.annex = annex;
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

    public Integer getPromoter() {
        return promoter;
    }

    public void setPromoter(Integer promoter) {
        this.promoter = promoter;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPromoterStr() {
        return promoterStr;
    }

    public void setPromoterStr(String promoterStr) {
        this.promoterStr = promoterStr;
    }
}
