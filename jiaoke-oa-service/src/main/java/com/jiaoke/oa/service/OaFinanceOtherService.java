package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaFinanceOther;

import java.util.List;

/**
 * 财务管理部-其它文件
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaFinanceOtherService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaFinanceOther> selectAll();

    /**
     * 筛选
     *
     * @param name name
     * @return json
     */
    List<OaFinanceOther> searchFilter(String name);

    /**
     * 新增
     *
     * @param oaFinanceOther oaFinanceOther
     * @return int
     */
    int insertSelective(OaFinanceOther oaFinanceOther);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaFinanceOther selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaFinanceOther oaFinanceOther
     * @return int
     */
    int updateByPrimaryKeySelective(OaFinanceOther oaFinanceOther);

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
