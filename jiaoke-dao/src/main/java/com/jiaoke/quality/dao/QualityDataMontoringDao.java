/**
 * FileName: QualityDataMontoringDao
 * Author:   Melone
 * Date:     2018/10/12 16:24
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
 * @create: 2018/10/12 16:24
 * @Description:
 */
public interface QualityDataMontoringDao {

    /**
     *  查询机组的实时数据
     * @return
     */
    List<Map<String,Object>> selectProductionData();

}
