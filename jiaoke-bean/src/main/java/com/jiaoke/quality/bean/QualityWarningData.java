/**
 * FileName: QualityWarningData
 * author:   Melone
 * Date:     2018/10/8 20:16
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
 * @create: 2018/10/8 20:16
 * @Description:
 */
@Data
public class QualityWarningData {

    private String crewId;
    private String materialName;
    private String actualRatio;
    private String moudleRatio;
    private String deviationRatio;
    private String warningLevel;

    public String getCrewId() {
        return crewId;
    }

    public void setCrewId(String crewId) {
        this.crewId = crewId;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public String getActualRatio() {
        return actualRatio;
    }

    public void setActualRatio(String actualRatio) {
        this.actualRatio = actualRatio;
    }

    public String getMoudleRatio() {
        return moudleRatio;
    }

    public void setMoudleRatio(String moudleRatio) {
        this.moudleRatio = moudleRatio;
    }

    public String getDeviationRatio() {
        return deviationRatio;
    }

    public void setDeviationRatio(String deviationRatio) {
        this.deviationRatio = deviationRatio;
    }

    public String getWarningLevel() {
        return warningLevel;
    }

    public void setWarningLevel(String warningLevel) {
        this.warningLevel = warningLevel;
    }
}
