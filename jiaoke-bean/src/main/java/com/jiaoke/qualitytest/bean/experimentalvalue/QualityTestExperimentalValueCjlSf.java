package com.jiaoke.qualitytest.bean.experimentalvalue;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.JSONObject;

/**
 * quality_test_experimental_value_cjl_sf实体类
 * 
 * @author 
 *
 */
public class QualityTestExperimentalValueCjlSf {
	/***/
	@JSONField(name="id")
	private Integer id;
	/***/
	@JSONField(name="order_ticket_num")
	private String orderTicketNum; 
	/***/
	@JSONField(name="experimental_name")
	private String experimentalName; 
	/***/
	@JSONField(name="experimental_id")
	private String experimentalId; 
	/***/
	@JSONField(name="SK315")
	private Double sK315; 
	/***/
	@JSONField(name="SK265")
	private Double sK265; 
	/***/
	@JSONField(name="SK19")
	private Double sK19; 
	/***/
	@JSONField(name="SK16")
	private Double sK16; 
	/***/
	@JSONField(name="SK132")
	private Double sK132; 
	/***/
	@JSONField(name="SK95")
	private Double sK95; 
	/***/
	@JSONField(name="SK475")
	private Double sK475; 
	/***/
	@JSONField(name="SK236")
	private Double sK236; 
	/***/
	@JSONField(name="SK118")
	private Double sK118; 
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
	/***/
	@JSONField(name="SD")
	private Double sD; 
	/**
	 * 实例化
	 */
	public QualityTestExperimentalValueCjlSf() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public QualityTestExperimentalValueCjlSf(JSONObject obj) {
		this();
		if (obj.get("id") instanceof Number) {
			this.setID(((Number) obj.get("id")).intValue());
		}
		if (obj.get("orderTicketNum") instanceof String) {
			this.setOrderTicketNum((String) obj.get("orderTicketNum"));
		}
		if (obj.get("experimentalName") instanceof String) {
			this.setExperimentalName((String) obj.get("experimentalName"));
		}
		if (obj.get("experimentalId") instanceof String) {
			this.setExperimentalId((String) obj.get("experimentalId"));
		}
		if (obj.get("sK315") instanceof Number) {
			this.setSK315(((Number) obj.get("sK315")).doubleValue());
		}
		if (obj.get("sK265") instanceof Number) {
			this.setSK265(((Number) obj.get("sK265")).doubleValue());
		}
		if (obj.get("sK19") instanceof Number) {
			this.setSK19(((Number) obj.get("sK19")).doubleValue());
		}
		if (obj.get("sK16") instanceof Number) {
			this.setSK16(((Number) obj.get("sK16")).doubleValue());
		}
		if (obj.get("sK132") instanceof Number) {
			this.setSK132(((Number) obj.get("sK132")).doubleValue());
		}
		if (obj.get("sK95") instanceof Number) {
			this.setSK95(((Number) obj.get("sK95")).doubleValue());
		}
		if (obj.get("sK475") instanceof Number) {
			this.setSK475(((Number) obj.get("sK475")).doubleValue());
		}
		if (obj.get("sK236") instanceof Number) {
			this.setSK236(((Number) obj.get("sK236")).doubleValue());
		}
		if (obj.get("sK118") instanceof Number) {
			this.setSK118(((Number) obj.get("sK118")).doubleValue());
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
		if (obj.get("sD") instanceof Number) {
			this.setSD(((Number) obj.get("sD")).doubleValue());
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
		if (this.getExperimentalName() != null) {
			result.put("experimentalName",this.getExperimentalName());
		}
		if (this.getExperimentalId() != null) {
			result.put("experimentalId",this.getExperimentalId());
		}
		if (this.getSK315() != null) {
			result.put("sK315",this.getSK315());
		}
		if (this.getSK265() != null) {
			result.put("sK265",this.getSK265());
		}
		if (this.getSK19() != null) {
			result.put("sK19",this.getSK19());
		}
		if (this.getSK16() != null) {
			result.put("sK16",this.getSK16());
		}
		if (this.getSK132() != null) {
			result.put("sK132",this.getSK132());
		}
		if (this.getSK95() != null) {
			result.put("sK95",this.getSK95());
		}
		if (this.getSK475() != null) {
			result.put("sK475",this.getSK475());
		}
		if (this.getSK236() != null) {
			result.put("sK236",this.getSK236());
		}
		if (this.getSK118() != null) {
			result.put("sK118",this.getSK118());
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
		if (this.getSD() != null) {
			result.put("sD",this.getSD());
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
	 * 获取sK315
	 * 
	 * @return
	 */
	public Double getSK315() {
		return sK315;
	}

	/**
	 * 设置sK315
	 * 
	 * @param sK315
	 */
	public void setSK315(Double sK315) {
		this.sK315 = sK315;
	}
	
	/**
	 * 获取sK265
	 * 
	 * @return
	 */
	public Double getSK265() {
		return sK265;
	}

	/**
	 * 设置sK265
	 * 
	 * @param sK265
	 */
	public void setSK265(Double sK265) {
		this.sK265 = sK265;
	}
	
	/**
	 * 获取sK19
	 * 
	 * @return
	 */
	public Double getSK19() {
		return sK19;
	}

	/**
	 * 设置sK19
	 * 
	 * @param sK19
	 */
	public void setSK19(Double sK19) {
		this.sK19 = sK19;
	}
	
	/**
	 * 获取sK16
	 * 
	 * @return
	 */
	public Double getSK16() {
		return sK16;
	}

	/**
	 * 设置sK16
	 * 
	 * @param sK16
	 */
	public void setSK16(Double sK16) {
		this.sK16 = sK16;
	}
	
	/**
	 * 获取sK132
	 * 
	 * @return
	 */
	public Double getSK132() {
		return sK132;
	}

	/**
	 * 设置sK132
	 * 
	 * @param sK132
	 */
	public void setSK132(Double sK132) {
		this.sK132 = sK132;
	}
	
	/**
	 * 获取sK95
	 * 
	 * @return
	 */
	public Double getSK95() {
		return sK95;
	}

	/**
	 * 设置sK95
	 * 
	 * @param sK95
	 */
	public void setSK95(Double sK95) {
		this.sK95 = sK95;
	}
	
	/**
	 * 获取sK475
	 * 
	 * @return
	 */
	public Double getSK475() {
		return sK475;
	}

	/**
	 * 设置sK475
	 * 
	 * @param sK475
	 */
	public void setSK475(Double sK475) {
		this.sK475 = sK475;
	}
	
	/**
	 * 获取sK236
	 * 
	 * @return
	 */
	public Double getSK236() {
		return sK236;
	}

	/**
	 * 设置sK236
	 * 
	 * @param sK236
	 */
	public void setSK236(Double sK236) {
		this.sK236 = sK236;
	}
	
	/**
	 * 获取sK118
	 * 
	 * @return
	 */
	public Double getSK118() {
		return sK118;
	}

	/**
	 * 设置sK118
	 * 
	 * @param sK118
	 */
	public void setSK118(Double sK118) {
		this.sK118 = sK118;
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
	
	/**
	 * 获取sD
	 * 
	 * @return
	 */
	public Double getSD() {
		return sD;
	}

	/**
	 * 设置sD
	 * 
	 * @param sD
	 */
	public void setSD(Double sD) {
		this.sD = sD;
	}

	@Override
	public String toString() {
		return "QualityTestExperimentalValueCjlSf [id=" + id + " , orderTicketNum=" + orderTicketNum + " , experimentalName=" + experimentalName + " , experimentalId=" + experimentalId + " , sK315=" + sK315 + " , sK265=" + sK265 + " , sK19=" + sK19 + " , sK16=" + sK16 + " , sK132=" + sK132 + " , sK95=" + sK95 + " , sK475=" + sK475 + " , sK236=" + sK236 + " , sK118=" + sK118 + " , sK06=" + sK06 + " , sK03=" + sK03 + " , sK015=" + sK015 + " , sK0075=" + sK0075 + " , sD=" + sD + "  ]";
	
	}
	
	
}
