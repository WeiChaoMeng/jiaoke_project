package com.jiaoke.qualitytest.bean;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.common.bean.QualityTestPage;

import java.util.Date;

/**
 * quality_test_experimental_standardvalue实体类
 * 
 * @author 
 *
 */
public class QualityTestExperimentalStandardvalue extends QualityTestPage {
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
	@JSONField(name="specification_id")
	private String specificationId; 
	/***/
	@JSONField(name="specification")
	private String specification; 
	/***/
	@JSONField(name="specification_level")
	private String specificationLevel; 
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
	@JSONField(name="requirements")
	private String requirements; 
	/***/
	@JSONField(name="comparemethod")
	private String comparemethod; 
	/***/
	@JSONField(name="min_value")
	private Double minValue; 
	/***/
	@JSONField(name="max_value")
	private Double maxValue; 
	/***/
	@JSONField(name="create_time")
	private Date createTime;
	/***/
	@JSONField(name="remark")
	private String remark; 
	/**
	 * 实例化
	 */
	public QualityTestExperimentalStandardvalue() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public QualityTestExperimentalStandardvalue(JSONObject obj) {
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
		if (obj.get("specificationId") instanceof String) {
			this.setSpecificationId((String) obj.get("specificationId"));
		}
		if (obj.get("specification") instanceof String) {
			this.setSpecification((String) obj.get("specification"));
		}
		if (obj.get("specificationLevel") instanceof String) {
			this.setSpecificationLevel((String) obj.get("specificationLevel"));
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
		if (obj.get("requirements") instanceof String) {
			this.setRequirements((String) obj.get("requirements"));
		}
		if (obj.get("comparemethod") instanceof String) {
			this.setComparemethod((String) obj.get("comparemethod"));
		}
		if (obj.get("minValue") instanceof Number) {
			this.setMinValue(((Number) obj.get("minValue")).doubleValue());
		}
		if (obj.get("maxValue") instanceof Number) {
			this.setMaxValue(((Number) obj.get("maxValue")).doubleValue());
		}
		this.setCreateTime((Date)obj.get("createTime"));
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
		if (this.getSpecificationId() != null) {
			result.put("specificationId",this.getSpecificationId());
		}
		if (this.getSpecification() != null) {
			result.put("specification",this.getSpecification());
		}
		if (this.getSpecificationLevel() != null) {
			result.put("specificationLevel",this.getSpecificationLevel());
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
		if (this.getRequirements() != null) {
			result.put("requirements",this.getRequirements());
		}
		if (this.getComparemethod() != null) {
			result.put("comparemethod",this.getComparemethod());
		}
		if (this.getMinValue() != null) {
			result.put("minValue",this.getMinValue());
		}
		if (this.getMaxValue() != null) {
			result.put("maxValue",this.getMaxValue());
		}
		if (this.getCreateTime() != null) {
			result.put("createTime",this.getCreateTime());
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
	 * 获取specificationId
	 * 
	 * @return
	 */
	public String getSpecificationId() {
		return specificationId;
	}

	/**
	 * 设置specificationId
	 * 
	 * @param specificationId
	 */
	public void setSpecificationId(String specificationId) {
		this.specificationId = specificationId;
	}
	
	/**
	 * 获取specification
	 * 
	 * @return
	 */
	public String getSpecification() {
		return specification;
	}

	/**
	 * 设置specification
	 * 
	 * @param specification
	 */
	public void setSpecification(String specification) {
		this.specification = specification;
	}
	
	/**
	 * 获取specificationLevel
	 * 
	 * @return
	 */
	public String getSpecificationLevel() {
		return specificationLevel;
	}

	/**
	 * 设置specificationLevel
	 * 
	 * @param specificationLevel
	 */
	public void setSpecificationLevel(String specificationLevel) {
		this.specificationLevel = specificationLevel;
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
	 * 获取requirements
	 * 
	 * @return
	 */
	public String getRequirements() {
		return requirements;
	}

	/**
	 * 设置requirements
	 * 
	 * @param requirements
	 */
	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}
	
	/**
	 * 获取comparemethod
	 * 
	 * @return
	 */
	public String getComparemethod() {
		return comparemethod;
	}

	/**
	 * 设置comparemethod
	 * 
	 * @param comparemethod
	 */
	public void setComparemethod(String comparemethod) {
		this.comparemethod = comparemethod;
	}
	
	/**
	 * 获取minValue
	 * 
	 * @return
	 */
	public Double getMinValue() {
		return minValue;
	}

	/**
	 * 设置minValue
	 * 
	 * @param minValue
	 */
	public void setMinValue(Double minValue) {
		this.minValue = minValue;
	}
	
	/**
	 * 获取maxValue
	 * 
	 * @return
	 */
	public Double getMaxValue() {
		return maxValue;
	}

	/**
	 * 设置maxValue
	 * 
	 * @param maxValue
	 */
	public void setMaxValue(Double maxValue) {
		this.maxValue = maxValue;
	}
	
	/**
	 * 获取createTime
	 * 
	 * @return
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * 设置createTime
	 * 
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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
		return "QualityTestExperimentalStandardvalue [id=" + id + " , materialsId=" + materialsId + " , materials=" + materials + " , specificationId=" + specificationId + " , specification=" + specification + " , specificationLevel=" + specificationLevel + " , experimentalId=" + experimentalId + " , experimentalName=" + experimentalName + " , experimentalItem=" + experimentalItem + " , requirements=" + requirements + " , comparemethod=" + comparemethod + " , minValue=" + minValue + " , maxValue=" + maxValue + " , createTime=" + createTime + " , remark=" + remark + "  ]";
	
	}
	
	
}
