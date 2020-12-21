package com.jiaoke.qualitytest.bean.report;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.jiaoke.common.bean.QualityTestSearchDate;

/**
 * v_quality_test_report_cjl_avg实体类
 * 
 * @author 
 *
 */
public class VQualityTestReportCjlAvg extends QualityTestSearchDate {
	/***/
	@JSONField(name="specification")
	private String specification;
	/***/
	@JSONField(name="sk375")
	private Double sk375;
	/***/
	@JSONField(name="sk315")
	private Double sk315;
	/***/
	@JSONField(name="sk265")
	private Double sk265;
	/***/
	@JSONField(name="sk19")
	private Double sk19;
	/***/
	@JSONField(name="sk16")
	private Double sk16;
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
	@JSONField(name="bgxdmd1")
	private Double bgxdmd1;
	/***/
	@JSONField(name="bgxdmd2")
	private Double bgxdmd2;
	/***/
	@JSONField(name="zpzkl")
	private Double zpzkl;
	/***/
	@JSONField(name="ysz")
	private Double ysz;
	/***/
	@JSONField(name="rrkl")
	private Double rrkl;
	/***/
	@JSONField(name="mh")
	private Double mh;
	/***/
	@JSONField(name="jgx")
	private Double jgx;
	/***/
	@JSONField(name="klhl0075")
	private Double klhl0075;
	/***/
	@JSONField(name="hsl")
	private Double hsl;
	/***/
	@JSONField(name="nfx")
	private Double nfx;
	/**
	 * 实例化
	 */
	public VQualityTestReportCjlAvg() {
		super();
	}
	/**
	 * 实例化
	 *
	 * @param obj
	 */
	public VQualityTestReportCjlAvg(JSONObject obj) {
		this();
		if (obj.get("specification") instanceof String) {
			this.setSpecification((String) obj.get("specification"));
		}
		if (obj.get("sk375") instanceof Number) {
			this.setSk375(((Number) obj.get("sk375")).doubleValue());
		}
		if (obj.get("sk315") instanceof Number) {
			this.setSk315(((Number) obj.get("sk315")).doubleValue());
		}
		if (obj.get("sk265") instanceof Number) {
			this.setSk265(((Number) obj.get("sk265")).doubleValue());
		}
		if (obj.get("sk19") instanceof Number) {
			this.setSk19(((Number) obj.get("sk19")).doubleValue());
		}
		if (obj.get("sk16") instanceof Number) {
			this.setSk16(((Number) obj.get("sk16")).doubleValue());
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
		if (obj.get("bgxdmd1") instanceof Number) {
			this.setBgxdmd1(((Number) obj.get("bgxdmd1")).doubleValue());
		}
		if (obj.get("bgxdmd2") instanceof Number) {
			this.setBgxdmd2(((Number) obj.get("bgxdmd2")).doubleValue());
		}
		if (obj.get("zpzkl") instanceof Number) {
			this.setZpzkl(((Number) obj.get("zpzkl")).doubleValue());
		}
		if (obj.get("ysz") instanceof Number) {
			this.setYsz(((Number) obj.get("ysz")).doubleValue());
		}
		if (obj.get("rrkl") instanceof Number) {
			this.setRrkl(((Number) obj.get("rrkl")).doubleValue());
		}
		if (obj.get("mh") instanceof Number) {
			this.setMh(((Number) obj.get("mh")).doubleValue());
		}
		if (obj.get("jgx") instanceof Number) {
			this.setJgx(((Number) obj.get("jgx")).doubleValue());
		}
		if (obj.get("klhl0075") instanceof Number) {
			this.setKlhl0075(((Number) obj.get("klhl0075")).doubleValue());
		}
		if (obj.get("hsl") instanceof Number) {
			this.setHsl(((Number) obj.get("hsl")).doubleValue());
		}
		if (obj.get("nfx") instanceof Number) {
			this.setNfx(((Number) obj.get("nfx")).doubleValue());
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
		if (this.getSk375() != null) {
			result.put("sk375",this.getSk375());
		}
		if (this.getSk315() != null) {
			result.put("sk315",this.getSk315());
		}
		if (this.getSk265() != null) {
			result.put("sk265",this.getSk265());
		}
		if (this.getSk19() != null) {
			result.put("sk19",this.getSk19());
		}
		if (this.getSk16() != null) {
			result.put("sk16",this.getSk16());
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
		if (this.getBgxdmd1() != null) {
			result.put("bgxdmd1",this.getBgxdmd1());
		}
		if (this.getBgxdmd2() != null) {
			result.put("bgxdmd2",this.getBgxdmd2());
		}
		if (this.getZpzkl() != null) {
			result.put("zpzkl",this.getZpzkl());
		}
		if (this.getYsz() != null) {
			result.put("ysz",this.getYsz());
		}
		if (this.getRrkl() != null) {
			result.put("rrkl",this.getRrkl());
		}
		if (this.getMh() != null) {
			result.put("mh",this.getMh());
		}
		if (this.getJgx() != null) {
			result.put("jgx",this.getJgx());
		}
		if (this.getKlhl0075() != null) {
			result.put("klhl0075",this.getKlhl0075());
		}
		if (this.getHsl() != null) {
			result.put("hsl",this.getHsl());
		}
		if (this.getNfx() != null) {
			result.put("nfx",this.getNfx());
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
	 * 获取sk375
	 *
	 * @return
	 */
	public Double getSk375() {
		return sk375;
	}

	/**
	 * 设置sk375
	 *
	 * @param sk375
	 */
	public void setSk375(Double sk375) {
		this.sk375 = sk375;
	}

	/**
	 * 获取sk315
	 *
	 * @return
	 */
	public Double getSk315() {
		return sk315;
	}

	/**
	 * 设置sk315
	 *
	 * @param sk315
	 */
	public void setSk315(Double sk315) {
		this.sk315 = sk315;
	}

	/**
	 * 获取sk265
	 *
	 * @return
	 */
	public Double getSk265() {
		return sk265;
	}

	/**
	 * 设置sk265
	 *
	 * @param sk265
	 */
	public void setSk265(Double sk265) {
		this.sk265 = sk265;
	}

	/**
	 * 获取sk19
	 *
	 * @return
	 */
	public Double getSk19() {
		return sk19;
	}

	/**
	 * 设置sk19
	 *
	 * @param sk19
	 */
	public void setSk19(Double sk19) {
		this.sk19 = sk19;
	}

	/**
	 * 获取sk16
	 *
	 * @return
	 */
	public Double getSk16() {
		return sk16;
	}

	/**
	 * 设置sk16
	 *
	 * @param sk16
	 */
	public void setSk16(Double sk16) {
		this.sk16 = sk16;
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
	 * 获取bgxdmd1
	 *
	 * @return
	 */
	public Double getBgxdmd1() {
		return bgxdmd1;
	}

	/**
	 * 设置bgxdmd1
	 *
	 * @param bgxdmd1
	 */
	public void setBgxdmd1(Double bgxdmd1) {
		this.bgxdmd1 = bgxdmd1;
	}

	/**
	 * 获取bgxdmd2
	 *
	 * @return
	 */
	public Double getBgxdmd2() {
		return bgxdmd2;
	}

	/**
	 * 设置bgxdmd2
	 *
	 * @param bgxdmd2
	 */
	public void setBgxdmd2(Double bgxdmd2) {
		this.bgxdmd2 = bgxdmd2;
	}

	/**
	 * 获取zpzkl
	 *
	 * @return
	 */
	public Double getZpzkl() {
		return zpzkl;
	}

	/**
	 * 设置zpzkl
	 *
	 * @param zpzkl
	 */
	public void setZpzkl(Double zpzkl) {
		this.zpzkl = zpzkl;
	}

	/**
	 * 获取ysz
	 *
	 * @return
	 */
	public Double getYsz() {
		return ysz;
	}

	/**
	 * 设置ysz
	 *
	 * @param ysz
	 */
	public void setYsz(Double ysz) {
		this.ysz = ysz;
	}

	/**
	 * 获取rrkl
	 *
	 * @return
	 */
	public Double getRrkl() {
		return rrkl;
	}

	/**
	 * 设置rrkl
	 *
	 * @param rrkl
	 */
	public void setRrkl(Double rrkl) {
		this.rrkl = rrkl;
	}

	/**
	 * 获取mh
	 *
	 * @return
	 */
	public Double getMh() {
		return mh;
	}

	/**
	 * 设置mh
	 *
	 * @param mh
	 */
	public void setMh(Double mh) {
		this.mh = mh;
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
	 * 获取klhl0075
	 *
	 * @return
	 */
	public Double getKlhl0075() {
		return klhl0075;
	}

	/**
	 * 设置klhl0075
	 *
	 * @param klhl0075
	 */
	public void setKlhl0075(Double klhl0075) {
		this.klhl0075 = klhl0075;
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

	/**
	 * 获取nfx
	 *
	 * @return
	 */
	public Double getNfx() {
		return nfx;
	}

	/**
	 * 设置nfx
	 *
	 * @param nfx
	 */
	public void setNfx(Double nfx) {
		this.nfx = nfx;
	}

	@Override
	public String toString() {
		return "VQualityTestReportCjlAvg [specification=" + specification + " , sk375=" + sk375 + " , sk315=" + sk315 + " , sk265=" + sk265 + " , sk19=" + sk19 + " , sk16=" + sk16 + " , sk132=" + sk132 + " , sk95=" + sk95 + " , sk475=" + sk475 + " , sk236=" + sk236 + " , sk118=" + sk118 + " , sk06=" + sk06 + " , sk03=" + sk03 + " , sk015=" + sk015 + " , sk0075=" + sk0075 + " , bgxdmd1=" + bgxdmd1 + " , bgxdmd2=" + bgxdmd2 + " , zpzkl=" + zpzkl + " , ysz=" + ysz + " , rrkl=" + rrkl + " , mh=" + mh + " , jgx=" + jgx + " , klhl0075=" + klhl0075 + " , hsl=" + hsl + " , nfx=" + nfx + "  ]";

	}


}