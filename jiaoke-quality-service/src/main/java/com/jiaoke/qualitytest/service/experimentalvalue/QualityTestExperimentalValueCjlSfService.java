package com.jiaoke.qualitytest.service.experimentalvalue;
import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueCjlSf;

import java.util.List;



/**
 * QualityTestExperimentalValueCjlSf的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalValueCjlSfService {
	/**
	 * 获得QualityTestExperimentalValueCjlSf数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(QualityTestExperimentalValueCjlSf value);
	
	/**
	 * 通过QualityTestExperimentalValueCjlSf的id获得QualityTestExperimentalValueCjlSf对象
	 * 
	 * @param id
	 * @return
	 */
	String findOne(Integer id);
	
	/**
	 * 将QualityTestExperimentalValueCjlSf中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(QualityTestExperimentalValueCjlSf value);
	
	/**
	 * 通过QualityTestExperimentalValueCjlSf的id更新QualityTestExperimentalValueCjlSf中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	String updateNotNullById(QualityTestExperimentalValueCjlSf enti);
	
	/**
	 * 通过QualityTestExperimentalValueCjlSf的id删除QualityTestExperimentalValueCjlSf
	 * 
	 * @param id
	 * @return
	 */
	String deleteById(Integer id);
}
