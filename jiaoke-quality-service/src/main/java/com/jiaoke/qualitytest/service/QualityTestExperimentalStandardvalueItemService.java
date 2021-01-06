package com.jiaoke.qualitytest.service;

import com.jiaoke.qualitytest.bean.QualityTestExperimentalStandardvalueItem;

/**
 * QualityTestExperimentalStandardvalueItem的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalStandardvalueItemService {
	/**
	 * 获得QualityTestExperimentalStandardvalueItem数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(QualityTestExperimentalStandardvalueItem value);
	
	/**
	 * 通过QualityTestExperimentalStandardvalueItem的id获得QualityTestExperimentalStandardvalueItem对象
	 * 
	 * @param id
	 * @return
	 */
	String findOne(Integer id);
	
	/**
	 * 将QualityTestExperimentalStandardvalueItem中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(QualityTestExperimentalStandardvalueItem value);
	
	/**
	 * 通过QualityTestExperimentalStandardvalueItem的id更新QualityTestExperimentalStandardvalueItem中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	String updateNotNullById(QualityTestExperimentalStandardvalueItem enti);
	
	/**
	 * 通过QualityTestExperimentalStandardvalueItem的id删除QualityTestExperimentalStandardvalueItem
	 * 
	 * @param id
	 * @return
	 */
	String deleteById(Integer id);
}
