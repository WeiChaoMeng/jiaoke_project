package com.jiaoke.qualitytest.bean.report;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.jiaoke.common.bean.QualityTestSearchDate;

/**
 * v_quality_test_report_kf_avg实体类
 * 
 * @author 
 *
 */
public class VQualityTestReportKfAvg extends QualityTestSearchDate {
	/***/
	@JSONField(name="specification")
	private String specification;
	/***/
	@JSONField(name="sk118")
	private Double sk118;
	/***/
	@JSONField(name="sk06")
	private Double sk06;
	/***/
	@JSONField(name="sk03")
	private Double sk03;
	/***/
	@JSONField(name="sk015")
	private Double sk015;
	/***/
	@JSONField(name="sk0075")
	private Double sk0075;
	/***/
	@JSONField(name="bgmd")
	private Double bgmd;
	/***/
	@JSONField(name="qsxs")
	private Double qsxs;
	/***/
	@JSONField(name="jradx")
	private Double jradx;
	/***/
	@JSONField(name="sxzl")
	private Double sxzl;
	/***/
	@JSONField(name="hsl")
	private Double hsl;
	/**
	 * 实例化
	 */
	public VQualityTestReportKfAvg() {
		super();
	}
	/**
	 * 实例化
	 *
	 * @param obj
	 */
	public VQualityTestReportKfAvg(JSONObject obj) {
		this();
		if (obj.get("specification") instanceof String) {
			this.setSpecification((String) obj.get("specification"));
		}
		if (obj.get("sk118") instanceof Number) {
			this.setSk118(((Number) obj.get("sk118")).doubleValue());
		}
		if (obj.get("sk06") instanceof Number) {
			this.setSk06(((Number) obj.get("sk06")).doubleValue());
		}
		if (obj.get("sk03") instanceof Number) {
			this.setSk03(((Number) obj.get("sk03")).doubleValue());
		}
		if (obj.get("sk015") instanceof Number) {
			this.setSk015(((Number) obj.get("sk015")).doubleValue());
		}
		if (obj.get("sk0075") instanceof Number) {
			this.setSk0075(((Number) obj.get("sk0075")).doubleValue());
		}
		if (obj.get("bgmd") instanceof Number) {
			this.setBgmd(((Number) obj.get("bgmd")).doubleValue());
		}
		if (obj.get("qsxs") instanceof Number) {
			this.setQsxs(((Number) obj.get("qsxs")).doubleValue());
		}
		if (obj.get("jradx") instanceof Number) {
			this.setJradx(((Number) obj.get("jradx")).doubleValue());
		}
		if (obj.get("sxzl") instanceof Number) {
			this.setSxzl(((Number) obj.get("sxzl")).doubleValue());
		}
		if (obj.get("hsl") instanceof Number) {
			this.setHsl(((Number) obj.get("hsl")).doubleValue());
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
		if (this.getSk118() != null) {
			result.put("sk118",this.getSk118());
		}
		if (this.getSk06() != null) {
			result.put("sk06",this.getSk06());
		}
		if (this.getSk03() != null) {
			result.put("sk03",this.getSk03());
		}
		if (this.getSk015() != null) {
			result.put("sk015",this.getSk015());
		}
		if (this.getSk0075() != null) {
			result.put("sk0075",this.getSk0075());
		}
		if (this.getBgmd() != null) {
			result.put("bgmd",this.getBgmd());
		}
		if (this.getQsxs() != null) {
			result.put("qsxs",this.getQsxs());
		}
		if (this.getJradx() != null) {
			result.put("jradx",this.getJradx());
		}
		if (this.getSxzl() != null) {
			result.put("sxzl",this.getSxzl());
		}
		if (this.getHsl() != null) {
			result.put("hsl",this.getHsl());
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
	 * 获取sk118
	 *
	 * @return
	 */
	public Double getSk118() {
		return sk118;
	}

	/**
	 * 设置sk118
	 *
	 * @param sk118
	 */
	public void setSk118(Double sk118) {
		this.sk118 = sk118;
	}

	/**
	 * 获取sk06
	 *
	 * @return
	 */
	public Double getSk06() {
		return sk06;
	}

	/**
	 * 设置sk06
	 *
	 * @param sk06
	 */
	public void setSk06(Double sk06) {
		this.sk06 = sk06;
	}

	/**
	 * 获取sk03
	 *
	 * @return
	 */
	public Double getSk03() {
		return sk03;
	}

	/**
	 * 设置sk03
	 *
	 * @param sk03
	 */
	public void setSk03(Double sk03) {
		this.sk03 = sk03;
	}

	/**
	 * 获取sk015
	 *
	 * @return
	 */
	public Double getSk015() {
		return sk015;
	}

	/**
	 * 设置sk015
	 *
	 * @param sk015
	 */
	public void setSk015(Double sk015) {
		this.sk015 = sk015;
	}

	/**
	 * 获取sk0075
	 *
	 * @return
	 */
	public Double getSk0075() {
		return sk0075;
	}

	/**
	 * 设置sk0075
	 *
	 * @param sk0075
	 */
	public void setSk0075(Double sk0075) {
		this.sk0075 = sk0075;
	}

	/**
	 * 获取bgmd
	 *
	 * @return
	 */
	public Double getBgmd() {
		return bgmd;
	}

	/**
	 * 设置bgmd
	 *
	 * @param bgmd
	 */
	public void setBgmd(Double bgmd) {
		this.bgmd = bgmd;
	}

	/**
	 * 获取qsxs
	 *
	 * @return
	 */
	public Double getQsxs() {
		return qsxs;
	}

	/**
	 * 设置qsxs
	 *
	 * @param qsxs
	 */
	public void setQsxs(Double qsxs) {
		this.qsxs = qsxs;
	}

	/**
	 * 获取jradx
	 *
	 * @return
	 */
	public Double getJradx() {
		return jradx;
	}

	/**
	 * 设置jradx
	 *
	 * @param jradx
	 */
	public void setJradx(Double jradx) {
		this.jradx = jradx;
	}

	/**
	 * 获取sxzl
	 *
	 * @return
	 */
	public Double getSxzl() {
		return sxzl;
	}

	/**
	 * 设置sxzl
	 *
	 * @param sxzl
	 */
	public void setSxzl(Double sxzl) {
		this.sxzl = sxzl;
	}

	/**
	 * 获取hsl
	 *
	 * @return
	 */
	public Double getHsl() {
		return hsl;
	}

	/**
	 * 设置hsl
	 *
	 * @param hsl
	 */
	public void setHsl(Double hsl) {
		this.hsl = hsl;
	}

	@Override
	public String toString() {
		return "VQualityTestReportKfAvg [specification=" + specification + " , sk118=" + sk118 + " , sk06=" + sk06 + " , sk03=" + sk03 + " , sk015=" + sk015 + " , sk0075=" + sk0075 + " , bgmd=" + bgmd + " , qsxs=" + qsxs + " , jradx=" + jradx + " , sxzl=" + sxzl + " , hsl=" + hsl + "  ]";

	}


}