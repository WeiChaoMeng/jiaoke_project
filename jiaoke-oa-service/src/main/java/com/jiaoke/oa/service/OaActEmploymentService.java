package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActEmployment;

/**
 * 部室用人申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActEmploymentService {

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
     * @param oaActEmployment oaActEmployment
     * @param userId          userId
     * @param randomId        randomId
     * @param state           state
     * @return int
     */
    int insert(OaActEmployment oaActEmployment, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActEmployment oaActEmployment
     * @return int
     */
    int edit(OaActEmployment oaActEmployment);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActEmployment selectByPrimaryKey(String id);

    /**
     * 根据主键更新数据
     *
     * @param oaActEmployment oaActEmployment
     * @return int
     */
    int updateByPrimaryKeySelective(OaActEmployment oaActEmployment);
}
