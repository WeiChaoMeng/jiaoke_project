package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaProductionEngineering;

import java.util.List;

/**
 * 经营报价档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaProductionEngineeringService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaProductionEngineering> selectAll();

    /**
     * 筛选
     *
     * @param projectName projectName
     * @return json
     */
    List<OaProductionEngineering> searchFilter(String projectName);

    /**
     * 新增
     *
     * @param oaProductionEngineering oaProductionEngineering
     * @return int
     */
    int insertSelective(OaProductionEngineering oaProductionEngineering);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaProductionEngineering selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaProductionEngineering oaProductionEngineering
     * @return int
     */
    int updateByPrimaryKeySelective(OaProductionEngineering oaProductionEngineering);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);
}
