package com.jiaoke.qualitytest.dao.report;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.report.VQualityTestReportLqhhl;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * VQualityTestReportLqhhl的Dao接口
 * 
 * @author 
 *
 */
public interface VQualityTestReportLqhhlDao {

	/**
	 * 获得VQualityTestReportLqhhl数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getVQualityTestReportLqhhlRowCount(Assist assist);
	
	/**
	 * 获得VQualityTestReportLqhhl数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<VQualityTestReportLqhhl> selectVQualityTestReportLqhhl(Assist assist);
	
	/**
	 * 获得一个VQualityTestReportLqhhl对象,以参数VQualityTestReportLqhhl对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	VQualityTestReportLqhhl selectVQualityTestReportLqhhlObjSingle(VQualityTestReportLqhhl obj);
	
	/**
	 * 获得一个VQualityTestReportLqhhl对象,以参数VQualityTestReportLqhhl对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<VQualityTestReportLqhhl> selectVQualityTestReportLqhhlByObj(VQualityTestReportLqhhl obj);

	/**
	 * 插入VQualityTestReportLqhhl到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportLqhhl(VQualityTestReportLqhhl value);
	
	/**
	 * 插入VQualityTestReportLqhhl中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullVQualityTestReportLqhhl(VQualityTestReportLqhhl value);
	
	/**
	 * 批量插入VQualityTestReportLqhhl到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportLqhhlByBatch(List<VQualityTestReportLqhhl> value);
	
	/**
	 * 通过辅助工具Assist的条件删除VQualityTestReportLqhhl
	 * 
	 * @param assist
	 * @return
	 */
	int deleteVQualityTestReportLqhhlByAssist(Assist assist);
	
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportLqhhl中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateVQualityTestReportLqhhl(@Param("enti") VQualityTestReportLqhhl value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportLqhhl中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullVQualityTestReportLqhhl(@Param("enti") VQualityTestReportLqhhl value, @Param("assist") Assist assist);
}