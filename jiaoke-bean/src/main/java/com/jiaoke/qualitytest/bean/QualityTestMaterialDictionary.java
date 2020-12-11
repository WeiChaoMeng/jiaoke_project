package com.jiaoke.qualitytest.bean;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.common.bean.QualityTestPage;

/**
 * quality_test_material_dictionary实体类
 * 
 * @author 
 *
 */
public class QualityTestMaterialDictionary extends QualityTestPage {
	/***/
	@JSONField(name="Id")
	private Integer id; 
	/***/
	@JSONField(name="name")
	private String name; 
	/***/
	@JSONField(name="logogram_name")
	private String logogramName; 
	/***/
	@JSONField(name="standard")
	private String standard; 
	/***/
	@JSONField(name="remark")
	private String remark; 
	/**
	 * 实例化
	 */
	public QualityTestMaterialDictionary() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public QualityTestMaterialDictionary(JSONObject obj) {
		this();
		if (obj.get("id") instanceof Number) {
			this.setId(((Number) obj.get("id")).intValue());
		}
		if (obj.get("name") instanceof String) {
			this.setName((String) obj.get("name"));
		}
		if (obj.get("logogramName") instanceof String) {
			this.setLogogramName((String) obj.get("logogramName"));
		}
		if (obj.get("standard") instanceof String) {
			this.setStandard((String) obj.get("standard"));
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
		if (this.getName() != null) {
			result.put("name",this.getName());
		}
		if (this.getLogogramName() != null) {
			result.put("logogramName",this.getLogogramName());
		}
		if (this.getStandard() != null) {
			result.put("standard",this.getStandard());
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
	 * 获取logogramName
	 * 
	 * @return
	 */
	public String getLogogramName() {
		return logogramName;
	}

	/**
	 * 设置logogramName
	 * 
	 * @param logogramName
	 */
	public void setLogogramName(String logogramName) {
		this.logogramName = logogramName;
	}
	
	/**
	 * 获取standard
	 * 
	 * @return
	 */
	public String getStandard() {
		return standard;
	}

	/**
	 * 设置standard
	 * 
	 * @param standard
	 */
	public void setStandard(String standard) {
		this.standard = standard;
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
		return "QualityTestMaterialDictionary [id=" + id + " , name=" + name + " , logogramName=" + logogramName + " , standard=" + standard + " , remark=" + remark + "  ]";
	
	}
	
	
}
