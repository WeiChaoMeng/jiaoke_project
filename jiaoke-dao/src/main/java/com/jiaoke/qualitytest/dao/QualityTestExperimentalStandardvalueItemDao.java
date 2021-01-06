package com.jiaoke.qualitytest.dao;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.QualityTestExperimentalStandardvalueItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * QualityTestExperimentalStandardvalueItem的Dao接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalStandardvalueItemDao {

	/**
	 * 获得QualityTestExperimentalStandardvalueItem数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getQualityTestExperimentalStandardvalueItemRowCount(Assist assist);
	
	/**
	 * 获得QualityTestExperimentalStandardvalueItem数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<QualityTestExperimentalStandardvalueItem> selectQualityTestExperimentalStandardvalueItem(Assist assist);
	/**
	 * 通过QualityTestExperimentalStandardvalueItem的id获得QualityTestExperimentalStandardvalueItem对象
	 * 
	 * @param id
	 * @return
	 */
	QualityTestExperimentalStandardvalueItem selectQualityTestExperimentalStandardvalueItemById(Integer id);
	
	/**
	 * 获得一个QualityTestExperimentalStandardvalueItem对象,以参数QualityTestExperimentalStandardvalueItem对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	QualityTestExperimentalStandardvalueItem selectQualityTestExperimentalStandardvalueItemObjSingle(QualityTestExperimentalStandardvalueItem obj);
	
	/**
	 * 获得一个QualityTestExperimentalStandardvalueItem对象,以参数QualityTestExperimentalStandardvalueItem对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<QualityTestExperimentalStandardvalueItem> selectQualityTestExperimentalStandardvalueItemByObj(QualityTestExperimentalStandardvalueItem obj);

	/**
	 * 插入QualityTestExperimentalStandardvalueItem到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalStandardvalueItem(QualityTestExperimentalStandardvalueItem value);
	
	/**
	 * 插入QualityTestExperimentalStandardvalueItem中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullQualityTestExperimentalStandardvalueItem(QualityTestExperimentalStandardvalueItem value);
	
	/**
	 * 批量插入QualityTestExperimentalStandardvalueItem到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalStandardvalueItemByBatch(List<QualityTestExperimentalStandardvalueItem> value);
	/**
	 * 通过QualityTestExperimentalStandardvalueItem的id删除QualityTestExperimentalStandardvalueItem
	 * 
	 * @param id
	 * @return
	 */
	int deleteQualityTestExperimentalStandardvalueItemById(Integer id);
	
	/**
	 * 通过辅助工具Assist的条件删除QualityTestExperimentalStandardvalueItem
	 * 
	 * @param assist
	 * @return
	 */
	int deleteQualityTestExperimentalStandardvalueItemByAssist(Assist assist);
	
	/**
	 * 通过QualityTestExperimentalStandardvalueItem的id更新QualityTestExperimentalStandardvalueItem中的数据,包括null值
	 * 
	 * @param enti
	 * @return
	 */
	int updateQualityTestExperimentalStandardvalueItemById(QualityTestExperimentalStandardvalueItem enti);
	
	/**
	 * 通过QualityTestExperimentalStandardvalueItem的id更新QualityTestExperimentalStandardvalueItem中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	int updateNotNullQualityTestExperimentalStandardvalueItemById(QualityTestExperimentalStandardvalueItem enti);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentalStandardvalueItem中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateQualityTestExperimentalStandardvalueItem(@Param("enti") QualityTestExperimentalStandardvalueItem value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentalStandardvalueItem中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullQualityTestExperimentalStandardvalueItem(@Param("enti") QualityTestExperimentalStandardvalueItem value, @Param("assist") Assist assist);
}