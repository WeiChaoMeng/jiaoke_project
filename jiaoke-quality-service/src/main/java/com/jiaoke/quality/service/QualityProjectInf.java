/**
 * FileName: QualityProjectInf
 * Author:   Melone
 * Date:     2019/11/14 16:55
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.jiaoke.quality.bean.QualityProjectItem;

import java.text.ParseException;
import java.util.List;
import java.util.concurrent.ExecutionException;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/11/14 16:55
 * @Description:
 */
public interface QualityProjectInf {
    
    /**
     *
     * 功能描述: <br>
     *  <添加客户对应的工程名称>
     * @param 
     * @return 
     * @auther Melone
     * @date 2019/11/14 18:25
     */
    int addProjectItem(QualityProjectItem fromData);

    /**
     *
     * 功能描述: <br>
     *  <查询所有客户对应的工程名称>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/14 19:08
     */
    List<QualityProjectItem> getUserProjectList() throws Exception;

    /**
     *
     * 功能描述: <br>
     *  <通过id查询客户详细信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/14 21:16
     */
    QualityProjectItem getUserProjectById(String id);

    /**
     *
     * 功能描述: <br>
     *  <根据单个id删除用户工程>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/15 12:12
     */
    int delectUserProject(String idStr);

    /**
     *
     * 功能描述: <br>
     *  <根据id数组删除id>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/15 12:13
     */
    int delectUserProjectByIdArray(String[] idArr);

    /**
     *
     * 功能描述: <br>
     *  <修改用户工程信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/15 13:27
     */
    int editProjectItem(QualityProjectItem fromData);

    /**
     *
     * 功能描述: <br>
     *  <车牌号绑定生产信息>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/16 9:34
     */
    void  editProductionDataByCarNum(String carNum) throws ExecutionException, InterruptedException, ParseException;
}
