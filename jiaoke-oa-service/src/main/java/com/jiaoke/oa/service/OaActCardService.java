package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActCard;
import com.jiaoke.oa.bean.UserInfo;

/**
 * 饭卡审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 0:32
 */
public interface OaActCardService {

    /**
     * 新增
     *
     * @param oaActCard oaActCard
     * @param userId    userId
     * @param randomId  randomId
     * @param state     state
     * @return int
     */
    int insertCard(OaActCard oaActCard, Integer userId, String randomId, Integer state);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActCard selectByPrimaryKey(String id);

    /**
     * 删除
     *
     * @param id id
     * @return int
     */
    int delete(String id);

    /**
     * 编辑
     *
     * @param oaActCard oaActCard
     * @return int
     */
    int edit(OaActCard oaActCard);

    /**
     * 根据主键更新
     *
     * @param oaActCard oaActCard
     * @return int
     */
    int updateByPrimaryKeySelective(OaActCard oaActCard);
}
