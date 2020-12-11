package com.jiaoke.qualitytest.service;
import com.jiaoke.qualitytest.bean.QualityTestExperimentalStandardvalue;

/**
 * QualityTestExperimentalStandardvalue的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalStandardvalueService {
	/**
	 * 获得QualityTestExperimentalStandardvalue数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(QualityTestExperimentalStandardvalue value);
	
	/**
	 * 通过QualityTestExperimentalStandardvalue的id获得QualityTestExperimentalStandardvalue对象
	 * 
	 * @param id
	 * @return
	 */
	String findOne(Integer id);
	
	/**
	 * 将QualityTestExperimentalStandardvalue中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(QualityTestExperimentalStandardvalue value);
	
	/**
	 * 通过QualityTestExperimentalStandardvalue的id更新QualityTestExperimentalStandardvalue中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	String updateNotNullById(QualityTestExperimentalStandardvalue enti);
	
	/**
	 * 通过QualityTestExperimentalStandardvalue的id删除QualityTestExperimentalStandardvalue
	 * 
	 * @param id
	 * @return
	 */
	String deleteById(Integer id);
}
