package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaOvertimeStatistics;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 加班统计表数据表
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaOvertimeStatisticsMapper extends Mapper<OaOvertimeStatistics> {

    /**
     * 插入数据看并返回主键
     *
     * @param list overtimeStatisticsList
     * @return id
     */
    int batchInsertData(List<OaOvertimeStatistics> list);

    /**
     * 根据加班统计表id查询
     *
     * @param overtimeId overtimeId
     * @return list
     */
    List<OaOvertimeStatistics> selectByOvertimeId(String overtimeId);

    /**
     * 根据加班统计表id删除
     *
     * @param overtimeId overtimeId
     * @return int
     */
    int deleteByOvertimeId(String overtimeId);
}
