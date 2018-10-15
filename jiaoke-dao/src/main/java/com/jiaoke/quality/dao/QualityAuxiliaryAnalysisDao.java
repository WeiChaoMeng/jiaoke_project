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
    List<Map<String,String>> selelectWarningLiveDataToList(@Param("pageFirstNum") int pageFirstNum, @Param("eachPageDataNum")int eachPageDataNum,@Param("warningLive") int warningLive);
    /**
     * 根据预警级别返回预警数据分页总数量
     * @param warningLive
     * @return
     */
    int selelectCountWarningLive(@Param("warningLive") int warningLive);


}
