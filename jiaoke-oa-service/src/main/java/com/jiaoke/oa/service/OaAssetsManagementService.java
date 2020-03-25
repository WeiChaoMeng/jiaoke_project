package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaAssetManagement;

import java.util.List;

/**
 * oa-资产管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
public interface OaAssetsManagementService {

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaAssetManagement> selectAll();

    /**
     * 更具名字模糊查询
     *
     * @param assetsName 资产名称
     * @return list
     */
    List<OaAssetManagement> fuzzyQueryByName(String assetsName);
}
