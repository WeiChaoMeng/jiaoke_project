package com.jiaoke.qualitytest.service;
import java.util.Date;
import java.util.List;

import com.jiake.utils.RandomUtil;
import com.jiaoke.common.bean.Assist;
import com.jiaoke.common.bean.LayUIPage;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.qualitytest.bean.QualityTestExperimentDictionary;
import com.jiaoke.qualitytest.bean.QualityTestExperimentalParam;
import com.jiaoke.qualitytest.bean.QualityTestSamplingpage;
import com.jiaoke.qualitytest.dao.QualityTestExperimentalParamDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
/**
 * QualityTestExperimentalParam的服务接口的实现类
 * 
 * @author 
 *
 */
@Service
public class QualityTestExperimentalParamServiceImpl implements QualityTestExperimentalParamService {
	private final Logger LOG = LogManager.getLogger(this.getClass());

	@Autowired
	private QualityTestExperimentalParamDao qualityTestExperimentalParamDao;
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
	public void setSeachFilter(Assist assist, QualityTestExperimentalParam value) {

		if (value == null) {
			assist.andLt("status", 2);
			return;
		}
		if (value!=null && value.getMaterialId()!=null &&  value.getMaterialId().toString().trim().length()>0) {
			assist.andEq("material_id", value.getMaterialId());
		}
		if (value!=null && value.getExperimenId()!=null &&  value.getExperimenId().toString().trim().length()>0) {
			assist.andEq("experimen_id", value.getExperimenId());
		}
		if (value.getStatus() != null && value.getStatus() !=null) {
			assist.andEq("status", value.getStatus());
		} else {
			assist.andLt("status", 2);
		}
	}
	@Override
	public String find(QualityTestExperimentalParam value) {
		//TODO这里可以做通过Assist做添加查询
		Assist assist = new Assist();
		if (value.getPage()!=null)
		{
			assist.setStartRow((value.getPage() - 1) * value.getLimit());
			assist.setRowSize(value.getLimit());
		}
		assist.setOrder(Assist.order("material_id", false));
		setSeachFilter(assist, value);
		List<QualityTestExperimentalParam> result = qualityTestExperimentalParamDao.selectQualityTestExperimentalParam(assist);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行获取QualityTestExperimentalParam数据集-->结果:", result);
		}
		Assist assistCount = new Assist();
		setSeachFilter(assistCount, value);
		int count = (int) qualityTestExperimentalParamDao.getQualityTestExperimentalParamRowCount(assistCount);

		LayUIPage ResultPage = new LayUIPage<QualityTestExperimentalParam>(0, "OK", count, result);
		return ResultPage.toJson();
	}
	@Override
	public String findOne(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentalParam的id获得QualityTestExperimentalParam对象-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		QualityTestExperimentalParam result = qualityTestExperimentalParamDao.selectQualityTestExperimentalParamById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentalParam的id获得QualityTestExperimentalParam对象-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String saveNotNull(QualityTestExperimentalParam value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行将QualityTestExperimentalParam中属性值不为null的数据保存到数据库-->失败:对象不能为空");
			}
			return resultFormat(C412, null);
		}
		value.setID(RandomUtil.random());
		int result = qualityTestExperimentalParamDao.insertNotNullQualityTestExperimentalParam(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行将QualityTestExperimentalParam中属性值不为null的数据保存到数据库-->结果:", result);
		}
		return resultFormat(C200, result);
	}
	@Override
	public String updateNotNullById(QualityTestExperimentalParam value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentalParam的id更新QualityTestExperimentalParam中属性不为null的数据-->失败:对象为null");
			}
			return resultFormat(C412, null);
		}
		value.setID(value.getUpdateId());
		int result = qualityTestExperimentalParamDao.updateNotNullQualityTestExperimentalParamById(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentalParam的id更新QualityTestExperimentalParam中属性不为null的数据-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String deleteById(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentalParam的id删除QualityTestExperimentalParam-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		QualityTestExperimentalParam value = new QualityTestExperimentalParam();
		value.setID(id);
		value.setStatus(-1);/*
		UserInfo user = (UserInfo) SecurityUtils.getSubject().getPrincipal();
		value.setDelUser(user.getUsername());
		value.setDelUserid(user.getId());
		value.setDelTime(new Date());*/
		int result = qualityTestExperimentalParamDao.updateNotNullQualityTestExperimentalParamById(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestSamplingpage的id删除QualityTestSamplingpage-->结果:", result);
		}
		return resultFormat(C200, result);
	}
	@Override
	public String copyById(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentalParam的id删除QualityTestExperimentalParam-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		QualityTestExperimentalParam value=qualityTestExperimentalParamDao.selectQualityTestExperimentalParamById(id);
		if (value==null) {
			return resultFormat(C412, null);
		}
		QualityTestExperimentalParam newObj = new QualityTestExperimentalParam();
		newObj.setID(RandomUtil.random());
		newObj.setMaterialId(value.getMaterialId());
		newObj.setMaterialName(value.getMaterialName());
		newObj.setExperimenId(value.getExperimenId());
		newObj.setExperimenName(value.getExperimenName());
		newObj.setExperimenParam(value.getExperimenParam());
		newObj.setFormula(value.getFormula());
		newObj.setStatus(0);
		int result = qualityTestExperimentalParamDao.insertNotNullQualityTestExperimentalParam(newObj);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestSamplingpage的id复制QualityTestSamplingpage-->结果:", result);
		}
		return resultFormat(C200, result);
	}

}