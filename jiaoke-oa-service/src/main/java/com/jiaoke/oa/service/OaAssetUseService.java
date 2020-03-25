package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaAssetUse;

import java.util.List;

/**
 * oa-领用记录
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
public interface OaAssetUseService {

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaAssetUse> selectAll();

    /**
     * 更具名字模糊查询
     *
     * @param assetsName 资产名称
     * @return list
     */
    List<OaAssetUse> fuzzyQueryByName(String assetsName);
}
