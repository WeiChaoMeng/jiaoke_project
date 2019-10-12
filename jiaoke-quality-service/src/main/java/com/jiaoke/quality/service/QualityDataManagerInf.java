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

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

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

    /**
     * 查询每天各个模板产品信息
     * @param producedDate
     * @param crewNum
     * @return
     */
    Map<String, Object> selectProducttionByDate(String producedDate, String crewNum, HttpServletRequest request);

    /**
     * 点击查看按钮后根据传来的id查询信息
     * @param id
     * @return
     */
    Map<String, Object> selectProductMessageById(String id,String crewNum);

    /**
     * 根据配比号、日期、机组查询所有产品
     * @param ratioNum
     * @param crewNum
     * @param date
     * @return
     */
    Map<String,Object> selectProListByRatioNumAndDate(String ratioNum, String crewNum, String date);

    /**
     *
     * 功能描述: <br>
     *  <获取20盘产品平均值>
     * @param
     * @return
     * @auther Melone
     * @date 2019/5/13 18:07
     */
    String getProSVGRationAndModelRation(String productSVG);

    /**
     *
     * 功能描述: <br>
     *  <获取级配图产品相关数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/5/13 18:08
     */
    String getProductSvgGrading(String productSVG);

    /**
     *
     * 功能描述: <br>
     *  <根据ID与机组查询Echarts需要的相关数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/10/8 19:58
     */
    String selectEchartsDataById(String id, String crewNum);

    /**
     *
     * 功能描述: <br>
     *  <根据机组、生产时间、生产日期查询>
     * @param
     * @return
     * @auther Melone
     * @date 2019/10/10 9:30
     */
    Map<String, Object> selectWarningMessageById(String crewNum, String produceDate, String produceTime);
}
