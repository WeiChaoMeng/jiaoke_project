package com.jiaoke.qualitytest.bean.report;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.jiaoke.common.bean.QualityTestSearchDate;

import java.util.Date;

/**
 * V_quality_test_report_rhlq实体类
 * 
 * @author 
 *
 */
public class VQualityTestReportRhlq extends QualityTestSearchDate {
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
	@JSONField(name="zfllwhl")
	private String zfllwhl; 
	/***/
	@JSONField(name="bznd")
	private String bznd; 
	/***/
	@JSONField(name="zrd")
	private String zrd; 
	/***/
	@JSONField(name="yd")
	private String yd; 
	/***/
	@JSONField(name="ccwdx1")
	private String ccwdx1; 
	/***/
	@JSONField(name="ccwdx5")
	private String ccwdx5; 
	/**
	 * 实例化
	 */
	public VQualityTestReportRhlq() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public VQualityTestReportRhlq(JSONObject obj) {
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
		if (obj.get("zfllwhl") instanceof String) {
			this.setZfllwhl((String) obj.get("zfllwhl"));
		}
		if (obj.get("bznd") instanceof String) {
			this.setBznd((String) obj.get("bznd"));
		}
		if (obj.get("zrd") instanceof String) {
			this.setZrd((String) obj.get("zrd"));
		}
		if (obj.get("yd") instanceof String) {
			this.setYd((String) obj.get("yd"));
		}
		if (obj.get("ccwdx1") instanceof String) {
			this.setCcwdx1((String) obj.get("ccwdx1"));
		}
		if (obj.get("ccwdx5") instanceof String) {
			this.setCcwdx5((String) obj.get("ccwdx5"));
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
	 * 获取zfllwhl
	 * 
	 * @return
	 */
	public String getZfllwhl() {
		return zfllwhl;
	}

	/**
	 * 设置zfllwhl
	 * 
	 * @param zfllwhl
	 */
	public void setZfllwhl(String zfllwhl) {
		this.zfllwhl = zfllwhl;
	}
	
	/**
	 * 获取bznd
	 * 
	 * @return
	 */
	public String getBznd() {
		return bznd;
	}

	/**
	 * 设置bznd
	 * 
	 * @param bznd
	 */
	public void setBznd(String bznd) {
		this.bznd = bznd;
	}
	
	/**
	 * 获取zrd
	 * 
	 * @return
	 */
	public String getZrd() {
		return zrd;
	}

	/**
	 * 设置zrd
	 * 
	 * @param zrd
	 */
	public void setZrd(String zrd) {
		this.zrd = zrd;
	}
	
	/**
	 * 获取yd
	 * 
	 * @return
	 */
	public String getYd() {
		return yd;
	}

	/**
	 * 设置yd
	 * 
	 * @param yd
	 */
	public void setYd(String yd) {
		this.yd = yd;
	}
	
	/**
	 * 获取ccwdx1
	 * 
	 * @return
	 */
	public String getCcwdx1() {
		return ccwdx1;
	}

	/**
	 * 设置ccwdx1
	 * 
	 * @param ccwdx1
	 */
	public void setCcwdx1(String ccwdx1) {
		this.ccwdx1 = ccwdx1;
	}
	
	/**
	 * 获取ccwdx5
	 * 
	 * @return
	 */
	public String getCcwdx5() {
		return ccwdx5;
	}

	/**
	 * 设置ccwdx5
	 * 
	 * @param ccwdx5
	 */
	public void setCcwdx5(String ccwdx5) {
		this.ccwdx5 = ccwdx5;
	}

	@Override
	public String toString() {
		return "VQualityTestReportRhlq [createTime=" + createTime + " , materials=" + materials + " , materialsNum=" + materialsNum + " , manufacturers=" + manufacturers + " , manufacturersNum=" + manufacturersNum + " , specification=" + specification + " , specificationNum=" + specificationNum + " , requiredResult=" + requiredResult + " , requiredStatus=" + requiredStatus + " , orderTicketNum=" + orderTicketNum + " , requiredStatusShow=" + requiredStatusShow + " , zfllwhl=" + zfllwhl + " , bznd=" + bznd + " , zrd=" + zrd + " , yd=" + yd + " , ccwdx1=" + ccwdx1 + " , ccwdx5=" + ccwdx5 + "  ]";
	
	}
	
	
}
