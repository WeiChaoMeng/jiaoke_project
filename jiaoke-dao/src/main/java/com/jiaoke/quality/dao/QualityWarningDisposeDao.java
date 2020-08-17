/**
 * FileName: QualityWarningDisposeDao
 * Author:   Melone
 * Date:     2020/7/21 9:19
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
 * @create: 2020/7/21 09:19
 * @Description:
 */
public interface QualityWarningDisposeDao {
    /**
     *
     * 功能描述: <br>
     *  <查询两个机组本日产品>
     * @param
     * @return
     * @auther Melone
     * @date 2020/7/21 9:43
     */
    List<Map<String, Object>> getTwoCrewPro();

    /**
     *
     * 功能描述: <br>
     *  <根据日期与配比查询>
     * @param
     * @return
     * @auther Melone
     * @date 2020/7/22 14:37
     */
    List<Map<String, String>> selectProDataByRation(@Param("proDate") String proDate,@Param("rationNum") String rationNum,@Param("crewNum") String crewNum);

    /**
     *
     * 功能描述: <br>
     *  <添加预警信息>
     * @param
     * @return
     * @auther Melone
     * @date 2020/7/23 9:36
     */
    int insertProductWarningMsg(@Param("proMsg") String proMsg,@Param("upUser") String upUser,@Param("upTime") String upTime, @Param("idList") List<String> idList);
}
