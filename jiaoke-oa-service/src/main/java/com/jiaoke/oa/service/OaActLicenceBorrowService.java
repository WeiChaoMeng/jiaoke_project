package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActLicenceBorrow;

/**
 * 证照借用审批单（原件）
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:51
 */
public interface OaActLicenceBorrowService {

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
     * @param oaActLicenceBorrow oaActLicenceBorrow
     * @param userId             userId
     * @param randomId           randomId
     * @param state              state
     * @return int
     */
    int insert(OaActLicenceBorrow oaActLicenceBorrow, Integer userId, String randomId, Integer state);

    /**
     * 保存待发
     *
     * @param oaActLicenceBorrow oaActLicenceBorrow
     * @param userId             userId
     * @param randomId           randomId
     * @return int
     */
    int savePending(OaActLicenceBorrow oaActLicenceBorrow, Integer userId, String randomId);

    /**
     * 编辑
     *
     * @param oaActLicenceBorrow oaActLicenceBorrow
     * @return int
     */
    int edit(OaActLicenceBorrow oaActLicenceBorrow);

    /**
     * 查询
     *
     * @param id id
     * @return OaActSealsUse
     */
    OaActLicenceBorrow selectByPrimaryKey(String id);
}
