package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaPersonalWages;
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
public interface OaPersonalWagesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaPersonalWages record);

    int insertSelective(OaPersonalWages record);

    OaPersonalWages selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaPersonalWages record);

    int updateByPrimaryKey(OaPersonalWages record);

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
     * 修改状态根据工资统计id
     *
     * @param wageStatisticsId 工资统计id
     * @param sendState        发送状态
     * @return NumberOfAffectedRows
     */
    int updateStateByWageStatisticsId(@Param("wageStatisticsId") int wageStatisticsId,
                                      @Param("sendState") int sendState);

    /**
     * 通过工资统计Id得到总数
     *
     * @param wageStatisticsId 工资统计id
     * @return total
     */
    int getTotalByWageStatisticsId(int wageStatisticsId);

    /**
     * 通过工资统计Id获得分页
     *
     * @param wageStatisticsId 工资统计id
     * @param start            start
     * @param rows             rows
     * @return list
     */
    List<OaPersonalWages> getPagingByWageStatisticsId(@Param("wageStatisticsId") int wageStatisticsId,
                                                      @Param("start") int start,
                                                      @Param("rows") int rows);

    /**
     * 根据登录人昵称获取工资
     *
     * @param nickName 登录人昵称
     * @return OaPersonalWages
     */
    OaPersonalWages getPersonalWagesByNickName(String nickName);
}