package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActRotationHandover;

/**
 * 轮岗交接表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActRotationHandoverService {

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
     * @param oaActRotationHandover oaActRotationHandover
     * @param userId                userId
     * @param randomId              randomId
     * @param state                 state
     * @return int
     */
    int insert(OaActRotationHandover oaActRotationHandover, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActRotationHandover oaActRotationHandover
     * @return int
     */
    int edit(OaActRotationHandover oaActRotationHandover);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActRotationHandover selectByPrimaryKey(String id);

    /**
     * 更新附件列表
     *
     * @param array array
     * @param id    id
     * @return int
     */
    int updateAnnexes(String[] array, String id);
}
