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
    Map<String,Object> getRatioListByDateTimeAndCrew(String startDate, String endDate, String crew);

    List<Map<String,Object>> getPromessageByRaionModel(String startDate, String endDate, String crew, String rationId, String projectName);

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

    /**
     *
     * 功能描述: <br>
     *  <查询指定日期内生产的产品类型>
     * @param
     * @return
     * @auther Melone
     * @date 2019/9/17 10:08
     */
    List<Map<String, Object>> mobileGetRatioListByDate(String startDate, String crew);


    /**
     *
     * 功能描述: <br>
     *  <移动端根据日期机组获取生产信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/9/17 10:32
     */
    List<Map<String, Object>> getMobilePromessageByRaionModel(String startDate, String crew, String rationId);

    /**
     *
     * 功能描述: <br>
     *  <查询昨天一、二机组生产数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/10/8 20:51
     */
    List<Map<String, Object>> mobileGetYesterdayProduct();

    /**
     *
     * 功能描述: <br>
     *  <根据机组日期>
     * @param
     * @return
     * @auther Melone
     * @date 2019/10/10 16:29
     */
    String getWarningDataByDate(String crew, String startDate);

    /**
     *
     * 功能描述: <br>
     *  <根据日期查询预警信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/10/16 13:16
     */
    String getAllCriticalWarningByDate(String startDate, String endDate);

    /**
     *
     * 功能描述: <br>
     *  <根据日期查询工程名称、产品类型>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/21 14:22
     */
    Map<String,Object> getProjectNameByDate(String startDate, String endDate);
}
