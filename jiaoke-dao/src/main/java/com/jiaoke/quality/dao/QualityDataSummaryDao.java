/**
 * FileName: QualityDataSummaryDao
 * Author:   Melone
 * Date:     2019/4/29 11:20
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.dao;

import com.jiaoke.quality.bean.QualityRatioTemplate;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/4/29 11:20
 * @Description:
 */
public interface QualityDataSummaryDao {
    /**
     *
     * 功能描述: <br>
     *  <查询近三天生产数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/4/29 11:26
     */
    List<Map<String, Object>> selectThreeDayData();

    List<Map<String, Object>> selectRatioListByDateTimeAndCrew(@Param("startDate") String startDate, @Param("endDate")String endDate,@Param("crew") String crew);

    List<Map<String,Object>> selectPromessageByRaionModel(@Param("startDate") String startDate, @Param("endDate")String endDate,@Param("crew") String crew,@Param("rationId") String rationId);

    Map<String, String> selectRaionModelById(@Param("crewNum")String crew, @Param("rationNum")String rationId);

    /**
     *
     * 功能描述: <br>
     *  <查询所有关键预警数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/20 12:13
     */
    List<Map<String, String>> selectAllCriticalWarning();

    /**
     *
     * 功能描述: <br>
     *  <根据日期、盘号、机组查询生产信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/21 8:46
     */
    Map<String, String> selectProductMessageById(@Param("proDate") String proDate,@Param("produceDisc") String produceDisc,@Param("crewStr") String crewStr);

    /**
     *
     * 功能描述: <br>
     *  <根据日期与盘号查询预警信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/21 8:55
     */
    List<Map<String, String>> selectProduceByDateAndDiscNum(@Param("date")String proDate,@Param("discNum") String discNum,@Param("crewNum") String crewNum);

    /**
     *
     * 功能描述: <br>
     *  <根据配比编号查询配比信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/21 8:59
     */
    QualityRatioTemplate selectRationById(@Param("ratioNum") String ratioNum,@Param("crewNum") String crewNum);
}
