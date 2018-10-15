/**
 * FileName: QualityRealTimeWarningDao
 * Author:   Melone
 * Date:     2018/10/15 19:14
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
 * @create: 2018/10/15 19:14
 * @Description:
 */
public interface QualityRealTimeWarningDao {

    /**
     * 查询最后的预警数据
     * @return
     */
    List<Map<String,String>> selectLastWarningData();

}
