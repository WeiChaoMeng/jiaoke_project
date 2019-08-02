package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActLeave;

/**
 * 请假审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActLeaveService {

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
     * @param oaActLeave oaActLeave
     * @param userId     userId
     * @param randomId   randomId
     * @param state      state
     * @return int
     */
    int insert(OaActLeave oaActLeave, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActLeave oaActLeave
     * @return int
     */
    int edit(OaActLeave oaActLeave);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActLeave selectByPrimaryKey(String id);

    /**
     * 更新附件列表
     *
     * @param array array
     * @param id    id
     * @return int
     */
    int updateAnnexes(String[] array, String id);
}
