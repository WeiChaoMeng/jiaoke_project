package com.jiaoke.qualitytest.service.report;
import com.jiaoke.qualitytest.bean.report.VQualityTestReportXjlAvg;

import java.util.List;



/**
 * VQualityTestReportXjlAvg的服务接口
 * 
 * @author 
 *
 */
public interface VQualityTestReportXjlAvgService {
	/**
	 * 获得VQualityTestReportXjlAvg数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(VQualityTestReportXjlAvg value);
	
	// TODO 你的表中没有找到主键属性,你可以修改模板使用Assist来作为条件值做一些操作,比如用Assist来做删除与修改
	
	/**
	 * 将VQualityTestReportXjlAvg中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(VQualityTestReportXjlAvg value);
	
}
