package com.jiaoke.qualitytest.service;
import java.util.List;

import com.jiaoke.qualitytest.bean.QualityTestMaterialDictionary;

/**
 * QualityTestMaterialDictionary的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestMaterialDictionaryService {
	/**
	 * 获得QualityTestMaterialDictionary数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(QualityTestMaterialDictionary value);
	
	/**
	 * 通过QualityTestMaterialDictionary的id获得QualityTestMaterialDictionary对象
	 * 
	 * @param id
	 * @return
	 */
	String findOne(Integer id);
	
	/**
	 * 将QualityTestMaterialDictionary中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(QualityTestMaterialDictionary value);
	
	/**
	 * 通过QualityTestMaterialDictionary的id更新QualityTestMaterialDictionary中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	String updateNotNullById(QualityTestMaterialDictionary enti);
	
	/**
	 * 通过QualityTestMaterialDictionary的id删除QualityTestMaterialDictionary
	 * 
	 * @param id
	 * @return
	 */
	String deleteById(Integer id);
}
