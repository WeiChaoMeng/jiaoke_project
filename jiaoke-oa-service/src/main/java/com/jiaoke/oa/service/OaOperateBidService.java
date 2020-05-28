package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaOperateBid;

import java.util.List;

/**
 * 经营开发档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaOperateBidService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaOperateBid> selectAll();

    /**
     * 筛选
     *
     * @param projectName projectName
     * @return json
     */
    List<OaOperateBid> searchFilter(String projectName);

    /**
     * 新增
     *
     * @param oaOperateBid oaOperateBid
     * @return int
     */
    int insertSelective(OaOperateBid oaOperateBid);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaOperateBid selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaOperateBid oaOperateBid
     * @return int
     */
    int updateByPrimaryKeySelective(OaOperateBid oaOperateBid);

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
