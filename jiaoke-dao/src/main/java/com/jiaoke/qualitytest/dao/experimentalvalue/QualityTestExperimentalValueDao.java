package com.jiaoke.qualitytest.dao.experimentalvalue;
import java.util.List;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValue;

import org.apache.ibatis.annotations.Param;
/**
 * QualityTestExperimentalValue的Dao接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalValueDao {

	/**
	 * 获得QualityTestExperimentalValue数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getQualityTestExperimentalValueRowCount(Assist assist);
	
	/**
	 * 获得QualityTestExperimentalValue数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<QualityTestExperimentalValue> selectQualityTestExperimentalValue(Assist assist);
	/**
	 * 通过QualityTestExperimentalValue的id获得QualityTestExperimentalValue对象
	 * 
	 * @param id
	 * @return
	 */
	QualityTestExperimentalValue selectQualityTestExperimentalValueById(Integer id);
	
	/**
	 * 获得一个QualityTestExperimentalValue对象,以参数QualityTestExperimentalValue对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	QualityTestExperimentalValue selectQualityTestExperimentalValueObjSingle(QualityTestExperimentalValue obj);
	
	/**
	 * 获得一个QualityTestExperimentalValue对象,以参数QualityTestExperimentalValue对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<QualityTestExperimentalValue> selectQualityTestExperimentalValueByObj(QualityTestExperimentalValue obj);

	/**
	 * 插入QualityTestExperimentalValue到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalValue(QualityTestExperimentalValue value);
	
	/**
	 * 插入QualityTestExperimentalValue中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullQualityTestExperimentalValue(QualityTestExperimentalValue value);
	
	/**
	 * 批量插入QualityTestExperimentalValue到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalValueByBatch(List<QualityTestExperimentalValue> value);
	/**
	 * 通过QualityTestExperimentalValue的id删除QualityTestExperimentalValue
	 * 
	 * @param id
	 * @return
	 */
	int deleteQualityTestExperimentalValueById(Integer id);
	
	/**
	 * 通过辅助工具Assist的条件删除QualityTestExperimentalValue
	 * 
	 * @param assist
	 * @return
	 */
	int deleteQualityTestExperimentalValueByAssist(Assist assist);
	
	/**
	 * 通过QualityTestExperimentalValue的id更新QualityTestExperimentalValue中的数据,包括null值
	 * 
	 * @param enti
	 * @return
	 */
	int updateQualityTestExperimentalValueById(QualityTestExperimentalValue enti);
	
	/**
	 * 通过QualityTestExperimentalValue的id更新QualityTestExperimentalValue中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	int updateNotNullQualityTestExperimentalValueById(QualityTestExperimentalValue enti);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentalValue中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateQualityTestExperimentalValue(@Param("enti") QualityTestExperimentalValue value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentalValue中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullQualityTestExperimentalValue(@Param("enti") QualityTestExperimentalValue value, @Param("assist") Assist assist);
}