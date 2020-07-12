package com.jiaoke.quality.bean;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 实时监控数据（假）
 *
 * @author lihui
 * @version 1.0
 * @date 2018-12-25 00:00:00
 */
@Data
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
     * 骨料10
     */
    private Integer materialAggregate10;
    /**
     * 骨料9
     */
    private Integer materialAggregate9;
    /**
     * 骨料8
     */
    private Integer materialAggregate8;
    /**
     * 骨料7
     */
    private Integer materialAggregate7;
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
     * 石粉3
     */
    private Double materialStone3;
    /**
     * 石粉4
     */
    private Double materialStone4;

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
     * 添加剂1
     */
    private Double materialAdditive1;
    /**
     * 添加剂2
     */
    private Double materialAdditive2;
    /**
     * 添加剂3
     */
    private Double materialAdditive3;
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

}