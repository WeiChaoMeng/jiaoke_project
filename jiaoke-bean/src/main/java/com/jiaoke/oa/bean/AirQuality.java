package com.jiaoke.oa.bean;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 空气质量
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:36
 */
@Table(name = "air_quality")
public class AirQuality {

    /**
     * 主键
     */
    @Id
    private String id;

    /**
     * 细颗粒物（PM2.5）
     */
    private String fineParticle;

    /**
     * 可吸入颗粒物（PM10）
     */
    private String pmio;

    /**
     * 时间
     */
    private Date updateDate;
    @Transient
    private String updateDateStr;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFineParticle() {
        return fineParticle;
    }

    public void setFineParticle(String fineParticle) {
        this.fineParticle = fineParticle;
    }

    public String getPmio() {
        return pmio;
    }

    public void setPmio(String pmio) {
        this.pmio = pmio;
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
}
