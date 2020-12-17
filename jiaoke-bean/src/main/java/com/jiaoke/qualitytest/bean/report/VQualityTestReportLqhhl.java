package com.jiaoke.qualitytest.bean.report;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.jiaoke.common.bean.QualityTestSearchDate;

import java.util.Date;

/**
 * V_quality_test_report_lqhhl实体类
 * 
 * @author 
 *
 */
public class VQualityTestReportLqhhl extends QualityTestSearchDate {
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
	@JSONField(name="ID")
	private Integer iD; 
	/***/
	@JSONField(name="experimental_id")
	private String experimentalId; 
	/***/
	@JSONField(name="experimental_name")
	private String experimentalName; 
	/***/
	@JSONField(name="SK375")
	private Double sK375; 
	/***/
	@JSONField(name="SK315")
	private Double sK315; 
	/***/
	@JSONField(name="SK265")
	private Double sK265; 
	/***/
	@JSONField(name="SK19")
	private Double sK19; 
	/***/
	@JSONField(name="SK16")
	private Double sK16; 
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
	@JSONField(name="zdlhxdmd")
	private String zdlhxdmd; 
	/***/
	@JSONField(name="mtjxdmd")
	private String mtjxdmd; 
	/***/
	@JSONField(name="kxl")
	private String kxl; 
	/***/
	@JSONField(name="lqbhd")
	private String lqbhd; 
	/***/
	@JSONField(name="kljxl")
	private String kljxl; 
	/***/
	@JSONField(name="cjlgjjxl")
	private String cjlgjjxl; 
	/***/
	@JSONField(name="wdd")
	private String wdd; 
	/***/
	@JSONField(name="lz")
	private String lz; 
	/***/
	@JSONField(name="xl")
	private String xl; 
	/***/
	@JSONField(name="fs")
	private String fs; 
	/***/
	@JSONField(name="clwdd")
	private String clwdd; 
	/***/
	@JSONField(name="drplqdb")
	private String drplqdb; 
	/***/
	@JSONField(name="dwdd")
	private String dwdd; 
	/***/
	@JSONField(name="ssxs")
	private String ssxs; 
	/***/
	@JSONField(name="gzsd")
	private String gzsd; 
	/**
	 * 实例化
	 */
	public VQualityTestReportLqhhl() {
		super();
	}
	/**
	 * 实例化
	 * 
	 * @param obj
	 */
	public VQualityTestReportLqhhl(JSONObject obj) {
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
		if (obj.get("iD") instanceof Number) {
			this.setID(((Number) obj.get("iD")).intValue());
		}
		if (obj.get("experimentalId") instanceof String) {
			this.setExperimentalId((String) obj.get("experimentalId"));
		}
		if (obj.get("experimentalName") instanceof String) {
			this.setExperimentalName((String) obj.get("experimentalName"));
		}
		if (obj.get("sK375") instanceof Number) {
			this.setSK375(((Number) obj.get("sK375")).doubleValue());
		}
		if (obj.get("sK315") instanceof Number) {
			this.setSK315(((Number) obj.get("sK315")).doubleValue());
		}
		if (obj.get("sK265") instanceof Number) {
			this.setSK265(((Number) obj.get("sK265")).doubleValue());
		}
		if (obj.get("sK19") instanceof Number) {
			this.setSK19(((Number) obj.get("sK19")).doubleValue());
		}
		if (obj.get("sK16") instanceof Number) {
			this.setSK16(((Number) obj.get("sK16")).doubleValue());
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
		if (obj.get("zdlhxdmd") instanceof String) {
			this.setZdlhxdmd((String) obj.get("zdlhxdmd"));
		}
		if (obj.get("mtjxdmd") instanceof String) {
			this.setMtjxdmd((String) obj.get("mtjxdmd"));
		}
		if (obj.get("kxl") instanceof String) {
			this.setKxl((String) obj.get("kxl"));
		}
		if (obj.get("lqbhd") instanceof String) {
			this.setLqbhd((String) obj.get("lqbhd"));
		}
		if (obj.get("kljxl") instanceof String) {
			this.setKljxl((String) obj.get("kljxl"));
		}
		if (obj.get("cjlgjjxl") instanceof String) {
			this.setCjlgjjxl((String) obj.get("cjlgjjxl"));
		}
		if (obj.get("wdd") instanceof String) {
			this.setWdd((String) obj.get("wdd"));
		}
		if (obj.get("lz") instanceof String) {
			this.setLz((String) obj.get("lz"));
		}
		if (obj.get("xl") instanceof String) {
			this.setXl((String) obj.get("xl"));
		}
		if (obj.get("fs") instanceof String) {
			this.setFs((String) obj.get("fs"));
		}
		if (obj.get("clwdd") instanceof String) {
			this.setClwdd((String) obj.get("clwdd"));
		}
		if (obj.get("drplqdb") instanceof String) {
			this.setDrplqdb((String) obj.get("drplqdb"));
		}
		if (obj.get("dwdd") instanceof String) {
			this.setDwdd((String) obj.get("dwdd"));
		}
		if (obj.get("ssxs") instanceof String) {
			this.setSsxs((String) obj.get("ssxs"));
		}
		if (obj.get("gzsd") instanceof String) {
			this.setGzsd((String) obj.get("gzsd"));
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
		if (this.getID() != null) {
			result.put("iD",this.getID());
		}
		if (this.getExperimentalId() != null) {
			result.put("experimentalId",this.getExperimentalId());
		}
		if (this.getExperimentalName() != null) {
			result.put("experimentalName",this.getExperimentalName());
		}
		if (this.getSK375() != null) {
			result.put("sK375",this.getSK375());
		}
		if (this.getSK315() != null) {
			result.put("sK315",this.getSK315());
		}
		if (this.getSK265() != null) {
			result.put("sK265",this.getSK265());
		}
		if (this.getSK19() != null) {
			result.put("sK19",this.getSK19());
		}
		if (this.getSK16() != null) {
			result.put("sK16",this.getSK16());
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
	 * 获取sK375
	 * 
	 * @return
	 */
	public Double getSK375() {
		return sK375;
	}

	/**
	 * 设置sK375
	 * 
	 * @param sK375
	 */
	public void setSK375(Double sK375) {
		this.sK375 = sK375;
	}
	
	/**
	 * 获取sK315
	 * 
	 * @return
	 */
	public Double getSK315() {
		return sK315;
	}

	/**
	 * 设置sK315
	 * 
	 * @param sK315
	 */
	public void setSK315(Double sK315) {
		this.sK315 = sK315;
	}
	
	/**
	 * 获取sK265
	 * 
	 * @return
	 */
	public Double getSK265() {
		return sK265;
	}

	/**
	 * 设置sK265
	 * 
	 * @param sK265
	 */
	public void setSK265(Double sK265) {
		this.sK265 = sK265;
	}
	
	/**
	 * 获取sK19
	 * 
	 * @return
	 */
	public Double getSK19() {
		return sK19;
	}

	/**
	 * 设置sK19
	 * 
	 * @param sK19
	 */
	public void setSK19(Double sK19) {
		this.sK19 = sK19;
	}
	
	/**
	 * 获取sK16
	 * 
	 * @return
	 */
	public Double getSK16() {
		return sK16;
	}

	/**
	 * 设置sK16
	 * 
	 * @param sK16
	 */
	public void setSK16(Double sK16) {
		this.sK16 = sK16;
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
	 * 获取zdlhxdmd
	 * 
	 * @return
	 */
	public String getZdlhxdmd() {
		return zdlhxdmd;
	}

	/**
	 * 设置zdlhxdmd
	 * 
	 * @param zdlhxdmd
	 */
	public void setZdlhxdmd(String zdlhxdmd) {
		this.zdlhxdmd = zdlhxdmd;
	}
	
	/**
	 * 获取mtjxdmd
	 * 
	 * @return
	 */
	public String getMtjxdmd() {
		return mtjxdmd;
	}

	/**
	 * 设置mtjxdmd
	 * 
	 * @param mtjxdmd
	 */
	public void setMtjxdmd(String mtjxdmd) {
		this.mtjxdmd = mtjxdmd;
	}
	
	/**
	 * 获取kxl
	 * 
	 * @return
	 */
	public String getKxl() {
		return kxl;
	}

	/**
	 * 设置kxl
	 * 
	 * @param kxl
	 */
	public void setKxl(String kxl) {
		this.kxl = kxl;
	}
	
	/**
	 * 获取lqbhd
	 * 
	 * @return
	 */
	public String getLqbhd() {
		return lqbhd;
	}

	/**
	 * 设置lqbhd
	 * 
	 * @param lqbhd
	 */
	public void setLqbhd(String lqbhd) {
		this.lqbhd = lqbhd;
	}
	
	/**
	 * 获取kljxl
	 * 
	 * @return
	 */
	public String getKljxl() {
		return kljxl;
	}

	/**
	 * 设置kljxl
	 * 
	 * @param kljxl
	 */
	public void setKljxl(String kljxl) {
		this.kljxl = kljxl;
	}
	
	/**
	 * 获取cjlgjjxl
	 * 
	 * @return
	 */
	public String getCjlgjjxl() {
		return cjlgjjxl;
	}

	/**
	 * 设置cjlgjjxl
	 * 
	 * @param cjlgjjxl
	 */
	public void setCjlgjjxl(String cjlgjjxl) {
		this.cjlgjjxl = cjlgjjxl;
	}
	
	/**
	 * 获取wdd
	 * 
	 * @return
	 */
	public String getWdd() {
		return wdd;
	}

	/**
	 * 设置wdd
	 * 
	 * @param wdd
	 */
	public void setWdd(String wdd) {
		this.wdd = wdd;
	}
	
	/**
	 * 获取lz
	 * 
	 * @return
	 */
	public String getLz() {
		return lz;
	}

	/**
	 * 设置lz
	 * 
	 * @param lz
	 */
	public void setLz(String lz) {
		this.lz = lz;
	}
	
	/**
	 * 获取xl
	 * 
	 * @return
	 */
	public String getXl() {
		return xl;
	}

	/**
	 * 设置xl
	 * 
	 * @param xl
	 */
	public void setXl(String xl) {
		this.xl = xl;
	}
	
	/**
	 * 获取fs
	 * 
	 * @return
	 */
	public String getFs() {
		return fs;
	}

	/**
	 * 设置fs
	 * 
	 * @param fs
	 */
	public void setFs(String fs) {
		this.fs = fs;
	}
	
	/**
	 * 获取clwdd
	 * 
	 * @return
	 */
	public String getClwdd() {
		return clwdd;
	}

	/**
	 * 设置clwdd
	 * 
	 * @param clwdd
	 */
	public void setClwdd(String clwdd) {
		this.clwdd = clwdd;
	}
	
	/**
	 * 获取drplqdb
	 * 
	 * @return
	 */
	public String getDrplqdb() {
		return drplqdb;
	}

	/**
	 * 设置drplqdb
	 * 
	 * @param drplqdb
	 */
	public void setDrplqdb(String drplqdb) {
		this.drplqdb = drplqdb;
	}
	
	/**
	 * 获取dwdd
	 * 
	 * @return
	 */
	public String getDwdd() {
		return dwdd;
	}

	/**
	 * 设置dwdd
	 * 
	 * @param dwdd
	 */
	public void setDwdd(String dwdd) {
		this.dwdd = dwdd;
	}
	
	/**
	 * 获取ssxs
	 * 
	 * @return
	 */
	public String getSsxs() {
		return ssxs;
	}

	/**
	 * 设置ssxs
	 * 
	 * @param ssxs
	 */
	public void setSsxs(String ssxs) {
		this.ssxs = ssxs;
	}
	
	/**
	 * 获取gzsd
	 * 
	 * @return
	 */
	public String getGzsd() {
		return gzsd;
	}

	/**
	 * 设置gzsd
	 * 
	 * @param gzsd
	 */
	public void setGzsd(String gzsd) {
		this.gzsd = gzsd;
	}

	@Override
	public String toString() {
		return "VQualityTestReportLqhhl [createTime=" + createTime + " , materials=" + materials + " , materialsNum=" + materialsNum + " , manufacturers=" + manufacturers + " , manufacturersNum=" + manufacturersNum + " , specification=" + specification + " , specificationNum=" + specificationNum + " , requiredResult=" + requiredResult + " , requiredStatus=" + requiredStatus + " , orderTicketNum=" + orderTicketNum + " , requiredStatusShow=" + requiredStatusShow + " , iD=" + iD + " , experimentalId=" + experimentalId + " , experimentalName=" + experimentalName + " , sK375=" + sK375 + " , sK315=" + sK315 + " , sK265=" + sK265 + " , sK19=" + sK19 + " , sK16=" + sK16 + " , sK132=" + sK132 + " , sK95=" + sK95 + " , sK475=" + sK475 + " , sK236=" + sK236 + " , sK118=" + sK118 + " , sK06=" + sK06 + " , sK03=" + sK03 + " , sK015=" + sK015 + " , sK0075=" + sK0075 + " , sD=" + sD + " , zdlhxdmd=" + zdlhxdmd + " , mtjxdmd=" + mtjxdmd + " , kxl=" + kxl + " , lqbhd=" + lqbhd + " , kljxl=" + kljxl + " , cjlgjjxl=" + cjlgjjxl + " , wdd=" + wdd + " , lz=" + lz + " , xl=" + xl + " , fs=" + fs + " , clwdd=" + clwdd + " , drplqdb=" + drplqdb + " , dwdd=" + dwdd + " , ssxs=" + ssxs + " , gzsd=" + gzsd + "  ]";
	
	}
	
	
}
