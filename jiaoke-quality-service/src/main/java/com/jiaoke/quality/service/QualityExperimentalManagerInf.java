/**
 * FileName: QualityExperimentalManagerInf
 * Author:   Melone
 * Date:     2019/6/26 11:54
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.service;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/6/26 11:54
 * @Description:
 */
public interface QualityExperimentalManagerInf {
    /**
     *
     * 功能描述: <br>
     *  <返回取样单表单下拉框相关数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/26 11:56
     */
    String getSamplingPageFromData();

    /**
     *
     * 功能描述: <br>
     *  <查询所有取样单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/26 14:10
     */
    String getAllSamplingPage();

    /**
     *
     * 功能描述: <br>
     *  <根据ID删除取样单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/26 17:38
     */
    String removeSampleById(String id);

    /**
     *
     * 功能描述: <br>
     *  <添加新的取样单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/27 10:17
     */
    String addSample(String materials, String manufacturers, String specification, String tunnage, String creat_time, String remark);

    /**
     *
     * 功能描述: <br>
     *  <确认完成委托单生产委托单、任务单、实验过程>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/27 12:06
     */
    String confirmCompletedById(String id);

    /**
     *
     * 功能描述: <br>
     *  <获取所有委托单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/27 17:04
     */
    String getAllexperimental();

    /**
     *
     * 功能描述: <br>
     *  <根据ID查询委托单信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/28 11:45
     */
    String getExperimentalMessageById(String id);


    /**
     *
     * 功能描述: <br>
     *  <根据委托单编号查询所有实验项目>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/2 10:27
     */
    String getExperimentalItemByOrderNum(String orderNum);

    /**
     *
     * 功能描述: <br>
     *  <根据委托单ID查询试验项目列表>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/2 12:20
     */
    String getExperimentalItemById(String id);

    /**
     *
     * 功能描述: <br>
     *  <根据委托单编号，添加试验项目>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/2 15:05
     */
    String addExperimentalItemByOrderTicketNum(String orderTicketNum, String experimentalItemId);

    /**
     *
     * 功能描述: <br>
     *  <查询委托单下试验项目数量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/2 16:14
     */
    String getExperimentalItemCount(String orderTicketNum);


    /**
     *
     * 功能描述: <br>
     *  <查询所有实验>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/8 17:24
     */
    String getAllExperimentalItem();

    /**
     *
     * 功能描述: <br>
     *  <根据ID查询指定未完实验信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/8 18:01
     */
    String getExperimentalItemMsgById(String id);

    /**
     *
     * 功能描述: <br>
     *  <根据ID查询指定实验项目>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/11 18:18
     */
    String getExperimentalItemNumList(String id);

    /**
     *
     * 功能描述: <br>
     *  <插入实验信息，插入实验项目表>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/12 15:13
     */
    String addExperimentalMsgAndItem(String fromJson,String firstTest,String coarseTest);

    /**
     *
     * 功能描述: <br>
     *  <获取实验相关信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/16 16:43
     */
    String getExperimentalProjectMessage(String id);

    /**
     *
     * 功能描述: <br>
     *  <根据表名获取实验详细信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/16 19:48
     */
   String getExperimentalProjectItem( String tableName,String experiment_num);

    /**
     *
     * 功能描述: <br>
     *  <根据实验单ID删除实验单、取样单等相关表单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/17 10:30
     */
    String removeExperimentalItemById(String id);
}
