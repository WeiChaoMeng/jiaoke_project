package com.jiaoke.qualitytest.service;
import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.QualityTestSamplingpage;

import java.util.List;


/**
 * QualityTestSamplingpage的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestSamplingpageService {
	/**
	 * 获得QualityTestSamplingpage数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */

	String find(QualityTestSamplingpage value);
	
	/**
	 * 通过QualityTestSamplingpage的id获得QualityTestSamplingpage对象
	 * 
	 * @param id
	 * @return
	 */
	String findOne(Integer id);
	
	/**
	 * 将QualityTestSamplingpage中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(QualityTestSamplingpage value);
	
	/**
	 * 通过QualityTestSamplingpage的id更新QualityTestSamplingpage中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	String updateNotNullById(QualityTestSamplingpage enti);
	
	/**
	 * 通过QualityTestSamplingpage的id删除QualityTestSamplingpage
	 * 
	 * @param id
	 * @return
	 */
	String deleteById(Integer id);

	/**
	 * 获得QualityTestSamplingpage数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 *
	 * @param id
	 * @return
	 */
	String confirmById(Integer id);

	/**
	 * 取样单台账
	 * @param value
	 * @return
	 */
	String reports(QualityTestSamplingpage value);
}
