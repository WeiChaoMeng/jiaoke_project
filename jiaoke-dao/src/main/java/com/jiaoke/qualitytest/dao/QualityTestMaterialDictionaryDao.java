package com.jiaoke.qualitytest.dao;
import java.util.List;



import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.QualityTestMaterialDictionary;
import org.apache.ibatis.annotations.Param;
/**
 * QualityTestMaterialDictionary的Dao接口
 * 
 * @author 
 *
 */
public interface QualityTestMaterialDictionaryDao {

	/**
	 * 获得QualityTestMaterialDictionary数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getQualityTestMaterialDictionaryRowCount(Assist assist);
	
	/**
	 * 获得QualityTestMaterialDictionary数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<QualityTestMaterialDictionary> selectQualityTestMaterialDictionary(Assist assist);
	/**
	 * 通过QualityTestMaterialDictionary的id获得QualityTestMaterialDictionary对象
	 * 
	 * @param id
	 * @return
	 */
	QualityTestMaterialDictionary selectQualityTestMaterialDictionaryById(Integer id);
	
	/**
	 * 获得一个QualityTestMaterialDictionary对象,以参数QualityTestMaterialDictionary对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	QualityTestMaterialDictionary selectQualityTestMaterialDictionaryObjSingle(QualityTestMaterialDictionary obj);
	
	/**
	 * 获得一个QualityTestMaterialDictionary对象,以参数QualityTestMaterialDictionary对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<QualityTestMaterialDictionary> selectQualityTestMaterialDictionaryByObj(QualityTestMaterialDictionary obj);

	/**
	 * 插入QualityTestMaterialDictionary到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestMaterialDictionary(QualityTestMaterialDictionary value);
	
	/**
	 * 插入QualityTestMaterialDictionary中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullQualityTestMaterialDictionary(QualityTestMaterialDictionary value);
	
	/**
	 * 批量插入QualityTestMaterialDictionary到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestMaterialDictionaryByBatch(List<QualityTestMaterialDictionary> value);
	/**
	 * 通过QualityTestMaterialDictionary的id删除QualityTestMaterialDictionary
	 * 
	 * @param id
	 * @return
	 */
	int deleteQualityTestMaterialDictionaryById(Integer id);
	
	/**
	 * 通过辅助工具Assist的条件删除QualityTestMaterialDictionary
	 * 
	 * @param assist
	 * @return
	 */
	int deleteQualityTestMaterialDictionaryByAssist(Assist assist);
	
	/**
	 * 通过QualityTestMaterialDictionary的id更新QualityTestMaterialDictionary中的数据,包括null值
	 * 
	 * @param enti
	 * @return
	 */
	int updateQualityTestMaterialDictionaryById(QualityTestMaterialDictionary enti);
	
	/**
	 * 通过QualityTestMaterialDictionary的id更新QualityTestMaterialDictionary中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	int updateNotNullQualityTestMaterialDictionaryById(QualityTestMaterialDictionary enti);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestMaterialDictionary中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateQualityTestMaterialDictionary(@Param("enti") QualityTestMaterialDictionary value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestMaterialDictionary中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullQualityTestMaterialDictionary(@Param("enti") QualityTestMaterialDictionary value, @Param("assist") Assist assist);
}