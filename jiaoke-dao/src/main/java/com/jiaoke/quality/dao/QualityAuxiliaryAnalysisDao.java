/**
 * FileName: QualityAuxiliaryAnalysisDao
 * author:   Melone
 * Date:     2018/10/15 14:49
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
 * @create: 2018/10/15 14:49
 * @Description:
 */
public interface QualityAuxiliaryAnalysisDao {


    /**
     * 查询预警等级超过一定限制的数据
     * @param pageFirstNum
     * @param eachPageDataNum
     * @param warningLive
     * @return
     */
    List<Map<String,String>> selelectWarningLiveDataToList(@Param("pageFirstNum") int pageFirstNum, @Param("eachPageDataNum")int eachPageDataNum,@Param("warningLive") int warningLive ,@Param("startDate")String startDate,@Param("endDate")String endDate,@Param("crew")String crew,@Param("rationId")String rationId);
    /**
     * 根据预警级别返回预警数据分页总数量
     * @param warningLive
     * @return
     */
    int selelectCountWarningLive(@Param("warningLive") int warningLive,@Param("startDate")String startDate,@Param("endDate")String endDate,@Param("crew")String crew,@Param("rationId")String rationId);


    /**
     * 根据预警基础信息查询预警级别详细信息
     * @param idList
     * @return
     */
    List<Map<String, String>> selectWaringData(@Param("idList")  List<String> idList);

    /**
     * 根据日期及盘号查询产品数据
     * @param prodate
     * @param discNum
     * @param crewNum
     * @return
     */
    Map<String, String> getProMessageByDate(@Param("prodate")  String prodate, @Param("discNum")  String discNum, @Param("crewNum")  String crewNum);

    /**
     * 根据ID返回产品
     * @return
     */
    List<Map<String, String>> getWaringList(@Param("producedId") String producedId);

    /**
     * 返回产品材料集合
     * @return
     */
    List<Map<String, String>> selectRealTimeDataEcharsMaterial(@Param("id") String id,@Param("crewNum") String crewNum);

    /**
     * 根据配比号与机组号返回 级配
     * @param crewNum
     * @param rationNum
     * @return
     */
    List<Map<String, String>> selectGradingBycrewNumAndRationNum(String crewNum, String rationNum);
}
