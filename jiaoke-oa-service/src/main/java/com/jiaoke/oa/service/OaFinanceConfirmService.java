package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaFinanceConfirm;

import java.util.List;

/**
 * 财务管理部-确认
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaFinanceConfirmService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaFinanceConfirm> selectAll();

    /**
     * 筛选
     *
     * @param name name
     * @return json
     */
    List<OaFinanceConfirm> searchFilter(String name);

    /**
     * 新增
     *
     * @param oaFinanceConfirm oaFinanceConfirm
     * @return int
     */
    int insertSelective(OaFinanceConfirm oaFinanceConfirm);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaFinanceConfirm selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaFinanceConfirm oaFinanceConfirm
     * @return int
     */
    int updateByPrimaryKeySelective(OaFinanceConfirm oaFinanceConfirm);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);
}
