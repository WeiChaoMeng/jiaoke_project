package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActSealsBorrow;

/**
 * 印章借用审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:29
 */
public interface OaActSealsBorrowService {

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
     * @param oaActSealsBorrow oaActSealsBorrow
     * @param userId           userId
     * @param randomId         randomId
     * @param state            state
     * @return int
     */
    int insert(OaActSealsBorrow oaActSealsBorrow, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActSealsBorrow oaActSealsBorrow
     * @return int
     */
    int edit(OaActSealsBorrow oaActSealsBorrow);

    /**
     * 合同审查表 - 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActSealsBorrow selectByPrimaryKey(String id);

    /**
     * 选择性更新
     *
     * @param oaActSealsBorrow oaActSealsBorrow
     * @return int
     */
    int updateByPrimaryKeySelective(OaActSealsBorrow oaActSealsBorrow);
}
