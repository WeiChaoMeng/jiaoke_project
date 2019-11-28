package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActAnnualLeave;

/**
 * 年休假审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActAnnualLeaveService {

    /**
     * 删除
     *
     * @param id id
     * @return int
     */
    int deleteData(String id);

    /**
     * 新增
     *
     * @param oaActAnnualLeave oaActProductionLeave
     * @param userId           userId
     * @param randomId         randomId
     * @param state            state
     * @return int
     */
    int insert(OaActAnnualLeave oaActAnnualLeave, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActAnnualLeave oaActProductionLeave
     * @return int
     */
    int edit(OaActAnnualLeave oaActAnnualLeave);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActAnnualLeave selectByPrimaryKey(String id);

    /**
     * 选择性更新
     * @param oaActAnnualLeave oaActAnnualLeave
     * @return int
     */
    int updateByPrimaryKeySelective(OaActAnnualLeave oaActAnnualLeave);
}
