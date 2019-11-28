package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActRegularization;

/**
 * 转正申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActRegularizationService {

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
     * @param oaActRegularization oaActRegularization
     * @param userId              userId
     * @param randomId            randomId
     * @param state               state
     * @return int
     */
    int insert(OaActRegularization oaActRegularization, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActRegularization oaActRegularization
     * @return int
     */
    int edit(OaActRegularization oaActRegularization);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActRegularization selectByPrimaryKey(String id);

    /**
     * 根据主键更新数据
     *
     * @param oaActRegularization oaActRegularization
     * @return int
     */
    int updateByPrimaryKeySelective(OaActRegularization oaActRegularization);
}
