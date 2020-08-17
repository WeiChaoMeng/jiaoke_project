/**
 * FileName: LeadCockpitServiceDao
 * Author:   Melone
 * Date:     2020/5/10 16:17
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.LeadCockpit.dao;

import org.apache.ibatis.annotations.Param;

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

    /**
     *
     * 功能描述: <br>
     *  <查询俩个机组最后一条数据相同产品三日内数据>
     * @param
     * @return
     * @auther Melone
     * @date 2020/5/14 18:47
     */
    List<Map<String, String>> selectAsphaltAggregateRatio();

    /**
     *
     * 功能描述: <br>
     *  <查询本日生产两个机组生产的产品>
     * @param
     * @return
     * @auther Melone
     * @date 2020/5/18 19:51
     */
    List<Map<String, String>> selectTodayProductList();

    /**
     *
     * 功能描述: <br>
     *  <查询两个机组的当日产品>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/9 19:06
     */
    List<Map<String, String>> getThisDayProduct();

    /**
     *
     * 功能描述: <br>
     *  <查询两个机组最多产品的温度曲线图>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/10 11:01
     */
    List<Map<String, String>> getThisDayMaxProductTemperature(@Param("proportioningNum") String proportioningNum);
    /**
     *
     * 功能描述: <br>
     *  <查询两个机组最多产品>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/10 11:01
     */
    Map<String, String> getThisDayMaxProportioningNum();

    /**
     *
     * 功能描述: <br>
     *  <查询各材料预警盘数>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/10 15:08
     */
    List<Map<String, String>> getWarningProportion(@Param("proportioningNum") String proportioningNum);

    /**
     *
     * 功能描述: <br>
     *  <查询今日产量最高产品盘数>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/10 15:14
     */
    Map<String, String> getThisDayMaxproductNumMap(@Param("proportioningNum") String proportioningNum);



    /**
     *
     * 功能描述: <br>
     *  <查询今日产量最高产品平均信息>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/10 16:21
     */
    List<Map<String, String>> getProductSvg(@Param("proportioningNum") String proportioningNum);

    /**
     *
     * 功能描述: <br>
     *  <查询基本信息>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/10 16:21
     */
    List<Map<String, String>> getProductBasicMsg(@Param("proportioningNum") String proportioningNum);

    /**
     *
     * 功能描述: <br>
     *  <根据日期、配比号查询温度列表>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/11 10:11
     */
    List<Map<String, String>> getMaxProductTemperatureByRationAndDate(@Param("startDate") String startDate,@Param("endDate")  String endDate,@Param("ration")   String ration);

    /**
     *
     * 功能描述: <br>
     *  <查询日期内该配比生产的盘数>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/11 10:25
     */
    Map<String, String> getMaxproductNumMapByDate(@Param("startDate") String startDate,@Param("endDate")  String endDate,@Param("ration")   String ration);

    /**
     *
     * 功能描述: <br>
     *  <查询各材料预警盘数>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/11 10:29
     */
    List<Map<String, String>> getWarningProportionByRationAndDate(@Param("startDate") String startDate,@Param("endDate")  String endDate,@Param("ration")   String ration);

    /**
     *
     * 功能描述: <br>
     *  <查询日期内该配比平均级配信息>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/11 11:02
     */
    List<Map<String, String>> getProductSvgByRationAndDate(@Param("startDate") String startDate,@Param("endDate")  String endDate,@Param("ration")   String ration);

    /**
     *
     * 功能描述: <br>
     *  <查询日期内该配比产品基本信息>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/11 11:12
     */
    List<Map<String, String>> getProductBasicMsgByDateAndRation(@Param("startDate") String startDate,@Param("endDate")  String endDate,@Param("ration")   String ration);

    /**
     *
     * 功能描述: <br>
     *  <查询日期内产品>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/11 13:45
     */
    List<Map<String, String>> getProductToEchars(@Param("startDate") String startDate,@Param("endDate")   String endDate);
    /**
     *
     * 功能描述: <br>
     *  <查询本日指定配比下所有产品>
     * @param
     * @return
     * @auther Melone
     * @date 2020/7/28 9:21
     */
    List<Map<String, String>> getAllProduct(@Param("proportioningNum") String proportioningNum);

    /**
     *
     * 功能描述: <br>
     *  <根据配比好获取指定配比>
     * @param
     * @return
     * @auther Melone
     * @date 2020/7/28 9:39
     */
    Map<String, String> getRationModel(@Param("proportioningNum") String proportioningNum);

    /**
     *
     * 功能描述: <br>
     *  <根据日期间隔查询所有产品>
     * @param
     * @return
     * @auther Melone
     * @date 2020/7/28 10:33
     */
    List<Map<String, String>> getAllProductByDate(@Param("startDate") String startDate,@Param("endDate") String endDate,@Param("ration") String ration);

}
