package com.jiaoke.qualitytest.service;
import java.util.List;

import com.jiake.utils.RandomUtil;
import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.QualityTestMaterialDictionary;
import com.jiaoke.qualitytest.dao.QualityTestMaterialDictionaryDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
/**
 * QualityTestMaterialDictionary的服务接口的实现类
 * 
 * @author 
 *
 */
@Service
public class QualityTestMaterialDictionaryServiceImpl implements QualityTestMaterialDictionaryService {
	private final Logger LOG = LogManager.getLogger(this.getClass());

	@Autowired
	private QualityTestMaterialDictionaryDao qualityTestMaterialDictionaryDao;
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
	public String find(QualityTestMaterialDictionary value) {
		//TODO这里可以做通过Assist做添加查询
		Assist assist = new Assist();
		assist.setOrder(Assist.order("id", true));
		List<QualityTestMaterialDictionary> result = qualityTestMaterialDictionaryDao.selectQualityTestMaterialDictionary(assist);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行获取QualityTestMaterialDictionary数据集-->结果:", result);
		}
		return resultFormat(C200, result);
	}
	@Override
	public String findOne(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestMaterialDictionary的id获得QualityTestMaterialDictionary对象-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		QualityTestMaterialDictionary result = qualityTestMaterialDictionaryDao.selectQualityTestMaterialDictionaryById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestMaterialDictionary的id获得QualityTestMaterialDictionary对象-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String saveNotNull(QualityTestMaterialDictionary value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行将QualityTestMaterialDictionary中属性值不为null的数据保存到数据库-->失败:对象不能为空");
			}
			return resultFormat(C412, null);
		}
		if(value.getName() == null || value.getLogogramName() == null  ){
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行将QualityTestMaterialDictionary中属性值不为null的数据保存到数据库-->失败:存在不能为空的空值");
			}
			return resultFormat(C412, null);
		}
		value.setId(RandomUtil.random());
		int result = qualityTestMaterialDictionaryDao.insertNotNullQualityTestMaterialDictionary(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行将QualityTestMaterialDictionary中属性值不为null的数据保存到数据库-->结果:", result);
		}
		return resultFormat(C200, result);
	}
	@Override
	public String updateNotNullById(QualityTestMaterialDictionary value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestMaterialDictionary的id更新QualityTestMaterialDictionary中属性不为null的数据-->失败:对象为null");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestMaterialDictionaryDao.updateNotNullQualityTestMaterialDictionaryById(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestMaterialDictionary的id更新QualityTestMaterialDictionary中属性不为null的数据-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String deleteById(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestMaterialDictionary的id删除QualityTestMaterialDictionary-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestMaterialDictionaryDao.deleteQualityTestMaterialDictionaryById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestMaterialDictionary的id删除QualityTestMaterialDictionary-->结果:", result);
		}
		return resultFormat(C200, result);
	}


}