package com.jiaoke.qualitytest.service.experimentalvalue;
import java.util.List;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.common.bean.LayUIPage;
import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueCjlSf;
import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueKfSf;
import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueXjlSf;
import com.jiaoke.qualitytest.dao.experimentalvalue.QualityTestExperimentalValueCjlSfDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
/**
 * QualityTestExperimentalValueCjlSf的服务接口的实现类
 * 
 * @author 
 *
 */
@Service
public class QualityTestExperimentalValueCjlSfServiceImpl implements QualityTestExperimentalValueCjlSfService {
	private final Logger LOG = LogManager.getLogger(this.getClass());

	@Autowired
	private QualityTestExperimentalValueCjlSfDao qualityTestExperimentalValueCjlSfDao;
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
	public void setSeachFilter(Assist assist, QualityTestExperimentalValueCjlSf value) {
		if (value == null) {
			return;
		}
		if (value.getOrderTicketNum() != null && !value.getOrderTicketNum().isEmpty()) {
			assist.andEq("order_ticket_num",  value.getOrderTicketNum() );
		}
	}

	@Override
	public String find(QualityTestExperimentalValueCjlSf value) {
		Assist assist = new Assist();
		setSeachFilter(assist, value);
		List<QualityTestExperimentalValueCjlSf> result = qualityTestExperimentalValueCjlSfDao.selectQualityTestExperimentalValueCjlSf(assist);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行获取QualityTestSamplingpage数据集-->结果:", result);
		}

		Assist assistCount = new Assist();
		setSeachFilter(assistCount, value);
		int count = (int) qualityTestExperimentalValueCjlSfDao.getQualityTestExperimentalValueCjlSfRowCount(assistCount);

		LayUIPage ResultPage = new LayUIPage<QualityTestExperimentalValueCjlSf>(0, "OK", count, result);
		return ResultPage.toJson();
	}
	@Override
	public String findOne(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentalValueCjlSf的id获得QualityTestExperimentalValueCjlSf对象-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		QualityTestExperimentalValueCjlSf result = qualityTestExperimentalValueCjlSfDao.selectQualityTestExperimentalValueCjlSfById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentalValueCjlSf的id获得QualityTestExperimentalValueCjlSf对象-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String saveNotNull(QualityTestExperimentalValueCjlSf value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行将QualityTestExperimentalValueCjlSf中属性值不为null的数据保存到数据库-->失败:对象不能为空");
			}
			return resultFormat(C412, null);
		}
		value.setID(Integer.valueOf(value.getExperimentalId()));
		QualityTestExperimentalValueCjlSf obj = qualityTestExperimentalValueCjlSfDao.selectQualityTestExperimentalValueCjlSfById(Integer.valueOf(value.getExperimentalId()));
		int result =0;
		if (obj==null) {
			result = qualityTestExperimentalValueCjlSfDao.insertNotNullQualityTestExperimentalValueCjlSf(value);
		}else{
			result = qualityTestExperimentalValueCjlSfDao.updateNotNullQualityTestExperimentalValueCjlSfById(value);
		}
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行将QualityTestExperimentalValueCjlSf中属性值不为null的数据保存到数据库-->结果:", result);
		}
		return resultFormat(C200, result);
	}
	@Override
	public String updateNotNullById(QualityTestExperimentalValueCjlSf value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentalValueCjlSf的id更新QualityTestExperimentalValueCjlSf中属性不为null的数据-->失败:对象为null");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestExperimentalValueCjlSfDao.updateNotNullQualityTestExperimentalValueCjlSfById(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentalValueCjlSf的id更新QualityTestExperimentalValueCjlSf中属性不为null的数据-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String deleteById(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentalValueCjlSf的id删除QualityTestExperimentalValueCjlSf-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestExperimentalValueCjlSfDao.deleteQualityTestExperimentalValueCjlSfById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentalValueCjlSf的id删除QualityTestExperimentalValueCjlSf-->结果:", result);
		}
		return resultFormat(C200, result);
	}


}