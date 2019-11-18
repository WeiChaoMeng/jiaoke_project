/**
 * FileName: QualityProjectDao
 * Author:   Melone
 * Date:     2019/11/14 18:30
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.dao;

import com.jiaoke.quality.bean.QualityProjectItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/11/14 18:30
 * @Description:
 */
public interface QualityProjectDao {

    /**
     *
     * 功能描述: <br>
     *  <添加客户对应的工程名称>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/14 18:25
     */
    int insertProjectItem(@Param("fromData") QualityProjectItem fromData);

    /**
     *
     * 功能描述: <br>
     *  <查询所有客户对应的工程名称>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/14 19:08
     */
    List<QualityProjectItem> selectUserProjectList();

    /**
     *
     * 功能描述: <br>
     *  <通过id查询客户详细信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/14 21:17
     */
    QualityProjectItem selectUserProjectById(@Param("id") String id);

    /**
     *
     * 功能描述: <br>
     *  <根据id删除用户工程>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/15 12:15
     */
    int delectUserProject(@Param("idStr") String idStr);

    /**
     *
     * 功能描述: <br>
     *  <根据id数组批量删除用户工程>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/15 12:16
     */
    int delectUserProjectByIdArray(@Param("idArr") String[] idArr);

    /**
     *
     * 功能描述: <br>
     *  <根据id修改用户工程表>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/15 13:30
     */
    int updateProjectItem(@Param("fromData") QualityProjectItem fromData);
}
