package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaProductionContract;

import java.util.List;

/**
 * 经营报价档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaProductionContractService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaProductionContract> selectAll();

    /**
     * 筛选
     *
     * @param projectName projectName
     * @return json
     */
    List<OaProductionContract> searchFilter(String projectName);

    /**
     * 新增
     *
     * @param oaProductionContract oaProductionContract
     * @return int
     */
    int insertSelective(OaProductionContract oaProductionContract);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaProductionContract selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaProductionContract oaProductionContract
     * @return int
     */
    int updateByPrimaryKeySelective(OaProductionContract oaProductionContract);

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
