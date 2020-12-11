package com.jiaoke.qualitytest.service;
import java.util.List;

import com.jiaoke.qualitytest.bean.QualityTestLabReport;

/**
 * QualityTestLabReport的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestLabReportService {
	/**
	 * 获得QualityTestLabReport数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(QualityTestLabReport value);
	
	/**
	 * 通过QualityTestLabReport的id获得QualityTestLabReport对象
	 * 
	 * @param id
	 * @return
	 */
	String findOne(String id);

	/**
	 *
	 * @param order_ticket_num
	 * @return
	 */
	String findbyTicketNum(String order_ticket_num);

	/**
	 *
	 * @param order_ticket_num
	 * @return
	 */
	QualityTestLabReport findOneByOrderTicketNum(String order_ticket_num);
	/**
	 * 将QualityTestLabReport中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(QualityTestLabReport value);
	
	/**
	 * 通过QualityTestLabReport的id更新QualityTestLabReport中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	String updateNotNullById(QualityTestLabReport enti);
	
	/**
	 * 通过QualityTestLabReport的id删除QualityTestLabReport
	 * 
	 * @param id
	 * @return
	 */
	String deleteById(String id);


}
