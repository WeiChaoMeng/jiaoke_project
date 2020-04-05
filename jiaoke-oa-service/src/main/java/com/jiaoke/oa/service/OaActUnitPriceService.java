package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActUnitPrice;

/**
 * 单价审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:17
 */
public interface OaActUnitPriceService {

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
     * @param oaActUnitPrice oaActUnitPrice
     * @param userId         userId
     * @param randomId       randomId
     * @param state          state
     * @return int
     */
    int insert(OaActUnitPrice oaActUnitPrice, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActUnitPrice oaActUnitPrice
     * @return int
     */
    int edit(OaActUnitPrice oaActUnitPrice);

    /**
     * 根据主键更新
     *
     * @param oaActUnitPrice oaActUnitPrice
     * @return int
     */
    int updateByPrimaryKeySelective(OaActUnitPrice oaActUnitPrice);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActUnitPrice selectByPrimaryKey(String id);
}
