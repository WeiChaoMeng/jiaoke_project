package com.jiaoke.qualitytest.bean;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.jiaoke.common.bean.QualityTestPage;

/**
 * quality_test_experimental_standardvalue_item实体类
 * 
 * @author 
 *
 */
public class QualityTestExperimentalStandardvalueItem extends QualityTestPage {
	/***/
	@JSONField(name="id")
	private Integer id; 
	/***/
	@JSONField(name="materials_id")
	private Integer materialsId; 
	/***/
	@JSONField(name="materials")
	private String materials; 
	/***/
	@JSONField(name="experimental_id")
	private Integer experimentalId; 
	/***/
	@JSONField(name="experimental_name")
	private String experimentalName; 
	/***/
	@JSONField(name="experimental_item")
	private String experimentalItem; 
	/***/
	@JSONField(name="sort")
	private Integer sort; 
	/***/
	@JSONField(name="remark")
	private String remark; 
	/**
	 * 实例化
	 */
	public QualityTestExperimentalStandardvalueItem() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public QualityTestExperimentalStandardvalueItem(JSONObject obj) {
		this();
		if (obj.get("id") instanceof Number) {
			this.setId(((Number) obj.get("id")).intValue());
		}
		if (obj.get("materialsId") instanceof Number) {
			this.setMaterialsId(((Number) obj.get("materialsId")).intValue());
		}
		if (obj.get("materials") instanceof String) {
			this.setMaterials((String) obj.get("materials"));
		}
		if (obj.get("experimentalId") instanceof Number) {
			this.setExperimentalId(((Number) obj.get("experimentalId")).intValue());
		}
		if (obj.get("experimentalName") instanceof String) {
			this.setExperimentalName((String) obj.get("experimentalName"));
		}
		if (obj.get("experimentalItem") instanceof String) {
			this.setExperimentalItem((String) obj.get("experimentalItem"));
		}
		if (obj.get("sort") instanceof Number) {
			this.setSort(((Number) obj.get("sort")).intValue());
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
		if (this.getMaterialsId() != null) {
			result.put("materialsId",this.getMaterialsId());
		}
		if (this.getMaterials() != null) {
			result.put("materials",this.getMaterials());
		}
		if (this.getExperimentalId() != null) {
			result.put("experimentalId",this.getExperimentalId());
		}
		if (this.getExperimentalName() != null) {
			result.put("experimentalName",this.getExperimentalName());
		}
		if (this.getExperimentalItem() != null) {
			result.put("experimentalItem",this.getExperimentalItem());
		}
		if (this.getSort() != null) {
			result.put("sort",this.getSort());
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
	 * 获取materialsId
	 * 
	 * @return
	 */
	public Integer getMaterialsId() {
		return materialsId;
	}

	/**
	 * 设置materialsId
	 * 
	 * @param materialsId
	 */
	public void setMaterialsId(Integer materialsId) {
		this.materialsId = materialsId;
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
	 * 获取experimentalId
	 * 
	 * @return
	 */
	public Integer getExperimentalId() {
		return experimentalId;
	}

	/**
	 * 设置experimentalId
	 * 
	 * @param experimentalId
	 */
	public void setExperimentalId(Integer experimentalId) {
		this.experimentalId = experimentalId;
	}
	
	/**
	 * 获取experimentalName
	 * 
	 * @return
	 */
	public String getExperimentalName() {
		return experimentalName;
	}

	/**
	 * 设置experimentalName
	 * 
	 * @param experimentalName
	 */
	public void setExperimentalName(String experimentalName) {
		this.experimentalName = experimentalName;
	}
	
	/**
	 * 获取experimentalItem
	 * 
	 * @return
	 */
	public String getExperimentalItem() {
		return experimentalItem;
	}

	/**
	 * 设置experimentalItem
	 * 
	 * @param experimentalItem
	 */
	public void setExperimentalItem(String experimentalItem) {
		this.experimentalItem = experimentalItem;
	}
	
	/**
	 * 获取sort
	 * 
	 * @return
	 */
	public Integer getSort() {
		return sort;
	}

	/**
	 * 设置sort
	 * 
	 * @param sort
	 */
	public void setSort(Integer sort) {
		this.sort = sort;
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
		return "QualityTestExperimentalStandardvalueItem [id=" + id + " , materialsId=" + materialsId + " , materials=" + materials + " , experimentalId=" + experimentalId + " , experimentalName=" + experimentalName + " , experimentalItem=" + experimentalItem + " , sort=" + sort + " , remark=" + remark + "  ]";
	
	}
	
	
}
