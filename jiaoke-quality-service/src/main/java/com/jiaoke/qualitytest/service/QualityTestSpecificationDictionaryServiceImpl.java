package com.jiaoke.qualitytest.service;
import java.util.List;

import com.jiake.utils.RandomUtil;
import com.jiaoke.common.bean.Assist;
import com.jiaoke.common.bean.LayUIPage;
import com.jiaoke.qualitytest.bean.QualityTestManufacturersDictionary;
import com.jiaoke.qualitytest.bean.QualityTestSpecificationDictionary;
import com.jiaoke.qualitytest.dao.QualityTestSpecificationDictionaryDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
/**
 * QualityTestSpecificationDictionary的服务接口的实现类
 * 
 * @author 
 *
 */
@Service
public class QualityTestSpecificationDictionaryServiceImpl implements QualityTestSpecificationDictionaryService {
	private final Logger LOG = LogManager.getLogger(this.getClass());

	@Autowired
	private QualityTestSpecificationDictionaryDao qualityTestSpecificationDictionaryDao;
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
	public void setSeachFilter(Assist assist, QualityTestSpecificationDictionary value) {

		if (value!=null && value.getMaterialId()!=null &&  value.getMaterialId().toString().trim().length()>0) {
			assist.andEq("material_id", value.getMaterialId());
		}
	}

	@Override
	public String find(QualityTestSpecificationDictionary value) {
		//TODO这里可以做通过Assist做添加查询
		Assist assist = new Assist();
		if (value.getPage()!=null)
		{
			assist.setStartRow((value.getPage() - 1) * value.getLimit());
			assist.setRowSize(value.getLimit());
		}
		assist.setOrder(Assist.order("material_id", false));
		setSeachFilter(assist, value);

		List<QualityTestSpecificationDictionary> result = qualityTestSpecificationDictionaryDao.selectQualityTestSpecificationDictionary(assist);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行获取QualityTestSpecificationDictionary数据集-->结果:", result);
		}
		Assist assistCount = new Assist();
		setSeachFilter(assistCount, value);
		int count = (int) qualityTestSpecificationDictionaryDao.getQualityTestSpecificationDictionaryRowCount(assistCount);

		LayUIPage ResultPage = new LayUIPage<QualityTestSpecificationDictionary>(0, "OK", count, result);
		return ResultPage.toJson();
	}
	@Override
	public String findOne(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestSpecificationDictionary的id获得QualityTestSpecificationDictionary对象-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		QualityTestSpecificationDictionary result = qualityTestSpecificationDictionaryDao.selectQualityTestSpecificationDictionaryById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestSpecificationDictionary的id获得QualityTestSpecificationDictionary对象-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String saveNotNull(QualityTestSpecificationDictionary value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行将QualityTestSpecificationDictionary中属性值不为null的数据保存到数据库-->失败:对象不能为空");
			}
			return resultFormat(C412, null);
		}
		value.setId(RandomUtil.random());
		int result = qualityTestSpecificationDictionaryDao.insertNotNullQualityTestSpecificationDictionary(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行将QualityTestSpecificationDictionary中属性值不为null的数据保存到数据库-->结果:", result);
		}
		return resultFormat(C200, result);
	}
	@Override
	public String updateNotNullById(QualityTestSpecificationDictionary value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestSpecificationDictionary的id更新QualityTestSpecificationDictionary中属性不为null的数据-->失败:对象为null");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestSpecificationDictionaryDao.updateNotNullQualityTestSpecificationDictionaryById(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestSpecificationDictionary的id更新QualityTestSpecificationDictionary中属性不为null的数据-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String deleteById(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestSpecificationDictionary的id删除QualityTestSpecificationDictionary-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestSpecificationDictionaryDao.deleteQualityTestSpecificationDictionaryById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestSpecificationDictionary的id删除QualityTestSpecificationDictionary-->结果:", result);
		}
		return resultFormat(C200, result);
	}


}