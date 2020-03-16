package com.jiaoke.oa.bean;

import javax.persistence.Table;

/**
 * 加班统计表-数据表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "oa_overtime_statistics")
public class OaOvertimeStatistics {

    /**
     * 主键
     */
    private Integer id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 周六、日
     */
    private String weekend;

    /**
     * 法定节假日
     */
    private String legalHolidays;

    /**
     * 倒休
     */
    private String restDown;

    /**
     * 周六日加班合计
     */
    private String weekendTotal;

    /**
     * 法定节假日加班合计
     */
    private String legalTotal;

    /**
     * 加班统计表id
     */
    private String overtimeId;

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

    public String getWeekend() {
        return weekend;
    }

    public void setWeekend(String weekend) {
        this.weekend = weekend;
    }

    public String getLegalHolidays() {
        return legalHolidays;
    }

    public void setLegalHolidays(String legalHolidays) {
        this.legalHolidays = legalHolidays;
    }

    public String getRestDown() {
        return restDown;
    }

    public void setRestDown(String restDown) {
        this.restDown = restDown;
    }

    public String getWeekendTotal() {
        return weekendTotal;
    }

    public void setWeekendTotal(String weekendTotal) {
        this.weekendTotal = weekendTotal;
    }

    public String getLegalTotal() {
        return legalTotal;
    }

    public void setLegalTotal(String legalTotal) {
        this.legalTotal = legalTotal;
    }

    public String getOvertimeId() {
        return overtimeId;
    }

    public void setOvertimeId(String overtimeId) {
        this.overtimeId = overtimeId;
    }
}
