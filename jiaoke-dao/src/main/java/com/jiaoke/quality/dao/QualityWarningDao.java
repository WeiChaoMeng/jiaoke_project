/**
 * FileName: QualityWarningDao
 * Author:   Melone
 * Date:     2018/10/8 11:57
 * History:
 * <author>    <time>     <version>   <desc>
 * 作者姓名     修改时间    版本号        描述
 **/
package com.jiaoke.quality.dao;

import com.jiaoke.quality.bean.QualityRatioTemplate;
import com.jiaoke.quality.bean.QualityWarningData;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 *  <一句话功能描述>
 *  <质量预警dao></>
 * @author: Melone
 * @create: 2018/10/8 11:57
 * @Description:
 */
public interface QualityWarningDao {

    /**
     *  为表quality_warning_promessage_crew1 添加数据（）
     * @param map
     * @return int 插入的id
     */
    int insertQualityWarningCrew(Map<String,String> map);

    /**
     * 传入机组配比号  机组号 查询配比模板
     * @param crewMoudelId
     * @param columeName
     * @return
     */
    QualityRatioTemplate selectRatioTemplateByCrew1MoudelId(@Param("crewMoudelId") String crewMoudelId, @Param("columeName")String columeName,@Param("proDate") String produceDate);


    void insertQualityWarningData( @Param("warningDataList") List<QualityWarningData> warningDataList,@Param("crewNum") String crewNum);

    QualityRatioTemplate getQualityRatioTemplateById(@Param("id") int id,@Param("crewNum") String crewNum,@Param("proDate") String produceDate);

    /**
     *
     * 功能描述: <br>
     *  <插入关键信息表>
     * @param
     * @return
     * @auther Melone
     * @date 2019/8/19 17:22
     */
    void insertCriticalWarning(@Param("id") int id);

    /**
     *
     * 功能描述: <br>
     *  <查询预警级别>
     * @param
     * @return
     * @auther Melone
     * @date 2020/3/31 8:41
     */
    List<Map<String, String>> selectWarningLevel();

    /**
     *
     * 功能描述: <br>
     *  <更新核心预警表>
     * @param
     * @return
     * @auther Melone
     * @date 2020/5/21 10:46
     */
    void updateQualityWarningData(@Param("id") int id,@Param("upWarning") int upWarning,@Param("criticalWarning")  int criticalWarning,@Param("proName") String proName);
    /**
     *
     * 功能描述: <br>
     *  <根据配比ID查询该配比预警信息>
     * @param
     * @return
     * @auther Melone
     * @date 2020/7/8 10:52
     */
    Map<String,String> selectWarningLevelByRatioId(@Param("ratioId") int ratioId);



    /**
     *
     * 功能描述: <br>
     *  <根据日期时间、机组查询距离该时间最近的生产时间>
     * @param
     * @return
     * @auther Melone
     * @date 2020/9/23 15:47
     */
    Map<String, Date> selectLastProductTime(@Param("produceTime") String produceTime,@Param("crewNum")  String crewNum);

    /**
     *
     * 功能描述: <br>
     *  <根据时间、机组号、产品类型获取最近的三盘数据>
     * @param
     * @return
     * @auther Melone
     * @date 2020/9/24 11:13
     */
    List<Map<String, String>> selectThreeProductByTime(@Param("productTime")  String productTime,@Param("crewNum") String crewNum,@Param("rationNum") String rationNum);

    /**
     *
     * 功能描述: <br>
     *  <根据机组查询生产人集合>
     * @param
     * @return
     * @auther Melone
     * @date 2020/9/28 9:53
     */
    List<Map<String, String>> selectProductionPeople(@Param("crewNum") String crewNum);

    /**
     *
     * 功能描述: <br>
     *  <更新生产数据绑定生产人>
     * @param
     * @return
     * @auther Melone
     * @date 2020/9/29 10:13
     */
    void updateProductPeopleToRealTimeDate(@Param("proDate") String proDate,@Param("produceTime") String produce_time,@Param("crewNum") String crewNum,@Param("productPeople") String productPeople);
}
