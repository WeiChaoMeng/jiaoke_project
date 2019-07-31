package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActTransferTwo;

/**
 * 转岗申请表2
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActTransferTwoService {

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
     * @param oaActTransferTwo oaActTransferTwo
     * @param userId           userId
     * @param randomId         randomId
     * @param state            state
     * @return int
     */
    int insert(OaActTransferTwo oaActTransferTwo, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActTransferTwo oaActTransferTwo
     * @return int
     */
    int edit(OaActTransferTwo oaActTransferTwo);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActTransferTwo selectByPrimaryKey(String id);

    /**
     * 更新附件列表
     *
     * @param array array
     * @param id    id
     * @return int
     */
    int updateAnnexes(String[] array, String id);
}
