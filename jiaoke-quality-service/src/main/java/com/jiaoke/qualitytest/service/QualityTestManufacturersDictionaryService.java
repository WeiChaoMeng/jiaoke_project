package com.jiaoke.qualitytest.service;
import java.util.List;

import com.jiaoke.qualitytest.bean.QualityTestManufacturersDictionary;

/**
 * QualityTestManufacturersDictionary的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestManufacturersDictionaryService {
	/**
	 * 获得QualityTestManufacturersDictionary数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(QualityTestManufacturersDictionary value);
	
	/**
	 * 通过QualityTestManufacturersDictionary的id获得QualityTestManufacturersDictionary对象
	 * 
	 * @param id
	 * @return
	 */
	String findOne(Integer id);
	
	/**
	 * 将QualityTestManufacturersDictionary中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(QualityTestManufacturersDictionary value);
	
	/**
	 * 通过QualityTestManufacturersDictionary的id更新QualityTestManufacturersDictionary中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	String updateNotNullById(QualityTestManufacturersDictionary enti);
	
	/**
	 * 通过QualityTestManufacturersDictionary的id删除QualityTestManufacturersDictionary
	 * 
	 * @param id
	 * @return
	 */
	String deleteById(Integer id);
}
