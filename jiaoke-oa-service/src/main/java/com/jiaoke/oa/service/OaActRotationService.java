package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActRotation;

/**
 * 员工轮岗审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActRotationService {

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
     * @param oaActRotation oaActRotation
     * @param userId        userId
     * @param randomId      randomId
     * @param state         state
     * @return int
     */
    int insert(OaActRotation oaActRotation, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActRotation oaActRotation
     * @return int
     */
    int edit(OaActRotation oaActRotation);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActRotation selectByPrimaryKey(String id);

    /**
     * 选择性更新
     *
     * @param oaActRotation oaActRotation
     * @return int
     */
    int updateByPrimaryKeySelective(OaActRotation oaActRotation);
}
