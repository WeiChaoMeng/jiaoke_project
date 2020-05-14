/**
 * FileName: LeadCockpitServiceDao
 * Author:   Melone
 * Date:     2020/5/10 16:17
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.LeadCockpit.dao;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/5/10 16:17
 * @Description:
 */
public interface LeadCockpitServiceDao {

    /**
     *
     * 功能描述: <br>
     *  <查询前十工程>
     * @param
     * @return
     * @auther Melone
     * @date 2020/5/13 9:15
     */
    List<Map<String, String>> selectTopTenProject();
    /**
     *
     * 功能描述: <br>
     *  <查询本月前十产品>
     * @param
     * @return
     * @auther Melone
     * @date 2020/5/13 9:15
     */
    List<Map<String, String>> selectThisMonthProduct();

    /**
     *
     * 功能描述: <br>
     *  <查询本月产量>
     * @param
     * @return
     * @auther Melone
     * @date 2020/5/13 9:16
     */
    List<Map<String, String>> selectThisMonthYield();
}
