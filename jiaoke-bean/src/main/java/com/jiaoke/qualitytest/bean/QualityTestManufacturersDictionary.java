package com.jiaoke.qualitytest.bean;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.common.bean.QualityTestPage;

/**
 * quality_test_manufacturers_dictionary实体类
 * 
 * @author 
 *
 */
public class QualityTestManufacturersDictionary extends QualityTestPage {
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
	@JSONField(name="remark")
	private String remark; 
	/**
	 * 实例化
	 */
	public QualityTestManufacturersDictionary() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public QualityTestManufacturersDictionary(JSONObject obj) {
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
		if (obj.get("remark") instanceof String) {
			this.setRemark((String) obj.get("remark"));
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
		if (this.getRemark() != null) {
			result.put("remark",this.getRemark());
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
	 * 获取remark
	 * 
	 * @return
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * 设置remark
	 * 
	 * @param remark
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "QualityTestManufacturersDictionary [id=" + id + " , materialId=" + materialId + " , materialName=" + materialName + " , name=" + name + " , remark=" + remark + "  ]";
	
	}
	
	
}
