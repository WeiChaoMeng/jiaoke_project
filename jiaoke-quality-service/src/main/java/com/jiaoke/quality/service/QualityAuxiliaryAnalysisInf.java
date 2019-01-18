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

import javax.servlet.http.HttpServletRequest;
import java.util.List;
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
    PageBean<Map<String,String>> selelectWarningLiveData(int i, String url, String warningLive,String proData,String crew,String rationId);

    /**
     * 根据预警基本信息查询所有相关的预警信息
     * @param pageBean
     * @return
     */
    List<Map<String, String>> selectWaringData(PageBean<Map<String, String>> pageBean);

    /**
     * 根据id以及日期与盘号返回产品详细信息
     * @param prodate
     * @param discNum
     * @return
     */
    void getPageByProductIdAndProdate(String producedId, String prodate, String discNum, String crew, HttpServletRequest request);

    /**
     * 返回json数据用于解析
     * @param id
     * @param crewNum
     * @return
     */
    String getRealTimeDataEcharsMaterial(String id, String crewNum);
}
