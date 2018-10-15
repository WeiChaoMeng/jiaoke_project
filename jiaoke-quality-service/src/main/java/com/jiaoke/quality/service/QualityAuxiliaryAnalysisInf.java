/**
 * FileName: QualityAuxiliaryAnalysisInf
 * Author:   Melone
 * Date:     2018/10/15 15:00
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

import com.jiaoke.common.bean.PageBean;

import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/15 15:00
 * @Description:
 */
public interface QualityAuxiliaryAnalysisInf {

    /**
     * 根据预警级别返回报警数据集
     * @param i
     * @param url
     * @param warningLive
     * @return
     */
    PageBean<Map<String,String>> selelectWarningLiveData(int i, String url, String warningLive);
}
