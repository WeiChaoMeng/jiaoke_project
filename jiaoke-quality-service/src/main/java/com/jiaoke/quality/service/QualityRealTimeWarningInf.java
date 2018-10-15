/**
 * FileName: QualityRealTimeWarningInf
 * Author:   Melone
 * Date:     2018/10/15 19:47
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/15 19:47
 * @Description:
 */
public interface QualityRealTimeWarningInf {

    /**
     * 查询最后的预警数据
     * @return
     */
    String selectLastWarningData();

}
