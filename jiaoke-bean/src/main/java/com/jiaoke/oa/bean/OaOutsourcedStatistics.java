package com.jiaoke.oa.bean;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * 外包员工工作统计表
 *
 * @author li
 */
@Table(name = "oa_outsourced_statistics")
public class OaOutsourcedStatistics implements Serializable {
    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    private Integer id;

    /**
     * 表名称
     */
    private String name;

    /**
     * 实发总额
     */
    private String totalAmount;

    /**
     * 结算月份
     */
    private String settlementMonth;

    /**
     * 总数
     */
    private String total;

    /**
     * 上传人
     */
    private String uploadUsers;

    /**
     * 上传日期
     */
    private String createDate;

    /**
     * 状态
     */
    private Integer state;

    private static final long serialVersionUID = 1L;

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

    public String getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getSettlementMonth() {
        return settlementMonth;
    }

    public void setSettlementMonth(String settlementMonth) {
        this.settlementMonth = settlementMonth;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getUploadUsers() {
        return uploadUsers;
    }

    public void setUploadUsers(String uploadUsers) {
        this.uploadUsers = uploadUsers;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }
}