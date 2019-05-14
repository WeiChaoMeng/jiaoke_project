/**
 * FileName: QualityDataSummaryDao
 * Author:   Melone
 * Date:     2019/4/29 11:20
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.dao;

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

}
