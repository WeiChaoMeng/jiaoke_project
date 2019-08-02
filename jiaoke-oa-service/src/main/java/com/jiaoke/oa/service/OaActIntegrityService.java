package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActIntegrity;

/**
 * 廉政谈话审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActIntegrityService {

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
     * @param oaActIntegrity oaActIntegrity
     * @param userId         userId
     * @param randomId       randomId
     * @param state          state
     * @return int
     */
    int insert(OaActIntegrity oaActIntegrity, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActIntegrity oaActIntegrity
     * @return int
     */
    int edit(OaActIntegrity oaActIntegrity);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActIntegrity selectByPrimaryKey(String id);

    /**
     * 更新附件列表
     *
     * @param array array
     * @param id    id
     * @return int
     */
    int updateAnnexes(String[] array, String id);
}
