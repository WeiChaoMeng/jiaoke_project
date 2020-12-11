package com.jiaoke.qualitytest.bean.report;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.common.bean.QualityTestPage;
import com.jiaoke.common.bean.QualityTestSearchDate;

import java.util.Date;

/**
 * v_quality_test_report_xjl实体类
 * 
 * @author 
 *
 */
public class VQualityTestReportXjl extends QualityTestSearchDate {
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
	/***/
	@JSONField(name="required_result")
	private Integer requiredResult; 
	/***/
	@JSONField(name="required_status")
	private Integer requiredStatus; 
	/***/
	@JSONField(name="required_status_show")
	private String requiredStatusShow; 
	/***/
	@JSONField(name="ID")
	private Integer iD; 
	/***/
	@JSONField(name="order_ticket_num")
	private String orderTicketNum; 
	/***/
	@JSONField(name="experimental_id")
	private String experimentalId; 
	/***/
	@JSONField(name="experimental_name")
	private String experimentalName; 
	/***/
	@JSONField(name="SK132")
	private Double sK132; 
	/***/
	@JSONField(name="SK95")
	private Double sK95; 
	/***/
	@JSONField(name="SK475")
	private Double sK475; 
	/***/
	@JSONField(name="SK236")
	private Double sK236; 
	/***/
	@JSONField(name="SK118")
	private Double sK118; 
	/***/
	@JSONField(name="SK06")
	private Double sK06; 
	/***/
	@JSONField(name="SK03")
	private Double sK03; 
	/***/
	@JSONField(name="SK015")
	private Double sK015; 
	/***/
	@JSONField(name="SK0075")
	private Double sK0075; 
	/***/
	@JSONField(name="SD")
	private Double sD; 
	/***/
	@JSONField(name="bgmd")
	private String bgmd; 
	/***/
	@JSONField(name="mdjxsl")
	private String mdjxsl; 
	/***/
	@JSONField(name="sdl")
	private String sdl; 
	/***/
	@JSONField(name="lj")
	private String lj; 
	/***/
	@JSONField(name="yjl")
	private String yjl; 
	/**
	 * 实例化
	 */
	public VQualityTestReportXjl() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public VQualityTestReportXjl(JSONObject obj) {
		this();
		this.setCreateTime((Date) obj.get("createTime"));
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
		if (obj.get("requiredStatusShow") instanceof String) {
			this.setRequiredStatusShow((String) obj.get("requiredStatusShow"));
		}
		if (obj.get("iD") instanceof Number) {
			this.setID(((Number) obj.get("iD")).intValue());
		}
		if (obj.get("orderTicketNum") instanceof String) {
			this.setOrderTicketNum((String) obj.get("orderTicketNum"));
		}
		if (obj.get("experimentalId") instanceof String) {
			this.setExperimentalId((String) obj.get("experimentalId"));
		}
		if (obj.get("experimentalName") instanceof String) {
			this.setExperimentalName((String) obj.get("experimentalName"));
		}
		if (obj.get("sK132") instanceof Number) {
			this.setSK132(((Number) obj.get("sK132")).doubleValue());
		}
		if (obj.get("sK95") instanceof Number) {
			this.setSK95(((Number) obj.get("sK95")).doubleValue());
		}
		if (obj.get("sK475") instanceof Number) {
			this.setSK475(((Number) obj.get("sK475")).doubleValue());
		}
		if (obj.get("sK236") instanceof Number) {
			this.setSK236(((Number) obj.get("sK236")).doubleValue());
		}
		if (obj.get("sK118") instanceof Number) {
			this.setSK118(((Number) obj.get("sK118")).doubleValue());
		}
		if (obj.get("sK06") instanceof Number) {
			this.setSK06(((Number) obj.get("sK06")).doubleValue());
		}
		if (obj.get("sK03") instanceof Number) {
			this.setSK03(((Number) obj.get("sK03")).doubleValue());
		}
		if (obj.get("sK015") instanceof Number) {
			this.setSK015(((Number) obj.get("sK015")).doubleValue());
		}
		if (obj.get("sK0075") instanceof Number) {
			this.setSK0075(((Number) obj.get("sK0075")).doubleValue());
		}
		if (obj.get("sD") instanceof Number) {
			this.setSD(((Number) obj.get("sD")).doubleValue());
		}
		if (obj.get("bgmd") instanceof String) {
			this.setBgmd((String) obj.get("bgmd"));
		}
		if (obj.get("mdjxsl") instanceof String) {
			this.setMdjxsl((String) obj.get("mdjxsl"));
		}
		if (obj.get("sdl") instanceof String) {
			this.setSdl((String) obj.get("sdl"));
		}
		if (obj.get("lj") instanceof String) {
			this.setLj((String) obj.get("lj"));
		}
		if (obj.get("yjl") instanceof String) {
			this.setYjl((String) obj.get("yjl"));
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
		if (this.getRequiredStatusShow() != null) {
			result.put("requiredStatusShow",this.getRequiredStatusShow());
		}
		if (this.getID() != null) {
			result.put("iD",this.getID());
		}
		if (this.getOrderTicketNum() != null) {
			result.put("orderTicketNum",this.getOrderTicketNum());
		}
		if (this.getExperimentalId() != null) {
			result.put("experimentalId",this.getExperimentalId());
		}
		if (this.getExperimentalName() != null) {
			result.put("experimentalName",this.getExperimentalName());
		}
		if (this.getSK132() != null) {
			result.put("sK132",this.getSK132());
		}
		if (this.getSK95() != null) {
			result.put("sK95",this.getSK95());
		}
		if (this.getSK475() != null) {
			result.put("sK475",this.getSK475());
		}
		if (this.getSK236() != null) {
			result.put("sK236",this.getSK236());
		}
		if (this.getSK118() != null) {
			result.put("sK118",this.getSK118());
		}
		if (this.getSK06() != null) {
			result.put("sK06",this.getSK06());
		}
		if (this.getSK03() != null) {
			result.put("sK03",this.getSK03());
		}
		if (this.getSK015() != null) {
			result.put("sK015",this.getSK015());
		}
		if (this.getSK0075() != null) {
			result.put("sK0075",this.getSK0075());
		}
		if (this.getSD() != null) {
			result.put("sD",this.getSD());
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
	 * 获取iD
	 * 
	 * @return
	 */
	public Integer getID() {
		return iD;
	}

	/**
	 * 设置iD
	 * 
	 * @param iD
	 */
	public void setID(Integer iD) {
		this.iD = iD;
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
	 * 获取experimentalId
	 * 
	 * @return
	 */
	public String getExperimentalId() {
		return experimentalId;
	}

	/**
	 * 设置experimentalId
	 * 
	 * @param experimentalId
	 */
	public void setExperimentalId(String experimentalId) {
		this.experimentalId = experimentalId;
	}
	
	/**
	 * 获取experimentalName
	 * 
	 * @return
	 */
	public String getExperimentalName() {
		return experimentalName;
	}

	/**
	 * 设置experimentalName
	 * 
	 * @param experimentalName
	 */
	public void setExperimentalName(String experimentalName) {
		this.experimentalName = experimentalName;
	}
	
	/**
	 * 获取sK132
	 * 
	 * @return
	 */
	public Double getSK132() {
		return sK132;
	}

	/**
	 * 设置sK132
	 * 
	 * @param sK132
	 */
	public void setSK132(Double sK132) {
		this.sK132 = sK132;
	}
	
	/**
	 * 获取sK95
	 * 
	 * @return
	 */
	public Double getSK95() {
		return sK95;
	}

	/**
	 * 设置sK95
	 * 
	 * @param sK95
	 */
	public void setSK95(Double sK95) {
		this.sK95 = sK95;
	}
	
	/**
	 * 获取sK475
	 * 
	 * @return
	 */
	public Double getSK475() {
		return sK475;
	}

	/**
	 * 设置sK475
	 * 
	 * @param sK475
	 */
	public void setSK475(Double sK475) {
		this.sK475 = sK475;
	}
	
	/**
	 * 获取sK236
	 * 
	 * @return
	 */
	public Double getSK236() {
		return sK236;
	}

	/**
	 * 设置sK236
	 * 
	 * @param sK236
	 */
	public void setSK236(Double sK236) {
		this.sK236 = sK236;
	}
	
	/**
	 * 获取sK118
	 * 
	 * @return
	 */
	public Double getSK118() {
		return sK118;
	}

	/**
	 * 设置sK118
	 * 
	 * @param sK118
	 */
	public void setSK118(Double sK118) {
		this.sK118 = sK118;
	}
	
	/**
	 * 获取sK06
	 * 
	 * @return
	 */
	public Double getSK06() {
		return sK06;
	}

	/**
	 * 设置sK06
	 * 
	 * @param sK06
	 */
	public void setSK06(Double sK06) {
		this.sK06 = sK06;
	}
	
	/**
	 * 获取sK03
	 * 
	 * @return
	 */
	public Double getSK03() {
		return sK03;
	}

	/**
	 * 设置sK03
	 * 
	 * @param sK03
	 */
	public void setSK03(Double sK03) {
		this.sK03 = sK03;
	}
	
	/**
	 * 获取sK015
	 * 
	 * @return
	 */
	public Double getSK015() {
		return sK015;
	}

	/**
	 * 设置sK015
	 * 
	 * @param sK015
	 */
	public void setSK015(Double sK015) {
		this.sK015 = sK015;
	}
	
	/**
	 * 获取sK0075
	 * 
	 * @return
	 */
	public Double getSK0075() {
		return sK0075;
	}

	/**
	 * 设置sK0075
	 * 
	 * @param sK0075
	 */
	public void setSK0075(Double sK0075) {
		this.sK0075 = sK0075;
	}
	
	/**
	 * 获取sD
	 * 
	 * @return
	 */
	public Double getSD() {
		return sD;
	}

	/**
	 * 设置sD
	 * 
	 * @param sD
	 */
	public void setSD(Double sD) {
		this.sD = sD;
	}
	
	/**
	 * 获取bgmd
	 * 
	 * @return
	 */
	public String getBgmd() {
		return bgmd;
	}

	/**
	 * 设置bgmd
	 * 
	 * @param bgmd
	 */
	public void setBgmd(String bgmd) {
		this.bgmd = bgmd;
	}
	
	/**
	 * 获取mdjxsl
	 * 
	 * @return
	 */
	public String getMdjxsl() {
		return mdjxsl;
	}

	/**
	 * 设置mdjxsl
	 * 
	 * @param mdjxsl
	 */
	public void setMdjxsl(String mdjxsl) {
		this.mdjxsl = mdjxsl;
	}
	
	/**
	 * 获取sdl
	 * 
	 * @return
	 */
	public String getSdl() {
		return sdl;
	}

	/**
	 * 设置sdl
	 * 
	 * @param sdl
	 */
	public void setSdl(String sdl) {
		this.sdl = sdl;
	}
	
	/**
	 * 获取lj
	 * 
	 * @return
	 */
	public String getLj() {
		return lj;
	}

	/**
	 * 设置lj
	 * 
	 * @param lj
	 */
	public void setLj(String lj) {
		this.lj = lj;
	}
	
	/**
	 * 获取yjl
	 * 
	 * @return
	 */
	public String getYjl() {
		return yjl;
	}

	/**
	 * 设置yjl
	 * 
	 * @param yjl
	 */
	public void setYjl(String yjl) {
		this.yjl = yjl;
	}

	@Override
	public String toString() {
		return "VQualityTestReportXjl [createTime=" + createTime + " , materials=" + materials + " , materialsNum=" + materialsNum + " , manufacturers=" + manufacturers + " , manufacturersNum=" + manufacturersNum + " , specification=" + specification + " , specificationNum=" + specificationNum + " , requiredResult=" + requiredResult + " , requiredStatus=" + requiredStatus + " , requiredStatusShow=" + requiredStatusShow + " , iD=" + iD + " , orderTicketNum=" + orderTicketNum + " , experimentalId=" + experimentalId + " , experimentalName=" + experimentalName + " , sK132=" + sK132 + " , sK95=" + sK95 + " , sK475=" + sK475 + " , sK236=" + sK236 + " , sK118=" + sK118 + " , sK06=" + sK06 + " , sK03=" + sK03 + " , sK015=" + sK015 + " , sK0075=" + sK0075 + " , sD=" + sD + " , bgmd=" + bgmd + " , mdjxsl=" + mdjxsl + " , sdl=" + sdl + " , lj=" + lj + " , yjl=" + yjl + "  ]";
	
	}
	
	
}
