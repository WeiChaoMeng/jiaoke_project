package com.jiaoke.qualitytest.bean.report;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.jiaoke.common.bean.QualityTestSearchDate;

/**
 * V_quality_test_report_lqhhl_avg实体类
 * 
 * @author 
 *
 */
public class VQualityTestReportLqhhlAvg extends QualityTestSearchDate {
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
	@JSONField(name="zdlhxdmd")
	private Double zdlhxdmd; 
	/***/
	@JSONField(name="mtjxdmd")
	private Double mtjxdmd; 
	/***/
	@JSONField(name="kxl")
	private Double kxl; 
	/***/
	@JSONField(name="lqbhd")
	private Double lqbhd; 
	/***/
	@JSONField(name="kljxl")
	private Double kljxl; 
	/***/
	@JSONField(name="cjlgjjxl")
	private Double cjlgjjxl; 
	/***/
	@JSONField(name="wdd")
	private Double wdd; 
	/***/
	@JSONField(name="lz")
	private Double lz; 
	/***/
	@JSONField(name="xl")
	private Double xl; 
	/***/
	@JSONField(name="fs")
	private Double fs; 
	/***/
	@JSONField(name="clwdd")
	private Double clwdd; 
	/***/
	@JSONField(name="drplqdb")
	private Double drplqdb; 
	/***/
	@JSONField(name="dwdd")
	private Double dwdd; 
	/***/
	@JSONField(name="ssxs")
	private Double ssxs; 
	/***/
	@JSONField(name="gzsd")
	private Double gzsd; 
	/**
	 * 实例化
	 */
	public VQualityTestReportLqhhlAvg() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public VQualityTestReportLqhhlAvg(JSONObject obj) {
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
		if (obj.get("zdlhxdmd") instanceof Number) {
			this.setZdlhxdmd(((Number) obj.get("zdlhxdmd")).doubleValue());
		}
		if (obj.get("mtjxdmd") instanceof Number) {
			this.setMtjxdmd(((Number) obj.get("mtjxdmd")).doubleValue());
		}
		if (obj.get("kxl") instanceof Number) {
			this.setKxl(((Number) obj.get("kxl")).doubleValue());
		}
		if (obj.get("lqbhd") instanceof Number) {
			this.setLqbhd(((Number) obj.get("lqbhd")).doubleValue());
		}
		if (obj.get("kljxl") instanceof Number) {
			this.setKljxl(((Number) obj.get("kljxl")).doubleValue());
		}
		if (obj.get("cjlgjjxl") instanceof Number) {
			this.setCjlgjjxl(((Number) obj.get("cjlgjjxl")).doubleValue());
		}
		if (obj.get("wdd") instanceof Number) {
			this.setWdd(((Number) obj.get("wdd")).doubleValue());
		}
		if (obj.get("lz") instanceof Number) {
			this.setLz(((Number) obj.get("lz")).doubleValue());
		}
		if (obj.get("xl") instanceof Number) {
			this.setXl(((Number) obj.get("xl")).doubleValue());
		}
		if (obj.get("fs") instanceof Number) {
			this.setFs(((Number) obj.get("fs")).doubleValue());
		}
		if (obj.get("clwdd") instanceof Number) {
			this.setClwdd(((Number) obj.get("clwdd")).doubleValue());
		}
		if (obj.get("drplqdb") instanceof Number) {
			this.setDrplqdb(((Number) obj.get("drplqdb")).doubleValue());
		}
		if (obj.get("dwdd") instanceof Number) {
			this.setDwdd(((Number) obj.get("dwdd")).doubleValue());
		}
		if (obj.get("ssxs") instanceof Number) {
			this.setSsxs(((Number) obj.get("ssxs")).doubleValue());
		}
		if (obj.get("gzsd") instanceof Number) {
			this.setGzsd(((Number) obj.get("gzsd")).doubleValue());
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
		if (this.getZdlhxdmd() != null) {
			result.put("zdlhxdmd",this.getZdlhxdmd());
		}
		if (this.getMtjxdmd() != null) {
			result.put("mtjxdmd",this.getMtjxdmd());
		}
		if (this.getKxl() != null) {
			result.put("kxl",this.getKxl());
		}
		if (this.getLqbhd() != null) {
			result.put("lqbhd",this.getLqbhd());
		}
		if (this.getKljxl() != null) {
			result.put("kljxl",this.getKljxl());
		}
		if (this.getCjlgjjxl() != null) {
			result.put("cjlgjjxl",this.getCjlgjjxl());
		}
		if (this.getWdd() != null) {
			result.put("wdd",this.getWdd());
		}
		if (this.getLz() != null) {
			result.put("lz",this.getLz());
		}
		if (this.getXl() != null) {
			result.put("xl",this.getXl());
		}
		if (this.getFs() != null) {
			result.put("fs",this.getFs());
		}
		if (this.getClwdd() != null) {
			result.put("clwdd",this.getClwdd());
		}
		if (this.getDrplqdb() != null) {
			result.put("drplqdb",this.getDrplqdb());
		}
		if (this.getDwdd() != null) {
			result.put("dwdd",this.getDwdd());
		}
		if (this.getSsxs() != null) {
			result.put("ssxs",this.getSsxs());
		}
		if (this.getGzsd() != null) {
			result.put("gzsd",this.getGzsd());
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
	 * 获取zdlhxdmd
	 * 
	 * @return
	 */
	public Double getZdlhxdmd() {
		return zdlhxdmd;
	}

	/**
	 * 设置zdlhxdmd
	 * 
	 * @param zdlhxdmd
	 */
	public void setZdlhxdmd(Double zdlhxdmd) {
		this.zdlhxdmd = zdlhxdmd;
	}
	
	/**
	 * 获取mtjxdmd
	 * 
	 * @return
	 */
	public Double getMtjxdmd() {
		return mtjxdmd;
	}

	/**
	 * 设置mtjxdmd
	 * 
	 * @param mtjxdmd
	 */
	public void setMtjxdmd(Double mtjxdmd) {
		this.mtjxdmd = mtjxdmd;
	}
	
	/**
	 * 获取kxl
	 * 
	 * @return
	 */
	public Double getKxl() {
		return kxl;
	}

	/**
	 * 设置kxl
	 * 
	 * @param kxl
	 */
	public void setKxl(Double kxl) {
		this.kxl = kxl;
	}
	
	/**
	 * 获取lqbhd
	 * 
	 * @return
	 */
	public Double getLqbhd() {
		return lqbhd;
	}

	/**
	 * 设置lqbhd
	 * 
	 * @param lqbhd
	 */
	public void setLqbhd(Double lqbhd) {
		this.lqbhd = lqbhd;
	}
	
	/**
	 * 获取kljxl
	 * 
	 * @return
	 */
	public Double getKljxl() {
		return kljxl;
	}

	/**
	 * 设置kljxl
	 * 
	 * @param kljxl
	 */
	public void setKljxl(Double kljxl) {
		this.kljxl = kljxl;
	}
	
	/**
	 * 获取cjlgjjxl
	 * 
	 * @return
	 */
	public Double getCjlgjjxl() {
		return cjlgjjxl;
	}

	/**
	 * 设置cjlgjjxl
	 * 
	 * @param cjlgjjxl
	 */
	public void setCjlgjjxl(Double cjlgjjxl) {
		this.cjlgjjxl = cjlgjjxl;
	}
	
	/**
	 * 获取wdd
	 * 
	 * @return
	 */
	public Double getWdd() {
		return wdd;
	}

	/**
	 * 设置wdd
	 * 
	 * @param wdd
	 */
	public void setWdd(Double wdd) {
		this.wdd = wdd;
	}
	
	/**
	 * 获取lz
	 * 
	 * @return
	 */
	public Double getLz() {
		return lz;
	}

	/**
	 * 设置lz
	 * 
	 * @param lz
	 */
	public void setLz(Double lz) {
		this.lz = lz;
	}
	
	/**
	 * 获取xl
	 * 
	 * @return
	 */
	public Double getXl() {
		return xl;
	}

	/**
	 * 设置xl
	 * 
	 * @param xl
	 */
	public void setXl(Double xl) {
		this.xl = xl;
	}
	
	/**
	 * 获取fs
	 * 
	 * @return
	 */
	public Double getFs() {
		return fs;
	}

	/**
	 * 设置fs
	 * 
	 * @param fs
	 */
	public void setFs(Double fs) {
		this.fs = fs;
	}
	
	/**
	 * 获取clwdd
	 * 
	 * @return
	 */
	public Double getClwdd() {
		return clwdd;
	}

	/**
	 * 设置clwdd
	 * 
	 * @param clwdd
	 */
	public void setClwdd(Double clwdd) {
		this.clwdd = clwdd;
	}
	
	/**
	 * 获取drplqdb
	 * 
	 * @return
	 */
	public Double getDrplqdb() {
		return drplqdb;
	}

	/**
	 * 设置drplqdb
	 * 
	 * @param drplqdb
	 */
	public void setDrplqdb(Double drplqdb) {
		this.drplqdb = drplqdb;
	}
	
	/**
	 * 获取dwdd
	 * 
	 * @return
	 */
	public Double getDwdd() {
		return dwdd;
	}

	/**
	 * 设置dwdd
	 * 
	 * @param dwdd
	 */
	public void setDwdd(Double dwdd) {
		this.dwdd = dwdd;
	}
	
	/**
	 * 获取ssxs
	 * 
	 * @return
	 */
	public Double getSsxs() {
		return ssxs;
	}

	/**
	 * 设置ssxs
	 * 
	 * @param ssxs
	 */
	public void setSsxs(Double ssxs) {
		this.ssxs = ssxs;
	}
	
	/**
	 * 获取gzsd
	 * 
	 * @return
	 */
	public Double getGzsd() {
		return gzsd;
	}

	/**
	 * 设置gzsd
	 * 
	 * @param gzsd
	 */
	public void setGzsd(Double gzsd) {
		this.gzsd = gzsd;
	}

	@Override
	public String toString() {
		return "VQualityTestReportLqhhlAvg [specification=" + specification + " , sk375=" + sk375 + " , sk315=" + sk315 + " , sk265=" + sk265 + " , sk19=" + sk19 + " , sk16=" + sk16 + " , sk132=" + sk132 + " , sk95=" + sk95 + " , sk475=" + sk475 + " , sk236=" + sk236 + " , sk118=" + sk118 + " , sk06=" + sk06 + " , sk03=" + sk03 + " , sk015=" + sk015 + " , sk0075=" + sk0075 + " , zdlhxdmd=" + zdlhxdmd + " , mtjxdmd=" + mtjxdmd + " , kxl=" + kxl + " , lqbhd=" + lqbhd + " , kljxl=" + kljxl + " , cjlgjjxl=" + cjlgjjxl + " , wdd=" + wdd + " , lz=" + lz + " , xl=" + xl + " , fs=" + fs + " , clwdd=" + clwdd + " , drplqdb=" + drplqdb + " , dwdd=" + dwdd + " , ssxs=" + ssxs + " , gzsd=" + gzsd + "  ]";
	
	}
	
	
}
