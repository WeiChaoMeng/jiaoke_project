/**
 * FileName: QualityDataMontoringInf
 * Author:   Melone
 * Date:     2018/10/12 16:22
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2018/10/12 16:22
 * @Description:
 */
public interface QualityDataMontoringInf {

    /**
     *  查询机组的实时数据
     * @return
     */
    String selectProductionData();

    /**
     *  返回几天内各材料温度
     * @return
     */
    String getRealTimeDataEcharsTemp();


    /**
     * 返回最新数据材料图表数据
     * @return
     */
    String getRealTimeDataEcharsMaterial();

    /**
     *
     * 功能描述: <br>
     *  <返回最近三盘数据平均值>
     * @param
     * @return
     * @auther Melone
     * @date 2019/5/16 17:36
     */
    String getRealTimeThreeProductSVG();
}
