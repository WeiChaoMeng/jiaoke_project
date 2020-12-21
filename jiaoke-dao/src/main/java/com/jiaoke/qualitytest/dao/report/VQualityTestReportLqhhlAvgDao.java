package com.jiaoke.qualitytest.dao.report;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.report.VQualityTestReportLqhhlAvg;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * VQualityTestReportLqhhlAvg的Dao接口
 * 
 * @author 
 *
 */
public interface VQualityTestReportLqhhlAvgDao {

	/**
	 * 获得VQualityTestReportLqhhlAvg数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getVQualityTestReportLqhhlAvgRowCount(Assist assist);
	
	/**
	 * 获得VQualityTestReportLqhhlAvg数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<VQualityTestReportLqhhlAvg> selectVQualityTestReportLqhhlAvg(Assist assist);
	
	/**
	 * 获得一个VQualityTestReportLqhhlAvg对象,以参数VQualityTestReportLqhhlAvg对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	VQualityTestReportLqhhlAvg selectVQualityTestReportLqhhlAvgObjSingle(VQualityTestReportLqhhlAvg obj);
	
	/**
	 * 获得一个VQualityTestReportLqhhlAvg对象,以参数VQualityTestReportLqhhlAvg对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<VQualityTestReportLqhhlAvg> selectVQualityTestReportLqhhlAvgByObj(VQualityTestReportLqhhlAvg obj);

	/**
	 * 插入VQualityTestReportLqhhlAvg到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportLqhhlAvg(VQualityTestReportLqhhlAvg value);
	
	/**
	 * 插入VQualityTestReportLqhhlAvg中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullVQualityTestReportLqhhlAvg(VQualityTestReportLqhhlAvg value);
	
	/**
	 * 批量插入VQualityTestReportLqhhlAvg到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportLqhhlAvgByBatch(List<VQualityTestReportLqhhlAvg> value);
	
	/**
	 * 通过辅助工具Assist的条件删除VQualityTestReportLqhhlAvg
	 * 
	 * @param assist
	 * @return
	 */
	int deleteVQualityTestReportLqhhlAvgByAssist(Assist assist);
	
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportLqhhlAvg中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateVQualityTestReportLqhhlAvg(@Param("enti") VQualityTestReportLqhhlAvg value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportLqhhlAvg中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullVQualityTestReportLqhhlAvg(@Param("enti") VQualityTestReportLqhhlAvg value, @Param("assist") Assist assist);
}