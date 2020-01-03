package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActAdjustWages;

/**
 * 调资审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActAdjustWagesService {

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
     * @param oaActAdjustWages oaActAdjustWages
     * @param userId           userId
     * @param randomId         randomId
     * @param state            state
     * @return int
     */
    int insert(OaActAdjustWages oaActAdjustWages, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActAdjustWages oaActAdjustWages
     * @return int
     */
    int edit(OaActAdjustWages oaActAdjustWages);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActAdjustWages selectByPrimaryKey(String id);

    /**
     * 选择性更新
     *
     * @param oaActAdjustWages oaActAdjustWages
     * @return int
     */
    int updateByPrimaryKeySelective(OaActAdjustWages oaActAdjustWages);
}
