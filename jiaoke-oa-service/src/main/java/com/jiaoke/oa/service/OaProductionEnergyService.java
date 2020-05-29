package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaProductionEnergy;

import java.util.List;

/**
 * 经营报价档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaProductionEnergyService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaProductionEnergy> selectAll();

    /**
     * 筛选
     *
     * @param yearStr yearStr
     * @return json
     */
    List<OaProductionEnergy> searchFilter(String yearStr);

    /**
     * 新增
     *
     * @param oaProductionEnergy oaProductionEnergy
     * @return int
     */
    int insertSelective(OaProductionEnergy oaProductionEnergy);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaProductionEnergy selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaProductionEnergy oaProductionEnergy
     * @return int
     */
    int updateByPrimaryKeySelective(OaProductionEnergy oaProductionEnergy);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDelete(String[] ids);
}
