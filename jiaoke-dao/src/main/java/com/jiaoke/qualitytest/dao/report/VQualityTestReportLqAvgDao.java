package com.jiaoke.qualitytest.dao.report;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.report.VQualityTestReportLqAvg;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * VQualityTestReportLqAvg的Dao接口
 * 
 * @author 
 *
 */
public interface VQualityTestReportLqAvgDao {

	/**
	 * 获得VQualityTestReportLqAvg数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getVQualityTestReportLqAvgRowCount(Assist assist);
	
	/**
	 * 获得VQualityTestReportLqAvg数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<VQualityTestReportLqAvg> selectVQualityTestReportLqAvg(Assist assist);
	
	/**
	 * 获得一个VQualityTestReportLqAvg对象,以参数VQualityTestReportLqAvg对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	VQualityTestReportLqAvg selectVQualityTestReportLqAvgObjSingle(VQualityTestReportLqAvg obj);
	
	/**
	 * 获得一个VQualityTestReportLqAvg对象,以参数VQualityTestReportLqAvg对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<VQualityTestReportLqAvg> selectVQualityTestReportLqAvgByObj(VQualityTestReportLqAvg obj);

	/**
	 * 插入VQualityTestReportLqAvg到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportLqAvg(VQualityTestReportLqAvg value);
	
	/**
	 * 插入VQualityTestReportLqAvg中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullVQualityTestReportLqAvg(VQualityTestReportLqAvg value);
	
	/**
	 * 批量插入VQualityTestReportLqAvg到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportLqAvgByBatch(List<VQualityTestReportLqAvg> value);
	
	/**
	 * 通过辅助工具Assist的条件删除VQualityTestReportLqAvg
	 * 
	 * @param assist
	 * @return
	 */
	int deleteVQualityTestReportLqAvgByAssist(Assist assist);
	
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportLqAvg中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateVQualityTestReportLqAvg(@Param("enti") VQualityTestReportLqAvg value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportLqAvg中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullVQualityTestReportLqAvg(@Param("enti") VQualityTestReportLqAvg value, @Param("assist") Assist assist);
}