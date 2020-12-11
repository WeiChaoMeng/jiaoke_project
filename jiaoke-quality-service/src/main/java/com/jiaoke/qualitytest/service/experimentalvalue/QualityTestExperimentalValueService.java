package com.jiaoke.qualitytest.service.experimentalvalue;
import java.util.List;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValue;

/**
 * QualityTestExperimentalValue的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalValueService {
	/**
	 * 获得QualityTestExperimentalValue数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(QualityTestExperimentalValue value);
	
	/**
	 * 通过QualityTestExperimentalValue的id获得QualityTestExperimentalValue对象
	 * 
	 * @param id
	 * @return
	 */
	String findOne(Integer id);
	
	/**
	 * 将QualityTestExperimentalValue中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(QualityTestExperimentalValue value);
	
	/**
	 * 通过QualityTestExperimentalValue的id更新QualityTestExperimentalValue中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	String updateNotNullById(QualityTestExperimentalValue enti);
	
	/**
	 * 通过QualityTestExperimentalValue的id删除QualityTestExperimentalValue
	 * 
	 * @param id
	 * @return
	 */
	String deleteById(Integer id);
}
