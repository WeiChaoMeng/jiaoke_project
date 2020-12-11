package com.jiaoke.qualitytest.service.report;
import java.util.Date;
import java.util.List;

import com.jiake.utils.DateUtil;
import com.jiaoke.common.bean.Assist;
import com.jiaoke.common.bean.LayUIPage;
import com.jiaoke.qualitytest.bean.report.VQualityTestReportCjl;
import com.jiaoke.qualitytest.bean.report.VQualityTestReportXjl;
import com.jiaoke.qualitytest.dao.report.VQualityTestReportCjlDao;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;;
/**
 * VQualityTestReportCjl的服务接口的实现类
 * 
 * @author 
 *
 */
@Service
public class VQualityTestReportCjlServiceImpl implements VQualityTestReportCjlService {
	private final Logger LOG = LogManager.getLogger(this.getClass());

	@Autowired
	private VQualityTestReportCjlDao vQualityTestReportCjlDao;
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
	public void setSeachFilter(Assist assist, VQualityTestReportCjl value) {
		if (value.getSpecification() != null && !value.getSpecification().isEmpty()) {
			assist.andLike("specification", "%" + value.getSpecification() + "%");
		}
		if (value.getManufacturers() != null && !value.getManufacturers().isEmpty()) {
			assist.andLike("manufacturers", "%" + value.getManufacturers() + "%");
		}
		if (value.getBegindate() != null ) {
			assist.andGte("create_time", value.getBegindate());
		}if (value.getEnddate() != null ) {
			assist.andLte("create_time", value.getEnddate());
		}
		if (value.getBegindate()==null && value.getEnddate()==null)
		{
			assist.andGte("create_time", DateUtil.dateConvertYYYYMMDDHHMMSS(DateUtils.addDays(new Date(), -30)));
			assist.andLte("create_time", DateUtil.dateConvertYYYYMMDDHHMMSS(new Date()));
		}
		assist.setOrder(Assist.order("create_time", false));
	}
	@Override
	public String find(VQualityTestReportCjl value) {
		//TODO这里可以做通过Assist做添加查询
		Assist assist = new Assist();
		if (value.getPage()!=null)
		{
			assist.setStartRow((value.getPage() - 1) * value.getLimit());
			assist.setRowSize(value.getLimit());
		}
		setSeachFilter(assist, value);
		List<VQualityTestReportCjl> result = vQualityTestReportCjlDao.selectVQualityTestReportCjl(assist);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行获取VQualityTestReportKf数据集-->结果:", result);
		}
		Assist assistCount = new Assist();
		setSeachFilter(assistCount, value);
		int count = (int) vQualityTestReportCjlDao.getVQualityTestReportCjlRowCount(assistCount);

		LayUIPage ResultPage = new LayUIPage<VQualityTestReportCjl>(0, "OK", count, result);
		return ResultPage.toJson();
	}


	@Override
	public String saveNotNull(VQualityTestReportCjl value) {
		if (value == null) {
			if (LOG.isDebugEnabled()) {
				LOG.debug("执行将VQualityTestReportCjl中属性值不为null的数据保存到数据库-->失败:对象不能为空");
			}
			return resultFormat(C412, null);
		}
		int result = vQualityTestReportCjlDao.insertNotNullVQualityTestReportCjl(value);
		if (LOG.isDebugEnabled()) {
			LOG.debug("执行将VQualityTestReportCjl中属性值不为null的数据保存到数据库-->结果:", result);
		}
		return resultFormat(C200, result);
	}


}