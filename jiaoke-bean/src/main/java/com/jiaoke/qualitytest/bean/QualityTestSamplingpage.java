package com.jiaoke.qualitytest.bean;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.common.bean.QualityTestPage;
import com.jiaoke.common.bean.QualityTestSearchDate;
import org.springframework.format.annotation.DateTimeFormat;


import java.util.Date;

/**
 * quality_test_samplingpage实体类
 * 
 * @author 
 *
 */
public class QualityTestSamplingpage extends QualityTestSearchDate {
	/***/
	@JSONField(name="Id")
	private Integer id;
	/***/
	@JSONField(name="num")
	private String num; 
	/***/
	@JSONField(name="materials")
	private String materials; 
	/***/
	@JSONField(name="materials_num")
	private Integer materialsNum; 
	/***/
	@JSONField(name="manufacturers")
	private String manufacturers; 
	/***/
	@JSONField(name="manufacturers_num")
	private Integer manufacturersNum; 
	/***/
	@JSONField(name="specification")
	private String specification; 
	/***/
	@JSONField(name="specification_num")
	private Integer specificationNum; 
	/***/
	@JSONField(name="tunnage")
	private Double tunnage; 

	/***/
	@JSONField(name="status")
	private Integer status; 
	/***/
	@JSONField(name="create_time")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	/***/
	@JSONField(name="create_user")
	private String createUser; 
	/***/
	@JSONField(name="create_userid")
	private String createUserid;
	/***/
	@JSONField(name="status_show")
	private String status_show;

	/***/
	@JSONField(name="task_time")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date taskTime;
	/***/
	@JSONField(name="del_time")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date delTime;
	/***/
	@JSONField(name="del_userid")
	private Integer delUserid;
	/***/
	@JSONField(name="del_user")
	private String delUser;

	/***/
	@JSONField(name="remark")
	private String remark;
	/***/
	@JSONField(name="order_ticket_num")
	private String orderTicketNum;

	/***/
	@JSONField(name="required_experimental")
	private String requiredExperimental;

	/**-1 不合格 1合格*/
	@JSONField(name="experiment_result")
	private Integer experimentResult;
	/**
	 * 实例化
	 */
	public QualityTestSamplingpage() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public QualityTestSamplingpage(JSONObject obj) {
		this();
		if (obj.get("page") instanceof Number) {
			this.setPage(((Number) obj.get("page")).intValue());
		}
		if (obj.get("limit") instanceof Number) {
			this.setLimit(((Number) obj.get("limit")).intValue());
		}
		if (obj.get("id") instanceof Number) {
			this.setId(((Number) obj.get("id")).intValue());
		}
		if (obj.get("num") instanceof String) {
			this.setNum((String) obj.get("num"));
		}
		if (obj.get("materials") instanceof String) {
			this.setMaterials((String) obj.get("materials"));
		}
		if (obj.get("materialsNum") instanceof Number) {
			this.setMaterialsNum(((Number) obj.get("materialsNum")).intValue());
		}
		if (obj.get("manufacturers") instanceof String) {
			this.setManufacturers((String) obj.get("manufacturers"));
		}
		if (obj.get("manufacturersNum") instanceof Number) {
			this.setManufacturersNum(((Number) obj.get("manufacturersNum")).intValue());
		}
		if (obj.get("specification") instanceof String) {
			this.setSpecification((String) obj.get("specification"));
		}
		if (obj.get("specificationNum") instanceof Number) {
			this.setSpecificationNum(((Number) obj.get("specificationNum")).intValue());
		}
		if (obj.get("tunnage") instanceof Number) {
			this.setTunnage(((Number) obj.get("tunnage")).doubleValue());
		}

		if (obj.get("remark") instanceof String) {
			this.setRemark((String) obj.get("remark"));
		}
		if (obj.get("status") instanceof Number) {
			this.setStatus(((Number) obj.get("status")).intValue());
		}
		this.setCreateTime((Date)obj.get("create_time"));

		if (obj.get("createUser") instanceof String) {
			this.setCreateUser((String) obj.get("createUser"));
		}
		if (obj.get("createUserid") instanceof String) {
			this.setCreateUserid((String) obj.get("createUserid"));
		}


		this.setTaskTime((Date)obj.get("taskTime"));
		this.setDelTime((Date)obj.get("delTime"));
		if (obj.get("delUserid") instanceof Number) {
			this.setDelUserid(((Number) obj.get("delUserid")).intValue());
		}
		if (obj.get("delUser") instanceof String) {
			this.setDelUser((String) obj.get("delUser"));
		}
		if (obj.get("remark") instanceof String) {
			this.setRemark((String) obj.get("remark"));
		}
		if (obj.get("experimentResult") instanceof Number) {
			this.setExperimentResult(((Number) obj.get("experimentResult")).intValue());
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
		if (this.getNum() != null) {
			result.put("num",this.getNum());
		}
		if (this.getMaterials() != null) {
			result.put("materials",this.getMaterials());
		}
		if (this.getMaterialsNum() != null) {
			result.put("materialsNum",this.getMaterialsNum());
		}
		if (this.getManufacturers() != null) {
			result.put("manufacturers",this.getManufacturers());
		}
		if (this.getManufacturersNum() != null) {
			result.put("manufacturersNum",this.getManufacturersNum());
		}
		if (this.getSpecification() != null) {
			result.put("specification",this.getSpecification());
		}
		if (this.getSpecificationNum() != null) {
			result.put("specificationNum",this.getSpecificationNum());
		}
		if (this.getTunnage() != null) {
			result.put("tunnage",this.getTunnage());
		}
		if (this.getRemark() != null) {
			result.put("remark",this.getRemark());
		}
		if (this.getStatus() != null) {
			result.put("status",this.getStatus());
		}
		if (this.getCreateTime() != null) {
			result.put("createTime",this.getCreateTime());
		}
		if (this.getCreateUser() != null) {
			result.put("createUser",this.getCreateUser());
		}
		if (this.getCreateUserid() != null) {
			result.put("createUserid",this.getCreateUserid());
		}
		if (this.getExperimentResult() != null) {
			result.put("experimentResult", this.getExperimentResult());
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
	 * 获取num
	 * 
	 * @return
	 */
	public String getNum() {
		return num;
	}

	/**
	 * 设置num
	 * 
	 * @param num
	 */
	public void setNum(String num) {
		this.num = num;
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
	 * 获取materialsNum
	 * 
	 * @return
	 */
	public Integer getMaterialsNum() {
		return materialsNum;
	}

	/**
	 * 设置materialsNum
	 * 
	 * @param materialsNum
	 */
	public void setMaterialsNum(Integer materialsNum) {
		this.materialsNum = materialsNum;
	}
	
	/**
	 * 获取manufacturers
	 * 
	 * @return
	 */
	public String getManufacturers() {
		return manufacturers;
	}

	/**
	 * 设置manufacturers
	 * 
	 * @param manufacturers
	 */
	public void setManufacturers(String manufacturers) {
		this.manufacturers = manufacturers;
	}
	
	/**
	 * 获取manufacturersNum
	 * 
	 * @return
	 */
	public Integer getManufacturersNum() {
		return manufacturersNum;
	}

	/**
	 * 设置manufacturersNum
	 * 
	 * @param manufacturersNum
	 */
	public void setManufacturersNum(Integer manufacturersNum) {
		this.manufacturersNum = manufacturersNum;
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
	 * 获取specificationNum
	 * 
	 * @return
	 */
	public Integer getSpecificationNum() {
		return specificationNum;
	}

	/**
	 * 设置specificationNum
	 * 
	 * @param specificationNum
	 */
	public void setSpecificationNum(Integer specificationNum) {
		this.specificationNum = specificationNum;
	}
	
	/**
	 * 获取tunnage
	 * 
	 * @return
	 */
	public Double getTunnage() {
		return tunnage;
	}

	/**
	 * 设置tunnage
	 * 
	 * @param tunnage
	 */
	public void setTunnage(Double tunnage) {
		this.tunnage = tunnage;
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
	public String getCreateUserid() {
		return createUserid;
	}

	/**
	 * 设置createUserid
	 * 
	 * @param createUserid
	 */
	public void setCreateUserid(String createUserid) {
		this.createUserid = createUserid;
	}
	/**
	 * 获取taskTime
	 *
	 * @return
	 */
	public Date getTaskTime() {
		return taskTime;
	}

	/**
	 * 设置taskTime
	 *
	 * @param taskTime
	 */
	public void setTaskTime(Date taskTime) {
		this.taskTime = taskTime;
	}

	/**
	 * 获取delTime
	 *
	 * @return
	 */
	public Date getDelTime() {
		return delTime;
	}

	/**
	 * 设置delTime
	 *
	 * @param delTime
	 */
	public void setDelTime(Date delTime) {
		this.delTime = delTime;
	}

	/**
	 * 获取delUserid
	 *
	 * @return
	 */
	public Integer getDelUserid() {
		return delUserid;
	}

	/**
	 * 设置delUserid
	 *
	 * @param delUserid
	 */
	public void setDelUserid(Integer delUserid) {
		this.delUserid = delUserid;
	}

	/**
	 * 获取delUser
	 *
	 * @return
	 */
	public String getDelUser() {
		return delUser;
	}

	/**
	 * 设置delUser
	 *
	 * @param delUser
	 */
	public void setDelUser(String delUser) {
		this.delUser = delUser;
	}
	/**
	 * 获取experimentResult
	 *
	 * @return
	 */
	public Integer getExperimentResult() {
		return experimentResult;
	}

	/**
	 * 设置experimentResult
	 *
	 * @param experimentResult
	 */
	public void setExperimentResult(Integer experimentResult) {
		this.experimentResult = experimentResult;
	}

	@Override
	public String toString() {
		return "QualityTestSamplingpage [id=" + id + " , num=" + num + " , materials=" + materials + " , materialsNum=" + materialsNum + " , manufacturers=" + manufacturers + " , manufacturersNum=" + manufacturersNum + " , specification=" + specification + " , specificationNum=" + specificationNum + " , tunnage=" + tunnage + " , remark=" + remark + " , status=" + status + " , createTime=" + createTime + " , createUser=" + createUser + " , createUserid=" + createUserid + "  ]";
	
	}
	
	
}
