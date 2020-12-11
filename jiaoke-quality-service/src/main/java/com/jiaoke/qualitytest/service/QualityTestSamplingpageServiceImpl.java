package com.jiaoke.qualitytest.service;

import java.time.Instant;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.jiake.utils.DateUtil;
import com.jiake.utils.RandomUtil;
import com.jiaoke.common.bean.Assist;
import com.jiaoke.common.bean.LayUIPage;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.quality.dao.QualityExperimentalManagerDao;
import com.jiaoke.qualitytest.bean.QualityTestMaterialDictionary;
import com.jiaoke.qualitytest.bean.QualityTestOrderTicket;
import com.jiaoke.qualitytest.bean.QualityTestSamplingpage;
import com.jiaoke.qualitytest.dao.QualityTestMaterialDictionaryDao;
import com.jiaoke.qualitytest.dao.QualityTestOrderTicketDao;
import com.jiaoke.qualitytest.dao.QualityTestSamplingpageDao;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.ss.formula.functions.T;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;

/**
 * QualityTestSamplingpage的服务接口的实现类
 *
 * @author
 */
@Service
public class QualityTestSamplingpageServiceImpl implements QualityTestSamplingpageService {
    private final Logger LOG = LogManager.getLogger(this.getClass());

    @Autowired
    private QualityTestSamplingpageDao qualityTestSamplingpageDao;
    @Autowired
    private QualityTestOrderTicketDao qualityTestOrderTicketDao;
    /*
    @Autowired
    private QualityExperimentalManagerDao qualityExperimentalManagerDao;*/
    @Autowired
    private QualityTestMaterialDictionaryDao qualityTestMaterialDictionaryDao;

    private List<QualityTestMaterialDictionary> materiaList;

    // TODO 当你看到这个方法时你应该创建一个工具类做通用的方法,定义自己的返回格式化
    private static final int C200 = 200;
    private static final int C412 = 412;

    public String resultFormat(int code, Object data) {
        JSONObject result = new JSONObject();
        result.put("code", code);
        if (data != null) {
            result.put("data", data);
        }
        return result.toJSONString();
    }

    public void setSeachFilter(Assist assist, QualityTestSamplingpage value) {

        if (value == null) {
            assist.andGt("status", -1);
            return;
        }
        if (value.getNum() != null && !value.getNum().isEmpty()) {
            assist.andLike("num", "%" + value.getNum() + "%");
        }
        if (value.getMaterials() != null && !value.getMaterials().isEmpty()) {
            assist.andLike("materials", "%" + value.getMaterials() + "%");
        }
        if (value.getSpecification() != null && !value.getSpecification().isEmpty()) {
            assist.andLike("specification", "%" + value.getSpecification() + "%");
        }
        if (value.getManufacturers() != null && !value.getManufacturers().isEmpty()) {
            assist.andLike("manufacturers", "%" + value.getManufacturers() + "%");
        }
        if (value.getStatus() != null && value.getStatus() >= 0) {
            assist.andEq("status", value.getStatus());
        } else {
            assist.andGt("status", -1);
        }
    }


    @Override
    public String find(QualityTestSamplingpage value) {

        Assist assist = new Assist();
        assist.setStartRow((value.getPage() - 1) * value.getLimit());
        assist.setRowSize(value.getLimit());
        setSeachFilter(assist, value);
        assist.setOrder(Assist.order("task_time", false));

        List<QualityTestSamplingpage> result = qualityTestSamplingpageDao.selectQualityTestSamplingpage(assist);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行获取QualityTestSamplingpage数据集-->结果:", result);
        }

        Assist assistCount = new Assist();
        setSeachFilter(assistCount, value);
        int count = (int) qualityTestSamplingpageDao.getQualityTestSamplingpageRowCount(assistCount);

        LayUIPage ResultPage = new LayUIPage<QualityTestSamplingpage>(0, "OK", count, result);
        return ResultPage.toJson();
    }

    @Override
    public String findOne(Integer id) {
        if (id == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行通过QualityTestSamplingpage的id获得QualityTestSamplingpage对象-->失败:id不能为空");
            }
            return resultFormat(C412, null);
        }
        QualityTestSamplingpage result = qualityTestSamplingpageDao.selectQualityTestSamplingpageById(id);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行通过QualityTestSamplingpage的id获得QualityTestSamplingpage对象-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    @Override
    public String saveNotNull(QualityTestSamplingpage value) {
        if (value == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行将QualityTestSamplingpage中属性值不为null的数据保存到数据库-->失败:对象不能为空");
            }
            return resultFormat(C412, null);
        }
        value.setId(RandomUtil.random());
        UserInfo user = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        value.setCreateUser(user.getUsername());
        value.setCreateUserid(String.valueOf(user.getId()));
        if (value.getMaterialsNum() == null || value.getManufacturersNum() == null || value.getSpecificationNum() == null || value.getTunnage() == null) {// value.getCreateTime() == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行将QualityTestSamplingpage中属性值不为null的数据保存到数据库-->失败:存在不能为空的空值");
            }
            return resultFormat(C412, null);
        }
        int result = qualityTestSamplingpageDao.insertNotNullQualityTestSamplingpage(value);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行将QualityTestSamplingpage中属性值不为null的数据保存到数据库-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    @Override
    public String updateNotNullById(QualityTestSamplingpage value) {
        if (value == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行通过QualityTestSamplingpage的id更新QualityTestSamplingpage中属性不为null的数据-->失败:对象为null");
            }
            return resultFormat(C412, null);
        }
        int result = qualityTestSamplingpageDao.updateNotNullQualityTestSamplingpageById(value);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行通过QualityTestSamplingpage的id更新QualityTestSamplingpage中属性不为null的数据-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    @Override
    public String deleteById(Integer id) {
        if (id == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行通过QualityTestSamplingpage的id删除QualityTestSamplingpage-->失败:id不能为空");
            }
            return resultFormat(C412, null);
        }
        QualityTestSamplingpage value = new QualityTestSamplingpage();
        value.setId(id);
        value.setStatus(-1);
        UserInfo user = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        value.setDelUser(user.getUsername());
        value.setDelUserid(user.getId());
        value.setDelTime(new Date());
        int result = qualityTestSamplingpageDao.updateNotNullQualityTestSamplingpageById(value);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行通过QualityTestSamplingpage的id删除QualityTestSamplingpage-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    /**
     * 确认取样单
     *
     * @param id
     * @return
     */
    @Override
    public String confirmById(Integer id) {
        if (id == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行通过QualityTestSamplingpage的id删除QualityTestSamplingpage-->失败:id不能为空");
            }
            return resultFormat(C412, null);
        }
        QualityTestSamplingpage samplingpage = qualityTestSamplingpageDao.selectQualityTestSamplingpageById(id);
        if (samplingpage.getStatus() == 1) {
            return resultFormat(C412, null);
        }

        QualityTestSamplingpage value = new QualityTestSamplingpage();
        value.setId(id);
        value.setNum(getSamplingPagNum());
        value.setStatus(1);
        value.setCreateTime(new Date());
        int result = qualityTestSamplingpageDao.updateNotNullQualityTestSamplingpageById(value);
        if (result > 0) {
            this.addQualityTestOrderTicket(samplingpage);
        }
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行通过QualityTestSamplingpage的id删除QualityTestSamplingpage-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    /**
     * 获取取样单编号
     */
    public String getSamplingPagNum() {
        Date date = new Date();
        String strYear = DateUtil.dateConvertYYYY(date);

        Assist assist = new Assist();
        assist.andLike("num", "%"+strYear + "-%");
        long strCount = qualityTestSamplingpageDao.getQualityTestSamplingpageRowCount(assist);

        String strNum = String.format("LC-%s-%05d", strYear, strCount + 1);
        return strNum;
    }

    /**
     * 添加委托单
     *
     * @param samplingValue
     * @return
     */
    public int addQualityTestOrderTicket(QualityTestSamplingpage samplingValue) {
        if (samplingValue == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行将QualityTestOrderTicket中属性值不为null的数据保存到数据库-->失败:对象不能为空");
            }
            return 0;
        }
        QualityTestOrderTicket value = new QualityTestOrderTicket();
        value.setSamplingId(samplingValue.getId());
        value.setOrderTicketNum(this.getTestOrderTicketNum(samplingValue.getMaterialsNum()));
        value.setStatus(0);
        value.setId(RandomUtil.random());
        UserInfo user = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        value.setCreateUser(user.getUsername());
        value.setCreateUserid(user.getId());
        value.setCreateTime(new Date());
        if (value.getId() == null || value.getSamplingId() == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行将QualityTestOrderTicket中属性值不为null的数据保存到数据库-->失败:存在不能为空的空值");
            }
            return 0;
        }
        int result = qualityTestOrderTicketDao.insertNotNullQualityTestOrderTicket(value);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行将QualityTestOrderTicket中属性值不为null的数据保存到数据库-->结果:", result);
        }
        return result;
    }

    /**
     * 获取委托单编号
     */
    public String getTestOrderTicketNum(int nID) {
        Date date = new Date();
        String strYear = DateUtil.dateConvertYYYY(date);

        Assist assist = new Assist();
        assist.andLike("order_ticket_num", "%"+strYear + "-%");
        long strCount = qualityTestOrderTicketDao.getQualityTestOrderTicketRowCount(assist);

        String strMeaterialName = getMaterialAbbreviation(nID);

        String strNum = String.format("LC-%s-%s-%05d", strYear, strMeaterialName, strCount + 1);
        return strNum;
    }

    public String getMaterialAbbreviation(int nID) {
        String result = "CJL";
        if (materiaList == null) {
            materiaList = qualityTestMaterialDictionaryDao.selectQualityTestMaterialDictionary(null);
        }
        for (QualityTestMaterialDictionary obj : materiaList) {
            if (obj.getId()==nID)
            {
                return obj.getLogogramName();
            }
        }
        return result;
    }

    public void setReportsFilter(Assist assist, QualityTestSamplingpage value) {

        if (value == null) {
            assist.andGt("status", -1);
            return;
        }
        if (value.getMaterials() != null && !value.getMaterials().isEmpty()) {
            assist.andLike("materials", "%" + value.getMaterials() + "%");
        }
        if (value.getSpecification() != null && !value.getSpecification().isEmpty()) {
            assist.andLike("specification", "%" + value.getSpecification() + "%");
        }
        if (value.getManufacturers() != null && !value.getManufacturers().isEmpty()) {
            assist.andLike("manufacturers", "%" + value.getManufacturers() + "%");
        }
        if (value.getExperimentResult() != null) {
            assist.andEq("experiment_result", value.getExperimentResult());
        }
        if (value.getBegindate() != null ) {
            assist.andGte("task_time", value.getBegindate());
        }if (value.getEnddate() != null ) {
            assist.andLte("task_time", value.getEnddate());
        }
       if (value.getBegindate()==null && value.getEnddate()==null)
        {
            assist.andGte("task_time", DateUtil.dateConvertYYYYMMDDHHMMSS(DateUtils.addDays(new Date(), -30)));
            assist.andLte("task_time", DateUtil.dateConvertYYYYMMDDHHMMSS(new Date()));
        }

        if (value.getStatus() != null && value.getStatus() >= 0) {
            assist.andEq("status", value.getStatus());
        } else {
            assist.andGt("status", -1);
        }
    }
    /**
     * 取样单台账
     * @param value
     * @return
     */
    @Override
    public String reports(QualityTestSamplingpage value)
    {
        Assist assist = new Assist();
        assist.setStartRow((value.getPage() - 1) * value.getLimit());
        assist.setRowSize(value.getLimit());
        setReportsFilter(assist, value);
        assist.setOrder(Assist.order("task_time", false));

        List<QualityTestSamplingpage> result = qualityTestSamplingpageDao.selectQualityTestSamplingpage(assist);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行获取QualityTestSamplingpage数据集-->结果:", result);
        }

        Assist assistCount = new Assist();
        setReportsFilter(assistCount, value);
        int count = (int) qualityTestSamplingpageDao.getQualityTestSamplingpageRowCount(assistCount);

        LayUIPage ResultPage = new LayUIPage<QualityTestSamplingpage>(0, "OK", count, result);
        return ResultPage.toJson();
    }

}