/**
 * FileName: QualityExperimentalManagerDao
 * Author:   Melone
 * Date:     2019/6/26 12:00
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/6/26 12:00
 * @Description:
 */
public interface QualityExperimentalManagerForeignDao {

    /**
     *
     * 功能描述: <br>
     *  <查询材料字典，返回所以材料>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/26 12:14
     */
    List<Map<String, String>> getMaterialList();

    /**
     *
     * 功能描述: <br>
     *  <查询厂家字典，返回所以厂家>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/26 12:14
     */
    List<Map<String, String>> getManufacturersList();

    /**
     *
     * 功能描述: <br>
     *  <查询规格字典，返回所以规格>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/26 12:16
     */
    List<Map<String, String>> getSpecificationList();

    /**
     *
     * 功能描述: <br>
     *  <查询所有取样单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/26 14:18
     */
    List<Map<String, String>> selectAllSamplingPage();

    /**
     *
     * 功能描述: <br>
     *  <根据ID删除指定取样单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/26 17:44
     */
    int delectSampleById(@Param("id") String id);

    /**
     *
     * 功能描述: <br>
     *  <插入新的取样单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/27 10:26
     */
    int insertSample(@Param("materials") String materials, @Param("manufacturers") String manufacturers, @Param("specification") String specification, @Param("tunnage") String tunnage, @Param("creat_time") String creat_time, @Param("remark") String remark);

    /**
     *
     * 功能描述: <br>
     *  <根据ID查询取样单信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/27 12:36
     */
    Map<String, String> selectSampleMessageById(@Param("id") String id);

    /**
     *
     * 功能描述: <br>
     *  <根据日期查询当天委托单生产的数量，用于生产委托单编号>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/27 13:00
     */
    Map<String,Object>  selectOrderTicketCountByDate(@Param("date") String date);

    /**
     *
     * 功能描述: <br>
     *  <插入委托单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/27 15:25
     */
    int insertOrderTicketBySampleMssage(@Param("orderTicketNum") String orderTicketNum, @Param("sampling_id") String sampling_id, @Param("date") String date, @Param("manufacturers_num") String manufacturers_num, @Param("specification_num") String specification_num, @Param("tunnage") String tunnage, @Param("test_num") String test_num);

    /**
     *
     * 功能描述: <br>
     *  <更新取样表状态>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/27 16:13
     */
    int updateSampleMessageById(String id);

    /**
     *
     * 功能描述: <br>
     *  <查询所有委托单>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/27 17:10
     */
    List<Map<String, String>> selectAllexperimental();

    /**
     *
     * 功能描述: <br>
     *  <根据id查询委托单信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/6/28 11:49
     */
    Map<String, String> selectExperimentalMessageById(@Param("id") String id);

    /**
     *
     * 功能描述: <br>
     *  <根据委托单编号查询试验项目>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/2 10:29
     */
    List<Map<String, String>> selectExperimentalItemByOrderNum(@Param("orderNum") String orderNum);

    /**
     *
     * 功能描述: <br>
     *  <根据委托单id查询实验项目>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/2 12:24
     */
    List<Map<String, String>> getExperimentalItemById(@Param("id") String id);

    /**
     *
     * 功能描述: <br>
     *  <根据委托单号插入实验项目>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/2 15:15
     */
    int addExperimentalItemByOrderTicketNum(@Param("orderTicketNum") String orderTicketNum, @Param("ids") String[] ids);

    /**
     *
     * 功能描述: <br>
     *  <查询委托单下试验项目数量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/2 16:18
     */
    Map<String, Integer> selectExperimentalItemCount(@Param("orderTicketNum") String orderTicketNum);

    /**
     *
     * 功能描述: <br>
     *  <试验委托标号查询委托单信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/3 14:41
     */
    Map<String, String> getOrderTicketByOrderTicketNum(@Param("orderTicketNum") String orderTicketNum);

    /**
     *
     * 功能描述: <br>
     *  <插入任务单表>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/3 15:10
     */
    int insertTaskList(@Param("order_ticket_num") String order_ticket_num, @Param("test_num") String test_num, @Param("result") String result, @Param("materialName") String materialName, @Param("specificationName") String specificationName, @Param("remark") String remark);

    /**
     *
     * 功能描述: <br>
     *  <根据日期材料查询完成实验的数量>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/5 13:05
     */
    Map<String, Object> selectLabReportConuntByDateAndMaterials(@Param("dates") String dates, @Param("materials_num") String materials_num);

    /**
     *
     * 功能描述: <br>
     *  <插入实验报告表>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/8 11:43
     */
    int insertLabReport(@Param("experimentNum") String experimentNum,
                        @Param("order_ticket_num") String order_ticket_num,
                        @Param("materials_num") String materials_num,
                        @Param("entrustingParty") String entrustingParty,
                        @Param("manufacturersName") String manufacturersName,
                        @Param("samplingTime") String samplingTime,
                        @Param("creatTime") String creatTime,
                        @Param("requiredExperimental") String requiredExperimental,
                        @Param("logogram_name") String logogram_name,
                        @Param("samplingSpot") String samplingSpot,
                        @Param("specificationName") String specificationName);

    /**
     *
     * 功能描述: <br>
     *  <查询实验项目>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/8 12:08
     */
    List<Map<String,String>> selectExperimentItme(@Param("order_ticket_num") String order_ticket_num);

    /**
     *
     * 功能描述: <br>
     *  <查询所有实验项目>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/8 17:31
     */
    List<Map<String, String>> selectAllExperimentalItem();


    /**
     *
     * 功能描述: <br>
     *  <根据ID查询实验信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/8 18:08
     */
    Map<String, String> selectExperimentalItemMsgById(@Param("id") String id);

    /**
     *
     * 功能描述: <br>
     *  <根据ID查询指定实验项目>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/11 18:20
     */
    List<Map<String, String>> selectExperimentalItemNumList(@Param("id") String id);

    /**
     *
     * 功能描述: <br>
     *  <更新实验报告表>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/12 16:27
     */
    int updateLabReport(@Param("map") Map<String, String> map);

    /**
     *
     * 功能描述: <br>
     *  <插入细集料实验（排除筛孔）>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/16 12:48
     */
    int insertFineAggregate(@Param("firstTestList") List<Map<String, String>> firstTestList, @Param("experimentNum") String experimentNum);

    /**
     *
     * 功能描述: <br>
     *  <插入细集料筛选实验（排除其他实验）>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/16 12:49
     */
    int insertFineAggregateSieving(@Param("coarseTestList") List<Map<String, String>> coarseTestList, @Param("experimentNum") String experimentNum);


    /**
     *
     * 功能描述: <br>
     *  <插入粗集料实验（排除筛孔）>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/16 12:48
     */
    int insertCoarseAggregate(@Param("firstTestList") List<Map<String, String>> firstTestList, @Param("experimentNum") String experimentNum);


    /**
     *
     * 功能描述: <br>
     *  <插入粗集料筛选实验（排除其他实验）>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/16 12:49
     */
    int insertCoarseAggregateSieving(@Param("coarseTestList") List<Map<String, String>> coarseTestList, @Param("experimentNum") String experimentNum);


    /**
     *
     * 功能描述: <br>
     *  <插入沥青实验（排除筛孔）>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/16 12:48
     */
    int insertAsphalt(@Param("firstTestList") List<Map<String, String>> firstTestList, @Param("experimentNum") String experimentNum);

    /**
     *
     * 功能描述: <br>
     *  <查询实验信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/16 16:47
     */
    List<Map<String,String>> selectExperimentalProjectMessage(@Param("id") String id);

    /**
     *
     * 功能描述: <br>
     *  <根据表名、实验单号查询实验信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/16 21:00
     */
    List<Map<String,String>>  selectExperimentalMsgByTableName(@Param("tableName") String tableName, @Param("experiment_num") String experiment_num);

    /**
     *
     * 功能描述: <br>
     *  <根据I实验单D删除所有相关信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/17 11:05
     */
    int delectExperimentalItemById(@Param("id") String id);

    /**
     *
     * 功能描述: <br>
     *  <查询粗集料近七天台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/24 11:06
     */
    List<Map<String, String>> selectCoarseStandingBook();

    /**
     *
     * 功能描述: <br>
     *  <查询细集料七天内台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/24 12:30
     */
    List<Map<String, String>> selectFineStandingBook();

    /**
     *
     * 功能描述: <br>
     *  <查询沥青七天内台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/24 12:36
     */
    List<Map<String, String>> selectAsphaltStandingBook();

    /**
     *
     * 功能描述: <br>
     *  <查询粗集料筛选数据台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/24 13:07
     */
    List<Map<String, String>> selectCoarseSievingStandingBook();

    /**
     *
     * 功能描述: <br>
     *  <查询细集料筛选数据台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/24 13:07
     */
    List<Map<String, String>> selectFineievingStandingBook();

    /**
     *
     * 功能描述: <br>
     *  <根据日期查询粗料台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/25 11:48
     */
    List<Map<String, String>> selectCoarseStandingBookByDate(@Param("startDate") String startDate, @Param("endDate") String endDate);

    /**
     *
     * 功能描述: <br>
     *  <根据日期查询细集料台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/25 11:49
     */
    List<Map<String, String>> selectFineStandingBookByDate(@Param("startDate") String startDate, @Param("endDate") String endDate);

    /**
     *
     * 功能描述: <br>
     *  <根据日期查询沥青台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/25 11:49
     */
    List<Map<String, String>> selectAsphaltStandingBookByDate(@Param("startDate") String startDate, @Param("endDate") String endDate);

    /**
     *
     * 功能描述: <br>
     *  <根据日期查询粗料筛选台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/25 11:50
     */
    List<Map<String, String>> selectCoarseSievingStandingBookByDate(@Param("startDate") String startDate, @Param("endDate") String endDate);

    /**
     *
     * 功能描述: <br>
     *  <根据日期查询细集料筛选台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/25 11:50
     */
    List<Map<String, String>> selectFineievingStandingBookByDate(@Param("startDate") String startDate, @Param("endDate") String endDate);

    /**
     *
     * 功能描述: <br>
     *  <修改委托单状态>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/26 15:05
     */
    int updateOrderTicketByOrderTicketNum(@Param("orderTicketNum") String orderTicketNum);

    /**
     *
     * 功能描述: <br>
     *  <查询说要材料规格、材料厂家>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/26 16:07
     */
    List<Map<String, String>> selectSpecificationDataAndManufacturersData();

    /**
     *
     * 功能描述: <br>
     *  <根据id删除规格信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/26 17:31
     */
    int delectSpecificationById(@Param("id") String id);

    /**
     *
     * 功能描述: <br>
     *  <根据id删除厂家信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/26 17:31
     */
    int delectManufacturersById(@Param("id") String id);

    /**
     *
     * 功能描述: <br>
     *  <插入规格名称>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/26 19:38
     */
    int insertSpecification(@Param("specificationName") String specificationName);
    /**
     *
     * 功能描述: <br>
     *  <插入厂家名称>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/26 21:02
     */
    int insertManufacturers(@Param("manufacturersName") String manufacturersName);

    /**
     *
     * 功能描述: <br>
     *  <根据指定ID查询规格信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/26 21:49
     */
    Map<String, String> selectSpecificationById(@Param("id") String id);

    /**
     *
     * 功能描述: <br>
     *  <根据指定ID查询厂家信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/26 21:50
     */
    Map<String, String> selectManufacturersById(@Param("id") String id);

    /**
     *
     * 功能描述: <br>
     *  <根据id更新规格>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/26 22:18
     */
    int updateSpecificationById(@Param("id") String id, @Param("name") String name);

    /**
     *
     * 功能描述: <br>
     *  <根据id更新厂家>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/26 22:18
     */
    int updateManufacturersById(@Param("id") String id, @Param("name") String name);

    /**
     *
     * 功能描述: <br>
     *  <插入矿粉实验数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/28 15:12
     */
    int insertBrzzez(@Param("list") List<Map<String, String>> firstTestList, @Param("experimentNum") String experimentNum);

    /**
     *
     * 功能描述: <br>
     *  <查询石粉实验数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/28 16:08
     */
    List<Map<String, String>> selectBreezeStandingBook();

    /**
     *
     * 功能描述: <br>
     *  <根据日期查询矿粉台账>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/28 16:15
     */
    List<Map<String, String>> selectBreezeStandingBookByDate(@Param("startDate") String startDate, @Param("endDate") String endDate);

    /**
     *
     * 功能描述: <br>
     *  <根据id查询取样单信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/28 21:52
     */
    Map<String, String> selectSampleStatusById(@Param("id") String id);

    /**
     *
     * 功能描述: <br>
     *  <查询近七日实验检测数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/29 13:16
     */
    List<Map<String, String>> selectTestStandingBook();

    /**
     *
     * 功能描述: <br>
     *  <根据时间查询试验检测数据>
     * @param
     * @return
     * @auther Melone
     * @date 2019/7/29 13:17
     */
    List<Map<String, String>> selectTestStandingBookByDate(@Param("startDate") String startDate, @Param("endDate") String endDate);
}
