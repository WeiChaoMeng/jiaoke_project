package com.jiaoke.oa.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * oa-综合办公室档案-管理体系相关
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 11:12
 */
@Table(name = "oa_eia_monitor")
public class OaEiaMonitor {

    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 报告编号
     */
    private String reportNumber;

    /**
     * 样品名称
     */
    private String sampleName;

    /**
     * 检测单位
     */
    private String testingCompany;

    /**
     * 检测日期
     */
    private Date testingDate;

    @Transient
    private String testingDateStr;

    /**
     * 富文本
     */
    private String richText;

    /**
     * 创建日期
     */
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getReportNumber() {
        return reportNumber;
    }

    public void setReportNumber(String reportNumber) {
        this.reportNumber = reportNumber;
    }

    public String getSampleName() {
        return sampleName;
    }

    public void setSampleName(String sampleName) {
        this.sampleName = sampleName;
    }

    public String getTestingCompany() {
        return testingCompany;
    }

    public void setTestingCompany(String testingCompany) {
        this.testingCompany = testingCompany;
    }

    public Date getTestingDate() {
        return testingDate;
    }

    public void setTestingDate(Date testingDate) {
        this.testingDate = testingDate;
    }

    public String getTestingDateStr() {
        return testingDateStr;
    }

    public void setTestingDateStr(String testingDateStr) {
        this.testingDateStr = testingDateStr;
    }

    public String getRichText() {
        return richText;
    }

    public void setRichText(String richText) {
        this.richText = richText;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
