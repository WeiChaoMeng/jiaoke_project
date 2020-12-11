package com.jiaoke.qualitytest.bean.experimentalvalue;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.JSONObject;

/**
 * quality_test_experimental_value_lqhhl_ms实体类
 * 
 * @author 
 *
 */
public class QualityTestExperimentalValueLqhhlMs {
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
	@JSONField(name="NUM")
	private Double nUM; 
	/***/
	@JSONField(name="SYB")
	private Double sYB; 
	/***/
	@JSONField(name="SJGD1")
	private Double sJGD1; 
	/***/
	@JSONField(name="SJGD2")
	private Double sJGD2; 
	/***/
	@JSONField(name="SJGD3")
	private Double sJGD3; 
	/***/
	@JSONField(name="SJGD4")
	private Double sJGD4; 
	/***/
	@JSONField(name="SJGDPJZ")
	private Double sJGDPJZ; 
	/***/
	@JSONField(name="KZZ")
	private Double kZZ; 
	/***/
	@JSONField(name="BHMGZ")
	private Double bHMGZ; 
	/***/
	@JSONField(name="MTJXDMD")
	private Double mTJXDMD; 
	/***/
	@JSONField(name="WDD")
	private Double wDD; 
	/***/
	@JSONField(name="LZ")
	private Double lZ; 
	/***/
	@JSONField(name="REMARK")
	private Double rEMARK; 
	/**
	 * 实例化
	 */
	public QualityTestExperimentalValueLqhhlMs() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public QualityTestExperimentalValueLqhhlMs(JSONObject obj) {
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
		if (obj.get("nUM") instanceof Number) {
			this.setNUM(((Number) obj.get("nUM")).doubleValue());
		}
		if (obj.get("sYB") instanceof Number) {
			this.setSYB(((Number) obj.get("sYB")).doubleValue());
		}
		if (obj.get("sJGD1") instanceof Number) {
			this.setSJGD1(((Number) obj.get("sJGD1")).doubleValue());
		}
		if (obj.get("sJGD2") instanceof Number) {
			this.setSJGD2(((Number) obj.get("sJGD2")).doubleValue());
		}
		if (obj.get("sJGD3") instanceof Number) {
			this.setSJGD3(((Number) obj.get("sJGD3")).doubleValue());
		}
		if (obj.get("sJGD4") instanceof Number) {
			this.setSJGD4(((Number) obj.get("sJGD4")).doubleValue());
		}
		if (obj.get("sJGDPJZ") instanceof Number) {
			this.setSJGDPJZ(((Number) obj.get("sJGDPJZ")).doubleValue());
		}
		if (obj.get("kZZ") instanceof Number) {
			this.setKZZ(((Number) obj.get("kZZ")).doubleValue());
		}
		if (obj.get("bHMGZ") instanceof Number) {
			this.setBHMGZ(((Number) obj.get("bHMGZ")).doubleValue());
		}
		if (obj.get("mTJXDMD") instanceof Number) {
			this.setMTJXDMD(((Number) obj.get("mTJXDMD")).doubleValue());
		}
		if (obj.get("wDD") instanceof Number) {
			this.setWDD(((Number) obj.get("wDD")).doubleValue());
		}
		if (obj.get("lZ") instanceof Number) {
			this.setLZ(((Number) obj.get("lZ")).doubleValue());
		}
		if (obj.get("rEMARK") instanceof Number) {
			this.setREMARK(((Number) obj.get("rEMARK")).doubleValue());
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
		if (this.getNUM() != null) {
			result.put("nUM",this.getNUM());
		}
		if (this.getSYB() != null) {
			result.put("sYB",this.getSYB());
		}
		if (this.getSJGD1() != null) {
			result.put("sJGD1",this.getSJGD1());
		}
		if (this.getSJGD2() != null) {
			result.put("sJGD2",this.getSJGD2());
		}
		if (this.getSJGD3() != null) {
			result.put("sJGD3",this.getSJGD3());
		}
		if (this.getSJGD4() != null) {
			result.put("sJGD4",this.getSJGD4());
		}
		if (this.getSJGDPJZ() != null) {
			result.put("sJGDPJZ",this.getSJGDPJZ());
		}
		if (this.getKZZ() != null) {
			result.put("kZZ",this.getKZZ());
		}
		if (this.getBHMGZ() != null) {
			result.put("bHMGZ",this.getBHMGZ());
		}
		if (this.getMTJXDMD() != null) {
			result.put("mTJXDMD",this.getMTJXDMD());
		}
		if (this.getWDD() != null) {
			result.put("wDD",this.getWDD());
		}
		if (this.getLZ() != null) {
			result.put("lZ",this.getLZ());
		}
		if (this.getREMARK() != null) {
			result.put("rEMARK",this.getREMARK());
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
	 * 获取nUM
	 * 
	 * @return
	 */
	public Double getNUM() {
		return nUM;
	}

	/**
	 * 设置nUM
	 * 
	 * @param nUM
	 */
	public void setNUM(Double nUM) {
		this.nUM = nUM;
	}
	
	/**
	 * 获取sYB
	 * 
	 * @return
	 */
	public Double getSYB() {
		return sYB;
	}

	/**
	 * 设置sYB
	 * 
	 * @param sYB
	 */
	public void setSYB(Double sYB) {
		this.sYB = sYB;
	}
	
	/**
	 * 获取sJGD1
	 * 
	 * @return
	 */
	public Double getSJGD1() {
		return sJGD1;
	}

	/**
	 * 设置sJGD1
	 * 
	 * @param sJGD1
	 */
	public void setSJGD1(Double sJGD1) {
		this.sJGD1 = sJGD1;
	}
	
	/**
	 * 获取sJGD2
	 * 
	 * @return
	 */
	public Double getSJGD2() {
		return sJGD2;
	}

	/**
	 * 设置sJGD2
	 * 
	 * @param sJGD2
	 */
	public void setSJGD2(Double sJGD2) {
		this.sJGD2 = sJGD2;
	}
	
	/**
	 * 获取sJGD3
	 * 
	 * @return
	 */
	public Double getSJGD3() {
		return sJGD3;
	}

	/**
	 * 设置sJGD3
	 * 
	 * @param sJGD3
	 */
	public void setSJGD3(Double sJGD3) {
		this.sJGD3 = sJGD3;
	}
	
	/**
	 * 获取sJGD4
	 * 
	 * @return
	 */
	public Double getSJGD4() {
		return sJGD4;
	}

	/**
	 * 设置sJGD4
	 * 
	 * @param sJGD4
	 */
	public void setSJGD4(Double sJGD4) {
		this.sJGD4 = sJGD4;
	}
	
	/**
	 * 获取sJGDPJZ
	 * 
	 * @return
	 */
	public Double getSJGDPJZ() {
		return sJGDPJZ;
	}

	/**
	 * 设置sJGDPJZ
	 * 
	 * @param sJGDPJZ
	 */
	public void setSJGDPJZ(Double sJGDPJZ) {
		this.sJGDPJZ = sJGDPJZ;
	}
	
	/**
	 * 获取kZZ
	 * 
	 * @return
	 */
	public Double getKZZ() {
		return kZZ;
	}

	/**
	 * 设置kZZ
	 * 
	 * @param kZZ
	 */
	public void setKZZ(Double kZZ) {
		this.kZZ = kZZ;
	}
	
	/**
	 * 获取bHMGZ
	 * 
	 * @return
	 */
	public Double getBHMGZ() {
		return bHMGZ;
	}

	/**
	 * 设置bHMGZ
	 * 
	 * @param bHMGZ
	 */
	public void setBHMGZ(Double bHMGZ) {
		this.bHMGZ = bHMGZ;
	}
	
	/**
	 * 获取mTJXDMD
	 * 
	 * @return
	 */
	public Double getMTJXDMD() {
		return mTJXDMD;
	}

	/**
	 * 设置mTJXDMD
	 * 
	 * @param mTJXDMD
	 */
	public void setMTJXDMD(Double mTJXDMD) {
		this.mTJXDMD = mTJXDMD;
	}
	
	/**
	 * 获取wDD
	 * 
	 * @return
	 */
	public Double getWDD() {
		return wDD;
	}

	/**
	 * 设置wDD
	 * 
	 * @param wDD
	 */
	public void setWDD(Double wDD) {
		this.wDD = wDD;
	}
	
	/**
	 * 获取lZ
	 * 
	 * @return
	 */
	public Double getLZ() {
		return lZ;
	}

	/**
	 * 设置lZ
	 * 
	 * @param lZ
	 */
	public void setLZ(Double lZ) {
		this.lZ = lZ;
	}
	
	/**
	 * 获取rEMARK
	 * 
	 * @return
	 */
	public Double getREMARK() {
		return rEMARK;
	}

	/**
	 * 设置rEMARK
	 * 
	 * @param rEMARK
	 */
	public void setREMARK(Double rEMARK) {
		this.rEMARK = rEMARK;
	}

	@Override
	public String toString() {
		return "QualityTestExperimentalValueLqhhlMs [id=" + id + " , orderTicketNum=" + orderTicketNum + " , experimentalId=" + experimentalId + " , experimentalName=" + experimentalName + " , nUM=" + nUM + " , sYB=" + sYB + " , sJGD1=" + sJGD1 + " , sJGD2=" + sJGD2 + " , sJGD3=" + sJGD3 + " , sJGD4=" + sJGD4 + " , sJGDPJZ=" + sJGDPJZ + " , kZZ=" + kZZ + " , bHMGZ=" + bHMGZ + " , mTJXDMD=" + mTJXDMD + " , wDD=" + wDD + " , lZ=" + lZ + " , rEMARK=" + rEMARK + "  ]";
	
	}
	
	
}
