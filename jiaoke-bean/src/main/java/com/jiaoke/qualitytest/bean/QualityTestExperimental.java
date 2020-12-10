package com.jiaoke.qualitytest.bean;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.common.bean.QualityTestPage;
import com.jiaoke.common.bean.QualityTestSearchDate;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * quality_test_experimental实体类
 * 
 * @author 
 *
 */
public class QualityTestExperimental extends QualityTestSearchDate {
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
	@JSONField(name="specification")
	private String specification;
	/***/
	@JSONField(name="tunnage")
	private Double tunnage;

	/***/
	@JSONField(name="sampling_create_time")
	private Date samplingcreateTime;
	/***/
	@JSONField(name="samplingremark")
	private String samplingremark;
	/***/
	@JSONField(name="ID")
	private Integer id;
	/***/
	@JSONField(name="experimental_num")
	private String experimentalNum;
	/***/
	@JSONField(name="experimental_id")
	private Integer experimentalId;
	/***/
	@JSONField(name="experimental_name")
	private String experimentalName;
	/***/
	@JSONField(name="order_ticket_id")
	private Integer orderTicketId;
	/***/
	@JSONField(name="order_ticket_num")
	private String orderTicketNum;
	/***/
	@JSONField(name="experimental_result")
	private Integer experimentalResult;
	/***/
	@JSONField(name="status")
	private Integer status;
	/***/
	@JSONField(name="experimental_param_id")
	private Integer experimentalParamId;
	/***/
	@JSONField(name="experimental_content")
	private Object experimentalContent;
	/***/
	@JSONField(name="experimental_value")
	private Object experimentalValue;
	/***/
	@JSONField(name="experimental_value_sf")
	private Object experimentalValueSf;
	/***/
	@JSONField(name="experimental_progress")
	private Integer experimentalProgress;
	/***/
	@JSONField(name="remark")
	private String remark;
	/***/
	@JSONField(name="create_user")
	private Integer createUser;
	/***/
	@JSONField(name="create_time")
	private Date createTime;
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
	@JSONField(name="status_show")
	private String status_show;

	/***/
	@JSONField(name="result_show")
	private String result_show;

	/**
	 * 实例化
	 */
	public QualityTestExperimental() {
		super();
	}
	/**
	 * 实例化
	 *
	 * @param obj
	 */
	public QualityTestExperimental(JSONObject obj) {
		this();
		if (obj.get("page") instanceof Number) {
			this.setPage(((Number) obj.get("page")).intValue());
		}
		if (obj.get("limit") instanceof Number) {
			this.setLimit(((Number) obj.get("limit")).intValue());
		}
		if (obj.get("experimentalId") instanceof Number) {
			this.setExperimentalId(((Number) obj.get("experimentalId")).intValue());
		}
		if (obj.get("num") instanceof String) {
			this.setNum((String) obj.get("num"));
		}
		if (obj.get("materials") instanceof String) {
			this.setMaterials((String) obj.get("materials"));
		}
		if (obj.get("manufacturers") instanceof String) {
			this.setManufacturers((String) obj.get("manufacturers"));
		}
		if (obj.get("specification") instanceof String) {
			this.setSpecification((String) obj.get("specification"));
		}
		if (obj.get("tunnage") instanceof Number) {
			this.setTunnage(((Number) obj.get("tunnage")).doubleValue());
		}
		if (obj.get("samplingcreateTime") instanceof Date) {
			this.setSamplingcreateTime((Date) obj.get("samplingcreateTime"));
		}
		if (obj.get("samplingremark") instanceof String) {
			this.setSamplingremark((String) obj.get("samplingremark"));
		}
		if (obj.get("id") instanceof Number) {
			this.setID(((Number) obj.get("id")).intValue());
		}
		if (obj.get("experimentalNum") instanceof Number) {
			this.setExperimentalNum(((String) obj.get("experimentalNum")));
		}
		if (obj.get("experimentalName") instanceof String) {
			this.setExperimentalName((String) obj.get("experimentalName"));
		}
		if (obj.get("orderTicketId") instanceof Number) {
			this.setOrderTicketId(((Number) obj.get("orderTicketId")).intValue());
		}
		if (obj.get("orderTicketNum") instanceof String) {
			this.setOrderTicketNum(((String) obj.get("orderTicketNum")));
		}
		if (obj.get("experimentalResult") instanceof Number) {
			this.setExperimentalResult(((Number) obj.get("experimentalResult")).intValue());
		}
		if (obj.get("status") instanceof Number) {
			this.setStatus(((Number) obj.get("status")).intValue());
		}
		if (obj.get("experimentalParamId") instanceof Number) {
			this.setExperimentalParamId(((Number) obj.get("experimentalParamId")).intValue());
		}
		this.setExperimentalContent(obj.get("experimentalContent"));
		this.setExperimentalValue(obj.get("experimentalValue"));
		this.setExperimentalValueSf(obj.get("experimentalValueSf"));
		if (obj.get("experimentalProgress") instanceof Number) {
			this.setExperimentalProgress(((Number) obj.get("experimentalProgress")).intValue());
		}
		if (obj.get("remark") instanceof String) {
			this.setRemark((String) obj.get("remark"));
		}
		if (obj.get("createUser") instanceof Number) {
			this.setCreateUser(((Number) obj.get("createUser")).intValue());
		}
		this.setCreateTime((Date)obj.get("createTime"));

		this.setDelTime((Date)obj.get("delTime"));
		if (obj.get("delUserid") instanceof Number) {
			this.setDelUserid(((Number) obj.get("delUserid")).intValue());
		}
		if (obj.get("delUser") instanceof String) {
			this.setDelUser((String) obj.get("delUser"));
		}
	}

	/**
	 * 将当前对象转换为JsonObject
	 *
	 * @return
	 */
	public JSONObject toJson() {
		JSONObject result = new JSONObject();
		if (this.getNum() != null) {
			result.put("num",this.getNum());
		}
		if (this.getMaterials() != null) {
			result.put("materials",this.getMaterials());
		}
		if (this.getManufacturers() != null) {
			result.put("manufacturers",this.getManufacturers());
		}
		if (this.getSpecification() != null) {
			result.put("specification",this.getSpecification());
		}
		if (this.getTunnage() != null) {
			result.put("tunnage",this.getTunnage());
		}
		if (this.getID() != null) {
			result.put("id",this.getID());
		}
		if (this.getExperimentalNum() != null) {
			result.put("experimentalNum",this.getExperimentalNum());
		}
		if (this.getExperimentalId() != null) {
			result.put("experimentalId",this.getExperimentalId());
		}
		if (this.getExperimentalName() != null) {
			result.put("experimentalName",this.getExperimentalName());
		}
		if (this.getOrderTicketId() != null) {
			result.put("orderTicketId",this.getOrderTicketId());
		}
		if (this.getOrderTicketNum() != null) {
			result.put("orderTicketNum",this.getOrderTicketNum());
		}
		if (this.getExperimentalResult() != null) {
			result.put("experimentalResult",this.getExperimentalResult());
		}
		if (this.getStatus() != null) {
			result.put("status",this.getStatus());
		}
		if (this.getExperimentalParamId() != null) {
			result.put("experimentalParamId",this.getExperimentalParamId());
		}
		if (this.getExperimentalContent() != null) {
			result.put("experimentalContent",this.getExperimentalContent());
		}if (this.getExperimentalValue() != null) {
			result.put("experimentalValue",this.getExperimentalValue());
		}
		if (this.getExperimentalValueSf() != null) {
			result.put("experimentalValueSf",this.getExperimentalValueSf());
		}
		if (this.getExperimentalProgress() != null) {
			result.put("experimentalProgress",this.getExperimentalProgress());
		}
		if (this.getRemark() != null) {
			result.put("remark",this.getRemark());
		}
		if (this.getCreateUser() != null) {
			result.put("createUser",this.getCreateUser());
		}
		if (this.getCreateTime() != null) {
			result.put("createTime",this.getCreateTime());
		}
		return result;
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

	public Date getSamplingcreateTime() {
		return samplingcreateTime;
	}

	public void setSamplingcreateTime(Date samplingcreateTime) {
		this.samplingcreateTime = samplingcreateTime;
	}

	public String getSamplingremark() {
		return samplingremark;
	}

	public void setSamplingremark(String samplingremark) {
		this.samplingremark = samplingremark;
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

	/**
	 * 获取experimentalNum
	 *
	 * @return
	 */
	public String getExperimentalNum() {
		return experimentalNum;
	}

	/**
	 * 设置experimentalNum
	 *
	 * @param experimentalNum
	 */
	public void setExperimentalNum(String experimentalNum) {
		this.experimentalNum = experimentalNum;
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
	 * 获取orderTicketId
	 *
	 * @return
	 */
	public Integer getOrderTicketId() {
		return orderTicketId;
	}

	/**
	 * 设置orderTicketId
	 *
	 * @param orderTicketId
	 */
	public void setOrderTicketId(Integer orderTicketId) {
		this.orderTicketId = orderTicketId;
	}

	/**
	 * 获取orderTicketNum
	 *
	 * @return
	 */
	public String getOrderTicketNum() {
		return orderTicketNum;
	}

	/**
	 * 设置orderTicketNum
	 *
	 * @param orderTicketNum
	 */
	public void setOrderTicketNum(String orderTicketNum) {
		this.orderTicketNum = orderTicketNum;
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
	 * 获取experimentalParamId
	 *
	 * @return
	 */
	public Integer getExperimentalParamId() {
		return experimentalParamId;
	}

	/**
	 * 设置experimentalParamId
	 *
	 * @param experimentalParamId
	 */
	public void setExperimentalParamId(Integer experimentalParamId) {
		this.experimentalParamId = experimentalParamId;
	}

	/**
	 * 获取experimentalContent
	 *
	 * @return
	 */
	public Object getExperimentalContent() {
		return experimentalContent;
	}

	/**
	 * 设置experimentalContent
	 *
	 * @param experimentalContent
	 */
	public void setExperimentalContent(Object experimentalContent) {
		this.experimentalContent = experimentalContent;
	}
	/**
	 * 获取experimentalValue
	 *
	 * @return
	 */
	public Object getExperimentalValue() {
		return experimentalValue;
	}

	/**
	 * 设置experimentalValue
	 *
	 * @param experimentalValue
	 */
	public void setExperimentalValue(Object experimentalValue) {
		this.experimentalValue = experimentalValue;
	}

	/**
	 * 获取experimentalValueSf
	 *
	 * @return
	 */
	public Object getExperimentalValueSf() {
		return experimentalValueSf;
	}

	/**
	 * 设置experimentalValueSf
	 *
	 * @param experimentalValueSf
	 */
	public void setExperimentalValueSf(Object experimentalValueSf) {
		this.experimentalValueSf = experimentalValueSf;
	}
	/**
	 * 获取experimentalProgress
	 *
	 * @return
	 */
	public Integer getExperimentalProgress() {
		return experimentalProgress;
	}

	/**
	 * 设置experimentalProgress
	 *
	 * @param experimentalProgress
	 */
	public void setExperimentalProgress(Integer experimentalProgress) {
		this.experimentalProgress = experimentalProgress;
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
	public Integer getCreateUser() {
		return createUser;
	}

	/**
	 * 设置createUser
	 *
	 * @param createUser
	 */
	public void setCreateUser(Integer createUser) {
		this.createUser = createUser;
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

	@Override
	public String toString() {
		return "VQualityTestExperimental [num=" + num + " , materials=" + materials + " , manufacturers=" + manufacturers + " , specification=" + specification + " , tunnage=" + tunnage + " , id=" + id + " , experimentalNum=" + experimentalNum + " , experimentalName=" + experimentalName + " , orderTicketId=" + orderTicketId + " , orderTicketNum=" + orderTicketNum + " , experimentalResult=" + experimentalResult + " , status=" + status + " , experimentalParamId=" + experimentalParamId + " , experimentalContent=" + experimentalContent + " , experimentalProgress=" + experimentalProgress + " , remark=" + remark + " , createUser=" + createUser + " , createTime=" + createTime + "  ]";

	}
	
	
}
