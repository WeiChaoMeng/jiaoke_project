package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActTransfer;

/**
 * 转岗申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActTransferService {

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
     * @param oaActTransfer oaActTransfer
     * @param userId        userId
     * @param randomId      randomId
     * @param state         state
     * @return int
     */
    int insert(OaActTransfer oaActTransfer, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActTransfer oaActTransfer
     * @return int
     */
    int edit(OaActTransfer oaActTransfer);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActTransfer selectByPrimaryKey(String id);

    /**
     * 选择性更新
     *
     * @param oaActTransfer oaActTransfer
     * @return int
     */
    int updateByPrimaryKeySelective(OaActTransfer oaActTransfer);
}
