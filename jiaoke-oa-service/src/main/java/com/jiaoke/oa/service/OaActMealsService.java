package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActMeals;

/**
 * 客饭审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActMealsService {

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
     * @param oaActMeals oaActMeals
     * @param userId     userId
     * @param randomId   randomId
     * @param state      state
     * @return int
     */
    int insert(OaActMeals oaActMeals, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActMeals oaActMeals
     * @return int
     */
    int edit(OaActMeals oaActMeals);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActMeals selectByPrimaryKey(String id);
}
