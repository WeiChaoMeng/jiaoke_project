/**
 * FileName: QualityIndexDao
 * author:   Melone
 * Date:     2018/10/9 17:53
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
 * @create: 2018/10/9 17:53
 * @Description:
 */
public interface QualityIndexDao {

    /**
     * 返回上个星期各机组产量
     * @return
     */
    List<Map<String,String>> getLastWeekCrewData();

}
