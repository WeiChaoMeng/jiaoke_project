package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActEngineering;

/**
 * 工程名称变更记录表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 3:29
 */
public interface OaActEngineeringService {

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
     * @param oaActEngineering oaActEngineering
     * @param userId           userId
     * @param randomId         randomId
     * @return int
     */
    int insert(OaActEngineering oaActEngineering, Integer userId, String randomId);

    /**
     * 编辑
     *
     * @param oaActEngineering oaActEngineering
     * @param userId           userId
     * @param randomId         randomId
     * @return int
     */
    int savePending(OaActEngineering oaActEngineering, Integer userId, String randomId);

    /**
     * 工程名称变更记录表 - 查询
     *
     * @param id id
     * @return OaActSealsUse
     */
    OaActEngineering selectByPrimaryKey(String id);

    /**
     * 编辑
     *
     * @param oaActEngineering oaActEngineering
     * @return int
     */
    int edit(OaActEngineering oaActEngineering);
}
