/**
 * FileName: QualityStatementInf
 * Author:   Melone
 * Date:     2018/11/2 10:58
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/11/2 10:58
 * @Description:
 */
public interface QualityStatementInf {

    /**
     * 返回上个月各级报警占比
     * @return
     */
    String selectLastMonthStatementToEchars();
}
