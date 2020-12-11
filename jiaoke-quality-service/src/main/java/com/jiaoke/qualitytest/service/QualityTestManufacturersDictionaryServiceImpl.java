package com.jiaoke.qualitytest.service;
import java.util.List;

import com.jiake.utils.RandomUtil;
import com.jiaoke.common.bean.Assist;
import com.jiaoke.common.bean.LayUIPage;
import com.jiaoke.qualitytest.bean.QualityTestExperimentDictionary;
import com.jiaoke.qualitytest.bean.QualityTestManufacturersDictionary;
import com.jiaoke.qualitytest.dao.QualityTestManufacturersDictionaryDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
/**
 * QualityTestManufacturersDictionary的服务接口的实现类
 * 
 * @author 
 *
 */
@Service
public class QualityTestManufacturersDictionaryServiceImpl implements QualityTestManufacturersDictionaryService {
	private final Logger LOG = LogManager.getLogger(this.getClass());

	@Autowired
	private QualityTestManufacturersDictionaryDao qualityTestManufacturersDictionaryDao;
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
	public void setSeachFilter(Assist assist, QualityTestManufacturersDictionary value) {

		if (value!=null && value.getMaterialId()!=null &&  value.getMaterialId().toString().trim().length()>0) {
			assist.andEq("material_id", value.getMaterialId());
		}
	}

	@Override
	public String find(QualityTestManufacturersDictionary value) {
		//TODO这里可以做通过Assist做添加查询
		Assist assist = new Assist();
		if (value.getPage()!=null)
		{
			assist.setStartRow((value.getPage() - 1) * value.getLimit());
			assist.setRowSize(value.getLimit());
		}
		assist.setOrder(Assist.order("material_id", false));
		setSeachFilter(assist, value);

		List<QualityTestManufacturersDictionary> result = qualityTestManufacturersDictionaryDao.selectQualityTestManufacturersDictionary(assist);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行获取QualityTestManufacturersDictionary数据集-->结果:", result);
		}

		Assist assistCount = new Assist();
		setSeachFilter(assistCount, value);
		int count = (int) qualityTestManufacturersDictionaryDao.getQualityTestManufacturersDictionaryRowCount(assistCount);

		LayUIPage ResultPage = new LayUIPage<QualityTestManufacturersDictionary>(0, "OK", count, result);
		return ResultPage.toJson();
	}
	@Override
	public String findOne(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestManufacturersDictionary的id获得QualityTestManufacturersDictionary对象-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		QualityTestManufacturersDictionary result = qualityTestManufacturersDictionaryDao.selectQualityTestManufacturersDictionaryById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestManufacturersDictionary的id获得QualityTestManufacturersDictionary对象-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String saveNotNull(QualityTestManufacturersDictionary value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行将QualityTestManufacturersDictionary中属性值不为null的数据保存到数据库-->失败:对象不能为空");
			}
			return resultFormat(C412, null);
		}
		value.setId(RandomUtil.random());
		int result = qualityTestManufacturersDictionaryDao.insertNotNullQualityTestManufacturersDictionary(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行将QualityTestManufacturersDictionary中属性值不为null的数据保存到数据库-->结果:", result);
		}
		return resultFormat(C200, result);
	}
	@Override
	public String updateNotNullById(QualityTestManufacturersDictionary value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestManufacturersDictionary的id更新QualityTestManufacturersDictionary中属性不为null的数据-->失败:对象为null");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestManufacturersDictionaryDao.updateNotNullQualityTestManufacturersDictionaryById(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestManufacturersDictionary的id更新QualityTestManufacturersDictionary中属性不为null的数据-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String deleteById(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestManufacturersDictionary的id删除QualityTestManufacturersDictionary-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestManufacturersDictionaryDao.deleteQualityTestManufacturersDictionaryById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestManufacturersDictionary的id删除QualityTestManufacturersDictionary-->结果:", result);
		}
		return resultFormat(C200, result);
	}


}