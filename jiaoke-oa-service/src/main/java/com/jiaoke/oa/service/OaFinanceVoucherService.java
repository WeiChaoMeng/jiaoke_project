package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaFinanceVoucher;

import java.util.List;

/**
 * 财务管理部-凭证
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaFinanceVoucherService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaFinanceVoucher> selectAll();

    /**
     * 筛选
     *
     * @param remarks remarks
     * @return json
     */
    List<OaFinanceVoucher> searchFilter(String remarks);

    /**
     * 新增
     *
     * @param oaFinanceVoucher oaOperateOffer
     * @return int
     */
    int insertSelective(OaFinanceVoucher oaFinanceVoucher);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaFinanceVoucher selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaFinanceVoucher oaOperateOffer
     * @return int
     */
    int updateByPrimaryKeySelective(OaFinanceVoucher oaFinanceVoucher);

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
