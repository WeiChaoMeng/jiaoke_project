package com.jiaoke.qualitytest.dao.report;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.report.VQualityTestReportRhlqAvg;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * VQualityTestReportRhlqAvg的Dao接口
 * 
 * @author 
 *
 */
public interface VQualityTestReportRhlqAvgDao {

	/**
	 * 获得VQualityTestReportRhlqAvg数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getVQualityTestReportRhlqAvgRowCount(Assist assist);
	
	/**
	 * 获得VQualityTestReportRhlqAvg数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<VQualityTestReportRhlqAvg> selectVQualityTestReportRhlqAvg(Assist assist);
	
	/**
	 * 获得一个VQualityTestReportRhlqAvg对象,以参数VQualityTestReportRhlqAvg对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	VQualityTestReportRhlqAvg selectVQualityTestReportRhlqAvgObjSingle(VQualityTestReportRhlqAvg obj);
	
	/**
	 * 获得一个VQualityTestReportRhlqAvg对象,以参数VQualityTestReportRhlqAvg对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<VQualityTestReportRhlqAvg> selectVQualityTestReportRhlqAvgByObj(VQualityTestReportRhlqAvg obj);

	/**
	 * 插入VQualityTestReportRhlqAvg到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportRhlqAvg(VQualityTestReportRhlqAvg value);
	
	/**
	 * 插入VQualityTestReportRhlqAvg中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullVQualityTestReportRhlqAvg(VQualityTestReportRhlqAvg value);
	
	/**
	 * 批量插入VQualityTestReportRhlqAvg到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportRhlqAvgByBatch(List<VQualityTestReportRhlqAvg> value);
	
	/**
	 * 通过辅助工具Assist的条件删除VQualityTestReportRhlqAvg
	 * 
	 * @param assist
	 * @return
	 */
	int deleteVQualityTestReportRhlqAvgByAssist(Assist assist);
	
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportRhlqAvg中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateVQualityTestReportRhlqAvg(@Param("enti") VQualityTestReportRhlqAvg value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportRhlqAvg中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullVQualityTestReportRhlqAvg(@Param("enti") VQualityTestReportRhlqAvg value, @Param("assist") Assist assist);
}