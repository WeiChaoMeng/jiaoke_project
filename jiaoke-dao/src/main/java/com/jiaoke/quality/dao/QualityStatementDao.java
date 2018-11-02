/**
 * FileName: QualityStatementDao
 * Author:   Melone
 * Date:     2018/11/2 10:54
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.dao;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/11/2 10:54
 * @Description:
 */
public interface QualityStatementDao {

    /**
     *
     * 功能描述: <br>
     *  <返回上个月各级报警占比>
     * @param
     * @return
     * @auther Melone
     * @date 2018/11/2 11:09
     */
    List<Map<String, Object>> selectLastMonthStatementToEchars();
}
