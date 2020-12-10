package com.jiaoke.qualitytest.bean;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.common.bean.QualityTestSearchDate;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * quality_test_lab_report实体类
 * 
 * @author 
 *
 */
public class QualityTestLabReport extends QualityTestSearchDate {
	/***/
	@JSONField(name="num")
	private String num;
	/***/
	@JSONField(name="materials")
	private String materials;
	/***/
	@JSONField(name="manufacturers")
	private String manufacturers;
	/***/
	@JSONField(name="specification")
	private String specification;
	/***/
	@JSONField(name="tunnage")
	private Double tunnage;
	/***/
	@JSONField(name="sampling_remark")
	private String samplingRemark;
	/***/
	@JSONField(name="required_result")
	private Integer requiredResult;


	/***/
	@JSONField(name="Id")
	private String id; 
	/***/
	@JSONField(name="experiment_num")
	private String experimentNum; 
	/**实验状态0.待发送 1.审批中 2.被回退 3.已完成*/
	@JSONField(name="experiment_status")
	private Integer experimentStatus;
	/**-1 不合格 1合格*/
	@JSONField(name="experiment_result")
	private Integer experimentResult;
	/***/
	@JSONField(name="order_ticket_num")
	private String orderTicketNum; 
	/***/
	@JSONField(name="materials_num")
	private Integer materialsNum; 
	/***/
	@JSONField(name="entrusting_party")
	private String entrustingParty; 
	/***/
	@JSONField(name="manufacturers_name")
	private String manufacturersName; 
	/***/
	@JSONField(name="sampling_date")
	private Date samplingDate;
	/***/
	@JSONField(name="test_date")
	private String testDate;
	/***/
	@JSONField(name="required_experimental")
	private String requiredExperimental; 
	/***/
	@JSONField(name="experimental_procedures")
	private String experimentalProcedures; 
	/***/
	@JSONField(name="sampling_spot")
	private String samplingSpot; 
	/***/
	@JSONField(name="sampling_standard")
	private String samplingStandard; 
	/***/
	@JSONField(name="verdict")
	private String verdict; 
	/***/
	@JSONField(name="charge_person")
	private String chargePerson; 
	/***/
	@JSONField(name="check_person")
	private String checkPerson; 
	/***/
	@JSONField(name="report_person")
	private String reportPerson; 
	/***/
	@JSONField(name="report_date")
	private Date reportDate;
	/**发送到部门：0、全部，1、材料部，2生产设备部*/
	@JSONField(name="notice_dep")
	private Integer noticeDep; 
	/**发送到部门*/
	@JSONField(name="notice_dep_str")
	private String noticeDepStr; 
	/**
	 * 实例化
	 */
	public QualityTestLabReport() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public QualityTestLabReport(JSONObject obj) {
		this();
		if (obj.get("num") instanceof String) {
			this.setNum((String) obj.get("num"));
		}
		if (obj.get("materials") instanceof String) {
			this.setMaterials((String) obj.get("materials"));
		}

		if (obj.get("manufacturers") instanceof String) {
			this.setManufacturers((String) obj.get("manufacturers"));
		}
		if (obj.get("specification") instanceof String) {
			this.setSpecification((String) obj.get("specification"));
		}
		if (obj.get("tunnage") instanceof Number) {
			this.setTunnage(((Number) obj.get("tunnage")).doubleValue());
		}
		if (obj.get("samplingRemark") instanceof String) {
			this.setSamplingRemark((String) obj.get("samplingRemark"));
		}

		if (obj.get("requiredResult") instanceof Number) {
			this.setRequiredResult(((Number) obj.get("requiredResult")).intValue());
		}

		if (obj.get("id") instanceof String) {
			this.setId((String) obj.get("id"));
		}
		if (obj.get("experimentNum") instanceof String) {
			this.setExperimentNum((String) obj.get("experimentNum"));
		}
		if (obj.get("experimentStatus") instanceof Number) {
			this.setExperimentStatus(((Number) obj.get("experimentStatus")).intValue());
		}
		if (obj.get("experimentResult") instanceof Number) {
			this.setExperimentResult(((Number) obj.get("experimentResult")).intValue());
		}
		if (obj.get("orderTicketNum") instanceof String) {
			this.setOrderTicketNum((String) obj.get("orderTicketNum"));
		}
		if (obj.get("materialsNum") instanceof Number) {
			this.setMaterialsNum(((Number) obj.get("materialsNum")).intValue());
		}
		if (obj.get("entrustingParty") instanceof String) {
			this.setEntrustingParty((String) obj.get("entrustingParty"));
		}
		if (obj.get("manufacturersName") instanceof String) {
			this.setManufacturersName((String) obj.get("manufacturersName"));
		}
		this.setSamplingDate((Date) obj.get("samplingDate"));

		if (obj.get("testDate") instanceof String) {
			this.setTestDate((String) obj.get("testDate"));
		}
		if (obj.get("requiredExperimental") instanceof String) {
			this.setRequiredExperimental((String) obj.get("requiredExperimental"));
		}
		if (obj.get("experimentalProcedures") instanceof String) {
			this.setExperimentalProcedures((String) obj.get("experimentalProcedures"));
		}
		if (obj.get("samplingSpot") instanceof String) {
			this.setSamplingSpot((String) obj.get("samplingSpot"));
		}
		if (obj.get("samplingStandard") instanceof String) {
			this.setSamplingStandard((String) obj.get("samplingStandard"));
		}
		if (obj.get("verdict") instanceof String) {
			this.setVerdict((String) obj.get("verdict"));
		}
		if (obj.get("chargePerson") instanceof String) {
			this.setChargePerson((String) obj.get("chargePerson"));
		}
		if (obj.get("checkPerson") instanceof String) {
			this.setCheckPerson((String) obj.get("checkPerson"));
		}
		if (obj.get("reportPerson") instanceof String) {
			this.setReportPerson((String) obj.get("reportPerson"));
		}
		this.setReportDate((Date)obj.get("reportDate"));
		if (obj.get("noticeDep") instanceof Number) {
			this.setNoticeDep(((Number) obj.get("noticeDep")).intValue());
		}
		if (obj.get("noticeDepStr") instanceof String) {
			this.setNoticeDepStr((String) obj.get("noticeDepStr"));
		}
	}
	
	/**
	 * 将当前对象转换为JsonObject
	 * 
	 * @return
	 */
	public JSONObject toJson() {
		JSONObject result = new JSONObject();
		if (this.getNum() != null) {
			result.put("num",this.getNum());
		}
		if (this.getMaterials() != null) {
			result.put("materials",this.getMaterials());
		}
		if (this.getManufacturers() != null) {
			result.put("manufacturers",this.getManufacturers());
		}
		if (this.getSpecification() != null) {
			result.put("specification",this.getSpecification());
		}
		if (this.getTunnage() != null) {
			result.put("tunnage",this.getTunnage());
		}
		if (this.getSamplingRemark() != null) {
			result.put("samplingRemark",this.getSamplingRemark());
		}
		if (this.getRequiredResult() != null) {
			result.put("requiredResult",this.getRequiredResult());
		}

		if (this.getId() != null) {
			result.put("id",this.getId());
		}
		if (this.getExperimentNum() != null) {
			result.put("experimentNum",this.getExperimentNum());
		}
		if (this.getExperimentStatus() != null) {
			result.put("experimentStatus",this.getExperimentStatus());
		}
		if (this.getExperimentResult() != null) {
			result.put("experimentResult",this.getExperimentResult());
		}
		if (this.getOrderTicketNum() != null) {
			result.put("orderTicketNum",this.getOrderTicketNum());
		}
		if (this.getMaterialsNum() != null) {
			result.put("materialsNum",this.getMaterialsNum());
		}
		if (this.getEntrustingParty() != null) {
			result.put("entrustingParty",this.getEntrustingParty());
		}
		if (this.getManufacturersName() != null) {
			result.put("manufacturersName",this.getManufacturersName());
		}
		if (this.getSamplingDate() != null) {
			result.put("samplingDate",this.getSamplingDate());
		}
		if (this.getTestDate() != null) {
			result.put("testDate",this.getTestDate());
		}
		if (this.getRequiredExperimental() != null) {
			result.put("requiredExperimental",this.getRequiredExperimental());
		}
		if (this.getExperimentalProcedures() != null) {
			result.put("experimentalProcedures",this.getExperimentalProcedures());
		}
		if (this.getSamplingSpot() != null) {
			result.put("samplingSpot",this.getSamplingSpot());
		}
		if (this.getSamplingStandard() != null) {
			result.put("samplingStandard",this.getSamplingStandard());
		}
		if (this.getVerdict() != null) {
			result.put("verdict",this.getVerdict());
		}
		if (this.getChargePerson() != null) {
			result.put("chargePerson",this.getChargePerson());
		}
		if (this.getCheckPerson() != null) {
			result.put("checkPerson",this.getCheckPerson());
		}
		if (this.getReportPerson() != null) {
			result.put("reportPerson",this.getReportPerson());
		}
		if (this.getReportDate() != null) {
			result.put("reportDate",this.getReportDate());
		}
		if (this.getNoticeDep() != null) {
			result.put("noticeDep",this.getNoticeDep());
		}
		if (this.getNoticeDepStr() != null) {
			result.put("noticeDepStr",this.getNoticeDepStr());
		}
		return result;
	}
	/**
	 * 获取num
	 *
	 * @return
	 */
	public String getNum() {
		return num;
	}

	/**
	 * 设置num
	 *
	 * @param num
	 */
	public void setNum(String num) {
		this.num = num;
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
	 * 获取tunnage
	 *
	 * @return
	 */
	public Double getTunnage() {
		return tunnage;
	}

	/**
	 * 设置tunnage
	 *
	 * @param tunnage
	 */
	public void setTunnage(Double tunnage) {
		this.tunnage = tunnage;
	}

	/**
	 * 获取samplingRemark
	 *
	 * @return
	 */
	public String getSamplingRemark() {
		return samplingRemark;
	}

	/**
	 * 设置samplingRemark
	 *
	 * @param samplingRemark
	 */
	public void setSamplingRemark(String samplingRemark) {
		this.samplingRemark = samplingRemark;
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
	 * 获取id
	 * 
	 * @return
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置id
	 * 
	 * @param id
	 */
	public void setId(String id) {
		this.id = id;
	}
	
	/**
	 * 获取experimentNum
	 * 
	 * @return
	 */
	public String getExperimentNum() {
		return experimentNum;
	}

	/**
	 * 设置experimentNum
	 * 
	 * @param experimentNum
	 */
	public void setExperimentNum(String experimentNum) {
		this.experimentNum = experimentNum;
	}
	
	/**
	 * 获取experimentStatus
	 * 
	 * @return
	 */
	public Integer getExperimentStatus() {
		return experimentStatus;
	}

	/**
	 * 设置experimentStatus
	 * 
	 * @param experimentStatus
	 */
	public void setExperimentStatus(Integer experimentStatus) {
		this.experimentStatus = experimentStatus;
	}
	/**
	 * 获取experimentResult
	 *
	 * @return
	 */
	public Integer getExperimentResult() {
		return experimentResult;
	}

	/**
	 * 设置experimentResult
	 *
	 * @param experimentResult
	 */
	public void setExperimentResult(Integer experimentResult) {
		this.experimentResult = experimentResult;
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
	 * 获取entrustingParty
	 * 
	 * @return
	 */
	public String getEntrustingParty() {
		return entrustingParty;
	}

	/**
	 * 设置entrustingParty
	 * 
	 * @param entrustingParty
	 */
	public void setEntrustingParty(String entrustingParty) {
		this.entrustingParty = entrustingParty;
	}
	
	/**
	 * 获取manufacturersName
	 * 
	 * @return
	 */
	public String getManufacturersName() {
		return manufacturersName;
	}

	/**
	 * 设置manufacturersName
	 * 
	 * @param manufacturersName
	 */
	public void setManufacturersName(String manufacturersName) {
		this.manufacturersName = manufacturersName;
	}
	
	/**
	 * 获取samplingDate
	 * 
	 * @return
	 */
	public Date getSamplingDate() {
		return samplingDate;
	}

	/**
	 * 设置samplingDate
	 * 
	 * @param samplingDate
	 */
	public void setSamplingDate(Date samplingDate) {
		this.samplingDate = samplingDate;
	}
	
	/**
	 * 获取testDate
	 * 
	 * @return
	 */
	public String getTestDate() {
		return testDate;
	}

	/**
	 * 设置testDate
	 * 
	 * @param testDate
	 */
	public void setTestDate(String testDate) {
		this.testDate = testDate;
	}
	
	/**
	 * 获取requiredExperimental
	 * 
	 * @return
	 */
	public String getRequiredExperimental() {
		return requiredExperimental;
	}

	/**
	 * 设置requiredExperimental
	 * 
	 * @param requiredExperimental
	 */
	public void setRequiredExperimental(String requiredExperimental) {
		this.requiredExperimental = requiredExperimental;
	}
	
	/**
	 * 获取experimentalProcedures
	 * 
	 * @return
	 */
	public String getExperimentalProcedures() {
		return experimentalProcedures;
	}

	/**
	 * 设置experimentalProcedures
	 * 
	 * @param experimentalProcedures
	 */
	public void setExperimentalProcedures(String experimentalProcedures) {
		this.experimentalProcedures = experimentalProcedures;
	}
	
	/**
	 * 获取samplingSpot
	 * 
	 * @return
	 */
	public String getSamplingSpot() {
		return samplingSpot;
	}

	/**
	 * 设置samplingSpot
	 * 
	 * @param samplingSpot
	 */
	public void setSamplingSpot(String samplingSpot) {
		this.samplingSpot = samplingSpot;
	}
	
	/**
	 * 获取samplingStandard
	 * 
	 * @return
	 */
	public String getSamplingStandard() {
		return samplingStandard;
	}

	/**
	 * 设置samplingStandard
	 * 
	 * @param samplingStandard
	 */
	public void setSamplingStandard(String samplingStandard) {
		this.samplingStandard = samplingStandard;
	}
	
	/**
	 * 获取verdict
	 * 
	 * @return
	 */
	public String getVerdict() {
		return verdict;
	}

	/**
	 * 设置verdict
	 * 
	 * @param verdict
	 */
	public void setVerdict(String verdict) {
		this.verdict = verdict;
	}
	
	/**
	 * 获取chargePerson
	 * 
	 * @return
	 */
	public String getChargePerson() {
		return chargePerson;
	}

	/**
	 * 设置chargePerson
	 * 
	 * @param chargePerson
	 */
	public void setChargePerson(String chargePerson) {
		this.chargePerson = chargePerson;
	}
	
	/**
	 * 获取checkPerson
	 * 
	 * @return
	 */
	public String getCheckPerson() {
		return checkPerson;
	}

	/**
	 * 设置checkPerson
	 * 
	 * @param checkPerson
	 */
	public void setCheckPerson(String checkPerson) {
		this.checkPerson = checkPerson;
	}
	
	/**
	 * 获取reportPerson
	 * 
	 * @return
	 */
	public String getReportPerson() {
		return reportPerson;
	}

	/**
	 * 设置reportPerson
	 * 
	 * @param reportPerson
	 */
	public void setReportPerson(String reportPerson) {
		this.reportPerson = reportPerson;
	}
	
	/**
	 * 获取reportDate
	 * 
	 * @return
	 */
	public Date getReportDate() {
		return reportDate;
	}

	/**
	 * 设置reportDate
	 * 
	 * @param reportDate
	 */
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	
	/**
	 * 获取noticeDep
	 * 
	 * @return
	 */
	public Integer getNoticeDep() {
		return noticeDep;
	}

	/**
	 * 设置noticeDep
	 * 
	 * @param noticeDep
	 */
	public void setNoticeDep(Integer noticeDep) {
		this.noticeDep = noticeDep;
	}
	
	/**
	 * 获取noticeDepStr
	 * 
	 * @return
	 */
	public String getNoticeDepStr() {
		return noticeDepStr;
	}

	/**
	 * 设置noticeDepStr
	 * 
	 * @param noticeDepStr
	 */
	public void setNoticeDepStr(String noticeDepStr) {
		this.noticeDepStr = noticeDepStr;
	}

	@Override
	public String toString() {
		return "QualityTestLabReport [id=" + id + " , experimentNum=" + experimentNum + " , experimentStatus=" + experimentStatus + " , orderTicketNum=" + orderTicketNum + " , materialsNum=" + materialsNum + " , entrustingParty=" + entrustingParty + " , manufacturersName=" + manufacturersName + " , samplingDate=" + samplingDate + " , testDate=" + testDate + " , requiredExperimental=" + requiredExperimental + " , experimentalProcedures=" + experimentalProcedures + " , samplingSpot=" + samplingSpot + " , samplingStandard=" + samplingStandard + " , verdict=" + verdict + " , chargePerson=" + chargePerson + " , checkPerson=" + checkPerson + " , reportPerson=" + reportPerson + " , reportDate=" + reportDate + " , noticeDep=" + noticeDep + " , noticeDepStr=" + noticeDepStr + "  ]";
	
	}
	
	
}
