package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaOutsourcedStaff;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

/**
 * 工资统计
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/28 2:58
 */
@Repository
public interface OaOutsourcedStaffMapper {
    /**
     * 根据工资统计id查询实发总额
     *
     * @param wageStatisticsId 工资统计id
     * @return 实发总额
     */
    BigDecimal getGrossActualAmount(int wageStatisticsId);

    /**
     * 批量插入
     *
     * @param list             excel
     * @param wageStatisticsId 工资统计id
     * @return NumberOfAffectedRows
     */
    int bulkInsertOutsourcedStaff(@Param("list") List list,
                                  @Param("wageStatisticsId") String wageStatisticsId);

    /**
     * 根据统计ID查询数据
     *
     * @param wageStatisticsId wageStatisticsId
     * @return list
     */
    List<OaOutsourcedStaff> selectOutsourcedStaffByWageStatisticsId(int wageStatisticsId);

    /**
     * 根据关联表主键删除
     *
     * @param wageStatisticsId wageStatisticsId
     * @return int
     */
    int deleteByWageStatisticsId(Integer wageStatisticsId);
}
