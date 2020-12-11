package com.jiaoke.qualitytest.service;
import java.util.List;

import com.jiaoke.qualitytest.bean.QualityTestSpecificationDictionary;

/**
 * QualityTestSpecificationDictionary的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestSpecificationDictionaryService {
	/**
	 * 获得QualityTestSpecificationDictionary数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(QualityTestSpecificationDictionary value);
	
	/**
	 * 通过QualityTestSpecificationDictionary的id获得QualityTestSpecificationDictionary对象
	 * 
	 * @param id
	 * @return
	 */
	String findOne(Integer id);
	
	/**
	 * 将QualityTestSpecificationDictionary中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(QualityTestSpecificationDictionary value);
	
	/**
	 * 通过QualityTestSpecificationDictionary的id更新QualityTestSpecificationDictionary中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	String updateNotNullById(QualityTestSpecificationDictionary enti);
	
	/**
	 * 通过QualityTestSpecificationDictionary的id删除QualityTestSpecificationDictionary
	 * 
	 * @param id
	 * @return
	 */
	String deleteById(Integer id);
}
