package com.jiaoke.qualitytest.bean.report;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.jiaoke.common.bean.QualityTestSearchDate;

/**
 * V_quality_test_report_rhlq_avg实体类
 * 
 * @author 
 *
 */
public class VQualityTestReportRhlqAvg extends QualityTestSearchDate {
	/***/
	@JSONField(name="specification")
	private String specification; 
	/***/
	@JSONField(name="zfllwhl")
	private Double zfllwhl; 
	/***/
	@JSONField(name="bznd")
	private Double bznd; 
	/***/
	@JSONField(name="zrd")
	private Double zrd; 
	/***/
	@JSONField(name="yd")
	private Double yd; 
	/***/
	@JSONField(name="ccwdx1")
	private Double ccwdx1; 
	/***/
	@JSONField(name="ccwdx5")
	private Double ccwdx5; 
	/**
	 * 实例化
	 */
	public VQualityTestReportRhlqAvg() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public VQualityTestReportRhlqAvg(JSONObject obj) {
		this();
		if (obj.get("specification") instanceof String) {
			this.setSpecification((String) obj.get("specification"));
		}
		if (obj.get("zfllwhl") instanceof Number) {
			this.setZfllwhl(((Number) obj.get("zfllwhl")).doubleValue());
		}
		if (obj.get("bznd") instanceof Number) {
			this.setBznd(((Number) obj.get("bznd")).doubleValue());
		}
		if (obj.get("zrd") instanceof Number) {
			this.setZrd(((Number) obj.get("zrd")).doubleValue());
		}
		if (obj.get("yd") instanceof Number) {
			this.setYd(((Number) obj.get("yd")).doubleValue());
		}
		if (obj.get("ccwdx1") instanceof Number) {
			this.setCcwdx1(((Number) obj.get("ccwdx1")).doubleValue());
		}
		if (obj.get("ccwdx5") instanceof Number) {
			this.setCcwdx5(((Number) obj.get("ccwdx5")).doubleValue());
		}
	}
	
	/**
	 * 将当前对象转换为JsonObject
	 * 
	 * @return
	 */
	public JSONObject toJson() {
		JSONObject result = new JSONObject();
		if (this.getSpecification() != null) {
			result.put("specification",this.getSpecification());
		}
		if (this.getZfllwhl() != null) {
			result.put("zfllwhl",this.getZfllwhl());
		}
		if (this.getBznd() != null) {
			result.put("bznd",this.getBznd());
		}
		if (this.getZrd() != null) {
			result.put("zrd",this.getZrd());
		}
		if (this.getYd() != null) {
			result.put("yd",this.getYd());
		}
		if (this.getCcwdx1() != null) {
			result.put("ccwdx1",this.getCcwdx1());
		}
		if (this.getCcwdx5() != null) {
			result.put("ccwdx5",this.getCcwdx5());
		}
		return result;
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
	 * 获取zfllwhl
	 * 
	 * @return
	 */
	public Double getZfllwhl() {
		return zfllwhl;
	}

	/**
	 * 设置zfllwhl
	 * 
	 * @param zfllwhl
	 */
	public void setZfllwhl(Double zfllwhl) {
		this.zfllwhl = zfllwhl;
	}
	
	/**
	 * 获取bznd
	 * 
	 * @return
	 */
	public Double getBznd() {
		return bznd;
	}

	/**
	 * 设置bznd
	 * 
	 * @param bznd
	 */
	public void setBznd(Double bznd) {
		this.bznd = bznd;
	}
	
	/**
	 * 获取zrd
	 * 
	 * @return
	 */
	public Double getZrd() {
		return zrd;
	}

	/**
	 * 设置zrd
	 * 
	 * @param zrd
	 */
	public void setZrd(Double zrd) {
		this.zrd = zrd;
	}
	
	/**
	 * 获取yd
	 * 
	 * @return
	 */
	public Double getYd() {
		return yd;
	}

	/**
	 * 设置yd
	 * 
	 * @param yd
	 */
	public void setYd(Double yd) {
		this.yd = yd;
	}
	
	/**
	 * 获取ccwdx1
	 * 
	 * @return
	 */
	public Double getCcwdx1() {
		return ccwdx1;
	}

	/**
	 * 设置ccwdx1
	 * 
	 * @param ccwdx1
	 */
	public void setCcwdx1(Double ccwdx1) {
		this.ccwdx1 = ccwdx1;
	}
	
	/**
	 * 获取ccwdx5
	 * 
	 * @return
	 */
	public Double getCcwdx5() {
		return ccwdx5;
	}

	/**
	 * 设置ccwdx5
	 * 
	 * @param ccwdx5
	 */
	public void setCcwdx5(Double ccwdx5) {
		this.ccwdx5 = ccwdx5;
	}

	@Override
	public String toString() {
		return "VQualityTestReportRhlqAvg [specification=" + specification + " , zfllwhl=" + zfllwhl + " , bznd=" + bznd + " , zrd=" + zrd + " , yd=" + yd + " , ccwdx1=" + ccwdx1 + " , ccwdx5=" + ccwdx5 + "  ]";
	
	}
	
	
}
