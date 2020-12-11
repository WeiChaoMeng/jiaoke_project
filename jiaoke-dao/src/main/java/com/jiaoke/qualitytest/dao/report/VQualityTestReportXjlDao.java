package com.jiaoke.qualitytest.dao.report;
import java.util.List;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.report.VQualityTestReportXjl;

import org.apache.ibatis.annotations.Param;
/**
 * VQualityTestReportXjl的Dao接口
 * 
 * @author 
 *
 */
public interface VQualityTestReportXjlDao {

	/**
	 * 获得VQualityTestReportXjl数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getVQualityTestReportXjlRowCount(Assist assist);
	
	/**
	 * 获得VQualityTestReportXjl数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<VQualityTestReportXjl> selectVQualityTestReportXjl(Assist assist);
	
	/**
	 * 获得一个VQualityTestReportXjl对象,以参数VQualityTestReportXjl对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	VQualityTestReportXjl selectVQualityTestReportXjlObjSingle(VQualityTestReportXjl obj);
	
	/**
	 * 获得一个VQualityTestReportXjl对象,以参数VQualityTestReportXjl对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<VQualityTestReportXjl> selectVQualityTestReportXjlByObj(VQualityTestReportXjl obj);

	/**
	 * 插入VQualityTestReportXjl到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportXjl(VQualityTestReportXjl value);
	
	/**
	 * 插入VQualityTestReportXjl中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullVQualityTestReportXjl(VQualityTestReportXjl value);
	
	/**
	 * 批量插入VQualityTestReportXjl到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportXjlByBatch(List<VQualityTestReportXjl> value);
	
	/**
	 * 通过辅助工具Assist的条件删除VQualityTestReportXjl
	 * 
	 * @param assist
	 * @return
	 */
	int deleteVQualityTestReportXjlByAssist(Assist assist);
	
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportXjl中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateVQualityTestReportXjl(@Param("enti") VQualityTestReportXjl value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportXjl中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullVQualityTestReportXjl(@Param("enti") VQualityTestReportXjl value, @Param("assist") Assist assist);
}