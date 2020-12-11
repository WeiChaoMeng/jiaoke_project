package com.jiaoke.qualitytest.service.experimentalvalue;
import java.util.List;

import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueLqhhlMs;
import com.jiaoke.qualitytest.dao.experimentalvalue.QualityTestExperimentalValueLqhhlMsDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
/**
 * QualityTestExperimentalValueLqhhlMs的服务接口的实现类
 * 
 * @author 
 *
 */
@Service
public class QualityTestExperimentalValueLqhhlMsServiceImpl implements QualityTestExperimentalValueLqhhlMsService {
	private final Logger LOG = LogManager.getLogger(this.getClass());

	@Autowired
	private QualityTestExperimentalValueLqhhlMsDao qualityTestExperimentalValueLqhhlMsDao;
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

	@Override
	public String find(QualityTestExperimentalValueLqhhlMs value) {
		//TODO这里可以做通过Assist做添加查询
		List<QualityTestExperimentalValueLqhhlMs> result = qualityTestExperimentalValueLqhhlMsDao.selectQualityTestExperimentalValueLqhhlMs(null);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行获取QualityTestExperimentalValueLqhhlMs数据集-->结果:", result);
		}
		return resultFormat(C200, result);
	}
	@Override
	public String findOne(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentalValueLqhhlMs的id获得QualityTestExperimentalValueLqhhlMs对象-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		QualityTestExperimentalValueLqhhlMs result = qualityTestExperimentalValueLqhhlMsDao.selectQualityTestExperimentalValueLqhhlMsById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentalValueLqhhlMs的id获得QualityTestExperimentalValueLqhhlMs对象-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String saveNotNull(QualityTestExperimentalValueLqhhlMs value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行将QualityTestExperimentalValueLqhhlMs中属性值不为null的数据保存到数据库-->失败:对象不能为空");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestExperimentalValueLqhhlMsDao.insertNotNullQualityTestExperimentalValueLqhhlMs(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行将QualityTestExperimentalValueLqhhlMs中属性值不为null的数据保存到数据库-->结果:", result);
		}
		return resultFormat(C200, result);
	}
	@Override
	public String updateNotNullById(QualityTestExperimentalValueLqhhlMs value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentalValueLqhhlMs的id更新QualityTestExperimentalValueLqhhlMs中属性不为null的数据-->失败:对象为null");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestExperimentalValueLqhhlMsDao.updateNotNullQualityTestExperimentalValueLqhhlMsById(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentalValueLqhhlMs的id更新QualityTestExperimentalValueLqhhlMs中属性不为null的数据-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String deleteById(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentalValueLqhhlMs的id删除QualityTestExperimentalValueLqhhlMs-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestExperimentalValueLqhhlMsDao.deleteQualityTestExperimentalValueLqhhlMsById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentalValueLqhhlMs的id删除QualityTestExperimentalValueLqhhlMs-->结果:", result);
		}
		return resultFormat(C200, result);
	}


}