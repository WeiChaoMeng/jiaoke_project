package com.jiaoke.qualitytest.service;

import com.alibaba.fastjson.JSONObject;
import com.jiaoke.common.bean.Assist;
import com.jiaoke.common.bean.LayUIPage;
import com.jiaoke.qualitytest.bean.QualityTestExperimentalStandardvalueItem;
import com.jiaoke.qualitytest.dao.QualityTestExperimentalStandardvalueItemDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * QualityTestExperimentalStandardvalueItem的服务接口的实现类
 * 
 * @author 
 *
 */
@Service
public class QualityTestExperimentalStandardvalueItemServiceImpl implements QualityTestExperimentalStandardvalueItemService {
	private final Logger LOG = LogManager.getLogger(this.getClass());

	@Autowired
	private QualityTestExperimentalStandardvalueItemDao qualityTestExperimentalStandardvalueItemDao;
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

	public void setSeachFilter(Assist assist, QualityTestExperimentalStandardvalueItem value) {
		if (value!=null && value.getMaterials()!=null &&  value.getMaterials().toString().trim().length()>0) {
			assist.andEq("materials", value.getMaterials());
		}
		if (value.getExperimentalId() != null && value.getExperimentalId()>0){
			assist.andLike("experimental_id",  value.getExperimentalId());
		}
	}
	@Override
	public String find(QualityTestExperimentalStandardvalueItem value) {
		//TODO这里可以做通过Assist做添加查询
		Assist assist = new Assist();
		if (value.getPage()!=null)
		{
			assist.setStartRow((value.getPage() - 1) * value.getLimit());
			assist.setRowSize(value.getLimit());
		}
		Assist.WhereOrder[] whereOrders=new Assist.WhereOrder[1];
		whereOrders[0]=Assist.order("sort", true);
		assist.setOrder(whereOrders);

		setSeachFilter(assist, value);
		List<QualityTestExperimentalStandardvalueItem> result = qualityTestExperimentalStandardvalueItemDao.selectQualityTestExperimentalStandardvalueItem(assist);
		if (LOG.isDebugEnabled()) {
			LOG.debug("QualityTestExperimentalStandardvalue-->结果:", result);
		}
		Assist assistCount = new Assist();
		setSeachFilter(assistCount, value);
		int count = (int) qualityTestExperimentalStandardvalueItemDao.getQualityTestExperimentalStandardvalueItemRowCount(assistCount);

		LayUIPage ResultPage = new LayUIPage<QualityTestExperimentalStandardvalueItem>(0, "OK", count, result);
		return ResultPage.toJson();
	}



	@Override
	public String findOne(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentalStandardvalueItem的id获得QualityTestExperimentalStandardvalueItem对象-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		QualityTestExperimentalStandardvalueItem result = qualityTestExperimentalStandardvalueItemDao.selectQualityTestExperimentalStandardvalueItemById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentalStandardvalueItem的id获得QualityTestExperimentalStandardvalueItem对象-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String saveNotNull(QualityTestExperimentalStandardvalueItem value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行将QualityTestExperimentalStandardvalueItem中属性值不为null的数据保存到数据库-->失败:对象不能为空");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestExperimentalStandardvalueItemDao.insertNotNullQualityTestExperimentalStandardvalueItem(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行将QualityTestExperimentalStandardvalueItem中属性值不为null的数据保存到数据库-->结果:", result);
		}
		return resultFormat(C200, result);
	}
	@Override
	public String updateNotNullById(QualityTestExperimentalStandardvalueItem value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentalStandardvalueItem的id更新QualityTestExperimentalStandardvalueItem中属性不为null的数据-->失败:对象为null");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestExperimentalStandardvalueItemDao.updateNotNullQualityTestExperimentalStandardvalueItemById(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentalStandardvalueItem的id更新QualityTestExperimentalStandardvalueItem中属性不为null的数据-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String deleteById(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimentalStandardvalueItem的id删除QualityTestExperimentalStandardvalueItem-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestExperimentalStandardvalueItemDao.deleteQualityTestExperimentalStandardvalueItemById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimentalStandardvalueItem的id删除QualityTestExperimentalStandardvalueItem-->结果:", result);
		}
		return resultFormat(C200, result);
	}


}