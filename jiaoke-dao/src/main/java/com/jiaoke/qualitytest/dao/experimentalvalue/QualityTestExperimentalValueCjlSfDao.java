package com.jiaoke.qualitytest.dao.experimentalvalue;
import java.util.List;


import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueCjlSf;
import org.apache.ibatis.annotations.Param;
/**
 * QualityTestExperimentalValueCjlSf的Dao接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalValueCjlSfDao {

	/**
	 * 获得QualityTestExperimentalValueCjlSf数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getQualityTestExperimentalValueCjlSfRowCount(Assist assist);
	
	/**
	 * 获得QualityTestExperimentalValueCjlSf数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<QualityTestExperimentalValueCjlSf> selectQualityTestExperimentalValueCjlSf(Assist assist);
	/**
	 * 通过QualityTestExperimentalValueCjlSf的id获得QualityTestExperimentalValueCjlSf对象
	 * 
	 * @param id
	 * @return
	 */
	QualityTestExperimentalValueCjlSf selectQualityTestExperimentalValueCjlSfById(Integer id);
	
	/**
	 * 获得一个QualityTestExperimentalValueCjlSf对象,以参数QualityTestExperimentalValueCjlSf对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	QualityTestExperimentalValueCjlSf selectQualityTestExperimentalValueCjlSfObjSingle(QualityTestExperimentalValueCjlSf obj);
	
	/**
	 * 获得一个QualityTestExperimentalValueCjlSf对象,以参数QualityTestExperimentalValueCjlSf对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<QualityTestExperimentalValueCjlSf> selectQualityTestExperimentalValueCjlSfByObj(QualityTestExperimentalValueCjlSf obj);

	/**
	 * 插入QualityTestExperimentalValueCjlSf到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalValueCjlSf(QualityTestExperimentalValueCjlSf value);
	
	/**
	 * 插入QualityTestExperimentalValueCjlSf中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullQualityTestExperimentalValueCjlSf(QualityTestExperimentalValueCjlSf value);
	
	/**
	 * 批量插入QualityTestExperimentalValueCjlSf到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalValueCjlSfByBatch(List<QualityTestExperimentalValueCjlSf> value);
	/**
	 * 通过QualityTestExperimentalValueCjlSf的id删除QualityTestExperimentalValueCjlSf
	 * 
	 * @param id
	 * @return
	 */
	int deleteQualityTestExperimentalValueCjlSfById(Integer id);
	
	/**
	 * 通过辅助工具Assist的条件删除QualityTestExperimentalValueCjlSf
	 * 
	 * @param assist
	 * @return
	 */
	int deleteQualityTestExperimentalValueCjlSfByAssist(Assist assist);
	
	/**
	 * 通过QualityTestExperimentalValueCjlSf的id更新QualityTestExperimentalValueCjlSf中的数据,包括null值
	 * 
	 * @param enti
	 * @return
	 */
	int updateQualityTestExperimentalValueCjlSfById(QualityTestExperimentalValueCjlSf enti);
	
	/**
	 * 通过QualityTestExperimentalValueCjlSf的id更新QualityTestExperimentalValueCjlSf中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	int updateNotNullQualityTestExperimentalValueCjlSfById(QualityTestExperimentalValueCjlSf enti);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentalValueCjlSf中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateQualityTestExperimentalValueCjlSf(@Param("enti") QualityTestExperimentalValueCjlSf value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentalValueCjlSf中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullQualityTestExperimentalValueCjlSf(@Param("enti") QualityTestExperimentalValueCjlSf value, @Param("assist") Assist assist);
}