package com.jiaoke.qualitytest.service.experimentalvalue;

import java.util.List;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.common.bean.LayUIPage;
import com.jiaoke.qualitytest.bean.QualityTestExperimental;
import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValue;
import com.jiaoke.qualitytest.dao.experimentalvalue.QualityTestExperimentalValueDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;

/**
 * QualityTestExperimentalValue的服务接口的实现类
 *
 * @author
 */
@Service
public class QualityTestExperimentalValueServiceImpl implements QualityTestExperimentalValueService {
    private final Logger LOG = LogManager.getLogger(this.getClass());

    @Autowired
    private QualityTestExperimentalValueDao qualityTestExperimentalValueDao;
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

    public void setSeachFilter(Assist assist, QualityTestExperimentalValue value) {
        if (value == null) {
            return;
        }
        if (value.getOrderTicketNum() != null && !value.getOrderTicketNum().isEmpty()) {
            assist.andEq("order_ticket_num", value.getOrderTicketNum());
        }
    }

    @Override
    public String find(QualityTestExperimentalValue value) {

        Assist assist = new Assist();
        if (value.getPage() != null) {
            assist.setStartRow((value.getPage() - 1) * value.getLimit());
            assist.setRowSize(value.getLimit());
        } else {
            assist.setStartRow(0);
            assist.setRowSize(1000);
        }
        setSeachFilter(assist, value);
        assist.setOrder(Assist.order("test_date", true));

        List<QualityTestExperimentalValue> result = qualityTestExperimentalValueDao.selectQualityTestExperimentalValue(assist);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行获取QualityTestSamplingpage数据集-->结果:", result);
        }

        Assist assistCount = new Assist();
        setSeachFilter(assistCount, value);
        int count = (int) qualityTestExperimentalValueDao.getQualityTestExperimentalValueRowCount(assistCount);

        LayUIPage ResultPage = new LayUIPage<QualityTestExperimentalValue>(0, "OK", count, result);
        return ResultPage.toJson();
    }

    @Override
    public String findOne(Integer id) {
        if (id == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行通过QualityTestExperimentalValue的id获得QualityTestExperimentalValue对象-->失败:id不能为空");
            }
            return resultFormat(C412, null);
        }
        QualityTestExperimentalValue result = qualityTestExperimentalValueDao.selectQualityTestExperimentalValueById(id);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行通过QualityTestExperimentalValue的id获得QualityTestExperimentalValue对象-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    @Override
    public String saveNotNull(QualityTestExperimentalValue value) {
        if (value == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行将QualityTestExperimentalValue中属性值不为null的数据保存到数据库-->失败:对象不能为空");
            }
            return resultFormat(C412, null);
        }
        int result = qualityTestExperimentalValueDao.insertNotNullQualityTestExperimentalValue(value);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行将QualityTestExperimentalValue中属性值不为null的数据保存到数据库-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    @Override
    public String updateNotNullById(QualityTestExperimentalValue value) {
        if (value == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行通过QualityTestExperimentalValue的id更新QualityTestExperimentalValue中属性不为null的数据-->失败:对象为null");
            }
            return resultFormat(C412, null);
        }
        int result = qualityTestExperimentalValueDao.updateNotNullQualityTestExperimentalValueById(value);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行通过QualityTestExperimentalValue的id更新QualityTestExperimentalValue中属性不为null的数据-->结果:", result);
        }
        return resultFormat(C200, result);
    }

    @Override
    public String deleteById(Integer id) {
        if (id == null) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("执行通过QualityTestExperimentalValue的id删除QualityTestExperimentalValue-->失败:id不能为空");
            }
            return resultFormat(C412, null);
        }
        int result = qualityTestExperimentalValueDao.deleteQualityTestExperimentalValueById(id);
        if (LOG.isDebugEnabled()) {
            LOG.debug("执行通过QualityTestExperimentalValue的id删除QualityTestExperimentalValue-->结果:", result);
        }
        return resultFormat(C200, result);
    }


}