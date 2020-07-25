/**
 * FileName: QualityWarningDisposeInf
 * Author:   Melone
 * Date:     2020/7/21 9:17
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import java.util.List;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2020/7/21 09:17
 * @Description:
 */
public interface QualityWarningDisposeInf {
    /**
     *
     * 功能描述: <br>
     *  <查询两个机组本日产品>
     * @param
     * @return
     * @auther Melone
     * @date 2020/7/21 9:23
     */
    String getTwoCrewPro();

    /**
     *
     * 功能描述: <br>
     *  <根据日期与配比查询产品>
     * @param
     * @return
     * @auther Melone
     * @date 2020/7/22 14:30
     */
    String getProDataByRation(String proDate, String rationNum,String crewNum);

    /**
     *
     * 功能描述: <br>
     *  <添加产品预警信息>
     * @param
     * @return
     * @auther Melone
     * @date 2020/7/23 9:34
     */
    String addProductWarningMsg(String proMsg, List<String> idList);
}
