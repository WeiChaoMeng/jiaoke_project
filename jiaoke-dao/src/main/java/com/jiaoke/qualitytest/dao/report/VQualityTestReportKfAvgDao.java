package com.jiaoke.qualitytest.dao.report;
import java.util.List;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.report.VQualityTestReportKfAvg;

import org.apache.ibatis.annotations.Param;
/**
 * VQualityTestReportKfAvg的Dao接口
 * 
 * @author 
 *
 */
public interface VQualityTestReportKfAvgDao {

	/**
	 * 获得VQualityTestReportKfAvg数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getVQualityTestReportKfAvgRowCount(Assist assist);
	
	/**
	 * 获得VQualityTestReportKfAvg数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<VQualityTestReportKfAvg> selectVQualityTestReportKfAvg(Assist assist);
	
	/**
	 * 获得一个VQualityTestReportKfAvg对象,以参数VQualityTestReportKfAvg对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	VQualityTestReportKfAvg selectVQualityTestReportKfAvgObjSingle(VQualityTestReportKfAvg obj);
	
	/**
	 * 获得一个VQualityTestReportKfAvg对象,以参数VQualityTestReportKfAvg对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<VQualityTestReportKfAvg> selectVQualityTestReportKfAvgByObj(VQualityTestReportKfAvg obj);

	/**
	 * 插入VQualityTestReportKfAvg到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportKfAvg(VQualityTestReportKfAvg value);
	
	/**
	 * 插入VQualityTestReportKfAvg中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullVQualityTestReportKfAvg(VQualityTestReportKfAvg value);
	
	/**
	 * 批量插入VQualityTestReportKfAvg到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportKfAvgByBatch(List<VQualityTestReportKfAvg> value);
	
	/**
	 * 通过辅助工具Assist的条件删除VQualityTestReportKfAvg
	 * 
	 * @param assist
	 * @return
	 */
	int deleteVQualityTestReportKfAvgByAssist(Assist assist);
	
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportKfAvg中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateVQualityTestReportKfAvg(@Param("enti") VQualityTestReportKfAvg value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportKfAvg中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullVQualityTestReportKfAvg(@Param("enti") VQualityTestReportKfAvg value, @Param("assist") Assist assist);
}