package com.jiaoke.qualitytest.service;
import java.util.List;

import com.jiaoke.qualitytest.bean.QualityTestOrderTicket;

/**
 * QualityTestOrderTicket的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestOrderTicketService {
	/**
	 * 获得QualityTestOrderTicket数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(QualityTestOrderTicket value);
	/**
	 * 获得QualityTestOrderTicket完成试验数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 *
	 * @return
	 */
	String findComplete(QualityTestOrderTicket value);


	/**
	 * 通过QualityTestOrderTicket的id获得QualityTestOrderTicket对象
	 * 
	 * @param id
	 * @return
	 */
	String findOne(Integer id);
	
	/**
	 * 将QualityTestOrderTicket中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(QualityTestOrderTicket value);
	
	/**
	 * 通过QualityTestOrderTicket的id更新QualityTestOrderTicket中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	String updateNotNullById(QualityTestOrderTicket enti);
	
	/**
	 * 通过QualityTestOrderTicket的id删除QualityTestOrderTicket
	 * 
	 * @param id
	 * @return
	 */
	String deleteById(Integer id);

	/**
	 * 添加试验
	 * @param id
	 * @param eID
	 * @return
	 */
	String addexp(Integer id,String eID);

	/**
	 * 委托单台账
	 * @param value
	 * @return
	 */
	String reports(QualityTestOrderTicket value);

}
