/**
 * FileName: QualityDataSummaryInf
 * Author:   Melone
 * Date:     2019/4/29 11:18
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/4/29 11:18
 * @Description:
 */
public interface QualityDataSummaryInf {
    /**
     *
     * 功能描述: <br>
     *  <查询近三天生产数据>
     * @param
     * @return 
     * @auther Melone
     * @date 2019/4/29 11:32
     */
    String getThreeDayData();

    /**
     *
     * 功能描述: <br>
     *  <查询日期范围内所生产得配比>
     * @param
     * @return
     * @auther Melone
     * @date 2019/4/30 14:44
     */
    List<Map<String, Object>> getRatioListByDateTimeAndCrew(String startDate, String endDate, String crew);

    List<Map<String,Object>> getPromessageByRaionModel(String startDate, String endDate, String crew, String rationId);

    void getProSvgmessage(String startDate, String endDate, String crew, String rationId, HttpServletRequest request);

    /**
     *
     * 功能描述: <br>
     *  <查询所有关键预警数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/20 12:10
     */
    String getAllCriticalWarning();

    /**
     *
     * 功能描述: <br>
     *  <根据日期盘好查询核心预警数据相关信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/21 8:39
     */
    Map<String, Object> getCeiticalWarning(String proDate, String produceDisc,String crewNum);
}
