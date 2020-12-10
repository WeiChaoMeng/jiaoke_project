package com.jiaoke.qualitytest.dao.experimentalvalue;
import java.util.List;


import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueKfSf;
import org.apache.ibatis.annotations.Param;
/**
 * QualityTestExperimentalValueKfSf的Dao接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalValueKfSfDao {

	/**
	 * 获得QualityTestExperimentalValueKfSf数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getQualityTestExperimentalValueKfSfRowCount(Assist assist);
	
	/**
	 * 获得QualityTestExperimentalValueKfSf数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<QualityTestExperimentalValueKfSf> selectQualityTestExperimentalValueKfSf(Assist assist);
	/**
	 * 通过QualityTestExperimentalValueKfSf的id获得QualityTestExperimentalValueKfSf对象
	 * 
	 * @param id
	 * @return
	 */
	QualityTestExperimentalValueKfSf selectQualityTestExperimentalValueKfSfById(Integer id);
	
	/**
	 * 获得一个QualityTestExperimentalValueKfSf对象,以参数QualityTestExperimentalValueKfSf对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	QualityTestExperimentalValueKfSf selectQualityTestExperimentalValueKfSfObjSingle(QualityTestExperimentalValueKfSf obj);
	
	/**
	 * 获得一个QualityTestExperimentalValueKfSf对象,以参数QualityTestExperimentalValueKfSf对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<QualityTestExperimentalValueKfSf> selectQualityTestExperimentalValueKfSfByObj(QualityTestExperimentalValueKfSf obj);

	/**
	 * 插入QualityTestExperimentalValueKfSf到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalValueKfSf(QualityTestExperimentalValueKfSf value);
	
	/**
	 * 插入QualityTestExperimentalValueKfSf中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullQualityTestExperimentalValueKfSf(QualityTestExperimentalValueKfSf value);
	
	/**
	 * 批量插入QualityTestExperimentalValueKfSf到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalValueKfSfByBatch(List<QualityTestExperimentalValueKfSf> value);
	/**
	 * 通过QualityTestExperimentalValueKfSf的id删除QualityTestExperimentalValueKfSf
	 * 
	 * @param id
	 * @return
	 */
	int deleteQualityTestExperimentalValueKfSfById(Integer id);
	
	/**
	 * 通过辅助工具Assist的条件删除QualityTestExperimentalValueKfSf
	 * 
	 * @param assist
	 * @return
	 */
	int deleteQualityTestExperimentalValueKfSfByAssist(Assist assist);
	
	/**
	 * 通过QualityTestExperimentalValueKfSf的id更新QualityTestExperimentalValueKfSf中的数据,包括null值
	 * 
	 * @param enti
	 * @return
	 */
	int updateQualityTestExperimentalValueKfSfById(QualityTestExperimentalValueKfSf enti);
	
	/**
	 * 通过QualityTestExperimentalValueKfSf的id更新QualityTestExperimentalValueKfSf中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	int updateNotNullQualityTestExperimentalValueKfSfById(QualityTestExperimentalValueKfSf enti);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentalValueKfSf中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateQualityTestExperimentalValueKfSf(@Param("enti") QualityTestExperimentalValueKfSf value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentalValueKfSf中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullQualityTestExperimentalValueKfSf(@Param("enti") QualityTestExperimentalValueKfSf value, @Param("assist") Assist assist);
}