package com.jiaoke.qualitytest.bean.report;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.jiaoke.common.bean.QualityTestSearchDate;

import java.util.Date;

/**
 * V_quality_test_report_cjl实体类
 *
 * @author
 */
public class VQualityTestReportCjl extends QualityTestSearchDate {
    /***/
    @JSONField(name = "create_time")
    private Date createTime;
    /***/
    @JSONField(name = "materials")
    private String materials;
    /***/
    @JSONField(name = "materials_num")
    private Integer materialsNum;
    /***/
    @JSONField(name = "manufacturers")
    private String manufacturers;
    /***/
    @JSONField(name = "manufacturers_num")
    private Integer manufacturersNum;
    /***/
    @JSONField(name = "specification")
    private String specification;
    /***/
    @JSONField(name = "specification_num")
    private Integer specificationNum;
    /**
     * -1 不合格 1合格
     */
    @JSONField(name = "required_result")
    private Integer requiredResult;
    /**
     * 实验状态0.待发送 1.审批中 2.被回退 3.已完成
     */
    @JSONField(name = "required_status")
    private Integer requiredStatus;
    /***/
    @JSONField(name = "order_ticket_num")
    private String orderTicketNum;
    /***/
    @JSONField(name = "required_status_show")
    private String requiredStatusShow;
    /***/
    @JSONField(name = "ID")
    private Integer iD;
    /***/
    @JSONField(name = "experimental_id")
    private String experimentalId;
    /***/
    @JSONField(name = "experimental_name")
    private String experimentalName;
    /***/
    @JSONField(name = "SK375")
    private Double sK375;
    /***/
    @JSONField(name = "SK315")
    private Double sK315;
    /***/
    @JSONField(name = "SK265")
    private Double sK265;
    /***/
    @JSONField(name = "SK19")
    private Double sK19;
    /***/
    @JSONField(name = "SK16")
    private Double sK16;
    /***/
    @JSONField(name = "SK132")
    private Double sK132;
    /***/
    @JSONField(name = "SK95")
    private Double sK95;
    /***/
    @JSONField(name = "SK475")
    private Double sK475;
    /***/
    @JSONField(name = "SK236")
    private Double sK236;
    /***/
    @JSONField(name = "SK118")
    private Double sK118;
    /***/
    @JSONField(name = "SK06")
    private Double sK06;
    /***/
    @JSONField(name = "SK03")
    private Double sK03;
    /***/
    @JSONField(name = "SK015")
    private Double sK015;
    /***/
    @JSONField(name = "SK0075")
    private Double sK0075;
    /***/
    @JSONField(name = "SD")
    private Double sD;
    /***/
    @JSONField(name = "ysz")
    private String ysz;
    /***/
    @JSONField(name = "mh")
    private String mh;
    /***/
    @JSONField(name = "bgxdmd1")
    private String bgxdmd1;
    /***/
    @JSONField(name = "bgxdmd2")
    private String bgxdmd2;
    /***/
    @JSONField(name = "mtjxdmd")
    private String mtjxdmd;
    /***/
    @JSONField(name = "xsl")
    private String xsl;
    /***/
    @JSONField(name = "jgx")
    private String jgx;
    /***/
    @JSONField(name = "zpzkl")
    private String zpzkl;
    /***/
    @JSONField(name = "klhl0075")
    private String klhl0075;
    /***/
    @JSONField(name = "rrkl")
    private String rrkl;
    /***/
    @JSONField(name = "hsl")
    private String hsl;
    /***/
    @JSONField(name = "nfx")
    private String nfx;

    /**
     * 实例化
     */
    public VQualityTestReportCjl() {
        super();
    }

    /**
     * 实例化
     *
     * @param obj
     */
    public VQualityTestReportCjl(JSONObject obj) {
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
        if (obj.get("ysz") instanceof String) {
            this.setYsz((String) obj.get("ysz"));
        }
        if (obj.get("mh") instanceof String) {
            this.setMh((String) obj.get("mh"));
        }
        if (obj.get("bgxdmd1") instanceof String) {
            this.setBgxdmd1((String) obj.get("bgxdmd1"));
        }
        if (obj.get("bgxdmd2") instanceof String) {
            this.setBgxdmd2((String) obj.get("bgxdmd2"));
        }
        if (obj.get("mtjxdmd") instanceof String) {
            this.setMtjxdmd((String) obj.get("mtjxdmd"));
        }
        if (obj.get("xsl") instanceof String) {
            this.setXsl((String) obj.get("xsl"));
        }
        if (obj.get("jgx") instanceof String) {
            this.setJgx((String) obj.get("jgx"));
        }
        if (obj.get("zpzkl") instanceof String) {
            this.setZpzkl((String) obj.get("zpzkl"));
        }
        if (obj.get("klhl0075") instanceof String) {
            this.setKlhl0075((String) obj.get("klhl0075"));
        }
        if (obj.get("rrkl") instanceof String) {
            this.setRrkl((String) obj.get("rrkl"));
        }
        if (obj.get("hsl") instanceof String) {
            this.setHsl((String) obj.get("hsl"));
        }
        if (obj.get("nfx") instanceof String) {
            this.setNfx((String) obj.get("nfx"));
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
            result.put("createTime", this.getCreateTime());
        }
        if (this.getMaterials() != null) {
            result.put("materials", this.getMaterials());
        }
        if (this.getMaterialsNum() != null) {
            result.put("materialsNum", this.getMaterialsNum());
        }
        if (this.getManufacturers() != null) {
            result.put("manufacturers", this.getManufacturers());
        }
        if (this.getManufacturersNum() != null) {
            result.put("manufacturersNum", this.getManufacturersNum());
        }
        if (this.getSpecification() != null) {
            result.put("specification", this.getSpecification());
        }
        if (this.getSpecificationNum() != null) {
            result.put("specificationNum", this.getSpecificationNum());
        }
        if (this.getRequiredResult() != null) {
            result.put("requiredResult", this.getRequiredResult());
        }
        if (this.getRequiredStatus() != null) {
            result.put("requiredStatus", this.getRequiredStatus());
        }
        if (this.getOrderTicketNum() != null) {
            result.put("orderTicketNum", this.getOrderTicketNum());
        }
        if (this.getRequiredStatusShow() != null) {
            result.put("requiredStatusShow", this.getRequiredStatusShow());
        }
        if (this.getID() != null) {
            result.put("iD", this.getID());
        }
        if (this.getExperimentalId() != null) {
            result.put("experimentalId", this.getExperimentalId());
        }
        if (this.getExperimentalName() != null) {
            result.put("experimentalName", this.getExperimentalName());
        }
        if (this.getSK375() != null) {
            result.put("sK375", this.getSK375());
        }
        if (this.getSK315() != null) {
            result.put("sK315", this.getSK315());
        }
        if (this.getSK265() != null) {
            result.put("sK265", this.getSK265());
        }
        if (this.getSK19() != null) {
            result.put("sK19", this.getSK19());
        }
        if (this.getSK16() != null) {
            result.put("sK16", this.getSK16());
        }
        if (this.getSK132() != null) {
            result.put("sK132", this.getSK132());
        }
        if (this.getSK95() != null) {
            result.put("sK95", this.getSK95());
        }
        if (this.getSK475() != null) {
            result.put("sK475", this.getSK475());
        }
        if (this.getSK236() != null) {
            result.put("sK236", this.getSK236());
        }
        if (this.getSK118() != null) {
            result.put("sK118", this.getSK118());
        }
        if (this.getSK06() != null) {
            result.put("sK06", this.getSK06());
        }
        if (this.getSK03() != null) {
            result.put("sK03", this.getSK03());
        }
        if (this.getSK015() != null) {
            result.put("sK015", this.getSK015());
        }
        if (this.getSK0075() != null) {
            result.put("sK0075", this.getSK0075());
        }
        if (this.getSD() != null) {
            result.put("sD", this.getSD());
        }
        if (this.getYsz() != null) {
            result.put("ysz", this.getYsz());
        }
        if (this.getMh() != null) {
            result.put("mh", this.getMh());
        }
        if (this.getBgxdmd1() != null) {
            result.put("bgxdmd1", this.getBgxdmd1());
        }
        if (this.getBgxdmd2() != null) {
            result.put("bgxdmd2", this.getBgxdmd2());
        }
        if (this.getMtjxdmd() != null) {
            result.put("mtjxdmd", this.getMtjxdmd());
        }
        if (this.getXsl() != null) {
            result.put("xsl", this.getXsl());
        }
        if (this.getJgx() != null) {
            result.put("jgx", this.getJgx());
        }
        if (this.getZpzkl() != null) {
            result.put("zpzkl", this.getZpzkl());
        }
        if (this.getKlhl0075() != null) {
            result.put("klhl0075", this.getKlhl0075());
        }
        if (this.getRrkl() != null) {
            result.put("rrkl", this.getRrkl());
        }
        if (this.getHsl() != null) {
            result.put("hsl", this.getHsl());
        }
        if (this.getNfx() != null) {
            result.put("nfx", this.getNfx());
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
     * 获取ysz
     *
     * @return
     */
    public String getYsz() {
        return ysz;
    }

    /**
     * 设置ysz
     *
     * @param ysz
     */
    public void setYsz(String ysz) {
        this.ysz = ysz;
    }

    /**
     * 获取mh
     *
     * @return
     */
    public String getMh() {
        return mh;
    }

    /**
     * 设置mh
     *
     * @param mh
     */
    public void setMh(String mh) {
        this.mh = mh;
    }

    /**
     * 获取bgxdmd1
     *
     * @return
     */
    public String getBgxdmd1() {
        return bgxdmd1;
    }

    /**
     * 设置bgxdmd1
     *
     * @param bgxdmd1
     */
    public void setBgxdmd1(String bgxdmd1) {
        this.bgxdmd1 = bgxdmd1;
    }

    /**
     * 获取bgxdmd2
     *
     * @return
     */
    public String getBgxdmd2() {
        return bgxdmd2;
    }

    /**
     * 设置bgxdmd2
     *
     * @param bgxdmd2
     */
    public void setBgxdmd2(String bgxdmd2) {
        this.bgxdmd2 = bgxdmd2;
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
     * 获取xsl
     *
     * @return
     */
    public String getXsl() {
        return xsl;
    }

    /**
     * 设置xsl
     *
     * @param xsl
     */
    public void setXsl(String xsl) {
        this.xsl = xsl;
    }

    /**
     * 获取jgx
     *
     * @return
     */
    public String getJgx() {
        return jgx;
    }

    /**
     * 设置jgx
     *
     * @param jgx
     */
    public void setJgx(String jgx) {
        this.jgx = jgx;
    }

    /**
     * 获取zpzkl
     *
     * @return
     */
    public String getZpzkl() {
        return zpzkl;
    }

    /**
     * 设置zpzkl
     *
     * @param zpzkl
     */
    public void setZpzkl(String zpzkl) {
        this.zpzkl = zpzkl;
    }

    /**
     * 获取klhl0075
     *
     * @return
     */
    public String getKlhl0075() {
        return klhl0075;
    }

    /**
     * 设置klhl0075
     *
     * @param klhl0075
     */
    public void setKlhl0075(String klhl0075) {
        this.klhl0075 = klhl0075;
    }

    /**
     * 获取rrkl
     *
     * @return
     */
    public String getRrkl() {
        return rrkl;
    }

    /**
     * 设置rrkl
     *
     * @param rrkl
     */
    public void setRrkl(String rrkl) {
        this.rrkl = rrkl;
    }

    /**
     * 获取hsl
     *
     * @return
     */
    public String getHsl() {
        return hsl;
    }

    /**
     * 设置hsl
     *
     * @param hsl
     */
    public void setHsl(String hsl) {
        this.hsl = hsl;
    }

    /**
     * 获取nfx
     *
     * @return
     */
    public String getNfx() {
        return nfx;
    }

    /**
     * 设置nfx
     *
     * @param nfx
     */
    public void setNfx(String nfx) {
        this.nfx = nfx;
    }

    @Override
    public String toString() {
        return "VQualityTestReportCjl [createTime=" + createTime + " , materials=" + materials + " , materialsNum=" + materialsNum + " , manufacturers=" + manufacturers + " , manufacturersNum=" + manufacturersNum + " , specification=" + specification + " , specificationNum=" + specificationNum + " , requiredResult=" + requiredResult + " , requiredStatus=" + requiredStatus + " , orderTicketNum=" + orderTicketNum + " , requiredStatusShow=" + requiredStatusShow + " , iD=" + iD + " , experimentalId=" + experimentalId + " , experimentalName=" + experimentalName + " , sK375=" + sK375 + " , sK315=" + sK315 + " , sK265=" + sK265 + " , sK19=" + sK19 + " , sK16=" + sK16 + " , sK132=" + sK132 + " , sK95=" + sK95 + " , sK475=" + sK475 + " , sK236=" + sK236 + " , sK118=" + sK118 + " , sK06=" + sK06 + " , sK03=" + sK03 + " , sK015=" + sK015 + " , sK0075=" + sK0075 + " , sD=" + sD + " , ysz=" + ysz + " , mh=" + mh + " , bgxdmd1=" + bgxdmd1 + " , bgxdmd2=" + bgxdmd2 + " , mtjxdmd=" + mtjxdmd + " , xsl=" + xsl + " , jgx=" + jgx + " , zpzkl=" + zpzkl + " , klhl0075=" + klhl0075 + " , rrkl=" + rrkl + " , hsl=" + hsl + " , nfx=" + nfx + "  ]";

    }


}
