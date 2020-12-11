package com.jiaoke.qualitytest.bean.experimentalvalue;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.common.bean.QualityTestPage;

import java.util.Date;

/**
 * quality_test_experimental_value实体类
 * 
 * @author 
 *
 */
public class QualityTestExperimentalValue extends QualityTestPage  {
	/***/
	@JSONField(name="id")
	private Integer id;
	/***/
	@JSONField(name="order_ticket_num")
	private String orderTicketNum;
	/***/
	@JSONField(name="experimental_id")
	private String experimentalId;
	/***/
	@JSONField(name="experimental_name")
	private String experimentalName;
	/***/
	@JSONField(name="experimental_type")
	private String experimentalType;
	/***/
	@JSONField(name="unit")
	private String unit;
	/***/
	@JSONField(name="value")
	private String value;
	/***/
	@JSONField(name="method")
	private String method;
	/***/
	@JSONField(name="requirements")
	private String requirements;
	/***/
	@JSONField(name="remark")
	private String remark;
	/***/
	@JSONField(name="test_date")
	private String testDate;
	/***/
	@JSONField(name="experimental_result")
	private Integer experimentalResult;
	/***/
	@JSONField(name="method1")
	private String method1;
	/***/
	@JSONField(name="unit1")
	private String unit1;
	/**
	 * 实例化
	 */
	public QualityTestExperimentalValue() {
		super();
	}
	/**
	 * 实例化
	 *
	 * @param obj
	 */
	public QualityTestExperimentalValue(JSONObject obj) {
		this();
		if (obj.get("id") instanceof Number) {
			this.setId(((Number) obj.get("id")).intValue());
		}
		if (obj.get("orderTicketNum") instanceof String) {
			this.setOrderTicketNum((String) obj.get("orderTicketNum"));
		}
		if (obj.get("experimentalId") instanceof String) {
			this.setExperimentalId((String) obj.get("experimentalId"));
		}
		if (obj.get("experimentalName") instanceof String) {
			this.setExperimentalName((String) obj.get("experimentalName"));
		}
		if (obj.get("experimentalType") instanceof String) {
			this.setExperimentalType((String) obj.get("experimentalType"));
		}
		if (obj.get("unit") instanceof String) {
			this.setUnit((String) obj.get("unit"));
		}
		if (obj.get("value") instanceof String) {
			this.setValue((String) obj.get("value"));
		}
		if (obj.get("method") instanceof String) {
			this.setMethod((String) obj.get("method"));
		}
		if (obj.get("requirements") instanceof String) {
			this.setRequirements((String) obj.get("requirements"));
		}
		if (obj.get("remark") instanceof String) {
			this.setRemark((String) obj.get("remark"));
		}
		if (obj.get("testDate") instanceof String) {
			this.setTestDate((String) obj.get("testDate"));
		}

		if (obj.get("experimentalResult") instanceof Number) {
			this.setExperimentalResult(((Number) obj.get("experimentalResult")).intValue());
		}
		if (obj.get("method1") instanceof String) {
			this.setMethod1((String) obj.get("method1"));
		}
		if (obj.get("unit1") instanceof String) {
			this.setUnit1((String) obj.get("unit1"));
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
		if (this.getOrderTicketNum() != null) {
			result.put("orderTicketNum",this.getOrderTicketNum());
		}
		if (this.getExperimentalId() != null) {
			result.put("experimentalId",this.getExperimentalId());
		}
		if (this.getExperimentalName() != null) {
			result.put("experimentalName",this.getExperimentalName());
		}
		if (this.getExperimentalType() != null) {
			result.put("experimentalType",this.getExperimentalType());
		}
		if (this.getUnit() != null) {
			result.put("unit",this.getUnit());
		}
		if (this.getValue() != null) {
			result.put("value",this.getValue());
		}
		if (this.getMethod() != null) {
			result.put("method",this.getMethod());
		}
		if (this.getRequirements() != null) {
			result.put("requirements",this.getRequirements());
		}
		if (this.getRemark() != null) {
			result.put("remark",this.getRemark());
		}
		if (this.getTestDate() != null) {
			result.put("testDate",this.getTestDate());
		}
		if (this.getExperimentalResult() != null) {
			result.put("experimentalResult",this.getExperimentalResult());
		}
		if (this.getMethod1() != null) {
			result.put("method1",this.getMethod1());
		}
		if (this.getUnit1() != null) {
			result.put("unit1",this.getUnit1());
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
	 * 获取experimentalId
	 *
	 * @return
	 */
	public String getExperimentalId() {
		return experimentalId;
	}

	/**
	 * 设置experimentalId
	 *
	 * @param experimentalId
	 */
	public void setExperimentalId(String experimentalId) {
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
	 * 获取experimentalType
	 *
	 * @return
	 */
	public String getExperimentalType() {
		return experimentalType;
	}

	/**
	 * 设置experimentalType
	 *
	 * @param experimentalType
	 */
	public void setExperimentalType(String experimentalType) {
		this.experimentalType = experimentalType;
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
	 * 获取value
	 *
	 * @return
	 */
	public String getValue() {
		return value;
	}

	/**
	 * 设置value
	 *
	 * @param value
	 */
	public void setValue(String value) {
		this.value = value;
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
	 * 获取testDate
	 *
	 * @return
	 */
	public String getTestDate() {
		return testDate;
	}

	/**
	 * 设置testDate
	 *
	 * @param testDate
	 */
	public void setTestDate(String testDate) {
		this.testDate = testDate;
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
	 * 获取method1
	 *
	 * @return
	 */
	public String getMethod1() {
		return method1;
	}

	/**
	 * 设置method1
	 *
	 * @param method1
	 */
	public void setMethod1(String method1) {
		this.method1 = method1;
	}

	/**
	 * 获取unit1
	 *
	 * @return
	 */
	public String getUnit1() {
		return unit1;
	}

	/**
	 * 设置unit1
	 *
	 * @param unit1
	 */
	public void setUnit1(String unit1) {
		this.unit1 = unit1;
	}

	@Override
	public String toString() {
		return "VQualityTestExperimentalValue [id=" + id + " , orderTicketNum=" + orderTicketNum + " , experimentalId=" + experimentalId + " , experimentalName=" + experimentalName + " , experimentalType=" + experimentalType + " , unit=" + unit + " , value=" + value + " , method=" + method + " , requirements=" + requirements + " , remark=" + remark + " , testDate=" + testDate + " , experimentalResult=" + experimentalResult + " , method1=" + method1 + " , unit1=" + unit1 + "  ]";

	}


}
	
	

