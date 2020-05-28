package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaMaterialOther;

import java.util.List;

/**
 * 物资管理部-其他
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaMaterialOtherService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaMaterialOther> selectAll();

    /**
     * 筛选
     *
     * @param name name
     * @return json
     */
    List<OaMaterialOther> searchFilter(String name);

    /**
     * 新增
     *
     * @param oaMaterialOther oaMaterialOther
     * @return int
     */
    int insertSelective(OaMaterialOther oaMaterialOther);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaMaterialOther selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaMaterialOther oaMaterialOther
     * @return int
     */
    int updateByPrimaryKeySelective(OaMaterialOther oaMaterialOther);

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
