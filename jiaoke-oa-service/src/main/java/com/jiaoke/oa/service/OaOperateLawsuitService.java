package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaOperateLawsuit;

import java.util.List;

/**
 * 经营报价档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaOperateLawsuitService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaOperateLawsuit> selectAll();

    /**
     * 筛选
     *
     * @param projectName projectName
     * @return json
     */
    List<OaOperateLawsuit> searchFilter(String projectName);

    /**
     * 新增
     *
     * @param oaOperateLawsuit oaOperateLawsuit
     * @return int
     */
    int insertSelective(OaOperateLawsuit oaOperateLawsuit);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaOperateLawsuit selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaOperateLawsuit oaOperateLawsuit
     * @return int
     */
    int updateByPrimaryKeySelective(OaOperateLawsuit oaOperateLawsuit);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);
}
