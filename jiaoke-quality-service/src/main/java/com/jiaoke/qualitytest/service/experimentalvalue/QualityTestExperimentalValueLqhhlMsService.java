package com.jiaoke.qualitytest.service.experimentalvalue;
import java.util.List;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueLqhhlMs;

/**
 * QualityTestExperimentalValueLqhhlMs的服务接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalValueLqhhlMsService {
	/**
	 * 获得QualityTestExperimentalValueLqhhlMs数据集,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @return
	 */
	String find(QualityTestExperimentalValueLqhhlMs value);
	
	/**
	 * 通过QualityTestExperimentalValueLqhhlMs的id获得QualityTestExperimentalValueLqhhlMs对象
	 * 
	 * @param id
	 * @return
	 */
	String findOne(Integer id);
	
	/**
	 * 将QualityTestExperimentalValueLqhhlMs中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	String saveNotNull(QualityTestExperimentalValueLqhhlMs value);
	
	/**
	 * 通过QualityTestExperimentalValueLqhhlMs的id更新QualityTestExperimentalValueLqhhlMs中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	String updateNotNullById(QualityTestExperimentalValueLqhhlMs enti);
	
	/**
	 * 通过QualityTestExperimentalValueLqhhlMs的id删除QualityTestExperimentalValueLqhhlMs
	 * 
	 * @param id
	 * @return
	 */
	String deleteById(Integer id);
}
