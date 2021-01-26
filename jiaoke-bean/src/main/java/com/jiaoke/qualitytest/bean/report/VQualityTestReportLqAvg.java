package com.jiaoke.qualitytest.bean.report;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.jiaoke.common.bean.QualityTestSearchDate;

/**
 * V_quality_test_report_lq_avg实体类
 * 
 * @author 
 *
 */
public class VQualityTestReportLqAvg extends QualityTestSearchDate {
	/***/
	@JSONField(name="specification")
	private String specification;
	/***/
	@JSONField(name="manufacturers")
	private String manufacturers;
	/***/
	@JSONField(name="clyd5")
	private Double clyd5; 
	/***/
	@JSONField(name="clyd10")
	private Double clyd10; 
	/***/
	@JSONField(name="clyd15")
	private Double clyd15; 
	/***/
	@JSONField(name="clyd25")
	private Double clyd25; 
	/***/
	@JSONField(name="clzrdb")
	private Double clzrdb; 
	/***/
	@JSONField(name="zlbh")
	private Double zlbh; 
	/***/
	@JSONField(name="lx")
	private Double lx; 
	/***/
	@JSONField(name="txhf")
	private Double txhf; 
	/***/
	@JSONField(name="xdmd")
	private Double xdmd; 
	/***/
	@JSONField(name="md15")
	private Double md15; 
	/***/
	@JSONField(name="dlnd")
	private Double dlnd; 
	/***/
	@JSONField(name="rjd")
	private Double rjd; 
	/***/
	@JSONField(name="sd")
	private Double sd; 
	/***/
	@JSONField(name="rhd")
	private Double rhd; 
	/***/
	@JSONField(name="yd5")
	private Double yd5; 
	/***/
	@JSONField(name="yd10")
	private Double yd10; 
	/***/
	@JSONField(name="yd15")
	private Double yd15; 
	/***/
	@JSONField(name="yd25")
	private Double yd25; 
	/***/
	@JSONField(name="zrd5")
	private Double zrd5; 
	/***/
	@JSONField(name="zrd10")
	private Double zrd10; 
	/***/
	@JSONField(name="zrd15")
	private Double zrd15; 
	/***/
	@JSONField(name="zrd25")
	private Double zrd25; 
	/***/
	@JSONField(name="zrd30")
	private Double zrd30; 
	/**
	 * 实例化
	 */
	public VQualityTestReportLqAvg() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public VQualityTestReportLqAvg(JSONObject obj) {
		this();
		if (obj.get("specification") instanceof String) {
			this.setSpecification((String) obj.get("specification"));
		}
		if (obj.get("manufacturers") instanceof String) {
			this.setManufacturers((String) obj.get("manufacturers"));
		}
		if (obj.get("clyd5") instanceof Number) {
			this.setClyd5(((Number) obj.get("clyd5")).doubleValue());
		}
		if (obj.get("clyd10") instanceof Number) {
			this.setClyd10(((Number) obj.get("clyd10")).doubleValue());
		}
		if (obj.get("clyd15") instanceof Number) {
			this.setClyd15(((Number) obj.get("clyd15")).doubleValue());
		}
		if (obj.get("clyd25") instanceof Number) {
			this.setClyd25(((Number) obj.get("clyd25")).doubleValue());
		}
		if (obj.get("clzrdb") instanceof Number) {
			this.setClzrdb(((Number) obj.get("clzrdb")).doubleValue());
		}
		if (obj.get("zlbh") instanceof Number) {
			this.setZlbh(((Number) obj.get("zlbh")).doubleValue());
		}
		if (obj.get("lx") instanceof Number) {
			this.setLx(((Number) obj.get("lx")).doubleValue());
		}
		if (obj.get("txhf") instanceof Number) {
			this.setTxhf(((Number) obj.get("txhf")).doubleValue());
		}
		if (obj.get("xdmd") instanceof Number) {
			this.setXdmd(((Number) obj.get("xdmd")).doubleValue());
		}
		if (obj.get("md15") instanceof Number) {
			this.setMd15(((Number) obj.get("md15")).doubleValue());
		}
		if (obj.get("dlnd") instanceof Number) {
			this.setDlnd(((Number) obj.get("dlnd")).doubleValue());
		}
		if (obj.get("rjd") instanceof Number) {
			this.setRjd(((Number) obj.get("rjd")).doubleValue());
		}
		if (obj.get("sd") instanceof Number) {
			this.setSd(((Number) obj.get("sd")).doubleValue());
		}
		if (obj.get("rhd") instanceof Number) {
			this.setRhd(((Number) obj.get("rhd")).doubleValue());
		}
		if (obj.get("yd5") instanceof Number) {
			this.setYd5(((Number) obj.get("yd5")).doubleValue());
		}
		if (obj.get("yd10") instanceof Number) {
			this.setYd10(((Number) obj.get("yd10")).doubleValue());
		}
		if (obj.get("yd15") instanceof Number) {
			this.setYd15(((Number) obj.get("yd15")).doubleValue());
		}
		if (obj.get("yd25") instanceof Number) {
			this.setYd25(((Number) obj.get("yd25")).doubleValue());
		}
		if (obj.get("zrd5") instanceof Number) {
			this.setZrd5(((Number) obj.get("zrd5")).doubleValue());
		}
		if (obj.get("zrd10") instanceof Number) {
			this.setZrd10(((Number) obj.get("zrd10")).doubleValue());
		}
		if (obj.get("zrd15") instanceof Number) {
			this.setZrd15(((Number) obj.get("zrd15")).doubleValue());
		}
		if (obj.get("zrd25") instanceof Number) {
			this.setZrd25(((Number) obj.get("zrd25")).doubleValue());
		}
		if (obj.get("zrd30") instanceof Number) {
			this.setZrd30(((Number) obj.get("zrd30")).doubleValue());
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
		if (this.getClyd5() != null) {
			result.put("clyd5",this.getClyd5());
		}
		if (this.getClyd10() != null) {
			result.put("clyd10",this.getClyd10());
		}
		if (this.getClyd15() != null) {
			result.put("clyd15",this.getClyd15());
		}
		if (this.getClyd25() != null) {
			result.put("clyd25",this.getClyd25());
		}
		if (this.getClzrdb() != null) {
			result.put("clzrdb",this.getClzrdb());
		}
		if (this.getZlbh() != null) {
			result.put("zlbh",this.getZlbh());
		}
		if (this.getLx() != null) {
			result.put("lx",this.getLx());
		}
		if (this.getTxhf() != null) {
			result.put("txhf",this.getTxhf());
		}
		if (this.getXdmd() != null) {
			result.put("xdmd",this.getXdmd());
		}
		if (this.getMd15() != null) {
			result.put("md15",this.getMd15());
		}
		if (this.getDlnd() != null) {
			result.put("dlnd",this.getDlnd());
		}
		if (this.getRjd() != null) {
			result.put("rjd",this.getRjd());
		}
		if (this.getSd() != null) {
			result.put("sd",this.getSd());
		}
		if (this.getRhd() != null) {
			result.put("rhd",this.getRhd());
		}
		if (this.getYd5() != null) {
			result.put("yd5",this.getYd5());
		}
		if (this.getYd10() != null) {
			result.put("yd10",this.getYd10());
		}
		if (this.getYd15() != null) {
			result.put("yd15",this.getYd15());
		}
		if (this.getYd25() != null) {
			result.put("yd25",this.getYd25());
		}
		if (this.getZrd5() != null) {
			result.put("zrd5",this.getZrd5());
		}
		if (this.getZrd10() != null) {
			result.put("zrd10",this.getZrd10());
		}
		if (this.getZrd15() != null) {
			result.put("zrd15",this.getZrd15());
		}
		if (this.getZrd25() != null) {
			result.put("zrd25",this.getZrd25());
		}
		if (this.getZrd30() != null) {
			result.put("zrd30",this.getZrd30());
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
	 * 获取clyd5
	 * 
	 * @return
	 */
	public Double getClyd5() {
		return clyd5;
	}

	/**
	 * 设置clyd5
	 * 
	 * @param clyd5
	 */
	public void setClyd5(Double clyd5) {
		this.clyd5 = clyd5;
	}
	
	/**
	 * 获取clyd10
	 * 
	 * @return
	 */
	public Double getClyd10() {
		return clyd10;
	}

	/**
	 * 设置clyd10
	 * 
	 * @param clyd10
	 */
	public void setClyd10(Double clyd10) {
		this.clyd10 = clyd10;
	}
	
	/**
	 * 获取clyd15
	 * 
	 * @return
	 */
	public Double getClyd15() {
		return clyd15;
	}

	/**
	 * 设置clyd15
	 * 
	 * @param clyd15
	 */
	public void setClyd15(Double clyd15) {
		this.clyd15 = clyd15;
	}
	
	/**
	 * 获取clyd25
	 * 
	 * @return
	 */
	public Double getClyd25() {
		return clyd25;
	}

	/**
	 * 设置clyd25
	 * 
	 * @param clyd25
	 */
	public void setClyd25(Double clyd25) {
		this.clyd25 = clyd25;
	}
	
	/**
	 * 获取clzrdb
	 * 
	 * @return
	 */
	public Double getClzrdb() {
		return clzrdb;
	}

	/**
	 * 设置clzrdb
	 * 
	 * @param clzrdb
	 */
	public void setClzrdb(Double clzrdb) {
		this.clzrdb = clzrdb;
	}
	
	/**
	 * 获取zlbh
	 * 
	 * @return
	 */
	public Double getZlbh() {
		return zlbh;
	}

	/**
	 * 设置zlbh
	 * 
	 * @param zlbh
	 */
	public void setZlbh(Double zlbh) {
		this.zlbh = zlbh;
	}
	
	/**
	 * 获取lx
	 * 
	 * @return
	 */
	public Double getLx() {
		return lx;
	}

	/**
	 * 设置lx
	 * 
	 * @param lx
	 */
	public void setLx(Double lx) {
		this.lx = lx;
	}
	
	/**
	 * 获取txhf
	 * 
	 * @return
	 */
	public Double getTxhf() {
		return txhf;
	}

	/**
	 * 设置txhf
	 * 
	 * @param txhf
	 */
	public void setTxhf(Double txhf) {
		this.txhf = txhf;
	}
	
	/**
	 * 获取xdmd
	 * 
	 * @return
	 */
	public Double getXdmd() {
		return xdmd;
	}

	/**
	 * 设置xdmd
	 * 
	 * @param xdmd
	 */
	public void setXdmd(Double xdmd) {
		this.xdmd = xdmd;
	}
	
	/**
	 * 获取md15
	 * 
	 * @return
	 */
	public Double getMd15() {
		return md15;
	}

	/**
	 * 设置md15
	 * 
	 * @param md15
	 */
	public void setMd15(Double md15) {
		this.md15 = md15;
	}
	
	/**
	 * 获取dlnd
	 * 
	 * @return
	 */
	public Double getDlnd() {
		return dlnd;
	}

	/**
	 * 设置dlnd
	 * 
	 * @param dlnd
	 */
	public void setDlnd(Double dlnd) {
		this.dlnd = dlnd;
	}
	
	/**
	 * 获取rjd
	 * 
	 * @return
	 */
	public Double getRjd() {
		return rjd;
	}

	/**
	 * 设置rjd
	 * 
	 * @param rjd
	 */
	public void setRjd(Double rjd) {
		this.rjd = rjd;
	}
	
	/**
	 * 获取sd
	 * 
	 * @return
	 */
	public Double getSd() {
		return sd;
	}

	/**
	 * 设置sd
	 * 
	 * @param sd
	 */
	public void setSd(Double sd) {
		this.sd = sd;
	}
	
	/**
	 * 获取rhd
	 * 
	 * @return
	 */
	public Double getRhd() {
		return rhd;
	}

	/**
	 * 设置rhd
	 * 
	 * @param rhd
	 */
	public void setRhd(Double rhd) {
		this.rhd = rhd;
	}
	
	/**
	 * 获取yd5
	 * 
	 * @return
	 */
	public Double getYd5() {
		return yd5;
	}

	/**
	 * 设置yd5
	 * 
	 * @param yd5
	 */
	public void setYd5(Double yd5) {
		this.yd5 = yd5;
	}
	
	/**
	 * 获取yd10
	 * 
	 * @return
	 */
	public Double getYd10() {
		return yd10;
	}

	/**
	 * 设置yd10
	 * 
	 * @param yd10
	 */
	public void setYd10(Double yd10) {
		this.yd10 = yd10;
	}
	
	/**
	 * 获取yd15
	 * 
	 * @return
	 */
	public Double getYd15() {
		return yd15;
	}

	/**
	 * 设置yd15
	 * 
	 * @param yd15
	 */
	public void setYd15(Double yd15) {
		this.yd15 = yd15;
	}
	
	/**
	 * 获取yd25
	 * 
	 * @return
	 */
	public Double getYd25() {
		return yd25;
	}

	/**
	 * 设置yd25
	 * 
	 * @param yd25
	 */
	public void setYd25(Double yd25) {
		this.yd25 = yd25;
	}
	
	/**
	 * 获取zrd5
	 * 
	 * @return
	 */
	public Double getZrd5() {
		return zrd5;
	}

	/**
	 * 设置zrd5
	 * 
	 * @param zrd5
	 */
	public void setZrd5(Double zrd5) {
		this.zrd5 = zrd5;
	}
	
	/**
	 * 获取zrd10
	 * 
	 * @return
	 */
	public Double getZrd10() {
		return zrd10;
	}

	/**
	 * 设置zrd10
	 * 
	 * @param zrd10
	 */
	public void setZrd10(Double zrd10) {
		this.zrd10 = zrd10;
	}
	
	/**
	 * 获取zrd15
	 * 
	 * @return
	 */
	public Double getZrd15() {
		return zrd15;
	}

	/**
	 * 设置zrd15
	 * 
	 * @param zrd15
	 */
	public void setZrd15(Double zrd15) {
		this.zrd15 = zrd15;
	}
	
	/**
	 * 获取zrd25
	 * 
	 * @return
	 */
	public Double getZrd25() {
		return zrd25;
	}

	/**
	 * 设置zrd25
	 * 
	 * @param zrd25
	 */
	public void setZrd25(Double zrd25) {
		this.zrd25 = zrd25;
	}
	
	/**
	 * 获取zrd30
	 * 
	 * @return
	 */
	public Double getZrd30() {
		return zrd30;
	}

	/**
	 * 设置zrd30
	 * 
	 * @param zrd30
	 */
	public void setZrd30(Double zrd30) {
		this.zrd30 = zrd30;
	}

	@Override
	public String toString() {
		return "VQualityTestReportLqAvg [specification=" + specification + " , clyd5=" + clyd5 + " , clyd10=" + clyd10 + " , clyd15=" + clyd15 + " , clyd25=" + clyd25 + " , clzrdb=" + clzrdb + " , zlbh=" + zlbh + " , lx=" + lx + " , txhf=" + txhf + " , xdmd=" + xdmd + " , md15=" + md15 + " , dlnd=" + dlnd + " , rjd=" + rjd + " , sd=" + sd + " , rhd=" + rhd + " , yd5=" + yd5 + " , yd10=" + yd10 + " , yd15=" + yd15 + " , yd25=" + yd25 + " , zrd5=" + zrd5 + " , zrd10=" + zrd10 + " , zrd15=" + zrd15 + " , zrd25=" + zrd25 + " , zrd30=" + zrd30 + "  ]";
	
	}
	
	
}
