package com.jiaoke.qualitytest.service;
import java.util.List;

import com.jiake.utils.RandomUtil;
import com.jiaoke.common.bean.Assist;
import com.jiaoke.common.bean.LayUIPage;
import com.jiaoke.qualitytest.bean.QualityTestExperimentalParam;
import com.jiaoke.qualitytest.bean.QualityTestExperimentalStandardvalue;
import com.jiaoke.qualitytest.dao.QualityTestExperimentalStandardvalueDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
/**
 * QualityTestExperimentalStandardvalue的服务接口的实现类
 * 
 * @author 
 *
 */
@Service
public class QualityTestExperimentalStandardvalueServiceImpl implements QualityTestExperimentalStandardvalueService {
	private final Logger LOG = LogManager.getLogger(this.getClass());

	@Autowired
	private QualityTestExperimentalStandardvalueDao qualityTestExperimentalStandardvalueDao;
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

	public void setSeachFilter(Assist assist, QualityTestExperimentalStandardvalue value) {
		if (value!=null && value.getMaterials()!=null &&  value.getMaterials().toString().trim().length()>0) {
			assist.andEq("materials", value.getMaterials());
		}
		if (value.getSpecification() != null && !value.getSpecification().isEmpty()) {
			assist.andLike("specification", "%" + value.getSpecification() + "%");
		}
		if (value.getExperimentalName() != null && !value.getExperimentalName().isEmpty()) {
			assist.andLike("experimental_name", "%" + value.getExperimentalName() + "%");
		}
	}
	@Override
	public String find(QualityTestExperimentalStandardvalue value) {
		//TODO这里可以做通过Assist做添加查询
		Assist assist = new Assist();
		if (value.getPage()!=null)
		{
			assist.setStartRow((value.getPage() - 1) * value.getLimit());
			assist.setRowSize(value.getLimit());
		}

/*
		assist.setOrder(Assist.order("material_id", true));
		assist.setOrder(Assist.order("specification", true));
*/
		assist.setOrder(Assist.order("experimental_name", true));

		setSeachFilter(assist, value);
		List<QualityTestExperimentalStandardvalue> result = qualityTestExperimentalStandardvalueDao.selectQualityTestExperimentalStandardvalue(assist);
		if (LOG.isDebugEnabled()) {
			LOG.debug("QualityTestExperimentalStandardvalue-->结果:", result);
		}
		Assist assistCount = new Assist();
		setSeachFilter(assistCount, value);
		int count = (int) qualityTestExperimentalStandardvalueDao.getQualityTestExperimentalStandardvalueRowCount(assistCount);

		LayUIPage ResultPage = new LayUIPage<QualityTestExperimentalStandardvalue>(0, "OK", count, result);
		return ResultPage.toJson();
	}


	@Override
	public String findOne(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentalStandardvalue的id获得QualityTestExperimentalStandardvalue对象-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		QualityTestExperimentalStandardvalue result = qualityTestExperimentalStandardvalueDao.selectQualityTestExperimentalStandardvalueById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentalStandardvalue的id获得QualityTestExperimentalStandardvalue对象-->结果:", result);
		}
		return resultFormat(C200, result.toJson());
	}

	@Override
	public String saveNotNull(QualityTestExperimentalStandardvalue value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行将QualityTestExperimentalStandardvalue中属性值不为null的数据保存到数据库-->失败:对象不能为空");
			}
			return resultFormat(C412, null);
		}
		value.setId(RandomUtil.random());
		int result = qualityTestExperimentalStandardvalueDao.insertNotNullQualityTestExperimentalStandardvalue(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行将QualityTestExperimentalStandardvalue中属性值不为null的数据保存到数据库-->结果:", result);
		}
		return resultFormat(C200, result);
	}
	@Override
	public String updateNotNullById(QualityTestExperimentalStandardvalue value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentalStandardvalue的id更新QualityTestExperimentalStandardvalue中属性不为null的数据-->失败:对象为null");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestExperimentalStandardvalueDao.updateNotNullQualityTestExperimentalStandardvalueById(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentalStandardvalue的id更新QualityTestExperimentalStandardvalue中属性不为null的数据-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String deleteById(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentalStandardvalue的id删除QualityTestExperimentalStandardvalue-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestExperimentalStandardvalueDao.deleteQualityTestExperimentalStandardvalueById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentalStandardvalue的id删除QualityTestExperimentalStandardvalue-->结果:", result);
		}
		return resultFormat(C200, result);
	}


}