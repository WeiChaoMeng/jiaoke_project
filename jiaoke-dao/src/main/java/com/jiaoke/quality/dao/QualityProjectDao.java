/**
 * FileName: QualityProjectDao
 * Author:   Melone
 * Date:     2019/11/14 18:30
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.dao;

import com.jiaoke.quality.bean.QualityProjectItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *
 * @author: Melone
 * @create: 2019/11/14 18:30
 * @Description:
 */
public interface QualityProjectDao {

    /**
     *
     * 功能描述: <br>
     *  <添加客户对应的工程名称>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/14 18:25
     */
    int insertProjectItem(@Param("fromData") QualityProjectItem fromData);

    /**
     *
     * 功能描述: <br>
     *  <查询所有客户对应的工程名称>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/14 19:08
     */
    List<QualityProjectItem> selectUserProjectList();

    /**
     *
     * 功能描述: <br>
     *  <通过id查询客户详细信息>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/14 21:17
     */
    QualityProjectItem selectUserProjectById(@Param("id") String id);

    /**
     *
     * 功能描述: <br>
     *  <根据id删除用户工程>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/15 12:15
     */
    int delectUserProject(@Param("idStr") String idStr);

    /**
     *
     * 功能描述: <br>
     *  <根据id数组批量删除用户工程>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/15 12:16
     */
    int delectUserProjectByIdArray(@Param("idArr") String[] idArr);

    /**
     *
     * 功能描述: <br>
     *  <根据id修改用户工程表>
     * @param
     * @return
     * @auther Melone
     * @date 2019/11/15 13:30
     */
    int updateProjectItem(@Param("fromData") QualityProjectItem fromData);

    /**
     *
     * 功能描述: <br>
     *  <根据机组查询最后一条车号>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/16 9:54
     */
    Map<String, Object> selectLastCarNumByCrewNum(@Param("crewNum") String crewNum);

    /**
     *
     * 功能描述: <br>
     *  <插入车号数据表>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/16 14:17
     */
    int insertCarNum(@Param("license") String license,@Param("recotime")  String recotime,@Param("crewNum") String crewNum);
    /**
     *
     * 功能描述: <br>
     *  <根据机组号与日期更改quality_monitoring_realtime_data1 数据>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/16 14:25
     */
    void updateRealtimeDataByCrewAndDate(@Param("license") String license,@Param("recotime") String recotime,@Param("crewNum") String crewNum);

    /**
     *
     * 功能描述: <br>
     *  <插入出厂信息表>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/16 15:10
     */
    int insertLeaveFactory(@Param("map") Map<String, String> map);

    /**
     *
     * 功能描述: <br>
     *  <根据日期间隔更新生产数据>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/16 16:12
     */
    void updateRealtimeDataByDate(@Param("license") String license,
                                  @Param("carTime")  String carTime,
                                  @Param("lastTime") String lastTime,
                                  @Param("crewNum")  String crewNum,
                                  @Param("proName") String proName);

    /**
     *
     * 功能描述: <br>
     *  <更新车牌表>
     * @param
     * @return
     * @auther Melone
     * @date 2020/4/27 10:33
     */
    void updateRealTimeDataByCarNum(@Param("license") String license,
                                        @Param("carTime")  String carTime,
                                        @Param("lastTime") String lastTime,
                                        @Param("crewNum")  String crewNum);

    /**
     *
     * 功能描述: <br>
     *  <更新预警表工程名称、车号冗余字段>
     * @param
     * @return
     * @auther Melone
     * @date 2020/5/21 14:55
     */
    void updateWarningDataByDate(@Param("license") String license,
                                     @Param("carTime")  String carTime,
                                     @Param("lastTime") String lastTime,
                                     @Param("crewNum")  String crewNum,
                                     @Param("proName") String proName);

    /**
     *
     * 功能描述: <br>
     *  <查询该机组下距离该时间最近的时间>
     * @param
     * @return
     * @auther Melone
     * @date 2020/6/17 16:59
     */
    Map<String, Object> selectLastCarNumByCrewNumAndTime(@Param("crewId") String crewId,@Param("recotime") String recotime);

    /**
     *
     * 功能描述: <br>
     *  <未读取到的车牌汇总>
     * @param
     * @return
     * @auther Melone
     * @date 2020/8/18 14:55
     */
    void insertErrorCarNum(@Param("license") String license,@Param("carTime")  String carTime);

    /**
     *
     * 功能描述: <br>
     *  <插入过磅信息>
     * @param
     * @return
     * @auther Melone
     * @date 2020/10/29 15:08
     */
    void insertWeighingInformation(@Param("insertMap") Map<String, String> insertMap);



    /**
     *
     * 功能描述: <br>
     *  <查询该条数据是否存在>
     * @param
     * @return
     * @auther Melone
     * @date 2020/10/29 19:27
     */
    Map<String, String> selectLeaveFactory(Map<String, String> map);

    /**
     *
     * 功能描述: <br>
     *  <根据车号查询生产时的车号>
     * @param
     * @return
     * @auther Melone
     * @date 2020/11/17 14:10
     */
    Map<String,String> selectCarNumByWeighing(@Param("insertMap")  Map<String, String> insertMap);

    /**
     *
     * 功能描述: <br>
     *  <根据出厂日期时间查询半个小时内车牌号>
     * @param
     * @return
     * @auther Melone
     * @date 2020/11/30 16:36
     */
    List<Map<String, String>> selectCarNumByLeaveFactory(@Param("insertMap")  Map<String, String> insertMap);

    /**
     *
     * 功能描述: <br>
     *  <根据日期更新车号和工程>
     * @param
     * @return
     * @auther Melone
     * @date 2020/12/2 9:42
     */
    int updateRealTimeCarNumAndProject(@Param("crewNum") String crewNum,@Param("carNum") String carNum,@Param("upTime")  String upTime,@Param("lastTime") String lastTime,@Param("projectName")  String projectName);
}
