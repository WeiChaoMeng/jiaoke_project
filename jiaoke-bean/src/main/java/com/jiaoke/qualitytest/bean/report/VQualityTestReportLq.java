package com.jiaoke.qualitytest.bean.report;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.jiaoke.common.bean.QualityTestSearchDate;

import java.util.Date;

/**
 * V_quality_test_report_lq实体类
 * 
 * @author 
 *
 */
public class VQualityTestReportLq extends QualityTestSearchDate {
	/***/
	@JSONField(name="create_time")
	private Date createTime;
	/***/
	@JSONField(name="materials")
	private String materials; 
	/***/
	@JSONField(name="materials_num")
	private Integer materialsNum; 
	/***/
	@JSONField(name="manufacturers")
	private String manufacturers; 
	/***/
	@JSONField(name="manufacturers_num")
	private Integer manufacturersNum; 
	/***/
	@JSONField(name="specification")
	private String specification; 
	/***/
	@JSONField(name="specification_num")
	private Integer specificationNum; 
	/**-1 不合格 1合格*/
	@JSONField(name="required_result")
	private Integer requiredResult; 
	/**实验状态0.待发送 1.审批中 2.被回退 3.已完成*/
	@JSONField(name="required_status")
	private Integer requiredStatus; 
	/***/
	@JSONField(name="order_ticket_num")
	private String orderTicketNum; 
	/***/
	@JSONField(name="required_status_show")
	private String requiredStatusShow; 
	/***/
	@JSONField(name="zrd30")
	private String zrd30; 
	/***/
	@JSONField(name="zrd25")
	private String zrd25; 
	/***/
	@JSONField(name="zrd15")
	private String zrd15; 
	/***/
	@JSONField(name="zrd10")
	private String zrd10; 
	/***/
	@JSONField(name="zrd5")
	private String zrd5; 
	/***/
	@JSONField(name="yd25")
	private String yd25; 
	/***/
	@JSONField(name="yd15")
	private String yd15; 
	/***/
	@JSONField(name="yd10")
	private String yd10; 
	/***/
	@JSONField(name="yd5")
	private String yd5; 
	/***/
	@JSONField(name="rhd")
	private String rhd; 
	/***/
	@JSONField(name="sd")
	private String sd; 
	/***/
	@JSONField(name="rjd")
	private String rjd; 
	/***/
	@JSONField(name="dlnd")
	private String dlnd; 
	/***/
	@JSONField(name="md15")
	private String md15; 
	/***/
	@JSONField(name="xdmd")
	private String xdmd; 
	/***/
	@JSONField(name="txhf")
	private String txhf; 
	/***/
	@JSONField(name="lx")
	private String lx; 
	/***/
	@JSONField(name="zlbh")
	private String zlbh; 
	/***/
	@JSONField(name="clzrdb")
	private String clzrdb; 
	/***/
	@JSONField(name="clyd25")
	private String clyd25; 
	/***/
	@JSONField(name="clyd15")
	private String clyd15; 
	/***/
	@JSONField(name="clyd10")
	private String clyd10; 
	/***/
	@JSONField(name="clyd5")
	private String clyd5; 
	/**
	 * 实例化
	 */
	public VQualityTestReportLq() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public VQualityTestReportLq(JSONObject obj) {
		this();
		this.setCreateTime((Date)obj.get("createTime"));
		if (obj.get("materials") instanceof String) {
			this.setMaterials((String) obj.get("materials"));
		}
		if (obj.get("materialsNum") instanceof Number) {
			this.setMaterialsNum(((Number) obj.get("materialsNum")).intValue());
		}
		if (obj.get("manufacturers") instanceof String) {
			this.setManufacturers((String) obj.get("manufacturers"));
		}
		if (obj.get("manufacturersNum") instanceof Number) {
			this.setManufacturersNum(((Number) obj.get("manufacturersNum")).intValue());
		}
		if (obj.get("specification") instanceof String) {
			this.setSpecification((String) obj.get("specification"));
		}
		if (obj.get("specificationNum") instanceof Number) {
			this.setSpecificationNum(((Number) obj.get("specificationNum")).intValue());
		}
		if (obj.get("requiredResult") instanceof Number) {
			this.setRequiredResult(((Number) obj.get("requiredResult")).intValue());
		}
		if (obj.get("requiredStatus") instanceof Number) {
			this.setRequiredStatus(((Number) obj.get("requiredStatus")).intValue());
		}
		if (obj.get("orderTicketNum") instanceof String) {
			this.setOrderTicketNum((String) obj.get("orderTicketNum"));
		}
		if (obj.get("requiredStatusShow") instanceof String) {
			this.setRequiredStatusShow((String) obj.get("requiredStatusShow"));
		}
		if (obj.get("zrd30") instanceof String) {
			this.setZrd30((String) obj.get("zrd30"));
		}
		if (obj.get("zrd25") instanceof String) {
			this.setZrd25((String) obj.get("zrd25"));
		}
		if (obj.get("zrd15") instanceof String) {
			this.setZrd15((String) obj.get("zrd15"));
		}
		if (obj.get("zrd10") instanceof String) {
			this.setZrd10((String) obj.get("zrd10"));
		}
		if (obj.get("zrd5") instanceof String) {
			this.setZrd5((String) obj.get("zrd5"));
		}
		if (obj.get("yd25") instanceof String) {
			this.setYd25((String) obj.get("yd25"));
		}
		if (obj.get("yd15") instanceof String) {
			this.setYd15((String) obj.get("yd15"));
		}
		if (obj.get("yd10") instanceof String) {
			this.setYd10((String) obj.get("yd10"));
		}
		if (obj.get("yd5") instanceof String) {
			this.setYd5((String) obj.get("yd5"));
		}
		if (obj.get("rhd") instanceof String) {
			this.setRhd((String) obj.get("rhd"));
		}
		if (obj.get("sd") instanceof String) {
			this.setSd((String) obj.get("sd"));
		}
		if (obj.get("rjd") instanceof String) {
			this.setRjd((String) obj.get("rjd"));
		}
		if (obj.get("dlnd") instanceof String) {
			this.setDlnd((String) obj.get("dlnd"));
		}
		if (obj.get("md15") instanceof String) {
			this.setMd15((String) obj.get("md15"));
		}
		if (obj.get("xdmd") instanceof String) {
			this.setXdmd((String) obj.get("xdmd"));
		}
		if (obj.get("txhf") instanceof String) {
			this.setTxhf((String) obj.get("txhf"));
		}
		if (obj.get("lx") instanceof String) {
			this.setLx((String) obj.get("lx"));
		}
		if (obj.get("zlbh") instanceof String) {
			this.setZlbh((String) obj.get("zlbh"));
		}
		if (obj.get("clzrdb") instanceof String) {
			this.setClzrdb((String) obj.get("clzrdb"));
		}
		if (obj.get("clyd25") instanceof String) {
			this.setClyd25((String) obj.get("clyd25"));
		}
		if (obj.get("clyd15") instanceof String) {
			this.setClyd15((String) obj.get("clyd15"));
		}
		if (obj.get("clyd10") instanceof String) {
			this.setClyd10((String) obj.get("clyd10"));
		}
		if (obj.get("clyd5") instanceof String) {
			this.setClyd5((String) obj.get("clyd5"));
		}
	}
	
	/**
	 * 将当前对象转换为JsonObject
	 * 
	 * @return
	 */
	public JSONObject toJson() {
		JSONObject result = new JSONObject();
		if (this.getCreateTime() != null) {
			result.put("createTime",this.getCreateTime());
		}
		if (this.getMaterials() != null) {
			result.put("materials",this.getMaterials());
		}
		if (this.getMaterialsNum() != null) {
			result.put("materialsNum",this.getMaterialsNum());
		}
		if (this.getManufacturers() != null) {
			result.put("manufacturers",this.getManufacturers());
		}
		if (this.getManufacturersNum() != null) {
			result.put("manufacturersNum",this.getManufacturersNum());
		}
		if (this.getSpecification() != null) {
			result.put("specification",this.getSpecification());
		}
		if (this.getSpecificationNum() != null) {
			result.put("specificationNum",this.getSpecificationNum());
		}
		if (this.getRequiredResult() != null) {
			result.put("requiredResult",this.getRequiredResult());
		}
		if (this.getRequiredStatus() != null) {
			result.put("requiredStatus",this.getRequiredStatus());
		}
		if (this.getOrderTicketNum() != null) {
			result.put("orderTicketNum",this.getOrderTicketNum());
		}
		if (this.getRequiredStatusShow() != null) {
			result.put("requiredStatusShow",this.getRequiredStatusShow());
		}
		if (this.getZrd30() != null) {
			result.put("zrd30",this.getZrd30());
		}
		if (this.getZrd25() != null) {
			result.put("zrd25",this.getZrd25());
		}
		if (this.getZrd15() != null) {
			result.put("zrd15",this.getZrd15());
		}
		if (this.getZrd10() != null) {
			result.put("zrd10",this.getZrd10());
		}
		if (this.getZrd5() != null) {
			result.put("zrd5",this.getZrd5());
		}
		if (this.getYd25() != null) {
			result.put("yd25",this.getYd25());
		}
		if (this.getYd15() != null) {
			result.put("yd15",this.getYd15());
		}
		if (this.getYd10() != null) {
			result.put("yd10",this.getYd10());
		}
		if (this.getYd5() != null) {
			result.put("yd5",this.getYd5());
		}
		if (this.getRhd() != null) {
			result.put("rhd",this.getRhd());
		}
		if (this.getSd() != null) {
			result.put("sd",this.getSd());
		}
		if (this.getRjd() != null) {
			result.put("rjd",this.getRjd());
		}
		if (this.getDlnd() != null) {
			result.put("dlnd",this.getDlnd());
		}
		if (this.getMd15() != null) {
			result.put("md15",this.getMd15());
		}
		if (this.getXdmd() != null) {
			result.put("xdmd",this.getXdmd());
		}
		if (this.getTxhf() != null) {
			result.put("txhf",this.getTxhf());
		}
		if (this.getLx() != null) {
			result.put("lx",this.getLx());
		}
		if (this.getZlbh() != null) {
			result.put("zlbh",this.getZlbh());
		}
		if (this.getClzrdb() != null) {
			result.put("clzrdb",this.getClzrdb());
		}
		if (this.getClyd25() != null) {
			result.put("clyd25",this.getClyd25());
		}
		if (this.getClyd15() != null) {
			result.put("clyd15",this.getClyd15());
		}
		if (this.getClyd10() != null) {
			result.put("clyd10",this.getClyd10());
		}
		if (this.getClyd5() != null) {
			result.put("clyd5",this.getClyd5());
		}
		return result;
	}
	
	
	/**
	 * 获取createTime
	 * 
	 * @return
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * 设置createTime
	 * 
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	/**
	 * 获取materials
	 * 
	 * @return
	 */
	public String getMaterials() {
		return materials;
	}

	/**
	 * 设置materials
	 * 
	 * @param materials
	 */
	public void setMaterials(String materials) {
		this.materials = materials;
	}
	
	/**
	 * 获取materialsNum
	 * 
	 * @return
	 */
	public Integer getMaterialsNum() {
		return materialsNum;
	}

	/**
	 * 设置materialsNum
	 * 
	 * @param materialsNum
	 */
	public void setMaterialsNum(Integer materialsNum) {
		this.materialsNum = materialsNum;
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
	 * 获取manufacturersNum
	 * 
	 * @return
	 */
	public Integer getManufacturersNum() {
		return manufacturersNum;
	}

	/**
	 * 设置manufacturersNum
	 * 
	 * @param manufacturersNum
	 */
	public void setManufacturersNum(Integer manufacturersNum) {
		this.manufacturersNum = manufacturersNum;
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
	 * 获取specificationNum
	 * 
	 * @return
	 */
	public Integer getSpecificationNum() {
		return specificationNum;
	}

	/**
	 * 设置specificationNum
	 * 
	 * @param specificationNum
	 */
	public void setSpecificationNum(Integer specificationNum) {
		this.specificationNum = specificationNum;
	}
	
	/**
	 * 获取requiredResult
	 * 
	 * @return
	 */
	public Integer getRequiredResult() {
		return requiredResult;
	}

	/**
	 * 设置requiredResult
	 * 
	 * @param requiredResult
	 */
	public void setRequiredResult(Integer requiredResult) {
		this.requiredResult = requiredResult;
	}
	
	/**
	 * 获取requiredStatus
	 * 
	 * @return
	 */
	public Integer getRequiredStatus() {
		return requiredStatus;
	}

	/**
	 * 设置requiredStatus
	 * 
	 * @param requiredStatus
	 */
	public void setRequiredStatus(Integer requiredStatus) {
		this.requiredStatus = requiredStatus;
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
	 * 获取requiredStatusShow
	 * 
	 * @return
	 */
	public String getRequiredStatusShow() {
		return requiredStatusShow;
	}

	/**
	 * 设置requiredStatusShow
	 * 
	 * @param requiredStatusShow
	 */
	public void setRequiredStatusShow(String requiredStatusShow) {
		this.requiredStatusShow = requiredStatusShow;
	}
	
	/**
	 * 获取zrd30
	 * 
	 * @return
	 */
	public String getZrd30() {
		return zrd30;
	}

	/**
	 * 设置zrd30
	 * 
	 * @param zrd30
	 */
	public void setZrd30(String zrd30) {
		this.zrd30 = zrd30;
	}
	
	/**
	 * 获取zrd25
	 * 
	 * @return
	 */
	public String getZrd25() {
		return zrd25;
	}

	/**
	 * 设置zrd25
	 * 
	 * @param zrd25
	 */
	public void setZrd25(String zrd25) {
		this.zrd25 = zrd25;
	}
	
	/**
	 * 获取zrd15
	 * 
	 * @return
	 */
	public String getZrd15() {
		return zrd15;
	}

	/**
	 * 设置zrd15
	 * 
	 * @param zrd15
	 */
	public void setZrd15(String zrd15) {
		this.zrd15 = zrd15;
	}
	
	/**
	 * 获取zrd10
	 * 
	 * @return
	 */
	public String getZrd10() {
		return zrd10;
	}

	/**
	 * 设置zrd10
	 * 
	 * @param zrd10
	 */
	public void setZrd10(String zrd10) {
		this.zrd10 = zrd10;
	}
	
	/**
	 * 获取zrd5
	 * 
	 * @return
	 */
	public String getZrd5() {
		return zrd5;
	}

	/**
	 * 设置zrd5
	 * 
	 * @param zrd5
	 */
	public void setZrd5(String zrd5) {
		this.zrd5 = zrd5;
	}
	
	/**
	 * 获取yd25
	 * 
	 * @return
	 */
	public String getYd25() {
		return yd25;
	}

	/**
	 * 设置yd25
	 * 
	 * @param yd25
	 */
	public void setYd25(String yd25) {
		this.yd25 = yd25;
	}
	
	/**
	 * 获取yd15
	 * 
	 * @return
	 */
	public String getYd15() {
		return yd15;
	}

	/**
	 * 设置yd15
	 * 
	 * @param yd15
	 */
	public void setYd15(String yd15) {
		this.yd15 = yd15;
	}
	
	/**
	 * 获取yd10
	 * 
	 * @return
	 */
	public String getYd10() {
		return yd10;
	}

	/**
	 * 设置yd10
	 * 
	 * @param yd10
	 */
	public void setYd10(String yd10) {
		this.yd10 = yd10;
	}
	
	/**
	 * 获取yd5
	 * 
	 * @return
	 */
	public String getYd5() {
		return yd5;
	}

	/**
	 * 设置yd5
	 * 
	 * @param yd5
	 */
	public void setYd5(String yd5) {
		this.yd5 = yd5;
	}
	
	/**
	 * 获取rhd
	 * 
	 * @return
	 */
	public String getRhd() {
		return rhd;
	}

	/**
	 * 设置rhd
	 * 
	 * @param rhd
	 */
	public void setRhd(String rhd) {
		this.rhd = rhd;
	}
	
	/**
	 * 获取sd
	 * 
	 * @return
	 */
	public String getSd() {
		return sd;
	}

	/**
	 * 设置sd
	 * 
	 * @param sd
	 */
	public void setSd(String sd) {
		this.sd = sd;
	}
	
	/**
	 * 获取rjd
	 * 
	 * @return
	 */
	public String getRjd() {
		return rjd;
	}

	/**
	 * 设置rjd
	 * 
	 * @param rjd
	 */
	public void setRjd(String rjd) {
		this.rjd = rjd;
	}
	
	/**
	 * 获取dlnd
	 * 
	 * @return
	 */
	public String getDlnd() {
		return dlnd;
	}

	/**
	 * 设置dlnd
	 * 
	 * @param dlnd
	 */
	public void setDlnd(String dlnd) {
		this.dlnd = dlnd;
	}
	
	/**
	 * 获取md15
	 * 
	 * @return
	 */
	public String getMd15() {
		return md15;
	}

	/**
	 * 设置md15
	 * 
	 * @param md15
	 */
	public void setMd15(String md15) {
		this.md15 = md15;
	}
	
	/**
	 * 获取xdmd
	 * 
	 * @return
	 */
	public String getXdmd() {
		return xdmd;
	}

	/**
	 * 设置xdmd
	 * 
	 * @param xdmd
	 */
	public void setXdmd(String xdmd) {
		this.xdmd = xdmd;
	}
	
	/**
	 * 获取txhf
	 * 
	 * @return
	 */
	public String getTxhf() {
		return txhf;
	}

	/**
	 * 设置txhf
	 * 
	 * @param txhf
	 */
	public void setTxhf(String txhf) {
		this.txhf = txhf;
	}
	
	/**
	 * 获取lx
	 * 
	 * @return
	 */
	public String getLx() {
		return lx;
	}

	/**
	 * 设置lx
	 * 
	 * @param lx
	 */
	public void setLx(String lx) {
		this.lx = lx;
	}
	
	/**
	 * 获取zlbh
	 * 
	 * @return
	 */
	public String getZlbh() {
		return zlbh;
	}

	/**
	 * 设置zlbh
	 * 
	 * @param zlbh
	 */
	public void setZlbh(String zlbh) {
		this.zlbh = zlbh;
	}
	
	/**
	 * 获取clzrdb
	 * 
	 * @return
	 */
	public String getClzrdb() {
		return clzrdb;
	}

	/**
	 * 设置clzrdb
	 * 
	 * @param clzrdb
	 */
	public void setClzrdb(String clzrdb) {
		this.clzrdb = clzrdb;
	}
	
	/**
	 * 获取clyd25
	 * 
	 * @return
	 */
	public String getClyd25() {
		return clyd25;
	}

	/**
	 * 设置clyd25
	 * 
	 * @param clyd25
	 */
	public void setClyd25(String clyd25) {
		this.clyd25 = clyd25;
	}
	
	/**
	 * 获取clyd15
	 * 
	 * @return
	 */
	public String getClyd15() {
		return clyd15;
	}

	/**
	 * 设置clyd15
	 * 
	 * @param clyd15
	 */
	public void setClyd15(String clyd15) {
		this.clyd15 = clyd15;
	}
	
	/**
	 * 获取clyd10
	 * 
	 * @return
	 */
	public String getClyd10() {
		return clyd10;
	}

	/**
	 * 设置clyd10
	 * 
	 * @param clyd10
	 */
	public void setClyd10(String clyd10) {
		this.clyd10 = clyd10;
	}
	
	/**
	 * 获取clyd5
	 * 
	 * @return
	 */
	public String getClyd5() {
		return clyd5;
	}

	/**
	 * 设置clyd5
	 * 
	 * @param clyd5
	 */
	public void setClyd5(String clyd5) {
		this.clyd5 = clyd5;
	}

	@Override
	public String toString() {
		return "VQualityTestReportLq [createTime=" + createTime + " , materials=" + materials + " , materialsNum=" + materialsNum + " , manufacturers=" + manufacturers + " , manufacturersNum=" + manufacturersNum + " , specification=" + specification + " , specificationNum=" + specificationNum + " , requiredResult=" + requiredResult + " , requiredStatus=" + requiredStatus + " , orderTicketNum=" + orderTicketNum + " , requiredStatusShow=" + requiredStatusShow + " , zrd30=" + zrd30 + " , zrd25=" + zrd25 + " , zrd15=" + zrd15 + " , zrd10=" + zrd10 + " , zrd5=" + zrd5 + " , yd25=" + yd25 + " , yd15=" + yd15 + " , yd10=" + yd10 + " , yd5=" + yd5 + " , rhd=" + rhd + " , sd=" + sd + " , rjd=" + rjd + " , dlnd=" + dlnd + " , md15=" + md15 + " , xdmd=" + xdmd + " , txhf=" + txhf + " , lx=" + lx + " , zlbh=" + zlbh + " , clzrdb=" + clzrdb + " , clyd25=" + clyd25 + " , clyd15=" + clyd15 + " , clyd10=" + clyd10 + " , clyd5=" + clyd5 + "  ]";
	
	}
	
	
}
