package com.jiaoke.qualitytest.dao.report;
import java.util.List;

import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.report.VQualityTestReportCjl;

import org.apache.ibatis.annotations.Param;
/**
 * VQualityTestReportCjl的Dao接口
 * 
 * @author 
 *
 */
public interface VQualityTestReportCjlDao {

	/**
	 * 获得VQualityTestReportCjl数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getVQualityTestReportCjlRowCount(Assist assist);
	
	/**
	 * 获得VQualityTestReportCjl数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<VQualityTestReportCjl> selectVQualityTestReportCjl(Assist assist);
	
	/**
	 * 获得一个VQualityTestReportCjl对象,以参数VQualityTestReportCjl对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	VQualityTestReportCjl selectVQualityTestReportCjlObjSingle(VQualityTestReportCjl obj);
	
	/**
	 * 获得一个VQualityTestReportCjl对象,以参数VQualityTestReportCjl对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<VQualityTestReportCjl> selectVQualityTestReportCjlByObj(VQualityTestReportCjl obj);

	/**
	 * 插入VQualityTestReportCjl到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportCjl(VQualityTestReportCjl value);
	
	/**
	 * 插入VQualityTestReportCjl中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullVQualityTestReportCjl(VQualityTestReportCjl value);
	
	/**
	 * 批量插入VQualityTestReportCjl到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportCjlByBatch(List<VQualityTestReportCjl> value);
	
	/**
	 * 通过辅助工具Assist的条件删除VQualityTestReportCjl
	 * 
	 * @param assist
	 * @return
	 */
	int deleteVQualityTestReportCjlByAssist(Assist assist);
	
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportCjl中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateVQualityTestReportCjl(@Param("enti") VQualityTestReportCjl value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportCjl中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullVQualityTestReportCjl(@Param("enti") VQualityTestReportCjl value, @Param("assist") Assist assist);
}