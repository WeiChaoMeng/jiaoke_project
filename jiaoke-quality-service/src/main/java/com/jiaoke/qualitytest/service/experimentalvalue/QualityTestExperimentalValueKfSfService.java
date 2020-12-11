package com.jiaoke.qualitytest.service.experimentalvalue;
import java.util.List;

import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueKfSf;

/**
 * QualityTestExperimentalValueKfSf的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalValueKfSfService {
	/**
	 * 获得QualityTestExperimentalValueKfSf数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(QualityTestExperimentalValueKfSf value);
	
	/**
	 * 通过QualityTestExperimentalValueKfSf的id获得QualityTestExperimentalValueKfSf对象
	 * 
	 * @param id
	 * @return
	 */
	String findOne(Integer id);
	
	/**
	 * 将QualityTestExperimentalValueKfSf中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(QualityTestExperimentalValueKfSf value);
	
	/**
	 * 通过QualityTestExperimentalValueKfSf的id更新QualityTestExperimentalValueKfSf中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	String updateNotNullById(QualityTestExperimentalValueKfSf enti);
	
	/**
	 * 通过QualityTestExperimentalValueKfSf的id删除QualityTestExperimentalValueKfSf
	 * 
	 * @param id
	 * @return
	 */
	String deleteById(Integer id);
}
