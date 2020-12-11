package com.jiaoke.qualitytest.service.experimentalvalue;
import java.util.List;

import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueXjlSf;

/**
 * QualityTestExperimentalValueXjlSf的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalValueXjlSfService {
	/**
	 * 获得QualityTestExperimentalValueXjlSf数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(QualityTestExperimentalValueXjlSf value);
	
	/**
	 * 通过QualityTestExperimentalValueXjlSf的id获得QualityTestExperimentalValueXjlSf对象
	 * 
	 * @param id
	 * @return
	 */
	String findOne(Integer id);
	
	/**
	 * 将QualityTestExperimentalValueXjlSf中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(QualityTestExperimentalValueXjlSf value);
	
	/**
	 * 通过QualityTestExperimentalValueXjlSf的id更新QualityTestExperimentalValueXjlSf中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	String updateNotNullById(QualityTestExperimentalValueXjlSf enti);
	
	/**
	 * 通过QualityTestExperimentalValueXjlSf的id删除QualityTestExperimentalValueXjlSf
	 * 
	 * @param id
	 * @return
	 */
	String deleteById(Integer id);
}
