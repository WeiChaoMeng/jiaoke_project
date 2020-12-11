package com.jiaoke.qualitytest.dao;
import java.util.List;



import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.QualityTestExperimental;
import org.apache.ibatis.annotations.Param;
/**
 * QualityTestExperimental的Dao接口
 * 
 * @author 
 *
 */
public interface QualityTestExperimentalDao {

	/**
	 * 获得QualityTestExperimental数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getQualityTestExperimentalRowCount(Assist assist);
	
	/**
	 * 获得QualityTestExperimental数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<QualityTestExperimental> selectQualityTestExperimental(Assist assist);
	/**
	 * 通过QualityTestExperimental的id获得QualityTestExperimental对象
	 * 
	 * @param id
	 * @return
	 */
	QualityTestExperimental selectQualityTestExperimentalById(Integer id);
	
	/**
	 * 获得一个QualityTestExperimental对象,以参数QualityTestExperimental对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	QualityTestExperimental selectQualityTestExperimentalObjSingle(QualityTestExperimental obj);
	
	/**
	 * 获得一个QualityTestExperimental对象,以参数QualityTestExperimental对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<QualityTestExperimental> selectQualityTestExperimentalByObj(QualityTestExperimental obj);

	/**
	 * 插入QualityTestExperimental到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimental(QualityTestExperimental value);
	
	/**
	 * 插入QualityTestExperimental中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullQualityTestExperimental(QualityTestExperimental value);
	
	/**
	 * 批量插入QualityTestExperimental到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestExperimentalByBatch(List<QualityTestExperimental> value);
	/**
	 * 通过QualityTestExperimental的id删除QualityTestExperimental
	 * 
	 * @param id
	 * @return
	 */
	int deleteQualityTestExperimentalById(Integer id);
	
	/**
	 * 通过辅助工具Assist的条件删除QualityTestExperimental
	 * 
	 * @param assist
	 * @return
	 */
	int deleteQualityTestExperimentalByAssist(Assist assist);
	
	/**
	 * 通过QualityTestExperimental的id更新QualityTestExperimental中的数据,包括null值
	 * 
	 * @param enti
	 * @return
	 */
	int updateQualityTestExperimentalById(QualityTestExperimental enti);
	
	/**
	 * 通过QualityTestExperimental的id更新QualityTestExperimental中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	int updateNotNullQualityTestExperimentalById(QualityTestExperimental enti);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimental中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateQualityTestExperimental(@Param("enti") QualityTestExperimental value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestExperimental中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullQualityTestExperimental(@Param("enti") QualityTestExperimental value, @Param("assist") Assist assist);
}