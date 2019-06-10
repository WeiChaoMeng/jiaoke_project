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
     * 保存待发
     *
     * @param oaActCard oaActCard
     * @param userId    userId
     * @param randomId  randomId
     * @return int
     */
    int savePendingCard(OaActCard oaActCard, Integer userId, String randomId);

    /**
     * 新增
     *
     * @param oaActCard oaActCard
     * @param userId    userId
     * @param randomId  randomId
     * @return int
     */
    int insertCard(OaActCard oaActCard, Integer userId, String randomId);

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
     * 更新状态
     *
     * @param id    id
     * @param state state
     * @return int
     */
    int updateStateById(String id, Integer state);

    /**
     * 编辑
     *
     * @param oaActCard oaActCard
     * @return int
     */
    int edit(OaActCard oaActCard);
}
