package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActEngage;

/**
 * 职称（技术等级）评聘申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActEngageService {

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
     * @param oaActEngage oaActEngage
     * @param userId      userId
     * @param randomId    randomId
     * @param state       state
     * @return int
     */
    int insert(OaActEngage oaActEngage, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActEngage oaActEngage
     * @return int
     */
    int edit(OaActEngage oaActEngage);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActEngage selectByPrimaryKey(String id);

    /**
     * 根据主键更新数据
     *
     * @param oaActEngage oaActEngage
     * @return int
     */
    int updateByPrimaryKeySelective(OaActEngage oaActEngage);
}
