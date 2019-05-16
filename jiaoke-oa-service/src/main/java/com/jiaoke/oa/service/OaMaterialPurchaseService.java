package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaMaterialPurchase;

import java.util.List;

/**
 * 物资管理部-原材料采购合同
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaMaterialPurchaseService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaMaterialPurchase> selectAll();

    /**
     * 筛选
     *
     * @param name name
     * @return json
     */
    List<OaMaterialPurchase> searchFilter(String name);

    /**
     * 新增
     *
     * @param oaMaterialPurchase oaMaterialPurchase
     * @return int
     */
    int insertSelective(OaMaterialPurchase oaMaterialPurchase);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaMaterialPurchase selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaMaterialPurchase oaMaterialPurchase
     * @return int
     */
    int updateByPrimaryKeySelective(OaMaterialPurchase oaMaterialPurchase);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);
}
