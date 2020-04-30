/**
 * FileName: QualityLeadingCockpit
 * Author:   Melone
 * Date:     2020/4/27 18:53
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
 * @create: 2020/4/27 18:53
 * @Description:
 */
public interface QualityLeadingCockpit {
    /**
     *
     * 功能描述: <br>
     *  <查询当月两个机组的生产情况>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/27 19:36
     */
    List<Map<String, Object>> selectThisMonthTwoCrewData();

    /**
     *
     * 功能描述: <br>
     *  <查询本年两个机组生产情况>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/27 22:12
     */
    List<Map<String, Object>> selectThisYearTwoCrewData();

    /**
     *
     * 功能描述: <br>
     *  <查询本年开工天数>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/28 11:00
     */
    List<Map<String, Object>> selectProductionDays();


    /**
     *
     * 功能描述: <br>
     *  <查询再生料使用总量>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/28 12:41
     */
    List<Map<String, Object>> getMaterialRegenerate();

    /**
     *
     * 功能描述: <br>
     *  <查询再生料本月使用总量>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/28 14:05
     */
    List<Map<String, Object>> getThisMonthRegenerate();
}
