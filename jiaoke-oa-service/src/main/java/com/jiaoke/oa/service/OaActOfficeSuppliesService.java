package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActOfficeSupplies;

/**
 * 办公用品需求计划
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:29
 */
public interface OaActOfficeSuppliesService {

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
     * @param oaActOfficeSupplies oaActOfficeSupplies
     * @param userId              userId
     * @param randomId            randomId
     * @param state               state
     * @return int
     */
    int insert(OaActOfficeSupplies oaActOfficeSupplies, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActOfficeSupplies oaActOfficeSupplies
     * @return int
     */
    int edit(OaActOfficeSupplies oaActOfficeSupplies);

    /**
     * 合同审查表 - 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActOfficeSupplies selectByPrimaryKey(String id);

    /**
     * 根据主键更新
     *
     * @param oaActOfficeSupplies oaActOfficeSupplies
     * @return int
     */
    int updateByPrimaryKeySelective(OaActOfficeSupplies oaActOfficeSupplies);
}
