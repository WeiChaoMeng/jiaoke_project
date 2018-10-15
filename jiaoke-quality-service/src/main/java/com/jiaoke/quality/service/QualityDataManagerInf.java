/**
 * FileName: QualityDataManagerInf
 * Author:   Melone
 * Date:     2018/10/15 11:46
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.jiaoke.common.bean.PageBean;
import com.jiaoke.quality.bean.QualityDataManagerDay;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/15 11:46
 * @Description:
 */
public interface QualityDataManagerInf {

    /**
     * 返回数据管理 每天数据统计数据（数据管理第一页）
     * @return
     */
    PageBean<QualityDataManagerDay> selectHistoryDataToDay(int currentPageNum,String url);
}
