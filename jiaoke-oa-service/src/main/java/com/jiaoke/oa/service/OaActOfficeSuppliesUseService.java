package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActOfficeSuppliesUse;
import com.jiaoke.oa.bean.OaAssetManagement;

import java.util.List;

/**
 * 办公用品领用
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:29
 */
public interface OaActOfficeSuppliesUseService {

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
     * @param oaActOfficeSuppliesUse oaActOfficeSuppliesUse
     * @param userId                 userId
     * @param randomId               randomId
     * @param state                  state
     * @return int
     */
    int insert(OaActOfficeSuppliesUse oaActOfficeSuppliesUse, Integer userId, String randomId, Integer state);

    /**
     * 合同审查表 - 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActOfficeSuppliesUse selectByPrimaryKey(String id);

    /**
     * 根据主键更新
     *
     * @param oaActOfficeSuppliesUse oaActOfficeSuppliesUse
     * @return int
     */
    int updateByPrimaryKeySelective(OaActOfficeSuppliesUse oaActOfficeSuppliesUse);

    /**
     * 查询库存信息
     *
     * @return list
     */
    List<OaAssetManagement> inventoryInfo();
}
