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

    /**
     * 查询预警信息的Echars信息
     * @return
     */
    String getWarningEcharsData();

    /**
     *
     * 功能描述: <br>
     *  <查询质量监控全局报警数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/5/15 11:16
     */
    String getGlobalWarningData();
}
