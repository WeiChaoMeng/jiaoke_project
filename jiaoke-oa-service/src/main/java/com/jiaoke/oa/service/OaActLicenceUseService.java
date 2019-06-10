package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActLicenceUse;

/**
 * 证照使用审批单（复印件）
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 3:01
 */
public interface OaActLicenceUseService {

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
     * @param oaActLicenceUse oaActLicenceUse
     * @param userId          userId
     * @param randomId        randomId
     * @param state           state
     * @return int
     */
    int insert(OaActLicenceUse oaActLicenceUse, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActLicenceUse oaActLicenceUse
     * @return int
     */
    int edit(OaActLicenceUse oaActLicenceUse);

    /**
     * 查询
     *
     * @param id id
     * @return OaActSealsUse
     */
    OaActLicenceUse selectByPrimaryKey(String id);
}
