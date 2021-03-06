package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaPersonalWages;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

/**
 * 正式工资统计
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/28 2:58
 */
@Repository
public interface OaPersonalWagesMapper {

    /**
     * 根据管理id删除
     *
     * @param wageStatisticsId wageStatisticsId
     * @return int
     */
    int deleteByWageStatisticsId(Integer wageStatisticsId);

    /**
     * 批量插入
     *
     * @param list             excel
     * @param wageStatisticsId 工资统计id
     * @return NumberOfAffectedRows
     */
    int insertMultiTerm(@Param("list") List list,
                        @Param("wageStatisticsId") String wageStatisticsId);

    /**
     * 根据工资统计id查询实发总额
     *
     * @param wageStatisticsId 工资统计id
     * @return 实发总额
     */
    BigDecimal getGrossActualAmount(int wageStatisticsId);

    /**
     * 根据登录人昵称获取工资
     *
     * @param nickName 登录人昵称
     * @return OaPersonalWages
     */
    List<OaPersonalWages> getPersonalWagesByNickName(String nickName);

    /**
     * 根据统计ID查询数据
     *
     * @param wageStatisticsId wageStatisticsId
     * @return list
     */
    List<OaPersonalWages> selectRegularStaffByWageStatisticsId(int wageStatisticsId);

    /**
     * 根据ID查询数据
     *
     * @param id id
     * @return list
     */
    OaPersonalWages selectRegularStaffById(int id);

    /**
     * 更新状态
     *
     * @param wageStatisticsId wageStatisticsId
     * @param state            s
     * @return int
     */
    int updateStateByWageStatisticsId(@Param("wageStatisticsId") Integer wageStatisticsId, @Param("state") Integer state);
}