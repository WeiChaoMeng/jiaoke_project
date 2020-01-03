package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActPactSign;

/**
 * 劳务派遣员工协议签订、续订、变更、终止审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActPactSignService {

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
     * @param oaActPactSign oaActPactSign
     * @param userId        userId
     * @param randomId      randomId
     * @param state         state
     * @return int
     */
    int insert(OaActPactSign oaActPactSign, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActPactSign oaActPactSign
     * @return int
     */
    int edit(OaActPactSign oaActPactSign);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActPactSign selectByPrimaryKey(String id);

    /**
     * 选择性更新
     *
     * @param oaActPactSign oaActPactSign
     * @return int
     */
    int updateByPrimaryKeySelective(OaActPactSign oaActPactSign);
}
