package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActAcceptance;
import com.jiaoke.oa.bean.OaActMaintain;

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
     * @param state           state
     * @return int
     */
    int insert(OaActAcceptance oaActAcceptance, Integer userId, String randomId, Integer state);

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

    /**
     * 选择性更新
     *
     * @param oaActAcceptance oaActAcceptance
     * @return int
     */
    int updateByPrimaryKeySelective(OaActAcceptance oaActAcceptance);
}
