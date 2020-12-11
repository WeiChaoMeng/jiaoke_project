package com.jiaoke.qualitytest.service;
import java.util.List;

import com.jiaoke.qualitytest.bean.QualityTestExperimentDictionary;

/**
 * QualityTestExperimentDictionary的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentDictionaryService {
	/**
	 * 获得QualityTestExperimentDictionary数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(QualityTestExperimentDictionary value);
	
	/**
	 * 通过QualityTestExperimentDictionary的id获得QualityTestExperimentDictionary对象
	 * 
	 * @param id
	 * @return
	 */
	String findOne(Integer id);
	
	/**
	 * 将QualityTestExperimentDictionary中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(QualityTestExperimentDictionary value);
	
	/**
	 * 通过QualityTestExperimentDictionary的id更新QualityTestExperimentDictionary中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	String updateNotNullById(QualityTestExperimentDictionary enti);
	
	/**
	 * 通过QualityTestExperimentDictionary的id删除QualityTestExperimentDictionary
	 * 
	 * @param id
	 * @return
	 */
	String deleteById(Integer id);
}
