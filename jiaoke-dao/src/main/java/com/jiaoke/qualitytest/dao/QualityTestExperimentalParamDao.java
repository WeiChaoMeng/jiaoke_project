package com.jiaoke.qualitytest.dao;
import java.util.List;


import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.QualityTestExperimentalParam;
import org.apache.ibatis.annotations.Param;
/**
 * QualityTestExperimentalParam的Dao接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalParamDao {

	/**
	 * 获得QualityTestExperimentalParam数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getQualityTestExperimentalParamRowCount(Assist assist);
	
	/**
	 * 获得QualityTestExperimentalParam数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<QualityTestExperimentalParam> selectQualityTestExperimentalParam(Assist assist);
	/**
	 * 通过QualityTestExperimentalParam的id获得QualityTestExperimentalParam对象
	 * 
	 * @param id
	 * @return
	 */
	QualityTestExperimentalParam selectQualityTestExperimentalParamById(Integer id);
	
	/**
	 * 获得一个QualityTestExperimentalParam对象,以参数QualityTestExperimentalParam对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	QualityTestExperimentalParam selectQualityTestExperimentalParamObjSingle(QualityTestExperimentalParam obj);
	
	/**
	 * 获得一个QualityTestExperimentalParam对象,以参数QualityTestExperimentalParam对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<QualityTestExperimentalParam> selectQualityTestExperimentalParamByObj(QualityTestExperimentalParam obj);

	/**
	 * 插入QualityTestExperimentalParam到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalParam(QualityTestExperimentalParam value);
	
	/**
	 * 插入QualityTestExperimentalParam中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullQualityTestExperimentalParam(QualityTestExperimentalParam value);
	
	/**
	 * 批量插入QualityTestExperimentalParam到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalParamByBatch(List<QualityTestExperimentalParam> value);
	/**
	 * 通过QualityTestExperimentalParam的id删除QualityTestExperimentalParam
	 * 
	 * @param id
	 * @return
	 */
	int deleteQualityTestExperimentalParamById(Integer id);
	
	/**
	 * 通过辅助工具Assist的条件删除QualityTestExperimentalParam
	 * 
	 * @param assist
	 * @return
	 */
	int deleteQualityTestExperimentalParamByAssist(Assist assist);
	
	/**
	 * 通过QualityTestExperimentalParam的id更新QualityTestExperimentalParam中的数据,包括null值
	 * 
	 * @param enti
	 * @return
	 */
	int updateQualityTestExperimentalParamById(QualityTestExperimentalParam enti);
	
	/**
	 * 通过QualityTestExperimentalParam的id更新QualityTestExperimentalParam中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	int updateNotNullQualityTestExperimentalParamById(QualityTestExperimentalParam enti);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentalParam中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateQualityTestExperimentalParam(@Param("enti") QualityTestExperimentalParam value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimentalParam中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullQualityTestExperimentalParam(@Param("enti") QualityTestExperimentalParam value, @Param("assist") Assist assist);
}