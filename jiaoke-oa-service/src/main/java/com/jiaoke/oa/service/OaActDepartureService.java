package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActDeparture;

/**
 * 离职会签表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActDepartureService {

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
     * @param oaActDeparture oaActDeparture
     * @param userId         userId
     * @param randomId       randomId
     * @param state          state
     * @return int
     */
    int insert(OaActDeparture oaActDeparture, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActDeparture oaActDeparture
     * @return int
     */
    int edit(OaActDeparture oaActDeparture);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActDeparture selectByPrimaryKey(String id);

    /**
     * 选择性更新
     *
     * @param oaActDeparture oaActDeparture
     * @return int
     */
    int updateByPrimaryKeySelective(OaActDeparture oaActDeparture);
}
