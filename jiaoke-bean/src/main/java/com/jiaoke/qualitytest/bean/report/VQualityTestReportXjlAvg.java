package com.jiaoke.qualitytest.bean.report;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.jiaoke.common.bean.QualityTestSearchDate;

/**
 * v_quality_test_report_xjl_avg实体类
 * 
 * @author 
 *
 */
public class VQualityTestReportXjlAvg extends QualityTestSearchDate {
	/***/
	@JSONField(name="specification")
	private String specification;
	/***/
	@JSONField(name="manufacturers")
	private String manufacturers;
	/***/
	@JSONField(name="sk132")
	private Double sk132;
	/***/
	@JSONField(name="sk95")
	private Double sk95;
	/***/
	@JSONField(name="sk475")
	private Double sk475;
	/***/
	@JSONField(name="sk236")
	private Double sk236;
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
	@JSONField(name="mdjxsl")
	private Double mdjxsl;
	/***/
	@JSONField(name="sdl")
	private Double sdl;
	/***/
	@JSONField(name="lj")
	private Double lj;
	/***/
	@JSONField(name="yjl")
	private Double yjl;
	/***/
	@JSONField(name="jgx")
	private Double jgx;
	/***/
	@JSONField(name="hnl")
	private Double hnl;
	/**
	 * 实例化
	 */
	public VQualityTestReportXjlAvg() {
		super();
	}
	/**
	 * 实例化
	 *
	 * @param obj
	 */
	public VQualityTestReportXjlAvg(JSONObject obj) {
		this();
		if (obj.get("specification") instanceof String) {
			this.setSpecification((String) obj.get("specification"));
		}
		if (obj.get("manufacturers") instanceof String) {
			this.setManufacturers((String) obj.get("manufacturers"));
		}
		if (obj.get("sk132") instanceof Number) {
			this.setSk132(((Number) obj.get("sk132")).doubleValue());
		}
		if (obj.get("sk95") instanceof Number) {
			this.setSk95(((Number) obj.get("sk95")).doubleValue());
		}
		if (obj.get("sk475") instanceof Number) {
			this.setSk475(((Number) obj.get("sk475")).doubleValue());
		}
		if (obj.get("sk236") instanceof Number) {
			this.setSk236(((Number) obj.get("sk236")).doubleValue());
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
		if (obj.get("mdjxsl") instanceof Number) {
			this.setMdjxsl(((Number) obj.get("mdjxsl")).doubleValue());
		}
		if (obj.get("sdl") instanceof Number) {
			this.setSdl(((Number) obj.get("sdl")).doubleValue());
		}
		if (obj.get("lj") instanceof Number) {
			this.setLj(((Number) obj.get("lj")).doubleValue());
		}
		if (obj.get("yjl") instanceof Number) {
			this.setYjl(((Number) obj.get("yjl")).doubleValue());
		}
		if (obj.get("jgx") instanceof Number) {
			this.setJgx(((Number) obj.get("jgx")).doubleValue());
		}
		if (obj.get("hnl") instanceof Number) {
			this.setHnl(((Number) obj.get("hnl")).doubleValue());
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
		if (this.getManufacturers() != null) {
			result.put("manufacturers",this.getManufacturers());
		}
		if (this.getSk132() != null) {
			result.put("sk132",this.getSk132());
		}
		if (this.getSk95() != null) {
			result.put("sk95",this.getSk95());
		}
		if (this.getSk475() != null) {
			result.put("sk475",this.getSk475());
		}
		if (this.getSk236() != null) {
			result.put("sk236",this.getSk236());
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
		if (this.getMdjxsl() != null) {
			result.put("mdjxsl",this.getMdjxsl());
		}
		if (this.getSdl() != null) {
			result.put("sdl",this.getSdl());
		}
		if (this.getLj() != null) {
			result.put("lj",this.getLj());
		}
		if (this.getYjl() != null) {
			result.put("yjl",this.getYjl());
		}
		if (this.getJgx() != null) {
			result.put("jgx",this.getJgx());
		}
		if (this.getHnl() != null) {
			result.put("hnl",this.getHnl());
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
	 * 获取sk132
	 *
	 * @return
	 */
	public Double getSk132() {
		return sk132;
	}

	/**
	 * 设置sk132
	 *
	 * @param sk132
	 */
	public void setSk132(Double sk132) {
		this.sk132 = sk132;
	}

	/**
	 * 获取sk95
	 *
	 * @return
	 */
	public Double getSk95() {
		return sk95;
	}

	/**
	 * 设置sk95
	 *
	 * @param sk95
	 */
	public void setSk95(Double sk95) {
		this.sk95 = sk95;
	}

	/**
	 * 获取sk475
	 *
	 * @return
	 */
	public Double getSk475() {
		return sk475;
	}

	/**
	 * 设置sk475
	 *
	 * @param sk475
	 */
	public void setSk475(Double sk475) {
		this.sk475 = sk475;
	}

	/**
	 * 获取sk236
	 *
	 * @return
	 */
	public Double getSk236() {
		return sk236;
	}

	/**
	 * 设置sk236
	 *
	 * @param sk236
	 */
	public void setSk236(Double sk236) {
		this.sk236 = sk236;
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
	 * 获取mdjxsl
	 *
	 * @return
	 */
	public Double getMdjxsl() {
		return mdjxsl;
	}

	/**
	 * 设置mdjxsl
	 *
	 * @param mdjxsl
	 */
	public void setMdjxsl(Double mdjxsl) {
		this.mdjxsl = mdjxsl;
	}

	/**
	 * 获取sdl
	 *
	 * @return
	 */
	public Double getSdl() {
		return sdl;
	}

	/**
	 * 设置sdl
	 *
	 * @param sdl
	 */
	public void setSdl(Double sdl) {
		this.sdl = sdl;
	}

	/**
	 * 获取lj
	 *
	 * @return
	 */
	public Double getLj() {
		return lj;
	}

	/**
	 * 设置lj
	 *
	 * @param lj
	 */
	public void setLj(Double lj) {
		this.lj = lj;
	}

	/**
	 * 获取yjl
	 *
	 * @return
	 */
	public Double getYjl() {
		return yjl;
	}

	/**
	 * 设置yjl
	 *
	 * @param yjl
	 */
	public void setYjl(Double yjl) {
		this.yjl = yjl;
	}

	/**
	 * 获取jgx
	 *
	 * @return
	 */
	public Double getJgx() {
		return jgx;
	}

	/**
	 * 设置jgx
	 *
	 * @param jgx
	 */
	public void setJgx(Double jgx) {
		this.jgx = jgx;
	}

	/**
	 * 获取hnl
	 *
	 * @return
	 */
	public Double getHnl() {
		return hnl;
	}

	/**
	 * 设置hnl
	 *
	 * @param hnl
	 */
	public void setHnl(Double hnl) {
		this.hnl = hnl;
	}

	@Override
	public String toString() {
		return "VQualityTestReportXjlAvg [specification=" + specification + " , sk132=" + sk132 + " , sk95=" + sk95 + " , sk475=" + sk475 + " , sk236=" + sk236 + " , sk118=" + sk118 + " , sk06=" + sk06 + " , sk03=" + sk03 + " , sk015=" + sk015 + " , sk0075=" + sk0075 + " , bgmd=" + bgmd + " , mdjxsl=" + mdjxsl + " , sdl=" + sdl + " , lj=" + lj + " , yjl=" + yjl + " , jgx=" + jgx + " , hnl=" + hnl + "  ]";

	}


}