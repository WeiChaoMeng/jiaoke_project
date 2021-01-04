package com.jiaoke.qualitytest.service;

import com.alibaba.fastjson.JSONObject;
import com.jiake.utils.DateUtil;
import com.jiake.utils.RandomUtil;
import com.jiaoke.common.bean.Assist;
import com.jiaoke.common.bean.LayUIPage;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.qualitytest.bean.QualityTestExperimentDictionary;
import com.jiaoke.qualitytest.bean.QualityTestExperimental;
import com.jiaoke.qualitytest.bean.QualityTestExperimentalParam;
import com.jiaoke.qualitytest.bean.QualityTestOrderTicket;
import com.jiaoke.qualitytest.dao.QualityTestExperimentDictionaryDao;
import com.jiaoke.qualitytest.dao.QualityTestExperimentalDao;
import com.jiaoke.qualitytest.dao.QualityTestExperimentalParamDao;
import com.jiaoke.qualitytest.dao.QualityTestOrderTicketDao;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * QualityTestOrderTicket的服务接口的实现类
 *
 * @author
 */
@Service
public class QualityTestOrderTicketServiceImpl implements QualityTestOrderTicketService {
    private final Logger LOG = LogManager.getLogger(this.getClass());

    @Autowired
    private QualityTestOrderTicketDao qualityTestOrderTicketDao;
    @Autowired
    private QualityTestExperimentalDao qualityTestExperimentalDao;
    @Autowired
    private QualityTestExperimentDictionaryDao qualityTestExperimentDictionaryDao;
    @Autowired
    QualityTestExperimentalParamDao qualityTestExperimentalParamDao;

    private  List<QualityTestExperimentDictionary> lstExperiment=null;
    private List<QualityTestExperimentalParam> lstExperimentParam=null;
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

    public void setSeachFilter(Assist assist, QualityTestOrderTicket value) {

        if (value == null) {
            assist.andGt("status", -1);
            return;
        }
        if (value.getOrderTicketNum() != null && !value.getOrderTicketNum().isEmpty()) {
            assist.andLike("order_ticket_num", "%" + value.getNum() + "%");
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
        if (value.getExperimentStatus() != null) {
            assist.andEq("experiment_status", value.getExperimentStatus());
        }
        if (value.getStatus() != null && value.getStatus() >= 0) {
            assist.andEq("status", value.getStatus());
        } else {
            assist.andGt("status", -1);
        }
    }

    @Override
    public String find(QualityTestOrderTicket value) {
        //TODO这里可以做通过Assist做添加查询
        Assist assist = new Assist();
        assist.setStartRow((value.getPage() - 1) * value.getLimit());
        assist.setRowSize(value.getLimit());
        setSeachFilter(assist, value);
        assist.setOrder(Assist.order("create_time", false));

        List<QualityTestOrderTicket> result = qualityTestOrderTicketDao.selectQualityTestOrderTicket(assist);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行获取QualityTestSamplingpage数据集-->结果:", result);
        }

        Assist assistCount = new Assist();
        setSeachFilter(assistCount, value);
        int count = (int) qualityTestOrderTicketDao.getQualityTestOrderTicketRowCount(assistCount);

        LayUIPage ResultPage = new LayUIPage<QualityTestOrderTicket>(0, "OK", count, result);
        return ResultPage.toJson();
    }

    /**
     * 暂时不用
     * @param value
     * @return
     */
    @Override
    public String findComplete(QualityTestOrderTicket value) {
        //TODO这里可以做通过Assist做添加查询
        Assist assist = new Assist();
        assist.setStartRow((value.getPage() - 1) * value.getLimit());
        assist.setRowSize(value.getLimit());
        setSeachFilter(assist, value);
        assist.setOrder(Assist.order("create_time", false));

        List<QualityTestOrderTicket> result = qualityTestOrderTicketDao.selectUnCompleteQualityTestOrderTicket(assist);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行获取QualityTestSamplingpage数据集-->结果:", result);
        }

        Assist assistCount = new Assist();
        setSeachFilter(assistCount, value);
        int count = (int) qualityTestOrderTicketDao.getUnCompleteQualityTestOrderTicketRowCount(assistCount);

        LayUIPage ResultPage = new LayUIPage<QualityTestOrderTicket>(0, "OK", count, result);
        return ResultPage.toJson();
    }


    @Override
    public String findOne(Integer id) {
        if (id == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行通过QualityTestOrderTicket的id获得QualityTestOrderTicket对象-->失败:id不能为空");
            }
            return resultFormat(C412, null);
        }
        QualityTestOrderTicket result = qualityTestOrderTicketDao.selectQualityTestOrderTicketById(id);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行通过QualityTestOrderTicket的id获得QualityTestOrderTicket对象-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    @Override
    public String saveNotNull(QualityTestOrderTicket value) {
        if (value == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行将QualityTestOrderTicket中属性值不为null的数据保存到数据库-->失败:对象不能为空");
            }
            return resultFormat(C412, null);
        }

        value.setId(RandomUtil.random());
        UserInfo user = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        value.setCreateUser(user.getUsername());
        value.setCreateUserid(user.getId());
        value.setCreateTime(new Date());

        if (value.getOrderTicketNum() == null || value.getSamplingId() == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行将QualityTestOrderTicket中属性值不为null的数据保存到数据库-->失败:存在不能为空的空值");
            }
            return resultFormat(C412, null);
        }
        int result = qualityTestOrderTicketDao.insertNotNullQualityTestOrderTicket(value);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行将QualityTestOrderTicket中属性值不为null的数据保存到数据库-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    @Override
    public String updateNotNullById(QualityTestOrderTicket value) {
        if (value == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行通过QualityTestOrderTicket的id更新QualityTestOrderTicket中属性不为null的数据-->失败:对象为null");
            }
            return resultFormat(C412, null);
        }
        int result = qualityTestOrderTicketDao.updateNotNullQualityTestOrderTicketById(value);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行通过QualityTestOrderTicket的id更新QualityTestOrderTicket中属性不为null的数据-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    @Override
    public String deleteById(Integer id) {
        if (id == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行通过QualityTestOrderTicket的id删除QualityTestOrderTicket-->失败:id不能为空");
            }
            return resultFormat(C412, null);
        }
        int result = qualityTestOrderTicketDao.deleteQualityTestOrderTicketById(id);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行通过QualityTestOrderTicket的id删除QualityTestOrderTicket-->结果:", result);
        }
        return resultFormat(C200, result);
    }


    /**
     * 新增试验
     *
     * @param id
     * @param eID
     * @return
     */
    @Override
    public String addexp(Integer id, String eID) {
        QualityTestOrderTicket orderInfo = qualityTestOrderTicketDao.selectQualityTestOrderTicketById(id);
        if (orderInfo == null || orderInfo.getStatus() == 2) {
            return resultFormat(C412, null);
        }
        lstExperiment= qualityTestExperimentDictionaryDao.selectQualityTestExperimentDictionary(null);
        lstExperimentParam= qualityTestExperimentalParamDao.selectQualityTestExperimentalParam(null);

        String[] ids = eID.split(",");
        int nAddCount = 0;
        String  strAddExpName = "";
        //添加试验
        for (String expId : ids) {
            QualityTestExperimental value = new QualityTestExperimental();
            value.setID(RandomUtil.random());
            value.setExperimentalNum(orderInfo.getOrderTicketNum()+(orderInfo.getStatus()==1?"-2":""));
            String strExpName=getExpName(Integer.valueOf(expId));
            value.setExperimentalId(Integer.valueOf(expId));
            value.setExperimentalName(strExpName);
            value.setOrderTicketId(id);
            value.setOrderTicketNum(orderInfo.getOrderTicketNum());
            value.setExperimentalParamId(this.getExpParamID(Integer.valueOf(expId)));
            value.setStatus(0);
            UserInfo user = (UserInfo) SecurityUtils.getSubject().getPrincipal();
            value.setCreateUser(user.getId());
            value.setCreateTime(new Date());
            int result = qualityTestExperimentalDao.insertNotNullQualityTestExperimental(value);
            if (result > 0) {
                strAddExpName+=strExpName+"、";
                nAddCount++;
            }
        }
        //更新状态
        if (nAddCount > 0) {
            if (orderInfo.getStatus() == 0) {
                orderInfo.setStatus(1);
            } else {
                orderInfo.setStatus(2);
            }

            String expName = (orderInfo.getRequiredExperimenta()==null?"":orderInfo.getRequiredExperimenta())+strAddExpName;
            orderInfo.setRequiredExperimenta(expName);
            qualityTestOrderTicketDao.updateNotNullQualityTestOrderTicketById(orderInfo);
        }

        return resultFormat(C200, nAddCount);
    }

    /**
     * 获取试验名称
     * @param id
     * @return
     */
    private  String getExpName(int id)
    {

        if (lstExperiment.size()>0)
        {
           for(QualityTestExperimentDictionary obj:lstExperiment)
           {
               if (obj.getId()==id)
               {
                   return obj.getName();
               }
           }
        }
        return "";
    }

    /**
     * 获取试验参数ID
     * @param id
     * @return
     */
    public   Integer getExpParamID(int id)
    {

        if (lstExperimentParam.size()>0)
        {
            for(QualityTestExperimentalParam obj:lstExperimentParam)
            {
                if (obj.getExperimenId()==id &&(obj.getStatus()==1||obj.getStatus()==2))
                {
                    return obj.getID();
                }
            }
        }
        return 0;
    }

    public void setReportsFilter(Assist assist, QualityTestOrderTicket value) {

        if (value == null) {
            assist.andGt("status", -1);
            return;
        }
        if (value.getOrderTicketNum() != null && !value.getOrderTicketNum().isEmpty()) {
            assist.andLike("order_ticket_num", "%" + value.getNum() + "%");
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
        if (value.getBegindate() != null ) {
            assist.andGte("create_time", value.getBegindate());
        }if (value.getEnddate() != null ) {
            assist.andLte("create_time", value.getEnddate());
        }
        if (value.getBegindate()==null && value.getEnddate()==null)
        {
            assist.andGte("create_time", DateUtil.dateConvertYYYYMMDDHHMMSS(DateUtils.addDays(new Date(), -31)));
            assist.andLte("create_time", DateUtil.dateConvertYYYYMMDDHHMMSS(new Date()));
        }

        if (value.getStatus() != null && value.getStatus() >= 0) {
            if (value.getStatus()==2) {
                assist.andEq("status", value.getStatus());
            }else
            {
                assist.andGt("status", -1);
                assist.andLt("status", 2);
            }
        } else {
            assist.andGt("status", -1);
        }
    }
    /**
     * 委托单台账
     * @param value
     * @return
     */
    @Override
    public String reports(QualityTestOrderTicket value)
    {
        Assist assist = new Assist();
        assist.setStartRow((value.getPage() - 1) * value.getLimit());
        assist.setRowSize(value.getLimit());
        setReportsFilter(assist, value);
        assist.setOrder(Assist.order("create_time", false));

        List<QualityTestOrderTicket> result = qualityTestOrderTicketDao.selectQualityTestOrderTicket(assist);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行获取QualityTestSamplingpage数据集-->结果:", result);
        }

        Assist assistCount = new Assist();
        setReportsFilter(assistCount, value);
        int count = (int) qualityTestOrderTicketDao.getQualityTestOrderTicketRowCount(assistCount);

        LayUIPage ResultPage = new LayUIPage<QualityTestOrderTicket>(0, "OK", count, result);
        return ResultPage.toJson();
    }


}