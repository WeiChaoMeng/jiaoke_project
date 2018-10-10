/**
 * FileName: QualityIndexInf
 * Author:   Melone
 * Date:     2018/10/9 17:47
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/9 17:47
 * @Description:
 */
public interface QualityIndexInf {

    /**
     * 返回上个星期每周各机组产量
     * @return
     */
    Map<String,String> getLastWeekCrewData();
}
