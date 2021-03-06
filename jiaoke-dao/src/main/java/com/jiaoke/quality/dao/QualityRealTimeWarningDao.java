/**
 * FileName: QualityRealTimeWarningDao
 * Author:   Melone
 * Date:     2018/10/15 19:14
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
 * @create: 2018/10/15 19:14
 * @Description:
 */
public interface QualityRealTimeWarningDao {

    /**
     * 查询最后的预警数据
     * @return
     */
    List<Map<String,String>> selectLastWarningData();

    /**
     * 查询最后的预警信息展现echars
     * @return
     */
    List<Map<String, Object>> selectWarningEcharsData();

    /**
     *
     * 功能描述: <br>
     *  <查询每个机组最后三盘数据平均值>
     * @param
     * @return
     * @auther Melone
     * @date 2019/5/14 18:06
     */
    List<Map<String, String>> selectThreeWarningData();

    /**
     *
     * 功能描述: <br>
     *  <查询机组需要全局预警的数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/5/15 11:20
     */
    List<Map<String, Object>> selectGlobalWarningData();

    /**
     *
     * 功能描述: <br>
     *  <查询所有预警级别数据>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/1 11:02
     */
    List<Map<String, String>>  selectWarningLevelData();

    /**
     *
     * 功能描述: <br>
     *  <更新预警级别>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/3 12:30
     */
    int updataWarningLevel(@Param("map") Map<String, String> map);
}
