package com.jiaoke.qualitytest.service.experimentalvalue;

import java.util.List;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.common.bean.LayUIPage;
import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValue;
import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueCjlSf;
import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueKfSf;
import com.jiaoke.qualitytest.dao.experimentalvalue.QualityTestExperimentalValueKfSfDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;

/**
 * QualityTestExperimentalValueKfSf的服务接口的实现类
 *
 * @author
 */
@Service
public class QualityTestExperimentalValueKfSfServiceImpl implements QualityTestExperimentalValueKfSfService {
    private final Logger LOG = LogManager.getLogger(this.getClass());

    @Autowired
    private QualityTestExperimentalValueKfSfDao qualityTestExperimentalValueKfSfDao;
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
    public void setSeachFilter(Assist assist, QualityTestExperimentalValueKfSf value) {
        if (value == null) {
            return;
        }
        if (value.getOrderTicketNum() != null && !value.getOrderTicketNum().isEmpty()) {
            assist.andEq("order_ticket_num",  value.getOrderTicketNum() );
        }
    }

    @Override
    public String find(QualityTestExperimentalValueKfSf value) {
        Assist assist = new Assist();
        setSeachFilter(assist, value);
        List<QualityTestExperimentalValueKfSf> result = qualityTestExperimentalValueKfSfDao.selectQualityTestExperimentalValueKfSf(assist);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行获取QualityTestSamplingpage数据集-->结果:", result);
        }

        Assist assistCount = new Assist();
        setSeachFilter(assistCount, value);
        int count = (int) qualityTestExperimentalValueKfSfDao.getQualityTestExperimentalValueKfSfRowCount(assistCount);

        LayUIPage ResultPage = new LayUIPage<QualityTestExperimentalValueKfSf>(0, "OK", count, result);
        return ResultPage.toJson();
    }

    @Override
    public String findOne(Integer id) {
        if (id == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行通过QualityTestExperimentalValueKfSf的id获得QualityTestExperimentalValueKfSf对象-->失败:id不能为空");
            }
            return resultFormat(C412, null);
        }
        QualityTestExperimentalValueKfSf result = qualityTestExperimentalValueKfSfDao.selectQualityTestExperimentalValueKfSfById(id);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行通过QualityTestExperimentalValueKfSf的id获得QualityTestExperimentalValueKfSf对象-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    @Override
    public String saveNotNull(QualityTestExperimentalValueKfSf value) {
        if (value == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行将QualityTestExperimentalValueKfSf中属性值不为null的数据保存到数据库-->失败:对象不能为空");
            }
            return resultFormat(C412, null);
        }
        value.setID(Integer.valueOf(value.getExperimentalId()));
        QualityTestExperimentalValueKfSf obj = qualityTestExperimentalValueKfSfDao.selectQualityTestExperimentalValueKfSfById(Integer.valueOf(value.getExperimentalId()));
        int result = 0;
        if (obj == null) {
            result = qualityTestExperimentalValueKfSfDao.insertNotNullQualityTestExperimentalValueKfSf(value);
        } else {
            result = qualityTestExperimentalValueKfSfDao.updateNotNullQualityTestExperimentalValueKfSfById(value);
        }
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行将QualityTestExperimentalValueKfSf中属性值不为null的数据保存到数据库-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    @Override
    public String updateNotNullById(QualityTestExperimentalValueKfSf value) {
        if (value == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行通过QualityTestExperimentalValueKfSf的id更新QualityTestExperimentalValueKfSf中属性不为null的数据-->失败:对象为null");
            }
            return resultFormat(C412, null);
        }
        int result = qualityTestExperimentalValueKfSfDao.updateNotNullQualityTestExperimentalValueKfSfById(value);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行通过QualityTestExperimentalValueKfSf的id更新QualityTestExperimentalValueKfSf中属性不为null的数据-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    @Override
    public String deleteById(Integer id) {
        if (id == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行通过QualityTestExperimentalValueKfSf的id删除QualityTestExperimentalValueKfSf-->失败:id不能为空");
            }
            return resultFormat(C412, null);
        }
        int result = qualityTestExperimentalValueKfSfDao.deleteQualityTestExperimentalValueKfSfById(id);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行通过QualityTestExperimentalValueKfSf的id删除QualityTestExperimentalValueKfSf-->结果:", result);
        }
        return resultFormat(C200, result);
    }


}