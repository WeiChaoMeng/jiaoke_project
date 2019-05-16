package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaOperateOther;

import java.util.List;

/**
 * 经营报价档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaOperateOtherService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaOperateOther> selectAll();

    /**
     * 筛选
     *
     * @param fileName fileName
     * @return json
     */
    List<OaOperateOther> searchFilter(String fileName);

    /**
     * 新增
     *
     * @param oaOperateOther oaOperateOther
     * @return int
     */
    int insertSelective(OaOperateOther oaOperateOther);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaOperateOther selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaOperateOther oaOperateOther
     * @return int
     */
    int updateByPrimaryKeySelective(OaOperateOther oaOperateOther);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);
}
