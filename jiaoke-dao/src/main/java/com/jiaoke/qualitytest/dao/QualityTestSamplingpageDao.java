package com.jiaoke.qualitytest.dao;
import java.util.List;


import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.QualityTestSamplingpage;
import org.apache.ibatis.annotations.Param;
/**
 * QualityTestSamplingpage的Dao接口
 * 
 * @author 
 *
 */
public interface QualityTestSamplingpageDao {

	/**
	 * 获得QualityTestSamplingpage数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getQualityTestSamplingpageRowCount(Assist assist);
	
	/**
	 * 获得QualityTestSamplingpage数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<QualityTestSamplingpage> selectQualityTestSamplingpage(Assist assist);
	/**
	 * 通过QualityTestSamplingpage的id获得QualityTestSamplingpage对象
	 * 
	 * @param id
	 * @return
	 */
	QualityTestSamplingpage selectQualityTestSamplingpageById(Integer id);
	
	/**
	 * 获得一个QualityTestSamplingpage对象,以参数QualityTestSamplingpage对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	QualityTestSamplingpage selectQualityTestSamplingpageObjSingle(QualityTestSamplingpage obj);
	
	/**
	 * 获得一个QualityTestSamplingpage对象,以参数QualityTestSamplingpage对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<QualityTestSamplingpage> selectQualityTestSamplingpageByObj(QualityTestSamplingpage obj);

	/**
	 * 插入QualityTestSamplingpage到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestSamplingpage(QualityTestSamplingpage value);
	
	/**
	 * 插入QualityTestSamplingpage中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullQualityTestSamplingpage(QualityTestSamplingpage value);
	
	/**
	 * 批量插入QualityTestSamplingpage到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestSamplingpageByBatch(List<QualityTestSamplingpage> value);
	/**
	 * 通过QualityTestSamplingpage的id删除QualityTestSamplingpage
	 * 
	 * @param id
	 * @return
	 */
	int deleteQualityTestSamplingpageById(Integer id);
	
	/**
	 * 通过辅助工具Assist的条件删除QualityTestSamplingpage
	 * 
	 * @param assist
	 * @return
	 */
	int deleteQualityTestSamplingpageByAssist(Assist assist);
	
	/**
	 * 通过QualityTestSamplingpage的id更新QualityTestSamplingpage中的数据,包括null值
	 * 
	 * @param enti
	 * @return
	 */
	int updateQualityTestSamplingpageById(QualityTestSamplingpage enti);
	
	/**
	 * 通过QualityTestSamplingpage的id更新QualityTestSamplingpage中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	int updateNotNullQualityTestSamplingpageById(QualityTestSamplingpage enti);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestSamplingpage中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateQualityTestSamplingpage(@Param("enti") QualityTestSamplingpage value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestSamplingpage中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullQualityTestSamplingpage(@Param("enti") QualityTestSamplingpage value, @Param("assist") Assist assist);
}