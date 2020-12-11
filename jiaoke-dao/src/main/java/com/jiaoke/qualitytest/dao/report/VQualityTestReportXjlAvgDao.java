package com.jiaoke.qualitytest.dao.report;
import java.util.List;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.report.VQualityTestReportXjlAvg;

import org.apache.ibatis.annotations.Param;
/**
 * VQualityTestReportXjlAvg的Dao接口
 * 
 * @author 
 *
 */
public interface VQualityTestReportXjlAvgDao {

	/**
	 * 获得VQualityTestReportXjlAvg数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getVQualityTestReportXjlAvgRowCount(Assist assist);
	
	/**
	 * 获得VQualityTestReportXjlAvg数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<VQualityTestReportXjlAvg> selectVQualityTestReportXjlAvg(Assist assist);
	
	/**
	 * 获得一个VQualityTestReportXjlAvg对象,以参数VQualityTestReportXjlAvg对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	VQualityTestReportXjlAvg selectVQualityTestReportXjlAvgObjSingle(VQualityTestReportXjlAvg obj);
	
	/**
	 * 获得一个VQualityTestReportXjlAvg对象,以参数VQualityTestReportXjlAvg对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<VQualityTestReportXjlAvg> selectVQualityTestReportXjlAvgByObj(VQualityTestReportXjlAvg obj);

	/**
	 * 插入VQualityTestReportXjlAvg到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportXjlAvg(VQualityTestReportXjlAvg value);
	
	/**
	 * 插入VQualityTestReportXjlAvg中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullVQualityTestReportXjlAvg(VQualityTestReportXjlAvg value);
	
	/**
	 * 批量插入VQualityTestReportXjlAvg到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportXjlAvgByBatch(List<VQualityTestReportXjlAvg> value);
	
	/**
	 * 通过辅助工具Assist的条件删除VQualityTestReportXjlAvg
	 * 
	 * @param assist
	 * @return
	 */
	int deleteVQualityTestReportXjlAvgByAssist(Assist assist);
	
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportXjlAvg中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateVQualityTestReportXjlAvg(@Param("enti") VQualityTestReportXjlAvg value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportXjlAvg中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullVQualityTestReportXjlAvg(@Param("enti") VQualityTestReportXjlAvg value, @Param("assist") Assist assist);
}