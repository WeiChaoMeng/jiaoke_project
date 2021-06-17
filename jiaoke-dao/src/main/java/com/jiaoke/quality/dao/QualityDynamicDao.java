/**
 * FileName: QualityDynamicDao
 * Author:   Melone
 * Date:     2018/12/21 15:45
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/12/21 15:45
 * @Description:
 */
public interface QualityDynamicDao {

    List<Map<String, String>> getLastDayToChars();

    List<Map<String,Object>> getAggregateRatioByMoudelId(@Param("ratioName")  String ratioName,@Param("moudelId") Set moudelId ,@Param("crew")String crew ,@Param("strDate")String strDate);

    List<Map<String,String>> selectRatioListByDate(@Param("startDate") String startDate, @Param("endDate")String endDate, @Param("crew")String crew,@Param("crewNum")String crewNum);

    List<Map<String, String>> selectProductByMaterialAndDate(@Param("startDate") String startDate,@Param("endDate") String endDate,@Param("material")  String material, @Param("ratioNum")String ratioNum,  @Param("crew")String crew);

    List<Map<String, String>> getLastWeekToChars();
}
