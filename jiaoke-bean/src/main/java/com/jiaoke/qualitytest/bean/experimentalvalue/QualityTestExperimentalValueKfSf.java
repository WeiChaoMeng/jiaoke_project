package com.jiaoke.qualitytest.bean.experimentalvalue;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.JSONObject;

/**
 * quality_test_experimental_value_kf_sf实体类
 * 
 * @author 
 *
 */
public class QualityTestExperimentalValueKfSf {
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
	@JSONField(name="SK06")
	private Double sK06; 
	/***/
	@JSONField(name="SK03")
	private Double sK03; 
	/***/
	@JSONField(name="SK015")
	private Double sK015; 
	/***/
	@JSONField(name="SK0075")
	private Double sK0075; 
	/**
	 * 实例化
	 */
	public QualityTestExperimentalValueKfSf() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public QualityTestExperimentalValueKfSf(JSONObject obj) {
		this();
		if (obj.get("id") instanceof Number) {
			this.setID(((Number) obj.get("id")).intValue());
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
		if (obj.get("sK06") instanceof Number) {
			this.setSK06(((Number) obj.get("sK06")).doubleValue());
		}
		if (obj.get("sK03") instanceof Number) {
			this.setSK03(((Number) obj.get("sK03")).doubleValue());
		}
		if (obj.get("sK015") instanceof Number) {
			this.setSK015(((Number) obj.get("sK015")).doubleValue());
		}
		if (obj.get("sK0075") instanceof Number) {
			this.setSK0075(((Number) obj.get("sK0075")).doubleValue());
		}
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
		if (this.getOrderTicketNum() != null) {
			result.put("orderTicketNum",this.getOrderTicketNum());
		}
		if (this.getExperimentalId() != null) {
			result.put("experimentalId",this.getExperimentalId());
		}
		if (this.getExperimentalName() != null) {
			result.put("experimentalName",this.getExperimentalName());
		}
		if (this.getSK06() != null) {
			result.put("sK06",this.getSK06());
		}
		if (this.getSK03() != null) {
			result.put("sK03",this.getSK03());
		}
		if (this.getSK015() != null) {
			result.put("sK015",this.getSK015());
		}
		if (this.getSK0075() != null) {
			result.put("sK0075",this.getSK0075());
		}
		return result;
	}
	
	
	/**
	 * 获取id
	 * 
	 * @return
	 */
	public Integer getID() {
		return id;
	}

	/**
	 * 设置id
	 * 
	 * @param id
	 */
	public void setID(Integer id) {
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
	 * 获取sK06
	 * 
	 * @return
	 */
	public Double getSK06() {
		return sK06;
	}

	/**
	 * 设置sK06
	 * 
	 * @param sK06
	 */
	public void setSK06(Double sK06) {
		this.sK06 = sK06;
	}
	
	/**
	 * 获取sK03
	 * 
	 * @return
	 */
	public Double getSK03() {
		return sK03;
	}

	/**
	 * 设置sK03
	 * 
	 * @param sK03
	 */
	public void setSK03(Double sK03) {
		this.sK03 = sK03;
	}
	
	/**
	 * 获取sK015
	 * 
	 * @return
	 */
	public Double getSK015() {
		return sK015;
	}

	/**
	 * 设置sK015
	 * 
	 * @param sK015
	 */
	public void setSK015(Double sK015) {
		this.sK015 = sK015;
	}
	
	/**
	 * 获取sK0075
	 * 
	 * @return
	 */
	public Double getSK0075() {
		return sK0075;
	}

	/**
	 * 设置sK0075
	 * 
	 * @param sK0075
	 */
	public void setSK0075(Double sK0075) {
		this.sK0075 = sK0075;
	}

	@Override
	public String toString() {
		return "QualityTestExperimentalValueKfSf [id=" + id + " , orderTicketNum=" + orderTicketNum + " , experimentalId=" + experimentalId + " , experimentalName=" + experimentalName + " , sK06=" + sK06 + " , sK03=" + sK03 + " , sK015=" + sK015 + " , sK0075=" + sK0075 + "  ]";
	
	}
	
	
}
