package com.jiaoke.qualitytest.dao.report;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.report.VQualityTestReportLq;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * VQualityTestReportLq的Dao接口
 * 
 * @author 
 *
 */
public interface VQualityTestReportLqDao {

	/**
	 * 获得VQualityTestReportLq数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getVQualityTestReportLqRowCount(Assist assist);
	
	/**
	 * 获得VQualityTestReportLq数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<VQualityTestReportLq> selectVQualityTestReportLq(Assist assist);
	
	/**
	 * 获得一个VQualityTestReportLq对象,以参数VQualityTestReportLq对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	VQualityTestReportLq selectVQualityTestReportLqObjSingle(VQualityTestReportLq obj);
	
	/**
	 * 获得一个VQualityTestReportLq对象,以参数VQualityTestReportLq对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<VQualityTestReportLq> selectVQualityTestReportLqByObj(VQualityTestReportLq obj);

	/**
	 * 插入VQualityTestReportLq到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportLq(VQualityTestReportLq value);
	
	/**
	 * 插入VQualityTestReportLq中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullVQualityTestReportLq(VQualityTestReportLq value);
	
	/**
	 * 批量插入VQualityTestReportLq到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportLqByBatch(List<VQualityTestReportLq> value);
	
	/**
	 * 通过辅助工具Assist的条件删除VQualityTestReportLq
	 * 
	 * @param assist
	 * @return
	 */
	int deleteVQualityTestReportLqByAssist(Assist assist);
	
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportLq中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateVQualityTestReportLq(@Param("enti") VQualityTestReportLq value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportLq中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullVQualityTestReportLq(@Param("enti") VQualityTestReportLq value, @Param("assist") Assist assist);
}