package com.jiaoke.qualitytest.dao;
import java.util.List;


import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.QualityTestLabReport;
import org.apache.ibatis.annotations.Param;
/**
 * QualityTestLabReport的Dao接口
 * 
 * @author 
 *
 */
public interface QualityTestLabReportDao {

	/**
	 * 获得QualityTestLabReport数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getQualityTestLabReportRowCount(Assist assist);
	
	/**
	 * 获得QualityTestLabReport数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<QualityTestLabReport> selectQualityTestLabReport(Assist assist);
	/**
	 * 通过QualityTestLabReport的id获得QualityTestLabReport对象
	 * 
	 * @param id
	 * @return
	 */
	QualityTestLabReport selectQualityTestLabReportById(String id);
	
	/**
	 * 获得一个QualityTestLabReport对象,以参数QualityTestLabReport对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	QualityTestLabReport selectQualityTestLabReportObjSingle(QualityTestLabReport obj);
	
	/**
	 * 获得一个QualityTestLabReport对象,以参数QualityTestLabReport对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<QualityTestLabReport> selectQualityTestLabReportByObj(QualityTestLabReport obj);

	/**
	 * 插入QualityTestLabReport到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestLabReport(QualityTestLabReport value);
	
	/**
	 * 插入QualityTestLabReport中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullQualityTestLabReport(QualityTestLabReport value);
	
	/**
	 * 批量插入QualityTestLabReport到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestLabReportByBatch(List<QualityTestLabReport> value);
	/**
	 * 通过QualityTestLabReport的id删除QualityTestLabReport
	 * 
	 * @param id
	 * @return
	 */
	int deleteQualityTestLabReportById(String id);
	
	/**
	 * 通过辅助工具Assist的条件删除QualityTestLabReport
	 * 
	 * @param assist
	 * @return
	 */
	int deleteQualityTestLabReportByAssist(Assist assist);
	
	/**
	 * 通过QualityTestLabReport的id更新QualityTestLabReport中的数据,包括null值
	 * 
	 * @param enti
	 * @return
	 */
	int updateQualityTestLabReportById(QualityTestLabReport enti);
	
	/**
	 * 通过QualityTestLabReport的id更新QualityTestLabReport中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	int updateNotNullQualityTestLabReportById(QualityTestLabReport enti);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestLabReport中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateQualityTestLabReport(@Param("enti") QualityTestLabReport value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestLabReport中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullQualityTestLabReport(@Param("enti") QualityTestLabReport value, @Param("assist") Assist assist);
}