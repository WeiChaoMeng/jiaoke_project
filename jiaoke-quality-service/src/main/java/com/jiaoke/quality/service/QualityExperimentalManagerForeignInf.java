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
public interface QualityExperimentalManagerForeignInf {
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
    String addExperimentalMsgAndItem(String fromJson, String firstTest, String coarseTest);

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
   String getExperimentalProjectItem(String tableName, String experiment_num);

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

    /**
     *
     * 功能描述: <br>
     *  <获取近七天原材料台账信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/24 11:04
     */
    String getSevenDayRawMaterialStandingBook();

    /**
     *
     * 功能描述: <br>
     *  <根据日期查询原材相关试验信息>
     * @param 
     * @return 
     * @auther Melone
     * @date 2019/7/25 11:43
     */
    String getRawMaterialStandingBookByDate(String startDate, String endDate);

    /**
     *
     * 功能描述: <br>
     *  <查询七日内沥青试验台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/25 13:18
     */
    String getAsphaltStandingBook();

    /**
     *
     * 功能描述: <br>
     *  <根据日期查询沥青试验台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/25 18:05
     */
    String getAsphaltStandingBookByDate(String startDate, String endDate);

    /**
     *
     * 功能描述: <br>
     *  <查询所有规格与生产厂家>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/26 15:55
     */
    String getSpecificationDataAndManufacturersData();

    /**
     *
     * 功能描述: <br>
     *  <根据id与make标记删除规格或者生产厂家>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/26 17:22
     */
    String deleteSpecificationOrManufacturersById(String id, String make);

    /**
     *
     * 功能描述: <br>
     *  <插入规格>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/26 20:59
     */
    String insertSpecificationFrom(String specificationName);
    /**
     *
     * 功能描述: <br>
     *  <插入厂家>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/26 20:59
     */
    String insertManufacturersFrom(String manufacturersName);

    /**
     *
     * 功能描述: <br>
     *  <根据ID查询厂家或规格>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/26 21:45
     */
    String getSpecificationOrManufacturersById(String id, String make);

    /**
     *
     * 功能描述: <br>
     *  <根据前台返回make与id修改规格或厂家>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/26 22:14
     */
    String updateSpecificationOrManufacturersById(String id, String make, String updateName);

    /**
     *
     * 功能描述: <br>
     *  <根据ID返回前台是否已完成>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/28 21:50
     */
    String getSampleStatusById(String id);

    /**
     *
     * 功能描述: <br>
     *  <查询近七天实验检测台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/29 13:08
     */
    String getTestStandingBook();
    /**
     *
     * 功能描述: <br>
     *  <根据日期查询实验检测台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/29 13:08
     */
    String getTestStandingBookByDate(String startDate, String endDate);
}
