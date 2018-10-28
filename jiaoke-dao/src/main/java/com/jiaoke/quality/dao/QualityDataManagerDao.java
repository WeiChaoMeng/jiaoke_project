/**
 * FileName: QualityDataManagerDao
 * Author:   Melone
 * Date:     2018/10/15 11:35
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.dao;

import com.jiaoke.quality.bean.QualityDataManagerDay;
import com.jiaoke.quality.bean.QualityRatioTemplate;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/15 11:35
 * @Description:
 */
public interface QualityDataManagerDao {


    /**
     * 分页查询历史数据信息（每天）
     * @param pageFirstNum
     * @param eachPageDataNum
     * @return
     */
    List<QualityDataManagerDay> selectHistoryDataToDay(@Param("pageFirstNum") int pageFirstNum, @Param("eachPageDataNum")int eachPageDataNum);

    /**
     * 分页查询共有多少条信息
     * @return
     */
    int selectHistoryDataToDayCount();

    /**
     *
     * 功能描述: <br>
     *  <根据日期查询当天产品共有几种配比>
     * @param
     * @return
     * @auther Melone
     * @date 2018/10/26 16:16
     */
    List<String> selectRatioNumListByDate(@Param("producedDate") String producedDate,  @Param("crewNum") String crewNum);

    /**
     * 返回指定日期每种配比的总值
     * @param producedDate
     * @param crewNum
     * @return
     */
    List<Map<String,String>> selectProducedSVG(@Param("producedDate") String producedDate,  @Param("crewNum") String crewNum);

    /**
     * 根据传入的模板id集合查询模板信息
     * @param crewNum
     * @param ratioNumList
     * @return
     */
    List<QualityRatioTemplate> selectRatioMessageById(@Param("crewNum") String crewNum, @Param("ratioNumList") List<String> ratioNumList);

    /**
     *  根据传入日期返回当天所有项目
     * @param producedDate
     * @return
     */
    List<Map<String, String>> selectProduceByDate(@Param("producedDate") String producedDate,@Param("crewNum") String crewNum);


    /**
     * 根据传入日期查询客户产品基本数据
     * @param crewNum
     * @param producedDate
     * @return
     */
    List<Map<String, String>> selectProduceMessageByDate(@Param("producedDate") String producedDate,@Param("crewNum") String crewNum);

    /**
     * 根据日期查询各客户生产数量，及当日生产总量
     * @param producedDate
     * @param crewNum
     * @return
     */
    List<Map<String, String>> selectUserProTotalByDate(@Param("producedDate") String producedDate,@Param("crewNum") String crewNum);
}
