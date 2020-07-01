package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaOutsourcedStaff;
import com.jiaoke.oa.bean.OaOutsourcedStatistics;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 外包员工工资统计
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaOutsourcedStatisticsMapper extends Mapper<OaOutsourcedStatistics> {

    /**
     * 根据结算月份筛选
     *
     * @param settlementMonth settlementMonth
     * @return list
     */
    List<OaOutsourcedStaff> settlementMonthFilter(String settlementMonth);

    /**
     * 更新状态
     *
     * @param id    id
     * @param state s
     * @return int
     */
    int updateState(@Param("id") Integer id, @Param("state") Integer state);
}
