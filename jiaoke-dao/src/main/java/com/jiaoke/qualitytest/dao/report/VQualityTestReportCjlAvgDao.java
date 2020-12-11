package com.jiaoke.qualitytest.dao.report;
import java.util.List;


import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.report.VQualityTestReportCjlAvg;
import org.apache.ibatis.annotations.Param;
/**
 * VQualityTestReportCjlAvg的Dao接口
 * 
 * @author 
 *
 */
public interface VQualityTestReportCjlAvgDao {

	/**
	 * 获得VQualityTestReportCjlAvg数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getVQualityTestReportCjlAvgRowCount(Assist assist);
	
	/**
	 * 获得VQualityTestReportCjlAvg数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<VQualityTestReportCjlAvg> selectVQualityTestReportCjlAvg(Assist assist);
	
	/**
	 * 获得一个VQualityTestReportCjlAvg对象,以参数VQualityTestReportCjlAvg对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	VQualityTestReportCjlAvg selectVQualityTestReportCjlAvgObjSingle(VQualityTestReportCjlAvg obj);
	
	/**
	 * 获得一个VQualityTestReportCjlAvg对象,以参数VQualityTestReportCjlAvg对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<VQualityTestReportCjlAvg> selectVQualityTestReportCjlAvgByObj(VQualityTestReportCjlAvg obj);

	/**
	 * 插入VQualityTestReportCjlAvg到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportCjlAvg(VQualityTestReportCjlAvg value);
	
	/**
	 * 插入VQualityTestReportCjlAvg中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullVQualityTestReportCjlAvg(VQualityTestReportCjlAvg value);
	
	/**
	 * 批量插入VQualityTestReportCjlAvg到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertVQualityTestReportCjlAvgByBatch(List<VQualityTestReportCjlAvg> value);
	
	/**
	 * 通过辅助工具Assist的条件删除VQualityTestReportCjlAvg
	 * 
	 * @param assist
	 * @return
	 */
	int deleteVQualityTestReportCjlAvgByAssist(Assist assist);
	
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportCjlAvg中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateVQualityTestReportCjlAvg(@Param("enti") VQualityTestReportCjlAvg value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新VQualityTestReportCjlAvg中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullVQualityTestReportCjlAvg(@Param("enti") VQualityTestReportCjlAvg value, @Param("assist") Assist assist);
}