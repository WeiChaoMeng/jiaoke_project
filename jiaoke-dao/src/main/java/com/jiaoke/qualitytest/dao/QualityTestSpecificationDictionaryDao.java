package com.jiaoke.qualitytest.dao;
import java.util.List;


import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.QualityTestSpecificationDictionary;
import org.apache.ibatis.annotations.Param;
/**
 * QualityTestSpecificationDictionary的Dao接口
 * 
 * @author 
 *
 */
public interface QualityTestSpecificationDictionaryDao {

	/**
	 * 获得QualityTestSpecificationDictionary数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getQualityTestSpecificationDictionaryRowCount(Assist assist);
	
	/**
	 * 获得QualityTestSpecificationDictionary数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<QualityTestSpecificationDictionary> selectQualityTestSpecificationDictionary(Assist assist);
	/**
	 * 通过QualityTestSpecificationDictionary的id获得QualityTestSpecificationDictionary对象
	 * 
	 * @param id
	 * @return
	 */
	QualityTestSpecificationDictionary selectQualityTestSpecificationDictionaryById(Integer id);
	
	/**
	 * 获得一个QualityTestSpecificationDictionary对象,以参数QualityTestSpecificationDictionary对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	QualityTestSpecificationDictionary selectQualityTestSpecificationDictionaryObjSingle(QualityTestSpecificationDictionary obj);
	
	/**
	 * 获得一个QualityTestSpecificationDictionary对象,以参数QualityTestSpecificationDictionary对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<QualityTestSpecificationDictionary> selectQualityTestSpecificationDictionaryByObj(QualityTestSpecificationDictionary obj);

	/**
	 * 插入QualityTestSpecificationDictionary到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestSpecificationDictionary(QualityTestSpecificationDictionary value);
	
	/**
	 * 插入QualityTestSpecificationDictionary中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullQualityTestSpecificationDictionary(QualityTestSpecificationDictionary value);
	
	/**
	 * 批量插入QualityTestSpecificationDictionary到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestSpecificationDictionaryByBatch(List<QualityTestSpecificationDictionary> value);
	/**
	 * 通过QualityTestSpecificationDictionary的id删除QualityTestSpecificationDictionary
	 * 
	 * @param id
	 * @return
	 */
	int deleteQualityTestSpecificationDictionaryById(Integer id);
	
	/**
	 * 通过辅助工具Assist的条件删除QualityTestSpecificationDictionary
	 * 
	 * @param assist
	 * @return
	 */
	int deleteQualityTestSpecificationDictionaryByAssist(Assist assist);
	
	/**
	 * 通过QualityTestSpecificationDictionary的id更新QualityTestSpecificationDictionary中的数据,包括null值
	 * 
	 * @param enti
	 * @return
	 */
	int updateQualityTestSpecificationDictionaryById(QualityTestSpecificationDictionary enti);
	
	/**
	 * 通过QualityTestSpecificationDictionary的id更新QualityTestSpecificationDictionary中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	int updateNotNullQualityTestSpecificationDictionaryById(QualityTestSpecificationDictionary enti);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestSpecificationDictionary中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateQualityTestSpecificationDictionary(@Param("enti") QualityTestSpecificationDictionary value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestSpecificationDictionary中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullQualityTestSpecificationDictionary(@Param("enti") QualityTestSpecificationDictionary value, @Param("assist") Assist assist);
}