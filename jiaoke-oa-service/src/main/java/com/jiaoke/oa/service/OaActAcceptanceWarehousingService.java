package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActAcceptanceWarehousing;
import com.jiaoke.oa.bean.OaActOfficeSupplies;

import java.util.List;

/**
 * 验收入库
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:29
 */
public interface OaActAcceptanceWarehousingService {

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
     * @param oaActAcceptanceWarehousing oaActAcceptanceWarehousing
     * @param userId                     userId
     * @param randomId                   randomId
     * @param state                      state
     * @return int
     */
    int insert(OaActAcceptanceWarehousing oaActAcceptanceWarehousing, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActAcceptanceWarehousing oaActAcceptanceWarehousing
     * @return int
     */
    int edit(OaActAcceptanceWarehousing oaActAcceptanceWarehousing);

    /**
     * 合同审查表 - 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActAcceptanceWarehousing selectByPrimaryKey(String id);

    /**
     * 根据主键更新
     *
     * @param oaActAcceptanceWarehousing oaActAcceptanceWarehousing
     * @return int
     */
    int updateByPrimaryKeySelective(OaActAcceptanceWarehousing oaActAcceptanceWarehousing);

    /**
     * 查询关联表信息（办公用品需求计划表）
     *
     * @param list list
     * @return list
     */
    List<OaActOfficeSupplies> selectMultipleData(List<String> list);

    /**
     * 入库
     *
     * @param oaActAcceptanceWarehousing oaActAcceptanceWarehousing
     * @return int
     */
    int enteringWarehouse(OaActAcceptanceWarehousing oaActAcceptanceWarehousing);
}
