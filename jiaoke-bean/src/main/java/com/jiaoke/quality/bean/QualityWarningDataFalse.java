package com.jiaoke.quality.bean;

import java.io.Serializable;

/**
 * 质量预警数据（假）
 *
 * @author lihui
 * @version 1.0
 * @date 2018-12-25 00:00:00
 */
public class QualityWarningDataFalse implements Serializable {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 实时数据(假)id
     */
    private Integer realtimeDataShamId;

    /**
     * 材料名
     */
    private String materialName;

    /**
     * 实际配比
     */
    private Double actualRatio;

    /**
     * 模板配比
     */
    private Double moudleRatio;

    /**
     * 偏差比
     */
    private Double deviationRatio;

    /**
     * 预警级别
     */
    private Integer warningLevel;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRealtimeDataShamId() {
        return realtimeDataShamId;
    }

    public void setRealtimeDataShamId(Integer realtimeDataShamId) {
        this.realtimeDataShamId = realtimeDataShamId;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public Double getActualRatio() {
        return actualRatio;
    }

    public void setActualRatio(Double actualRatio) {
        this.actualRatio = actualRatio;
    }

    public Double getMoudleRatio() {
        return moudleRatio;
    }

    public void setMoudleRatio(Double moudleRatio) {
        this.moudleRatio = moudleRatio;
    }

    public Double getDeviationRatio() {
        return deviationRatio;
    }

    public void setDeviationRatio(Double deviationRatio) {
        this.deviationRatio = deviationRatio;
    }

    public Integer getWarningLevel() {
        return warningLevel;
    }

    public void setWarningLevel(Integer warningLevel) {
        this.warningLevel = warningLevel;
    }
}