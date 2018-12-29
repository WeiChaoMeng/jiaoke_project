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
    QualityRatioTemplate selectRatioTemplateByCrew1MoudelId(@Param("crewMoudelId") String crewMoudelId, @Param("columeName")String columeName);


    void insertQualityWarningData( @Param("warningDataList") List<QualityWarningData> warningDataList);

    QualityRatioTemplate getQualityRatioTemplateById(int id);
}
