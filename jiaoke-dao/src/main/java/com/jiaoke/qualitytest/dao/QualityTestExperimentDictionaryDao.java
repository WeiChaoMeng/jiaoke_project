package com.jiaoke.qualitytest.dao;
import java.util.List;



import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.QualityTestExperimentDictionary;
import org.apache.ibatis.annotations.Param;
/**
 * QualityTestExperimentDictionary的Dao接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentDictionaryDao {

	/**
	 * 获得QualityTestExperimentDictionary数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getQualityTestExperimentDictionaryRowCount(Assist assist);
	
	/**
	 * 获得QualityTestExperimentDictionary数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<QualityTestExperimentDictionary> selectQualityTestExperimentDictionary(Assist assist);
	/**
	 * 通过QualityTestExperimentDictionary的id获得QualityTestExperimentDictionary对象
	 * 
	 * @param id
	 * @return
	 */
	QualityTestExperimentDictionary selectQualityTestExperimentDictionaryById(Integer id);
	
	/**
	 * 获得一个QualityTestExperimentDictionary对象,以参数QualityTestExperimentDictionary对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	QualityTestExperimentDictionary selectQualityTestExperimentDictionaryObjSingle(QualityTestExperimentDictionary obj);
	
	/**
	 * 获得一个QualityTestExperimentDictionary对象,以参数QualityTestExperimentDictionary对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<QualityTestExperimentDictionary> selectQualityTestExperimentDictionaryByObj(QualityTestExperimentDictionary obj);

	/**
	 * 插入QualityTestExperimentDictionary到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentDictionary(QualityTestExperimentDictionary value);
	
	/**
	 * 插入QualityTestExperimentDictionary中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullQualityTestExperimentDictionary(QualityTestExperimentDictionary value);
	
	/**
	 * 批量插入QualityTestExperimentDictionary到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentDictionaryByBatch(List<QualityTestExperimentDictionary> value);
	/**
	 * 通过QualityTestExperimentDictionary的id删除QualityTestExperimentDictionary
	 * 
	 * @param id
	 * @return
	 */
	int deleteQualityTestExperimentDictionaryById(Integer id);
	
	/**
	 * 通过辅助工具Assist的条件删除QualityTestExperimentDictionary
	 * 
	 * @param assist
	 * @return
	 */
	int deleteQualityTestExperimentDictionaryByAssist(Assist assist);
	
	/**
	 * 通过QualityTestExperimentDictionary的id更新QualityTestExperimentDictionary中的数据,包括null值
	 * 
	 * @param enti
	 * @return
	 */
	int updateQualityTestExperimentDictionaryById(QualityTestExperimentDictionary enti);
	
	/**
	 * 通过QualityTestExperimentDictionary的id更新QualityTestExperimentDictionary中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	int updateNotNullQualityTestExperimentDictionaryById(QualityTestExperimentDictionary enti);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentDictionary中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateQualityTestExperimentDictionary(@Param("enti") QualityTestExperimentDictionary value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentDictionary中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullQualityTestExperimentDictionary(@Param("enti") QualityTestExperimentDictionary value, @Param("assist") Assist assist);
}