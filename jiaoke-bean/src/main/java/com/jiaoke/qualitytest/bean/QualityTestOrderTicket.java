package com.jiaoke.qualitytest.bean;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.JSONObject;
import com.jiaoke.common.bean.QualityTestPage;
import com.jiaoke.common.bean.QualityTestSearchDate;

import java.util.Date;

/**
 * quality_test_order_ticket实体类
 *
 * @author
 */
public class QualityTestOrderTicket extends QualityTestSearchDate {
    /***/
    @JSONField(name = "num")
    private String num;
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

    /***/
    @JSONField(name = "tunnage")
    private Double tunnage;

    /***/
    @JSONField(name = "sampling_create_time")
    private Date samplingcreateTime;
    /***/
    @JSONField(name = "samplingremark")
    private String samplingremark;

    /***/
    @JSONField(name = "Id")
    private Integer id;
    /***/
    @JSONField(name = "order_ticket_num")
    private String orderTicketNum;
    /***/
    @JSONField(name = "sampling_id")
    private Integer samplingId;
    /***/
    @JSONField(name = "required_experimental")
    private String requiredExperimental;
    /***/
    @JSONField(name = "required_status")
    private Integer requiredStatus;
    /***/
    @JSONField(name = "required_result")
    private Integer requiredResult;
    /***/
    @JSONField(name = "create_time")
    private Date createTime;
    /***/
    @JSONField(name = "status")
    private Integer status;
    /***/
    @JSONField(name = "create_user")
    private String createUser;
    /***/
    @JSONField(name = "create_userid")
    private Integer createUserid;
    /***/
    @JSONField(name = "status_show")
    private String status_show;

    /**
     * -1 不合格 1合格
     */
    @JSONField(name = "experiment_result")
    private Integer experimentResult;
    /**实验状态0.待发送 1.审批中 2.被回退 3.已完成*/
    @JSONField(name="experiment_status")
    private Integer experimentStatus;

    /**
     * 实例化
     */
    public QualityTestOrderTicket() {
        super();
    }

    /**
     * 实例化
     *
     * @param obj
     */
    public QualityTestOrderTicket(JSONObject obj) {
        this();

        if (obj.get("page") instanceof Number) {
            this.setPage(((Number) obj.get("page")).intValue());
        }
        if (obj.get("limit") instanceof Number) {
            this.setLimit(((Number) obj.get("limit")).intValue());
        }
        if (obj.get("num") instanceof String) {
            this.setNum((String) obj.get("num"));
        }
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
        if (obj.get("tunnage") instanceof Number) {
            this.setTunnage(((Number) obj.get("tunnage")).doubleValue());
        }
        if (obj.get("samplingcreateTime") instanceof Date) {
            this.setSamplingcreateTime((Date) obj.get("samplingcreateTime"));
        }
        if (obj.get("samplingremark") instanceof String) {
            this.setSamplingRemark((String) obj.get("samplingremark"));
        }
        if (obj.get("id") instanceof Number) {
            this.setId(((Number) obj.get("id")).intValue());
        }
        if (obj.get("orderTicketNum") instanceof String) {
            this.setOrderTicketNum((String) obj.get("orderTicketNum"));
        }
        if (obj.get("samplingId") instanceof Number) {
            this.setSamplingId(((Number) obj.get("samplingId")).intValue());
        }
        if (obj.get("requiredExperimental") instanceof String) {
            this.setRequiredExperimenta((String) obj.get("requiredExperimental"));
        }
        if (obj.get("requiredStatus") instanceof Number) {
            this.setRequiredStatus(((Number) obj.get("requiredStatus")).intValue());
        }
        if (obj.get("requiredResult") instanceof Number) {
            this.setRequiredResult(((Number) obj.get("requiredResult")).intValue());
        }
        this.setCreateTime((Date) obj.get("createTime"));
        if (obj.get("status") instanceof Number) {
            this.setStatus(((Number) obj.get("status")).intValue());
        }
        if (obj.get("createUser") instanceof String) {
            this.setCreateUser((String) obj.get("createUser"));
        }
        if (obj.get("createUserid") instanceof Number) {
            this.setCreateUserid(((Number) obj.get("createUserid")).intValue());
        }
        if (obj.get("begindate") instanceof Date) {
            this.setBegindate((Date) obj.get("begindate"));
        }
        if (obj.get("enddate") instanceof Date) {
            this.setEnddate((Date) obj.get("enddate"));
        }
        if (obj.get("experimentResult") instanceof Number) {
            this.setExperimentResult(((Number) obj.get("experimentResult")).intValue());
        }
        if (obj.get("experimentStatus") instanceof Number) {
            this.setExperimentStatus(((Number) obj.get("experimentStatus")).intValue());
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
            result.put("num", this.getNum());
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
        if (this.getSpecification() != null) {
            result.put("specification", this.getSpecification());
        }
        if (this.getTunnage() != null) {
            result.put("tunnage", this.getTunnage());
        }
        if (this.getSamplingcreateTime() != null) {
            result.put("samplingcreateTime", this.getSamplingcreateTime());
        }
        if (this.getSamplingRemark() != null) {
            result.put("samplingremark", this.getSamplingRemark());
        }
        if (this.getId() != null) {
            result.put("id", this.getId());
        }
        if (this.getOrderTicketNum() != null) {
            result.put("orderTicketNum", this.getOrderTicketNum());
        }
        if (this.getSamplingId() != null) {
            result.put("samplingId", this.getSamplingId());
        }
        if (this.getRequiredExperimenta() != null) {
            result.put("requiredExperimental", this.getRequiredExperimenta());
        }
        if (this.getCreateTime() != null) {
            result.put("createTime", this.getCreateTime());
        }
        if (this.getStatus() != null) {
            result.put("status", this.getStatus());
        }
        if (this.getCreateUser() != null) {
            result.put("createUser", this.getCreateUser());
        }
        if (this.getCreateUserid() != null) {
            result.put("createUserid", this.getCreateUserid());
        }
        if (this.getExperimentResult() != null) {
            result.put("experimentResult", this.getExperimentResult());
        }
        if (this.getExperimentStatus() != null) {
            result.put("experimentStatus",this.getExperimentStatus());
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

    public Date getSamplingcreateTime() {
        return samplingcreateTime;
    }

    public void setSamplingcreateTime(Date samplingcreateTime) {
        this.samplingcreateTime = samplingcreateTime;
    }

    /**
     * 获取remark
     *
     * @return
     */
    public String getSamplingRemark() {
        return samplingremark;
    }

    /**
     * 设置remark
     *
     * @param remark
     */
    public void setSamplingRemark(String remark) {
        this.samplingremark = remark;
    }

    /**
     * 获取id
     *
     * @return
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置id
     *
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
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
     * 获取samplingId
     *
     * @return
     */
    public Integer getSamplingId() {
        return samplingId;
    }

    /**
     * 设置samplingId
     *
     * @param samplingId
     */
    public void setSamplingId(Integer samplingId) {
        this.samplingId = samplingId;
    }

    /**
     * 获取requiredExperimenta
     *
     * @return
     */
    public String getRequiredExperimenta() {
        return requiredExperimental;
    }

    /**
     * 设置requiredExperimenta
     *
     * @param requiredExperimental
     */
    public void setRequiredExperimenta(String requiredExperimental) {
        this.requiredExperimental = requiredExperimental;
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
     * 获取status
     *
     * @return
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置status
     *
     * @param status
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取createUser
     *
     * @return
     */
    public String getCreateUser() {
        return createUser;
    }

    /**
     * 设置createUser
     *
     * @param createUser
     */
    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    /**
     * 获取createUserid
     *
     * @return
     */
    public Integer getCreateUserid() {
        return createUserid;
    }

    /**
     * 设置createUserid
     *
     * @param createUserid
     */
    public void setCreateUserid(Integer createUserid) {
        this.createUserid = createUserid;
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

    @Override
    public String toString() {
        return "VQualityTestOrderTicket [num=" + num + " , materials=" + materials + " , manufacturers=" + manufacturers + " , specification=" + specification + " , tunnage=" + tunnage + " , remark=" + samplingremark + " , id=" + id + " , orderTicketNum=" + orderTicketNum + " , samplingId=" + samplingId + " , requiredExperimental=" + requiredExperimental + " , createTime=" + createTime + " , status=" + status + " , createUser=" + createUser + " , createUserid=" + createUserid + "  ]";

    }


}
