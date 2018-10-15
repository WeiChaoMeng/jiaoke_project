/**
 * FileName: QualityDataManagerDao
 * Author:   Melone
 * Date:     2018/10/15 11:35
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.dao;

import com.jiaoke.quality.bean.QualityDataManagerDay;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/15 11:35
 * @Description:
 */
public interface QualityDataManagerDao {


    /**
     * 分页查询历史数据信息（每天）
     * @param pageFirstNum
     * @param eachPageDataNum
     * @return
     */
    List<QualityDataManagerDay> selectHistoryDataToDay(@Param("pageFirstNum") int pageFirstNum, @Param("eachPageDataNum")int eachPageDataNum);

    /**
     * 分页查询共有多少条信息
     * @return
     */
    int selectHistoryDataToDayCount();
}
