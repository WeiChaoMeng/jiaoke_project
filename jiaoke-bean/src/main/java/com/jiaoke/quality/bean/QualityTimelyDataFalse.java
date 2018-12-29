package com.jiaoke.quality.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 实时监控数据（假）
 *
 * @author lihui
 * @version 1.0
 * @date 2018-12-25 00:00:00
 */
public class QualityTimelyDataFalse implements Serializable {
    /**
     * 主键
     */
    private int  id;

    /**
     * 生产日期
     */
    private Date produceDate;

    /**
     * 生产时间
     */
    private Date productTime;

    /**
     * 生产盘号
     */
    private String produceDiscNum;

    /**
     * 生产配比号
     */
    private String produceProportioningNum;

    /**
     * 生产车号
     */
    private String produceCarNum;

    /**
     * 生产客户号
     */
    private String produceCustomNum;

    /**
     * 骨料6
     */
    private Integer materialAggregate6;

    /**
     * 骨料5
     */
    private Integer materialAggregate5;

    /**
     * 骨料4
     */
    private Integer materialAggregate4;

    /**
     * 骨料3
     */
    private Integer materialAggregate3;

    /**
     * 骨料2
     */
    private Integer materialAggregate2;

    /**
     * 骨料1
     */
    private Integer materialAggregate1;

    /**
     * 石粉1
     */
    private Double materialStone1;

    /**
     * 石粉2
     */
    private Double materialStone2;

    /**
     * 沥青
     */
    private Double materialAsphalt;

    /**
     * 再生料
     */
    private Double materialRegenerate;

    /**
     * 添加剂
     */
    private Double materialAdditive;

    /**
     * 合计kg
     */
    private Double materialTotal;

    /**
     * 1仓温度
     */
    private Integer temperatureWarehouse1;

    /**
     * 混合料温度
     */
    private Integer temperatureMixture;

    /**
     * 除尘器入口温度
     */
    private Integer temperatureDuster;

    /**
     * 沥青温度
     */
    private Integer temperatureAsphalt;

    /**
     * 骨料温度
     */
    private Integer temperatureAggregate;

    /**
     * 机组编号
     */
    private Integer crewNum;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getProduceDate() {
        return produceDate;
    }

    public void setProduceDate(Date produceDate) {
        this.produceDate = produceDate;
    }

    public Date getProductTime() {
        return productTime;
    }

    public void setProductTime(Date productTime) {
        this.productTime = productTime;
    }

    public String getProduceDiscNum() {
        return produceDiscNum;
    }

    public void setProduceDiscNum(String produceDiscNum) {
        this.produceDiscNum = produceDiscNum;
    }

    public String getProduceProportioningNum() {
        return produceProportioningNum;
    }

    public void setProduceProportioningNum(String produceProportioningNum) {
        this.produceProportioningNum = produceProportioningNum;
    }

    public String getProduceCarNum() {
        return produceCarNum;
    }

    public void setProduceCarNum(String produceCarNum) {
        this.produceCarNum = produceCarNum;
    }

    public String getProduceCustomNum() {
        return produceCustomNum;
    }

    public void setProduceCustomNum(String produceCustomNum) {
        this.produceCustomNum = produceCustomNum;
    }

    public Integer getMaterialAggregate6() {
        return materialAggregate6;
    }

    public void setMaterialAggregate6(Integer materialAggregate6) {
        this.materialAggregate6 = materialAggregate6;
    }

    public Integer getMaterialAggregate5() {
        return materialAggregate5;
    }

    public void setMaterialAggregate5(Integer materialAggregate5) {
        this.materialAggregate5 = materialAggregate5;
    }

    public Integer getMaterialAggregate4() {
        return materialAggregate4;
    }

    public void setMaterialAggregate4(Integer materialAggregate4) {
        this.materialAggregate4 = materialAggregate4;
    }

    public Integer getMaterialAggregate3() {
        return materialAggregate3;
    }

    public void setMaterialAggregate3(Integer materialAggregate3) {
        this.materialAggregate3 = materialAggregate3;
    }

    public Integer getMaterialAggregate2() {
        return materialAggregate2;
    }

    public void setMaterialAggregate2(Integer materialAggregate2) {
        this.materialAggregate2 = materialAggregate2;
    }

    public Integer getMaterialAggregate1() {
        return materialAggregate1;
    }

    public void setMaterialAggregate1(Integer materialAggregate1) {
        this.materialAggregate1 = materialAggregate1;
    }

    public Double getMaterialStone1() {
        return materialStone1;
    }

    public void setMaterialStone1(Double materialStone1) {
        this.materialStone1 = materialStone1;
    }

    public Double getMaterialStone2() {
        return materialStone2;
    }

    public void setMaterialStone2(Double materialStone2) {
        this.materialStone2 = materialStone2;
    }

    public Double getMaterialAsphalt() {
        return materialAsphalt;
    }

    public void setMaterialAsphalt(Double materialAsphalt) {
        this.materialAsphalt = materialAsphalt;
    }

    public Double getMaterialRegenerate() {
        return materialRegenerate;
    }

    public void setMaterialRegenerate(Double materialRegenerate) {
        this.materialRegenerate = materialRegenerate;
    }

    public Double getMaterialAdditive() {
        return materialAdditive;
    }

    public void setMaterialAdditive(Double materialAdditive) {
        this.materialAdditive = materialAdditive;
    }

    public Double getMaterialTotal() {
        return materialTotal;
    }

    public void setMaterialTotal(Double materialTotal) {
        this.materialTotal = materialTotal;
    }

    public Integer getTemperatureWarehouse1() {
        return temperatureWarehouse1;
    }

    public void setTemperatureWarehouse1(Integer temperatureWarehouse1) {
        this.temperatureWarehouse1 = temperatureWarehouse1;
    }

    public Integer getTemperatureMixture() {
        return temperatureMixture;
    }

    public void setTemperatureMixture(Integer temperatureMixture) {
        this.temperatureMixture = temperatureMixture;
    }

    public Integer getTemperatureDuster() {
        return temperatureDuster;
    }

    public void setTemperatureDuster(Integer temperatureDuster) {
        this.temperatureDuster = temperatureDuster;
    }

    public Integer getTemperatureAsphalt() {
        return temperatureAsphalt;
    }

    public void setTemperatureAsphalt(Integer temperatureAsphalt) {
        this.temperatureAsphalt = temperatureAsphalt;
    }

    public Integer getTemperatureAggregate() {
        return temperatureAggregate;
    }

    public void setTemperatureAggregate(Integer temperatureAggregate) {
        this.temperatureAggregate = temperatureAggregate;
    }

    public Integer getCrewNum() {
        return crewNum;
    }

    public void setCrewNum(Integer crewNum) {
        this.crewNum = crewNum;
    }
}