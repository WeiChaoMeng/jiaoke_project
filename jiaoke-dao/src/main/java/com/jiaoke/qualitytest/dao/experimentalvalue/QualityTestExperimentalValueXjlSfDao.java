package com.jiaoke.qualitytest.dao.experimentalvalue;
import java.util.List;


import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueXjlSf;
import org.apache.ibatis.annotations.Param;
/**
 * QualityTestExperimentalValueXjlSf的Dao接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalValueXjlSfDao {

	/**
	 * 获得QualityTestExperimentalValueXjlSf数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getQualityTestExperimentalValueXjlSfRowCount(Assist assist);
	
	/**
	 * 获得QualityTestExperimentalValueXjlSf数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<QualityTestExperimentalValueXjlSf> selectQualityTestExperimentalValueXjlSf(Assist assist);
	/**
	 * 通过QualityTestExperimentalValueXjlSf的id获得QualityTestExperimentalValueXjlSf对象
	 * 
	 * @param id
	 * @return
	 */
	QualityTestExperimentalValueXjlSf selectQualityTestExperimentalValueXjlSfById(Integer id);
	
	/**
	 * 获得一个QualityTestExperimentalValueXjlSf对象,以参数QualityTestExperimentalValueXjlSf对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	QualityTestExperimentalValueXjlSf selectQualityTestExperimentalValueXjlSfObjSingle(QualityTestExperimentalValueXjlSf obj);
	
	/**
	 * 获得一个QualityTestExperimentalValueXjlSf对象,以参数QualityTestExperimentalValueXjlSf对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<QualityTestExperimentalValueXjlSf> selectQualityTestExperimentalValueXjlSfByObj(QualityTestExperimentalValueXjlSf obj);

	/**
	 * 插入QualityTestExperimentalValueXjlSf到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalValueXjlSf(QualityTestExperimentalValueXjlSf value);
	
	/**
	 * 插入QualityTestExperimentalValueXjlSf中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullQualityTestExperimentalValueXjlSf(QualityTestExperimentalValueXjlSf value);
	
	/**
	 * 批量插入QualityTestExperimentalValueXjlSf到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalValueXjlSfByBatch(List<QualityTestExperimentalValueXjlSf> value);
	/**
	 * 通过QualityTestExperimentalValueXjlSf的id删除QualityTestExperimentalValueXjlSf
	 * 
	 * @param id
	 * @return
	 */
	int deleteQualityTestExperimentalValueXjlSfById(Integer id);
	
	/**
	 * 通过辅助工具Assist的条件删除QualityTestExperimentalValueXjlSf
	 * 
	 * @param assist
	 * @return
	 */
	int deleteQualityTestExperimentalValueXjlSfByAssist(Assist assist);
	
	/**
	 * 通过QualityTestExperimentalValueXjlSf的id更新QualityTestExperimentalValueXjlSf中的数据,包括null值
	 * 
	 * @param enti
	 * @return
	 */
	int updateQualityTestExperimentalValueXjlSfById(QualityTestExperimentalValueXjlSf enti);
	
	/**
	 * 通过QualityTestExperimentalValueXjlSf的id更新QualityTestExperimentalValueXjlSf中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	int updateNotNullQualityTestExperimentalValueXjlSfById(QualityTestExperimentalValueXjlSf enti);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentalValueXjlSf中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateQualityTestExperimentalValueXjlSf(@Param("enti") QualityTestExperimentalValueXjlSf value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentalValueXjlSf中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullQualityTestExperimentalValueXjlSf(@Param("enti") QualityTestExperimentalValueXjlSf value, @Param("assist") Assist assist);
}