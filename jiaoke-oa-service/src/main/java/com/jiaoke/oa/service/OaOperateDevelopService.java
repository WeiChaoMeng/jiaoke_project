package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaOperateDevelop;
import io.swagger.models.auth.In;

import java.util.List;

/**
 * 经营开发档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaOperateDevelopService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaOperateDevelop> selectAll();

    /**
     * 筛选
     *
     * @param purchaser purchaser
     * @return json
     */
    List<OaOperateDevelop> searchFilter(String purchaser);

    /**
     * 新增
     *
     * @param oaOperateDevelop oaOperateDevelop
     * @return int
     */
    int insertSelective(OaOperateDevelop oaOperateDevelop);

    OaOperateDevelop selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaOperateDevelop oaOperateDevelop);

    int deleteByPrimaryKey(Integer id);

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDelete(String[] ids);
}
