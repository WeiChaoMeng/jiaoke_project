package com.jiaoke.qualitytest.service;
import java.util.List;

import com.jiake.utils.RandomUtil;
import com.jiaoke.common.bean.Assist;
import com.jiaoke.common.bean.LayUIPage;
import com.jiaoke.qualitytest.bean.QualityTestExperimentDictionary;
import com.jiaoke.qualitytest.bean.QualityTestOrderTicket;
import com.jiaoke.qualitytest.dao.QualityTestExperimentDictionaryDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
/**
 * QualityTestExperimentDictionary的服务接口的实现类
 * 
 * @author 
 *
 */
@Service
public class QualityTestExperimentDictionaryServiceImpl implements QualityTestExperimentDictionaryService {
	private final Logger LOG = LogManager.getLogger(this.getClass());

	@Autowired
	private QualityTestExperimentDictionaryDao qualityTestExperimentDictionaryDao;
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
	public void setSeachFilter(Assist assist, QualityTestExperimentDictionary value) {

		if (value!=null && value.getMaterialId()!=null &&  value.getMaterialId().toString().trim().length()>0) {
			assist.andEq("material_id", value.getMaterialId());
		}
	}

	@Override
	public String find(QualityTestExperimentDictionary value) {
		//TODO这里可以做通过Assist做添加查询
		Assist assist = new Assist();
		if (value.getPage()!=null)
		{
			assist.setStartRow((value.getPage() - 1) * value.getLimit());
			assist.setRowSize(value.getLimit());
		}
		assist.setOrder(Assist.order("material_id", false));
		setSeachFilter(assist, value);
		List<QualityTestExperimentDictionary> result = qualityTestExperimentDictionaryDao.selectQualityTestExperimentDictionary(assist);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行获取QualityTestExperimentDictionary数据集-->结果:", result);
		}
		Assist assistCount = new Assist();
		setSeachFilter(assistCount, value);
		int count = (int) qualityTestExperimentDictionaryDao.getQualityTestExperimentDictionaryRowCount(assistCount);

		LayUIPage ResultPage = new LayUIPage<QualityTestExperimentDictionary>(0, "OK", count, result);
		return ResultPage.toJson();
	}
	@Override
	public String findOne(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentDictionary的id获得QualityTestExperimentDictionary对象-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		QualityTestExperimentDictionary result = qualityTestExperimentDictionaryDao.selectQualityTestExperimentDictionaryById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentDictionary的id获得QualityTestExperimentDictionary对象-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String saveNotNull(QualityTestExperimentDictionary value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行将QualityTestExperimentDictionary中属性值不为null的数据保存到数据库-->失败:对象不能为空");
			}
			return resultFormat(C412, null);
		}
		value.setId(RandomUtil.random());
		value.setTableName("table");
		if(value.getMaterialId() == null || value.getName() == null || value.getTableName() == null  ){
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行将QualityTestExperimentDictionary中属性值不为null的数据保存到数据库-->失败:存在不能为空的空值");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestExperimentDictionaryDao.insertNotNullQualityTestExperimentDictionary(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行将QualityTestExperimentDictionary中属性值不为null的数据保存到数据库-->结果:", result);
		}
		return resultFormat(C200, result);
	}
	@Override
	public String updateNotNullById(QualityTestExperimentDictionary value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentDictionary的id更新QualityTestExperimentDictionary中属性不为null的数据-->失败:对象为null");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestExperimentDictionaryDao.updateNotNullQualityTestExperimentDictionaryById(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentDictionary的id更新QualityTestExperimentDictionary中属性不为null的数据-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String deleteById(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentDictionary的id删除QualityTestExperimentDictionary-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestExperimentDictionaryDao.deleteQualityTestExperimentDictionaryById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentDictionary的id删除QualityTestExperimentDictionary-->结果:", result);
		}
		return resultFormat(C200, result);
	}


}