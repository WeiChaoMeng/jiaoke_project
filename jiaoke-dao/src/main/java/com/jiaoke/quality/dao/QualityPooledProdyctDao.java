/**
 * FileName: QualityPooledProdyctDao
 * Author:   Melone
 * Date:     2020/10/23 10:17
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
 * @create: 2020/10/23 10:17
 * @Description:
 */
public interface QualityPooledProdyctDao {

    List<Map<String,String>> selectProdycyTotalByDate(@Param("startDate") String startDate, @Param("lastDate")  String lastDate);

    List<Map<String, String>> selectEverDayProdacuByDate(@Param("startDate") String startDate,@Param("lastDate")   String lastDate);

    List<Map<String, String>> getAllProductTypeTotal(@Param("startDate") String startDate,@Param("lastDate")   String lastDate);

    List<Map<String, String>> getTwoCrewProduct(@Param("startDate") String startDate,@Param("lastDate")   String lastDate);

    List<Map<String, String>> getProductTotalAndReagenerateTotal(@Param("startDate") String startDate,@Param("lastDate")   String lastDate);

    List<Map<String, String>> getTwoCrewMoreThan100Regenerate(@Param("startDate") String startDate,@Param("lastDate")   String lastDate);

    List<Map<String, String>> getwoCrewMoreThan100Product(@Param("startDate") String startDate,@Param("lastDate")   String lastDate);

    List<Map<String, String>> getTwoCrewMoreThan100RegenerateProduct(@Param("startDate") String startDate,@Param("lastDate")   String lastDate);

    List<Map<String, String>> getAllSquadTotal(@Param("startDate") String startDate,@Param("lastDate")   String lastDate);

    List<Map<String, String>> getAllSquadRegenerate(@Param("startDate") String startDate,@Param("lastDate")   String lastDate);

    List<Map<String, String>> getAllSquadProductMakeUp(@Param("startDate") String startDate,@Param("lastDate")   String lastDate);

    List<Map<String, String>> getProjectTotal(@Param("startDate") String startDate,@Param("lastDate")   String lastDate);

    List<Map<String, String>> getProjectTotalByDate(@Param("startDate") String startDate,@Param("lastDate")   String lastDate);

    List<Map<String, String>> getTwoCrewNotAddRegenerateProduct(@Param("startDate") String startDate,@Param("lastDate")   String lastDate);

    List<Map<String, String>> getRegenerateTypeTotal(@Param("startDate") String startDate,@Param("lastDate")   String lastDate);

    List<Map<String, String>> getTwoCrewContinuousThanProduct(@Param("startDate") String startDate,@Param("lastDate")   String lastDate);

    List<Map<String, String>> getTwoCrewProductByDate(@Param("startDate") String startDate,@Param("lastDate")   String lastDate);

    Map<String, String> getCrew1WeighDataByDate(@Param("startDate") String beforeDate,@Param("lastDate")  String afterDate);

    Map<String, String> getCrew2WeighDataByDate(@Param("startDate") String beforeDate,@Param("lastDate") String afterDate);
}
