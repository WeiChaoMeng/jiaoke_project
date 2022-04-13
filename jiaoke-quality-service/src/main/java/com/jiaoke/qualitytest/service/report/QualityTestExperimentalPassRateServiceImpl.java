package com.jiaoke.qualitytest.service.report;

import com.alibaba.fastjson.JSONObject;
import com.jiake.utils.DateUtil;
import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.QualityTestExperimental;
import com.jiaoke.qualitytest.bean.report.QualityTestExperimentalPassRate;
import com.jiaoke.qualitytest.dao.report.QualityTestExperimentalPassRateDao;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
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
public class QualityTestExperimentalPassRateServiceImpl implements QualityTestExperimentalPassRateService {
	private final Logger LOG = LogManager.getLogger(this.getClass());

	@Autowired
	private QualityTestExperimentalPassRateDao qualityTestExperimentalPassRatelDao;
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
		if (value.getMaterials() != null && !value.getMaterials().isEmpty()) {
			assist.andEq("materials", value.getMaterials() );
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
		if (value.getBegindate() != null ) {
			assist.andGte("sampling_create_time", value.getBegindate());
		}if (value.getEnddate() != null ) {
			assist.andLte("sampling_create_time", value.getEnddate());
		}
		if (value.getBegindate()==null && value.getEnddate()==null)
		{
			assist.andGte("sampling_create_time", DateUtil.dateConvertYYYYMMDDHHMMSS(DateUtils.addDays(new Date(), -30)));
			assist.andLte("sampling_create_time", DateUtil.dateConvertYYYYMMDDHHMMSS(new Date()));
		}

		assist.andGte("experiment_status", 1);
		//assist.andEq("experiment_status", 3);


	}
	@Override
	public String find(QualityTestExperimental value) {
		//TODO这里可以做通过Assist做添加查询
		Assist assist = new Assist();
		assist.setStartRow(1);
		assist.setRowSize(1000);
		setSeachFilter(assist, value);
		assist.setOrder(Assist.order("materials", false));

		List<QualityTestExperimentalPassRate> result = qualityTestExperimentalPassRatelDao.selectQualityTestExperimentalPassRate_materials(assist);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行获取QualityTestSamplingpage数据集-->结果:", result);
		}
		return resultFormat(C200, result);
	}


	public void setSeachFilter2(Assist assist, QualityTestExperimental value) {
		if (value.getMaterials() != null && !value.getMaterials().isEmpty()) {
			assist.andEq("materials", value.getMaterials() );
		}
		if (value.getSpecification() != null && !value.getSpecification().isEmpty()) {
			assist.andLike("specification", "%" + value.getSpecification() + "%");
		}
		if (value.getManufacturers() != null && !value.getManufacturers().isEmpty()) {
			assist.andLike("manufacturers", "%" + value.getManufacturers() + "%");
		}

		if (value.getBegindate() != null ) {
			assist.andGte("sampling_create_time", DateUtil.dateConvertYYYYMMDDHHMMSS(value.getBegindate()));
		}if (value.getEnddate() != null ) {
			assist.andLte("sampling_create_time", DateUtil.dateConvertYYYYMMDDHHMMSS(value.getEnddate()));
		}
		if (value.getBegindate()==null && value.getEnddate()==null)
		{
			assist.andGte("sampling_create_time", DateUtil.dateConvertYYYYMMDDHHMMSS(DateUtils.addDays(new Date(), -30)));
			assist.andLte("sampling_create_time", DateUtil.dateConvertYYYYMMDDHHMMSS(new Date()));
		}
		assist.andEq("experimental_result", -1);

	}
	@Override
	public String find_experimental(QualityTestExperimental value) {
		//TODO这里可以做通过Assist做添加查询
		Assist assist = new Assist();
		assist.setStartRow(1);
		assist.setRowSize(1000);
		setSeachFilter2(assist, value);
		assist.setOrder(Assist.order("experimental_name", false));

		List<QualityTestExperimentalPassRate> result = qualityTestExperimentalPassRatelDao.selectQualityTestExperimentalPassRate_experimental(assist);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行获取QualityTestSamplingpage数据集-->结果:", result);
		}
		return resultFormat(C200, result);
	}



}