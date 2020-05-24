/**
 * FileName: LeadCockpitServiceInf
 * author:   Melone
 * Date:     2020/5/10 16:12
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.leadCockpit.service;

import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/5/10 16:12
 * @Description:
 */
public interface LeadCockpitServiceInf {
    /**
     * 查询前十工程
     * @return
     */
    Map<String, Object> getTopTenProject();
    /**
     *
     * 功能描述: <br>
     *  <查询本月产量及前十产品类型>
     * @param
     * @return
     * @auther Melone
     * @date 2020/5/13 9:09
     */
    Map<String, Object> getThisMonthYield();

    /**
     *
     * 功能描述: <br>
     *  <获取三日内油石比>
     * @param
     * @return
     * @auther Melone
     * @date 2020/5/14 16:05
     */
    Map<String, Object> getAsphaltAggregateRatio();

    /**
     *
     * 功能描述: <br>
     *  <查询本日生产记录>
     * @param
     * @return
     * @auther Melone
     * @date 2020/5/18 19:46
     */
    Map<String, Object> getTodayProductList();
}
