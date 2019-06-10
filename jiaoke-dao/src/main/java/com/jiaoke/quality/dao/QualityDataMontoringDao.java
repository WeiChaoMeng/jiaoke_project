/**
 * FileName: QualityDataMontoringDao
 * Author:   Melone
 * Date:     2018/10/12 16:24
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
 * @create: 2018/10/12 16:24
 * @Description:
 */
public interface QualityDataMontoringDao {

    /**
     *  查询机组的实时数据
     * @return
     */
    List<Map<String,Object>> selectProductionData();

    /**
     * 查询机组最后七盘数据
     * @return
     */
    List<Map<String, String>> selectRealTimeDataEcharsTemp();


    /**
     * 查询机组最新数据展现质量预警图表上
     * @return
     */
    List<Map<String, String>> selectRealTimeDataEcharsMaterial();


    /**
     * 根据机组与模板号查询级配相关数据
     * @param crewNum
     * @param rationNum
     * @return
     */
    List<Map<String, String>> selectGradingBycrewNumAndRationNum(@Param("crewNum") String crewNum, @Param("rationNum") String rationNum);

    /**
     * 根据机组与配比号获取配比通知单相关数据
     * @param crewNum
     * @param rationNum
     * @return
     */
    List<Map<String, String>> selectRationByCrewAndRotinNum(@Param("crewNum")  String crewNum, @Param("rationNum") String rationNum);

    /**
     *
     * 功能描述: <br>
     *  <返回最近三盘数据平均值>
     * @param
     * @return
     * @auther Melone
     * @date 2019/5/16 17:38
     */
    List<Map<String, Object>> selectRealTimeThreeProductSVG();
}
