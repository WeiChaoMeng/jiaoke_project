package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActRewardsPenalties;

/**
 * 奖罚意见表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActRewardsPenaltiesService {

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
     * @param oaActRewardsPenalties oaActRewardsPenalties
     * @param userId                userId
     * @param randomId              randomId
     * @param state                 state
     * @return int
     */
    int insert(OaActRewardsPenalties oaActRewardsPenalties, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActRewardsPenalties oaActRewardsPenalties
     * @return int
     */
    int edit(OaActRewardsPenalties oaActRewardsPenalties);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActRewardsPenalties selectByPrimaryKey(String id);

    /**
     * 更新附件列表
     *
     * @param array array
     * @param id    id
     * @return int
     */
    int updateAnnexes(String[] array, String id);
}
