/**
 * FileName: QualityGradingManagerDao
 * Author:   Melone
 * Date:     2019/5/29 17:10
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
 * @create: 2019/5/29 17:10
 * @Description:
 */
public interface QualityGradingManagerDao {

    /**
     *
     * 功能描述: <br>
     *  <查询所有级配Model>
     * @param
     * @return
     * @auther Melone
     * @date 2019/5/29 17:34
     */
    List<Map<String, String>> selectGradingModelList();

    /**
     *
     * 功能描述: <br>
     *  <删除指定级配模板>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/3 12:13
     */
    int delectGrading(@Param("idArray") String[] strArray);

    /**
     *
     * 功能描述: <br>
     *  <根据id查询级配相关信息>
     * @param 
     * @return 
     * @auther Melone
     * @date 2019/6/3 17:59
     */
    List<Map<String, String>> selectGradingByModelId(@Param("id") String id);
}
