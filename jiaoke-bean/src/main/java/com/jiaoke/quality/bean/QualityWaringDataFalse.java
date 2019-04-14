/**
 * FileName: QualityWaringDataFalse
 * author:   Melone
 * Date:     2018/12/28 13:44
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.bean;

import lombok.Data;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/12/28 13:44
 * @Description:
 */
@Data
public class QualityWaringDataFalse {

    private int id;
    private int realtimeDataShamId;
    private String materialName;
    private double actualRatio;
    private double moudleRatio;
    private double deviationRatio;
    private int warningLevel;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRealtimeDataShamId() {
        return realtimeDataShamId;
    }

    public void setRealtimeDataShamId(int realtimeDataShamId) {
        this.realtimeDataShamId = realtimeDataShamId;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public double getActualRatio() {
        return actualRatio;
    }

    public void setActualRatio(double actualRatio) {
        this.actualRatio = actualRatio;
    }

    public double getMoudleRatio() {
        return moudleRatio;
    }

    public void setMoudleRatio(double moudleRatio) {
        this.moudleRatio = moudleRatio;
    }

    public double getDeviationRatio() {
        return deviationRatio;
    }

    public void setDeviationRatio(double deviationRatio) {
        this.deviationRatio = deviationRatio;
    }

    public int getWarningLevel() {
        return warningLevel;
    }

    public void setWarningLevel(int warningLevel) {
        this.warningLevel = warningLevel;
    }
}
