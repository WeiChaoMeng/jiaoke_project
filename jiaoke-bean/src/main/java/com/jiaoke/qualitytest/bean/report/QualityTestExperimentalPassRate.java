package com.jiaoke.qualitytest.bean.report;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.jiaoke.common.bean.QualityTestPage;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * quality_test_experimental实体类
 *
 * @author
 */
public class QualityTestExperimentalPassRate extends QualityTestPage {

    /***/
    @JSONField(name = "materials")
    private String materials;
    /***/
    @JSONField(name = "materials_num")
    private Integer materialsNum;

    /***/
    @JSONField(name = "experimental_name")
    private String experimentalName;

    /***/
    @JSONField(name = "count")
    private Integer count;
    /***/
    @JSONField(name = "experimental_result")
    private Integer experimentalResult;

    /**
     * 实例化
     */
    public QualityTestExperimentalPassRate() {
        super();
    }

    /**
     * 实例化
     *
     * @param obj
     */
    public QualityTestExperimentalPassRate(JSONObject obj) {
        this();
        if (obj.get("count") instanceof Number) {
            this.setCount(((Number) obj.get("count")).intValue());
        }

        if (obj.get("materials") instanceof String) {
            this.setMaterials((String) obj.get("materials"));
        }
        if (obj.get("materials_num") instanceof String) {
            this.setCount(((Number) obj.get("materials_num")).intValue());
        }
        if (obj.get("experimentalResult") instanceof Number) {
            this.setExperimentalResult(((Number) obj.get("experimentalResult")).intValue());
        }
    }

    /**
     * 将当前对象转换为JsonObject
     *
     * @return
     */
    public JSONObject toJson() {
        return null;
    }

    /**
     * 获取materials
     *
     * @return
     */
    public String getMaterials() {
        return materials;
    }

    /**
     * 设置materials
     *
     * @param materials
     */
    public void setMaterials(String materials) {
        this.materials = materials;
    }

    /**
     * 获取experimentalResult
     *
     * @return
     */
    public Integer getExperimentalResult() {
        return experimentalResult;
    }

    /**
     * 设置experimentalResult
     *
     * @param experimentalResult
     */
    public void setExperimentalResult(Integer experimentalResult) {
        this.experimentalResult = experimentalResult;
    }
    public Integer getMaterialsNum() {
        return materialsNum;
    }

    public void setMaterialsNum(Integer materialsNum) {
        this.materialsNum = materialsNum;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

}
