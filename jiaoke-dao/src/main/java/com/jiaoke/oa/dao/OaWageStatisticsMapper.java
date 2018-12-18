package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaWageStatistics;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OaWageStatisticsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaWageStatistics record);

    int insertSelective(OaWageStatistics record);

    OaWageStatistics selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaWageStatistics record);

    int updateByPrimaryKey(OaWageStatistics record);

    /**
     * 获取所有正式员工
     *
     * @return list
     */
    List<OaWageStatistics> getAllRegularEmployee();
}