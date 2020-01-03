package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActPactStop;

/**
 * 劳务协议终止通知书
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActPactStopService {

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
     * @param oaActPactStop oaActPactStop
     * @param userId        userId
     * @param randomId      randomId
     * @param state         state
     * @return int
     */
    int insert(OaActPactStop oaActPactStop, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActPactStop oaActPactStop
     * @return int
     */
    int edit(OaActPactStop oaActPactStop);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActPactStop selectByPrimaryKey(String id);

    /**
     * 选择性更新
     *
     * @param oaActPactStop oaActPactStop
     * @return int
     */
    int updateByPrimaryKeySelective(OaActPactStop oaActPactStop);
}
