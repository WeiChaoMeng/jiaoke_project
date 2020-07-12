package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaWageStatistics;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 正式职工工资统计
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/28 2:58
 */
@Repository
public interface OaWageStatisticsMapper {

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 选择性插入
     *
     * @param record record
     * @return int
     */
    int insertSelective(OaWageStatistics record);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return o
     */
    OaWageStatistics selectByPrimaryKey(Integer id);

    /**
     * 获取所有正式员工
     *
     * @return list
     */
    List<OaWageStatistics> getAllRegularEmployee();

    /**
     * 根据结算月筛选
     *
     * @param settlementDate settlementDate
     * @return list
     */
    List<OaWageStatistics> settlementMonthRegularStaffFilter(String settlementDate);

    /**
     * 更新状态
     *
     * @param id    id
     * @param state s
     * @return int
     */
    int updateState(@Param("id") Integer id, @Param("state") Integer state);
}