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
}
