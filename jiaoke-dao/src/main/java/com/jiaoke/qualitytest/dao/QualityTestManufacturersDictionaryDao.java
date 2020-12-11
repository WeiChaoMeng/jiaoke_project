package com.jiaoke.qualitytest.dao;
import java.util.List;


import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.QualityTestManufacturersDictionary;
import org.apache.ibatis.annotations.Param;
/**
 * QualityTestManufacturersDictionary的Dao接口
 * 
 * @author 
 *
 */
public interface QualityTestManufacturersDictionaryDao {

	/**
	 * 获得QualityTestManufacturersDictionary数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getQualityTestManufacturersDictionaryRowCount(Assist assist);
	
	/**
	 * 获得QualityTestManufacturersDictionary数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<QualityTestManufacturersDictionary> selectQualityTestManufacturersDictionary(Assist assist);
	/**
	 * 通过QualityTestManufacturersDictionary的id获得QualityTestManufacturersDictionary对象
	 * 
	 * @param id
	 * @return
	 */
	QualityTestManufacturersDictionary selectQualityTestManufacturersDictionaryById(Integer id);
	
	/**
	 * 获得一个QualityTestManufacturersDictionary对象,以参数QualityTestManufacturersDictionary对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	QualityTestManufacturersDictionary selectQualityTestManufacturersDictionaryObjSingle(QualityTestManufacturersDictionary obj);
	
	/**
	 * 获得一个QualityTestManufacturersDictionary对象,以参数QualityTestManufacturersDictionary对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<QualityTestManufacturersDictionary> selectQualityTestManufacturersDictionaryByObj(QualityTestManufacturersDictionary obj);

	/**
	 * 插入QualityTestManufacturersDictionary到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestManufacturersDictionary(QualityTestManufacturersDictionary value);
	
	/**
	 * 插入QualityTestManufacturersDictionary中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullQualityTestManufacturersDictionary(QualityTestManufacturersDictionary value);
	
	/**
	 * 批量插入QualityTestManufacturersDictionary到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestManufacturersDictionaryByBatch(List<QualityTestManufacturersDictionary> value);
	/**
	 * 通过QualityTestManufacturersDictionary的id删除QualityTestManufacturersDictionary
	 * 
	 * @param id
	 * @return
	 */
	int deleteQualityTestManufacturersDictionaryById(Integer id);
	
	/**
	 * 通过辅助工具Assist的条件删除QualityTestManufacturersDictionary
	 * 
	 * @param assist
	 * @return
	 */
	int deleteQualityTestManufacturersDictionaryByAssist(Assist assist);
	
	/**
	 * 通过QualityTestManufacturersDictionary的id更新QualityTestManufacturersDictionary中的数据,包括null值
	 * 
	 * @param enti
	 * @return
	 */
	int updateQualityTestManufacturersDictionaryById(QualityTestManufacturersDictionary enti);
	
	/**
	 * 通过QualityTestManufacturersDictionary的id更新QualityTestManufacturersDictionary中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	int updateNotNullQualityTestManufacturersDictionaryById(QualityTestManufacturersDictionary enti);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestManufacturersDictionary中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateQualityTestManufacturersDictionary(@Param("enti") QualityTestManufacturersDictionary value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestManufacturersDictionary中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullQualityTestManufacturersDictionary(@Param("enti") QualityTestManufacturersDictionary value, @Param("assist") Assist assist);
}