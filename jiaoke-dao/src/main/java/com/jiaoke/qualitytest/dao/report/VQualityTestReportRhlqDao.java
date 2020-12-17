package com.jiaoke.qualitytest.dao.report;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.report.VQualityTestReportRhlq;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * VQualityTestReportRhlq的Dao接口
 * 
 * @author 
 *
 */
public interface VQualityTestReportRhlqDao {

	/**
	 * 获得VQualityTestReportRhlq数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getVQualityTestReportRhlqRowCount(Assist assist);
	
	/**
	 * 获得VQualityTestReportRhlq数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<VQualityTestReportRhlq> selectVQualityTestReportRhlq(Assist assist);
	
	/**
	 * 获得一个VQualityTestReportRhlq对象,以参数VQualityTestReportRhlq对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	VQualityTestReportRhlq selectVQualityTestReportRhlqObjSingle(VQualityTestReportRhlq obj);
	
	/**
	 * 获得一个VQualityTestReportRhlq对象,以参数VQualityTestReportRhlq对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<VQualityTestReportRhlq> selectVQualityTestReportRhlqByObj(VQualityTestReportRhlq obj);

	/**
	 * 插入VQualityTestReportRhlq到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportRhlq(VQualityTestReportRhlq value);
	
	/**
	 * 插入VQualityTestReportRhlq中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullVQualityTestReportRhlq(VQualityTestReportRhlq value);
	
	/**
	 * 批量插入VQualityTestReportRhlq到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportRhlqByBatch(List<VQualityTestReportRhlq> value);
	
	/**
	 * 通过辅助工具Assist的条件删除VQualityTestReportRhlq
	 * 
	 * @param assist
	 * @return
	 */
	int deleteVQualityTestReportRhlqByAssist(Assist assist);
	
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportRhlq中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateVQualityTestReportRhlq(@Param("enti") VQualityTestReportRhlq value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportRhlq中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullVQualityTestReportRhlq(@Param("enti") VQualityTestReportRhlq value, @Param("assist") Assist assist);
}