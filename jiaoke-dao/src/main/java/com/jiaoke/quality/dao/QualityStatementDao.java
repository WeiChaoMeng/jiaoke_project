/**
 * FileName: QualityStatementDao
 * Author:   Melone
 * Date:     2018/11/2 10:54
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.dao;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/11/2 10:54
 * @Description:
 */
public interface QualityStatementDao {

    /**
     *
     * 功能描述: <br>
     *  <返回上个月各级报警占比>
     * @param
     * @return
     * @auther Melone
     * @date 2018/11/2 11:09
     */
    List<Map<String, Object>> selectLastMonthStatementToEchars();

    /**
     * 返回开始日期与结束日期，生产数量
     * @return
     */
    List<Map<String, String>> selectDateAndCount();

    /**
     * 返回三级预警最多材料
     * @return
     */
    List<Map<String, String>> selectMaterialMaxLever();

    /**
     * 返回上个月使用最多得模板
     * @return
     */
    List<Map<String, String>> selectMaxRationAndcount();

    /** Year **/

    /**
     * 返回生产年份集合
     * @return
     */
    List<Map<String, String>> selectYearList();

    /**
     * 返回上一年开始生产日期与结束日期，生产数量
     * @return
     */
    List<Map<String, String>> selectLastYearAndCount();

    /**
     * 返回上一年的三级预警最多的材料
     * @return
     */
    List<Map<String, String>> selectLastYearMaterialMaxLever();

    /**
     * 返回上一年使用最多模板及数量
     * @return
     */
    List<Map<String, String>> selectLastYearMaxRationAndcount();

    /**
     * 返回上一年各级报警占比
     * @return
     */
    List<Map<String, String>> selectLastYearStatementToEchars();

    /**
     * 返回所有生产过的月份
     * @return
     */
    List<Map<String, String>> selectMonthDateList();
}
