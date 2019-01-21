package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaAssetManagement;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * oa-资产管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface OaAssetsManagementMapper extends Mapper<OaAssetManagement> {

    /**
     * 更具名字模糊查询
     *
     * @param assetsName 资产名称
     * @return list
     */
    List<OaAssetManagement> fuzzyQueryByName(String assetsName);
}
