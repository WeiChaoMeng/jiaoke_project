package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActAcceptance;

/**
 * 验收单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 3:18
 */
public interface OaActAcceptanceService {

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
     * @param oaActAcceptance oaActAcceptance
     * @param userId          userId
     * @param randomId        randomId
     * @return int
     */
    int insert(OaActAcceptance oaActAcceptance, Integer userId, String randomId);

    /**
     * 保存待发
     *
     * @param oaActAcceptance oaActAcceptance
     * @param userId          userId
     * @param randomId        randomId
     * @return int
     */
    int savePending(OaActAcceptance oaActAcceptance, Integer userId, String randomId);

    /**
     * 验收单 - 查询
     *
     * @param id id
     * @return OaActSealsUse
     */
    OaActAcceptance selectByPrimaryKey(String id);

    /**
     * 编辑
     *
     * @param oaActAcceptance oaActAcceptance
     * @return int
     */
    int edit(OaActAcceptance oaActAcceptance);
}
