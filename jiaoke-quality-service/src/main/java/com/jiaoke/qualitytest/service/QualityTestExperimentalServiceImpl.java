package com.jiaoke.qualitytest.service;

import com.alibaba.fastjson.JSONObject;
import com.jiaoke.common.bean.Assist;
import com.jiaoke.common.bean.LayUIPage;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.qualitytest.bean.QualityTestExperimental;
import com.jiaoke.qualitytest.dao.QualityTestExperimentalDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
/**
 * QualityTestExperimental的服务接口的实现类
 * 
 * @author 
 *
 */
@Service
public class QualityTestExperimentalServiceImpl implements QualityTestExperimentalService {
	private final Logger LOG = LogManager.getLogger(this.getClass());

	@Autowired
	private QualityTestExperimentalDao qualityTestExperimentalDao;
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
	public void setSeachFilter(Assist assist, QualityTestExperimental value) {

		if (value == null) {
			assist.andGt("status", -1);
			return;
		}
		if (value.getNum() != null && !value.getNum().isEmpty()) {
			assist.andLike("num", "%" + value.getNum() + "%");
		}
		if (value.getMaterials() != null && !value.getMaterials().isEmpty()) {
			assist.andEq("materials",  value.getMaterials() );
		}
		if (value.getSpecification() != null && !value.getSpecification().isEmpty()) {
			assist.andLike("specification", "%" + value.getSpecification() + "%");
		}
		if (value.getManufacturers() != null && !value.getManufacturers().isEmpty()) {
			assist.andLike("manufacturers", "%" + value.getManufacturers() + "%");
		}
		if (value.getExperimentalId() != null && value.getExperimentalId()>0) {
			assist.andEq("experimental_id", value.getExperimentalId() );
		}
		if (value.getOrderTicketNum() != null && value.getOrderTicketNum().isEmpty()) {
			assist.andEq("order_ticket_num", value.getOrderTicketNum() );
		}
		if (value.getExperimentalResult() != null) {
			assist.andEq("experimental_result", value.getExperimentalResult() );
		}
		if (value.getBegindate() != null ) {
			assist.andGte("sampling_create_time", value.getBegindate());
		}if (value.getEnddate() != null ) {
			assist.andLte("sampling_create_time", value.getEnddate());
		}

		if (value.getStatus() != null && value.getStatus() >= 0) {
			assist.andEq("status", value.getStatus());
		} else {
			assist.andGt("status", -1);
		}
	}
	@Override
	public String find(QualityTestExperimental value) {
		//TODO这里可以做通过Assist做添加查询
		Assist assist = new Assist();
		assist.setStartRow((value.getPage() - 1) * value.getLimit());
		assist.setRowSize(value.getLimit());
		setSeachFilter(assist, value);
		assist.setOrder(Assist.order("create_time", false));

		List<QualityTestExperimental> result = qualityTestExperimentalDao.selectQualityTestExperimental(assist);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行获取QualityTestSamplingpage数据集-->结果:", result);
		}

		Assist assistCount = new Assist();
		setSeachFilter(assistCount, value);
		int count = (int) qualityTestExperimentalDao.getQualityTestExperimentalRowCount(assistCount);

		LayUIPage ResultPage = new LayUIPage<QualityTestExperimental>(0, "OK", count, result);
		return ResultPage.toJson();

	}
	@Override
	public String findOne(Integer id) {
		if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimental的id获得QualityTestExperimental对象-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		QualityTestExperimental result = qualityTestExperimentalDao.selectQualityTestExperimentalById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimental的id获得QualityTestExperimental对象-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String saveNotNull(QualityTestExperimental value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行将QualityTestExperimental中属性值不为null的数据保存到数据库-->失败:对象不能为空");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestExperimentalDao.insertNotNullQualityTestExperimental(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行将QualityTestExperimental中属性值不为null的数据保存到数据库-->结果:", result);
		}
		return resultFormat(C200, result);
	}
	@Override
	public String updateNotNullById(QualityTestExperimental value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimental的id更新QualityTestExperimental中属性不为null的数据-->失败:对象为null");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestExperimentalDao.updateNotNullQualityTestExperimentalById(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimental的id更新QualityTestExperimental中属性不为null的数据-->结果:", result);
		}
		return resultFormat(C200, result);
	}

	@Override
	public String deleteById(Integer id) {
		/*if (id == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行通过QualityTestExperimental的id删除QualityTestExperimental-->失败:id不能为空");
			}
			return resultFormat(C412, null);
		}
		int result = qualityTestExperimentalDao.deleteQualityTestExperimentalById(id);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestExperimental的id删除QualityTestExperimental-->结果:", result);
		}
		return resultFormat(C200, result);*/
		QualityTestExperimental value = new QualityTestExperimental();
		value.setID(id);
		value.setStatus(-1);
		UserInfo user = (UserInfo) SecurityUtils.getSubject().getPrincipal();
		value.setDelUser(user.getUsername());
		value.setDelUserid(user.getId());
		value.setDelTime(new Date());
		int result = qualityTestExperimentalDao.updateNotNullQualityTestExperimentalById(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行通过QualityTestSamplingpage的id删除QualityTestSamplingpage-->结果:", result);
		}
		return resultFormat(C200, result);

	}


}