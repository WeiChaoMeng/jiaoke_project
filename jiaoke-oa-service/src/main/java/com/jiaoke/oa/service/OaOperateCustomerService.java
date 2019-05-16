package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaOperateCustomer;

import java.util.List;

/**
 * 经营开发档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaOperateCustomerService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaOperateCustomer> selectAll();

    /**
     * 筛选
     *
     * @param projectName projectName
     * @return json
     */
    List<OaOperateCustomer> searchFilter(String projectName);

    /**
     * 新增
     *
     * @param oaOperateCustomer oaOperateCustomer
     * @return int
     */
    int insertSelective(OaOperateCustomer oaOperateCustomer);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaOperateCustomer selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaOperateCustomer oaOperateCustomer
     * @return int
     */
    int updateByPrimaryKeySelective(OaOperateCustomer oaOperateCustomer);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);
}
