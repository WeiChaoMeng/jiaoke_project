package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActRead;

/**
 * 收文阅办审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 3:36
 */
public interface OaActReadService {

    /**
     * 删除
     *
     * @param id id
     * @return int
     */
    int deleteData(String id);

    /**
     * 收文阅办审批单 - 新增
     *
     * @param oaActRead oaActRead
     * @param userId    userId
     * @param randomId  randomId
     * @param state     state
     * @return int
     */
    int insert(OaActRead oaActRead, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActRead oaActRead
     * @return int
     */
    int edit(OaActRead oaActRead);

    /**
     * 收文阅办审批单 - 查询
     *
     * @param id id
     * @return OaActSealsUse
     */
    OaActRead selectByPrimaryKey(String id);

    /**
     * 选择性更新
     *
     * @param oaActRead oaActRead
     * @return int
     */
    int updateByPrimaryKeySelective(OaActRead oaActRead);
}
