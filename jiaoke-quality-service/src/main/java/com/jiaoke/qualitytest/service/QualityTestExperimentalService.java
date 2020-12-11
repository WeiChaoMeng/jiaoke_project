package com.jiaoke.qualitytest.service;
import java.util.List;

import com.jiaoke.qualitytest.bean.QualityTestExperimental;

/**
 * QualityTestExperimental的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalService {
	/**
	 * 获得QualityTestExperimental数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(QualityTestExperimental value);
	
	/**
	 * 通过QualityTestExperimental的id获得QualityTestExperimental对象
	 * 
	 * @param id
	 * @return
	 */
	String findOne(Integer id);
	
	/**
	 * 将QualityTestExperimental中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(QualityTestExperimental value);
	
	/**
	 * 通过QualityTestExperimental的id更新QualityTestExperimental中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	String updateNotNullById(QualityTestExperimental enti);
	
	/**
	 * 通过QualityTestExperimental的id删除QualityTestExperimental
	 * 
	 * @param id
	 * @return
	 */
	String deleteById(Integer id);
}
