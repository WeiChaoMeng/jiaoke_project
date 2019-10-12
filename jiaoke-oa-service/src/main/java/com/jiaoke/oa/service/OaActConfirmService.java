package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActConfirm;

/**
 * 确认单审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:17
 */
public interface OaActConfirmService {

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
     * @param oaActConfirm oaActConfirm
     * @param userId       userId
     * @param randomId     randomId
     * @param state        state
     * @return int
     */
    int insert(OaActConfirm oaActConfirm, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActConfirm oaActConfirm
     * @return int
     */
    int edit(OaActConfirm oaActConfirm);

    int updateByPrimaryKeySelective(OaActConfirm oaActConfirm);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActConfirm selectByPrimaryKey(String id);
}
