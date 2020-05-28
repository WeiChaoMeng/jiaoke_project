package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaFinanceBill;

import java.util.List;

/**
 * 财务管理部-票据
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaFinanceBillService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaFinanceBill> selectAll();

    /**
     * 筛选
     *
     * @param remarks remarks
     * @return json
     */
    List<OaFinanceBill> searchFilter(String remarks);

    /**
     * 新增
     *
     * @param oaFinanceBill oaFinanceBill
     * @return int
     */
    int insertSelective(OaFinanceBill oaFinanceBill);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaFinanceBill selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaFinanceBill oaFinanceBill
     * @return int
     */
    int updateByPrimaryKeySelective(OaFinanceBill oaFinanceBill);

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
