package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaAssetManagement;
import org.apache.ibatis.annotations.Param;
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

    /**
     * 批量插入数据
     *
     * @param list OaAssetManagement
     * @return id
     */
    int batchInsertData(List<OaAssetManagement> list);

    /**
     * 查询资产名称和资产数量
     *
     * @return list
     */
    List<OaAssetManagement> selectNameAndNumber();

    /**
     * 根据id更新产品数量
     *
     * @param id              id
     * @param productQuantity productQuantity
     * @return int
     */
    int updateProductQuantityById(@Param("id") Integer id, @Param("productQuantity") Integer productQuantity);

    /**
     * 根据资产名称查询id、product_quantity
     *
     * @param assetsName assetsName
     * @return OaAssetManagement
     */
    OaAssetManagement selectByAssetsName(String assetsName);

    /**
     * 插入并返回主键
     *
     * @param oaAssetManagement oaAssetManagement
     * @return id
     */
    int insertReturnId(OaAssetManagement oaAssetManagement);
}
