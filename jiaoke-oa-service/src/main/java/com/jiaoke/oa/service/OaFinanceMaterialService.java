package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaFinanceMaterial;

import java.util.List;

/**
 * 财务管理部-报表及材料
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaFinanceMaterialService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaFinanceMaterial> selectAll();

    /**
     * 筛选
     *
     * @param remarks remarks
     * @return json
     */
    List<OaFinanceMaterial> searchFilter(String remarks);

    /**
     * 新增
     *
     * @param oaFinanceMaterial oaFinanceMaterial
     * @return int
     */
    int insertSelective(OaFinanceMaterial oaFinanceMaterial);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaFinanceMaterial selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaFinanceMaterial oaFinanceMaterial
     * @return int
     */
    int updateByPrimaryKeySelective(OaFinanceMaterial oaFinanceMaterial);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);
}
