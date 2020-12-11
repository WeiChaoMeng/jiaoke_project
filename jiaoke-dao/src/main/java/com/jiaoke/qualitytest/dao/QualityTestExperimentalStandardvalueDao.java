package com.jiaoke.qualitytest.dao;
import java.util.List;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.QualityTestExperimentalStandardvalue;

import org.apache.ibatis.annotations.Param;
/**
 * QualityTestExperimentalStandardvalue的Dao接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalStandardvalueDao {

	/**
	 * 获得QualityTestExperimentalStandardvalue数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getQualityTestExperimentalStandardvalueRowCount(Assist assist);
	
	/**
	 * 获得QualityTestExperimentalStandardvalue数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<QualityTestExperimentalStandardvalue> selectQualityTestExperimentalStandardvalue(Assist assist);
	/**
	 * 通过QualityTestExperimentalStandardvalue的id获得QualityTestExperimentalStandardvalue对象
	 * 
	 * @param id
	 * @return
	 */
	QualityTestExperimentalStandardvalue selectQualityTestExperimentalStandardvalueById(Integer id);
	
	/**
	 * 获得一个QualityTestExperimentalStandardvalue对象,以参数QualityTestExperimentalStandardvalue对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	QualityTestExperimentalStandardvalue selectQualityTestExperimentalStandardvalueObjSingle(QualityTestExperimentalStandardvalue obj);
	
	/**
	 * 获得一个QualityTestExperimentalStandardvalue对象,以参数QualityTestExperimentalStandardvalue对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<QualityTestExperimentalStandardvalue> selectQualityTestExperimentalStandardvalueByObj(QualityTestExperimentalStandardvalue obj);

	/**
	 * 插入QualityTestExperimentalStandardvalue到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalStandardvalue(QualityTestExperimentalStandardvalue value);
	
	/**
	 * 插入QualityTestExperimentalStandardvalue中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullQualityTestExperimentalStandardvalue(QualityTestExperimentalStandardvalue value);
	
	/**
	 * 批量插入QualityTestExperimentalStandardvalue到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalStandardvalueByBatch(List<QualityTestExperimentalStandardvalue> value);
	/**
	 * 通过QualityTestExperimentalStandardvalue的id删除QualityTestExperimentalStandardvalue
	 * 
	 * @param id
	 * @return
	 */
	int deleteQualityTestExperimentalStandardvalueById(Integer id);
	
	/**
	 * 通过辅助工具Assist的条件删除QualityTestExperimentalStandardvalue
	 * 
	 * @param assist
	 * @return
	 */
	int deleteQualityTestExperimentalStandardvalueByAssist(Assist assist);
	
	/**
	 * 通过QualityTestExperimentalStandardvalue的id更新QualityTestExperimentalStandardvalue中的数据,包括null值
	 * 
	 * @param enti
	 * @return
	 */
	int updateQualityTestExperimentalStandardvalueById(QualityTestExperimentalStandardvalue enti);
	
	/**
	 * 通过QualityTestExperimentalStandardvalue的id更新QualityTestExperimentalStandardvalue中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	int updateNotNullQualityTestExperimentalStandardvalueById(QualityTestExperimentalStandardvalue enti);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentalStandardvalue中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateQualityTestExperimentalStandardvalue(@Param("enti") QualityTestExperimentalStandardvalue value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentalStandardvalue中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullQualityTestExperimentalStandardvalue(@Param("enti") QualityTestExperimentalStandardvalue value, @Param("assist") Assist assist);
}