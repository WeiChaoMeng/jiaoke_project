package com.jiaoke.qualitytest.bean.report;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.JSONObject;
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
	@JSONField(name="md")
	private Double md; 
	/***/
	@JSONField(name="qsxs")
	private Double qsxs; 
	/***/
	@JSONField(name="jradx")
	private Double jradx; 
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
		if (obj.get("md") instanceof Number) {
			this.setMd(((Number) obj.get("md")).doubleValue());
		}
		if (obj.get("qsxs") instanceof Number) {
			this.setQsxs(((Number) obj.get("qsxs")).doubleValue());
		}
		if (obj.get("jradx") instanceof Number) {
			this.setJradx(((Number) obj.get("jradx")).doubleValue());
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
		if (this.getMd() != null) {
			result.put("md",this.getMd());
		}
		if (this.getQsxs() != null) {
			result.put("qsxs",this.getQsxs());
		}
		if (this.getJradx() != null) {
			result.put("jradx",this.getJradx());
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
	 * 获取md
	 * 
	 * @return
	 */
	public Double getMd() {
		return md;
	}

	/**
	 * 设置md
	 * 
	 * @param md
	 */
	public void setMd(Double md) {
		this.md = md;
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

	@Override
	public String toString() {
		return "VQualityTestReportKfAvg [specification=" + specification + " , sk06=" + sk06 + " , sk03=" + sk03 + " , sk015=" + sk015 + " , sk0075=" + sk0075 + " , md=" + md + " , qsxs=" + qsxs + " , jradx=" + jradx + "  ]";
	
	}
	
	
}
