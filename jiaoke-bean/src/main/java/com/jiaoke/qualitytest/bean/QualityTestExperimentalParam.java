package com.jiaoke.qualitytest.bean;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.common.bean.QualityTestPage;

import java.util.Date;

/**
 * quality_test_experimental_param实体类
 * 
 * @author 
 *
 */
public class QualityTestExperimentalParam extends QualityTestPage {
	/***/
	@JSONField(name="Id")
	private Integer id;

	@JSONField(name="updateId")
	private Integer updateId;

	/***/
	@JSONField(name="material_id")
	private Integer materialId; 
	/***/
	@JSONField(name="material_name")
	private String materialName; 
	/***/
	@JSONField(name="experimen_name")
	private String experimenName;

	@JSONField(name="experimen_id")
	private Integer experimenId;

	/***/
	@JSONField(name="experimen_param")
	private Object experimenParam; 
	/***/
	@JSONField(name="formula")
	private String formula; 
	/***/
	@JSONField(name="status")
	private Integer status;
	/***/
	@JSONField(name="status_show")
	private String status_show;
	/***/
	@JSONField(name="remark")
	private String remark; 
	/***/
	@JSONField(name="create_user")
	private String createUser; 
	/***/
	@JSONField(name="create_userid")
	private Integer createUserid; 
	/***/
	@JSONField(name="create_time")
	private Date createTime;
	/**
	 * 实例化
	 */
	public QualityTestExperimentalParam() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public QualityTestExperimentalParam(JSONObject obj) {
		this();
		if (obj.get("id") instanceof Number) {
			this.setID(((Number) obj.get("id")).intValue());
		}
		if (obj.get("updateId") instanceof Number) {
			this.setUpdateId(((Number) obj.get("updateId")).intValue());
			this.setID(((Number) obj.get("updateId")).intValue());
		}

		if (obj.get("materialId") instanceof Number) {
			this.setMaterialId(((Number) obj.get("materialId")).intValue());
		}
		if (obj.get("materialName") instanceof String) {
			this.setMaterialName((String) obj.get("materialName"));
		}
		if (obj.get("experimenName") instanceof String) {
			this.setExperimenName((String) obj.get("experimenName"));
		}
		if (obj.get("experimenId") instanceof String) {
			this.setExperimenId(((Number) obj.get("experimenId")).intValue());
		}
		this.setExperimenParam(obj.get("experimenParam"));
		if (obj.get("formula") instanceof String) {
			this.setFormula((String) obj.get("formula"));
		}
		if (obj.get("status") instanceof Number) {
			this.setStatus(((Number) obj.get("status")).intValue());
		}
		if (obj.get("remark") instanceof String) {
			this.setRemark((String) obj.get("remark"));
		}
		if (obj.get("createUser") instanceof String) {
			this.setCreateUser((String) obj.get("createUser"));
		}
		if (obj.get("createUserid") instanceof Number) {
			this.setCreateUserid(((Number) obj.get("createUserid")).intValue());
		}
		this.setCreateTime((Date)obj.get("createTime"));
	}
	
	/**
	 * 将当前对象转换为JsonObject
	 * 
	 * @return
	 */
	public JSONObject toJson() {
		JSONObject result = new JSONObject();
		if (this.getID() != null) {
			result.put("id",this.getID());
		}
		if (this.getMaterialId() != null) {
			result.put("materialId",this.getMaterialId());
		}
		if (this.getMaterialName() != null) {
			result.put("materialName",this.getMaterialName());
		}
		if (this.getExperimenName() != null) {
			result.put("experimenName",this.getExperimenName());
		}
		if (this.getExperimenId() != null) {
			result.put("experimenId",this.getExperimenId());
		}

		if (this.getExperimenParam() != null) {
			result.put("experimenParam",this.getExperimenParam());
		}
		if (this.getFormula() != null) {
			result.put("formula",this.getFormula());
		}
		if (this.getStatus() != null) {
			result.put("status",this.getStatus());
		}
		if (this.getRemark() != null) {
			result.put("remark",this.getRemark());
		}
		if (this.getCreateUser() != null) {
			result.put("createUser",this.getCreateUser());
		}
		if (this.getCreateUserid() != null) {
			result.put("createUserid",this.getCreateUserid());
		}
		if (this.getCreateTime() != null) {
			result.put("createTime",this.getCreateTime());
		}
		return result;
	}
	
	
	/**
	 * 获取iD
	 * 
	 * @return
	 */
	public Integer getID() {
		return id;
	}

	/**
	 * 设置iD
	 * 
	 * @param id
	 */
	public void setID(Integer id) {
		this.id = id;
	}

	public Integer getUpdateId() {
		return updateId;
	}

	public void setUpdateId(Integer updateId) {
		this.updateId = updateId;
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
	 * 获取experimenName
	 * 
	 * @return
	 */
	public String getExperimenName() {
		return experimenName;
	}

	/**
	 * 设置experimenName
	 * 
	 * @param experimenName
	 */
	public void setExperimenName(String experimenName) {
		this.experimenName = experimenName;
	}

	public Integer getExperimenId() {
		return experimenId;
	}

	public void setExperimenId(Integer experimenId) {
		this.experimenId = experimenId;
	}
	/**
	 * 获取experimenParam
	 * 
	 * @return
	 */
	public Object getExperimenParam() {
		return experimenParam;
	}

	/**
	 * 设置experimenParam
	 * 
	 * @param experimenParam
	 */
	public void setExperimenParam(Object experimenParam) {
		this.experimenParam = experimenParam;
	}
	
	/**
	 * 获取formula
	 * 
	 * @return
	 */
	public String getFormula() {
		return formula;
	}

	/**
	 * 设置formula
	 * 
	 * @param formula
	 */
	public void setFormula(String formula) {
		this.formula = formula;
	}
	
	/**
	 * 获取status
	 * 
	 * @return
	 */
	public Integer getStatus() {
		return status;
	}

	/**
	 * 设置status
	 * 
	 * @param status
	 */
	public void setStatus(Integer status) {
		this.status = status;
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
	
	/**
	 * 获取createUser
	 * 
	 * @return
	 */
	public String getCreateUser() {
		return createUser;
	}

	/**
	 * 设置createUser
	 * 
	 * @param createUser
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	
	/**
	 * 获取createUserid
	 * 
	 * @return
	 */
	public Integer getCreateUserid() {
		return createUserid;
	}

	/**
	 * 设置createUserid
	 * 
	 * @param createUserid
	 */
	public void setCreateUserid(Integer createUserid) {
		this.createUserid = createUserid;
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

	@Override
	public String toString() {
		return "QualityTestExperimentalParam [id=" + id + " , materialId=" + materialId + " , materialName=" + materialName + " , experimenName=" + experimenName + " , experimenParam=" + experimenParam + " , formula=" + formula + " , status=" + status + " , remark=" + remark + " , createUser=" + createUser + " , createUserid=" + createUserid + " , createTime=" + createTime + "  ]";
	
	}
	
	
}
