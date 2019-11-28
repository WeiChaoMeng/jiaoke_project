package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActProductionLeave;

/**
 * 生产假审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActProductionLeaveService {

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
     * @param oaActProductionLeave oaActProductionLeave
     * @param userId               userId
     * @param randomId             randomId
     * @param state                state
     * @return int
     */
    int insert(OaActProductionLeave oaActProductionLeave, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActProductionLeave oaActProductionLeave
     * @return int
     */
    int edit(OaActProductionLeave oaActProductionLeave);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActProductionLeave selectByPrimaryKey(String id);

    /**
     * 选择性更新
     *
     * @param oaActProductionLeave oaActProductionLeave
     * @return int
     */
    int updateByPrimaryKeySelective(OaActProductionLeave oaActProductionLeave);
}
