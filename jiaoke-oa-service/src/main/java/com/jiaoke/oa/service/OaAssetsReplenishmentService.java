package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaAssetReplenishment;

import java.util.List;

/**
 * oa-资产补货
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
public interface OaAssetsReplenishmentService {

    /**
     * 选择性添加
     *
     * @param oaAssetReplenishment oaAssetReplenishment
     * @return 影响行数
     */
    int insertSelective(OaAssetReplenishment oaAssetReplenishment);

    /**
     * 根据资产id查询
     *
     * @param assetManagementId 资产id
     * @return list
     */
    List<OaAssetReplenishment> select(Integer assetManagementId);

    /**
     * 根据时间搜索
     *
     * @param createTime        创建时间
     * @param assetManagementId 资产id
     * @return list
     */
    List<OaAssetReplenishment> replenishmentTimeFilter(String createTime, Integer assetManagementId);
}
