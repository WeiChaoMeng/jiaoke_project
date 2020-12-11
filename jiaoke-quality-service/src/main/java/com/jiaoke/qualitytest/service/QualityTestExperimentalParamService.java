package com.jiaoke.qualitytest.service;
import java.util.List;

import com.jiaoke.qualitytest.bean.QualityTestExperimentalParam;

/**
 * QualityTestExperimentalParam的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalParamService {
	/**
	 * 获得QualityTestExperimentalParam数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(QualityTestExperimentalParam value);
	
	/**
	 * 通过QualityTestExperimentalParam的id获得QualityTestExperimentalParam对象
	 * 
	 * @param id
	 * @return
	 */
	String findOne(Integer id);
	
	/**
	 * 将QualityTestExperimentalParam中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(QualityTestExperimentalParam value);
	
	/**
	 * 通过QualityTestExperimentalParam的id更新QualityTestExperimentalParam中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	String updateNotNullById(QualityTestExperimentalParam enti);
	
	/**
	 * 通过QualityTestExperimentalParam的id删除QualityTestExperimentalParam
	 * 
	 * @param id
	 * @return
	 */
	String deleteById(Integer id);

	/**
	 * 通过QualityTestExperimentalParam的id复制QualityTestExperimentalParam
	 *
	 * @param id
	 * @return
	 */
	String copyById(Integer id);

}
