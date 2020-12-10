package com.jiaoke.qualitytest.bean;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.common.bean.QualityTestPage;

/**
 * quality_test_experiment_dictionary实体类
 * 
 * @author 
 *
 */
public class QualityTestExperimentDictionary extends QualityTestPage {
	/***/
	@JSONField(name="Id")
	private Integer id; 
	/***/
	@JSONField(name="material_id")
	private Integer materialId; 
	/***/
	@JSONField(name="material_name")
	private String materialName; 
	/***/
	@JSONField(name="name")
	private String name; 
	/***/
	@JSONField(name="table_name")
	private String tableName; 
	/**实验项目标识名*/
	@JSONField(name="remake")
	private String remake; 
	/***/
	@JSONField(name="unit")
	private String unit; 
	/***/
	@JSONField(name="method")
	private String method; 
	/**
	 * 实例化
	 */
	public QualityTestExperimentDictionary() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public QualityTestExperimentDictionary(JSONObject obj) {
		this();
		if (obj.get("id") instanceof Number) {
			this.setId(((Number) obj.get("id")).intValue());
		}
		if (obj.get("materialId") instanceof Number) {
			this.setMaterialId(((Number) obj.get("materialId")).intValue());
		}
		if (obj.get("materialName") instanceof String) {
			this.setMaterialName((String) obj.get("materialName"));
		}
		if (obj.get("name") instanceof String) {
			this.setName((String) obj.get("name"));
		}
		if (obj.get("tableName") instanceof String) {
			this.setTableName((String) obj.get("tableName"));
		}
		if (obj.get("remake") instanceof String) {
			this.setRemake((String) obj.get("remake"));
		}
		if (obj.get("unit") instanceof String) {
			this.setUnit((String) obj.get("unit"));
		}
		if (obj.get("method") instanceof String) {
			this.setMethod((String) obj.get("method"));
		}
	}
	
	/**
	 * 将当前对象转换为JsonObject
	 * 
	 * @return
	 */
	public JSONObject toJson() {
		JSONObject result = new JSONObject();
		if (this.getId() != null) {
			result.put("id",this.getId());
		}
		if (this.getMaterialId() != null) {
			result.put("materialId",this.getMaterialId());
		}
		if (this.getMaterialName() != null) {
			result.put("materialName",this.getMaterialName());
		}
		if (this.getName() != null) {
			result.put("name",this.getName());
		}
		if (this.getTableName() != null) {
			result.put("tableName",this.getTableName());
		}
		if (this.getRemake() != null) {
			result.put("remake",this.getRemake());
		}
		if (this.getUnit() != null) {
			result.put("unit",this.getUnit());
		}
		if (this.getMethod() != null) {
			result.put("method",this.getMethod());
		}
		return result;
	}
	
	
	/**
	 * 获取id
	 * 
	 * @return
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * 设置id
	 * 
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	
	/**
	 * 获取materialId
	 * 
	 * @return
	 */
	public Integer getMaterialId() {
		return materialId;
	}

	/**
	 * 设置materialId
	 * 
	 * @param materialId
	 */
	public void setMaterialId(Integer materialId) {
		this.materialId = materialId;
	}
	
	/**
	 * 获取materialName
	 * 
	 * @return
	 */
	public String getMaterialName() {
		return materialName;
	}

	/**
	 * 设置materialName
	 * 
	 * @param materialName
	 */
	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	
	/**
	 * 获取name
	 * 
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * 设置name
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 获取tableName
	 * 
	 * @return
	 */
	public String getTableName() {
		return tableName;
	}

	/**
	 * 设置tableName
	 * 
	 * @param tableName
	 */
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
	/**
	 * 获取remake
	 * 
	 * @return
	 */
	public String getRemake() {
		return remake;
	}

	/**
	 * 设置remake
	 * 
	 * @param remake
	 */
	public void setRemake(String remake) {
		this.remake = remake;
	}
	
	/**
	 * 获取unit
	 * 
	 * @return
	 */
	public String getUnit() {
		return unit;
	}

	/**
	 * 设置unit
	 * 
	 * @param unit
	 */
	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	/**
	 * 获取method
	 * 
	 * @return
	 */
	public String getMethod() {
		return method;
	}

	/**
	 * 设置method
	 * 
	 * @param method
	 */
	public void setMethod(String method) {
		this.method = method;
	}

	@Override
	public String toString() {
		return "QualityTestExperimentDictionary [id=" + id + " , materialId=" + materialId + " , materialName=" + materialName + " , name=" + name + " , tableName=" + tableName + " , remake=" + remake + " , unit=" + unit + " , method=" + method + "  ]";
	
	}
	
	
}
