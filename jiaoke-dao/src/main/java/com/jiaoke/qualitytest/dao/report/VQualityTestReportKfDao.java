package com.jiaoke.qualitytest.dao.report;
import java.util.List;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.report.VQualityTestReportKf;

import org.apache.ibatis.annotations.Param;
/**
 * VQualityTestReportKf的Dao接口
 * 
 * @author 
 *
 */
public interface VQualityTestReportKfDao {

	/**
	 * 获得VQualityTestReportKf数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getVQualityTestReportKfRowCount(Assist assist);
	
	/**
	 * 获得VQualityTestReportKf数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<VQualityTestReportKf> selectVQualityTestReportKf(Assist assist);
	
	/**
	 * 获得一个VQualityTestReportKf对象,以参数VQualityTestReportKf对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	VQualityTestReportKf selectVQualityTestReportKfObjSingle(VQualityTestReportKf obj);
	
	/**
	 * 获得一个VQualityTestReportKf对象,以参数VQualityTestReportKf对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<VQualityTestReportKf> selectVQualityTestReportKfByObj(VQualityTestReportKf obj);

	/**
	 * 插入VQualityTestReportKf到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportKf(VQualityTestReportKf value);
	
	/**
	 * 插入VQualityTestReportKf中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullVQualityTestReportKf(VQualityTestReportKf value);
	
	/**
	 * 批量插入VQualityTestReportKf到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportKfByBatch(List<VQualityTestReportKf> value);
	
	/**
	 * 通过辅助工具Assist的条件删除VQualityTestReportKf
	 * 
	 * @param assist
	 * @return
	 */
	int deleteVQualityTestReportKfByAssist(Assist assist);
	
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportKf中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateVQualityTestReportKf(@Param("enti") VQualityTestReportKf value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportKf中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullVQualityTestReportKf(@Param("enti") VQualityTestReportKf value, @Param("assist") Assist assist);
}