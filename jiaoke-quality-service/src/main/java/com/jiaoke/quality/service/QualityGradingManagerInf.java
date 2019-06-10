/**
 * FileName: QualityGradingManagerInf
 * Author:   Melone
 * Date:     2019/5/29 17:07
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/5/29 17:07
 * @Description:
 */

public interface QualityGradingManagerInf {

    /**
     *
     * 功能描述: <br>
     *  <查询级配模板数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/5/29 17:27
     */
    String getGradingModelList();

    /**
     *
     * 功能描述: <br>
     *  <删除指定级配模板>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/3 12:12
     */
    String delectGrading(String idStr);

    /**
     *
     * 功能描述: <br>
     *  <查询指定ID下的级配内容>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/3 17:49
     */
    String getGrading(String id);
}
