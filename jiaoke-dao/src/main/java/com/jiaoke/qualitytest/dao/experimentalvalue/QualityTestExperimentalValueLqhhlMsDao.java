package com.jiaoke.qualitytest.dao.experimentalvalue;
import java.util.List;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.experimentalvalue.QualityTestExperimentalValueLqhhlMs;

import org.apache.ibatis.annotations.Param;
/**
 * QualityTestExperimentalValueLqhhlMs的Dao接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalValueLqhhlMsDao {

	/**
	 * 获得QualityTestExperimentalValueLqhhlMs数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getQualityTestExperimentalValueLqhhlMsRowCount(Assist assist);
	
	/**
	 * 获得QualityTestExperimentalValueLqhhlMs数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<QualityTestExperimentalValueLqhhlMs> selectQualityTestExperimentalValueLqhhlMs(Assist assist);
	/**
	 * 通过QualityTestExperimentalValueLqhhlMs的id获得QualityTestExperimentalValueLqhhlMs对象
	 * 
	 * @param id
	 * @return
	 */
	QualityTestExperimentalValueLqhhlMs selectQualityTestExperimentalValueLqhhlMsById(Integer id);
	
	/**
	 * 获得一个QualityTestExperimentalValueLqhhlMs对象,以参数QualityTestExperimentalValueLqhhlMs对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	QualityTestExperimentalValueLqhhlMs selectQualityTestExperimentalValueLqhhlMsObjSingle(QualityTestExperimentalValueLqhhlMs obj);
	
	/**
	 * 获得一个QualityTestExperimentalValueLqhhlMs对象,以参数QualityTestExperimentalValueLqhhlMs对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<QualityTestExperimentalValueLqhhlMs> selectQualityTestExperimentalValueLqhhlMsByObj(QualityTestExperimentalValueLqhhlMs obj);

	/**
	 * 插入QualityTestExperimentalValueLqhhlMs到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalValueLqhhlMs(QualityTestExperimentalValueLqhhlMs value);
	
	/**
	 * 插入QualityTestExperimentalValueLqhhlMs中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullQualityTestExperimentalValueLqhhlMs(QualityTestExperimentalValueLqhhlMs value);
	
	/**
	 * 批量插入QualityTestExperimentalValueLqhhlMs到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalValueLqhhlMsByBatch(List<QualityTestExperimentalValueLqhhlMs> value);
	/**
	 * 通过QualityTestExperimentalValueLqhhlMs的id删除QualityTestExperimentalValueLqhhlMs
	 * 
	 * @param id
	 * @return
	 */
	int deleteQualityTestExperimentalValueLqhhlMsById(Integer id);
	
	/**
	 * 通过辅助工具Assist的条件删除QualityTestExperimentalValueLqhhlMs
	 * 
	 * @param assist
	 * @return
	 */
	int deleteQualityTestExperimentalValueLqhhlMsByAssist(Assist assist);
	
	/**
	 * 通过QualityTestExperimentalValueLqhhlMs的id更新QualityTestExperimentalValueLqhhlMs中的数据,包括null值
	 * 
	 * @param enti
	 * @return
	 */
	int updateQualityTestExperimentalValueLqhhlMsById(QualityTestExperimentalValueLqhhlMs enti);
	
	/**
	 * 通过QualityTestExperimentalValueLqhhlMs的id更新QualityTestExperimentalValueLqhhlMs中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	int updateNotNullQualityTestExperimentalValueLqhhlMsById(QualityTestExperimentalValueLqhhlMs enti);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentalValueLqhhlMs中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateQualityTestExperimentalValueLqhhlMs(@Param("enti") QualityTestExperimentalValueLqhhlMs value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentalValueLqhhlMs中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullQualityTestExperimentalValueLqhhlMs(@Param("enti") QualityTestExperimentalValueLqhhlMs value, @Param("assist") Assist assist);
}