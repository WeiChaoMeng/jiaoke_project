package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaProductionOther;

import java.util.List;

/**
 * 生产管理部-其他
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaProductionOtherService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaProductionOther> selectAll();

    /**
     * 筛选
     *
     * @param name name
     * @return json
     */
    List<OaProductionOther> searchFilter(String name);

    /**
     * 新增
     *
     * @param oaProductionOther oaProductionOther
     * @return int
     */
    int insertSelective(OaProductionOther oaProductionOther);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaProductionOther selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaProductionOther oaProductionOther
     * @return int
     */
    int updateByPrimaryKeySelective(OaProductionOther oaProductionOther);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);
}
