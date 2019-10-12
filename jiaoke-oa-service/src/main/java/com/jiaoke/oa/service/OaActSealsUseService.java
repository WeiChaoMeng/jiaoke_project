package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActSealsUse;

/**
 * 印章使用审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:41
 */
public interface OaActSealsUseService {

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
     * @param oaActSealsUse oaActSealsUse
     * @param userId        userId
     * @param randomId      randomId
     * @param state         state
     * @return int
     */
    int insert(OaActSealsUse oaActSealsUse, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActSealsUse oaActSealsUse
     * @return int
     */
    int edit(OaActSealsUse oaActSealsUse);

    /**
     * 印章使用审批单 - 查询
     *
     * @param id id
     * @return OaActSealsUse
     */
    OaActSealsUse selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(OaActSealsUse oaActSealsUse);
}
