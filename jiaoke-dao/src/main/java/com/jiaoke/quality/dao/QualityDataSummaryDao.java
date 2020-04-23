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

    Map<String, String> selectRaionModelById(@Param("crewNum")String crew, @Param("rationNum")String rationId,@Param("proDate") String proDate);

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
    QualityRatioTemplate selectRationById(@Param("ratioNum") String ratioNum,@Param("crewNum") String crewNum,@Param("proDate") String proDate);

    /**
     *
     * 功能描述: <br>
     *  <>
     * @param
     * @return
     * @auther Melone
     * @date 2019/9/17 10:16
     */
    List<Map<String, Object>> mobileGetRatioListByDate(@Param("startDate") String startDate,@Param("crew")  String crew);

    /**
     *
     * 功能描述: <br>
     *  <根据日期与机组查询相关产品信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/9/17 10:39
     */
    List<Map<String, Object>> selectMobilePromessageByRaionModel( @Param("startDate") String startDate,@Param("crew")  String crew,@Param("rationId")  String rationId);

    /**
     *
     * 功能描述: <br>
     *  <移动端根据指定id与机组查询echarts数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/10/8 20:01
     */
    List<Map<String, String>> selectEchartsDataById(@Param("id") String id,@Param("crew")  String crewNum);

    /**
     *
     * 功能描述: <br>
     *  <查询昨天生产数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/10/8 20:52
     */
    List<Map<String, Object>> selectmobileGetYesterdayProduct();

    /**
     *
     * 功能描述: <br>
     *  <根据机组、生产日期、生产时间查询相关数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/10/10 9:33
     */
    Map<String, String> selectWarningMessageById(@Param("crewNum") String crewNum,@Param("produceDate") String produceDate,@Param("produceTime") String produceTime);

    /**
     *
     * 功能描述: <br>
     *  <根据机组、日期查询预警数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/10/10 16:40
     */
    List<Map<String, String>> selectMobileWarningDataByDate(@Param("crew") String crew,@Param("startDate") String startDate);

    /**
     *
     * 功能描述: <br>
     *  <根据日期时间查询核心报警信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/10/16 13:19
     */
    List<Map<String, String>> getAllCriticalWarningByDate(@Param("startDate") String startDate,@Param("endDate") String endDate);

    /**
     *
     * 功能描述: <br>
     *  <根据日期查询工程名称、产品类型>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/21 14:32
     */
    List<Map<String, String>> selectProjectNameByDate(@Param("startDate") String startDate,@Param("endDate") String endDate);

    /**
     *
     * 功能描述: <br>
     *  <查询工程根据日期与机组>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/23 9:34
     */
    List<Map<String, Object>> selectProjectByDateAndCrewNum(@Param("startDate") String startDate,
                                                            @Param("endDate")  String endDate,
                                                            @Param("crewNum") String crewNum);

    /**
     *
     * 功能描述: <br>
     *  <查询生产数据根据工程名与配比>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/23 10:31
     */
    List<Map<String, Object>> selectPromessageByRaionModelAndProject(@Param("startDate") String startDate,
                                                                     @Param("endDate")   String endDate,
                                                                     @Param("crew")  String crew,
                                                                     @Param("rationId")  String rationId,
                                                                     @Param("projectName") String projectName);
}
