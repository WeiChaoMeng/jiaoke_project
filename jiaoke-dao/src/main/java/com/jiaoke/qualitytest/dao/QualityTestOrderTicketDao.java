package com.jiaoke.qualitytest.dao;
import java.util.List;



import com.jiaoke.common.bean.Assist;
import com.jiaoke.qualitytest.bean.QualityTestOrderTicket;
import org.apache.ibatis.annotations.Param;
/**
 * QualityTestOrderTicket的Dao接口
 * 
 * @author 
 *
 */
public interface QualityTestOrderTicketDao {

	/**
	 * 获得QualityTestOrderTicket数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	long getQualityTestOrderTicketRowCount(Assist assist);
	/**
	 * 获得QualityTestOrderTicket完成试验数据的总行数,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 *
	 * @param assist
	 * @return
	 */
	long getUnCompleteQualityTestOrderTicketRowCount(Assist assist);
	/**
	 * 获得QualityTestOrderTicket数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 * 
	 * @param assist
	 * @return
	 */
	List<QualityTestOrderTicket> selectQualityTestOrderTicket(Assist assist);

	/**
	 * 获得QualityTestOrderTicket完成试验数据集合,可以通过辅助工具Assist进行条件查询,如果没有条件则传入null
	 *
	 * @param assist
	 * @return
	 */
	List<QualityTestOrderTicket> selectUnCompleteQualityTestOrderTicket(Assist assist);

	/**
	 * 通过QualityTestOrderTicket的id获得QualityTestOrderTicket对象
	 * 
	 * @param id
	 * @return
	 */
	QualityTestOrderTicket selectQualityTestOrderTicketById(Integer id);
	
	/**
	 * 获得一个QualityTestOrderTicket对象,以参数QualityTestOrderTicket对象中不为空的属性作为条件进行查询,返回符合条件的第一条
	 * 
	 * @param obj
	 * @return
	 */
	QualityTestOrderTicket selectQualityTestOrderTicketObjSingle(QualityTestOrderTicket obj);
	
	/**
	 * 获得一个QualityTestOrderTicket对象,以参数QualityTestOrderTicket对象中不为空的属性作为条件进行查询
	 * 
	 * @param obj
	 * @return
	 */
	List<QualityTestOrderTicket> selectQualityTestOrderTicketByObj(QualityTestOrderTicket obj);

	/**
	 * 插入QualityTestOrderTicket到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestOrderTicket(QualityTestOrderTicket value);
	
	/**
	 * 插入QualityTestOrderTicket中属性值不为null的数据到数据库
	 * 
	 * @param value
	 * @return
	 */
	int insertNotNullQualityTestOrderTicket(QualityTestOrderTicket value);
	
	/**
	 * 批量插入QualityTestOrderTicket到数据库,包括null值
	 * 
	 * @param value
	 * @return
	 */
	int insertQualityTestOrderTicketByBatch(List<QualityTestOrderTicket> value);
	/**
	 * 通过QualityTestOrderTicket的id删除QualityTestOrderTicket
	 * 
	 * @param id
	 * @return
	 */
	int deleteQualityTestOrderTicketById(Integer id);
	
	/**
	 * 通过辅助工具Assist的条件删除QualityTestOrderTicket
	 * 
	 * @param assist
	 * @return
	 */
	int deleteQualityTestOrderTicketByAssist(Assist assist);
	
	/**
	 * 通过QualityTestOrderTicket的id更新QualityTestOrderTicket中的数据,包括null值
	 * 
	 * @param enti
	 * @return
	 */
	int updateQualityTestOrderTicketById(QualityTestOrderTicket enti);
	
	/**
	 * 通过QualityTestOrderTicket的id更新QualityTestOrderTicket中属性不为null的数据
	 * 
	 * @param enti
	 * @return
	 */
	int updateNotNullQualityTestOrderTicketById(QualityTestOrderTicket enti);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestOrderTicket中的数据,包括null值
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateQualityTestOrderTicket(@Param("enti") QualityTestOrderTicket value, @Param("assist") Assist assist);
	
	/**
	 * 通过辅助工具Assist的条件更新QualityTestOrderTicket中属性不为null的数据
	 * 
	 * @param value
	 * @param assist
	 * @return
	 */
	int updateNotNullQualityTestOrderTicket(@Param("enti") QualityTestOrderTicket value, @Param("assist") Assist assist);
}