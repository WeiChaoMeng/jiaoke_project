package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActTaxiUse;

/**
 * 用车审批表（出租车）
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActTaxiUseService {

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
     * @param oaActTaxiUse oaActTaxiUse
     * @param userId       userId
     * @param randomId     randomId
     * @param state        state
     * @return int
     */
    int insert(OaActTaxiUse oaActTaxiUse, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActTaxiUse oaActTaxiUse
     * @return int
     */
    int edit(OaActTaxiUse oaActTaxiUse);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActTaxiUse selectByPrimaryKey(String id);

    /**
     * 选择性更新
     *
     * @param oaActTaxiUse oaActTaxiUse
     * @return int
     */
    int updateByPrimaryKeySelective(OaActTaxiUse oaActTaxiUse);
}
