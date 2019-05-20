package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaProductionEnvironment;

import java.util.List;

/**
 * 经营报价档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaProductionEnvironmentService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaProductionEnvironment> selectAll();

    /**
     * 筛选
     *
     * @param projectName projectName
     * @return json
     */
    List<OaProductionEnvironment> searchFilter(String projectName);

    /**
     * 新增
     *
     * @param oaProductionEnvironment oaProductionEnvironment
     * @return int
     */
    int insertSelective(OaProductionEnvironment oaProductionEnvironment);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaProductionEnvironment selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaProductionEnvironment oaProductionEnvironment
     * @return int
     */
    int updateByPrimaryKeySelective(OaProductionEnvironment oaProductionEnvironment);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);
}
