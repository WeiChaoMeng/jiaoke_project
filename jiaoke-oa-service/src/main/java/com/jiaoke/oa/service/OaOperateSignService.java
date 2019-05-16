package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaOperateDevelop;
import com.jiaoke.oa.bean.OaOperateSign;

import java.util.List;

/**
 * 经营开发档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaOperateSignService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaOperateSign> selectAll();

    /**
     * 筛选
     *
     * @param purchaser purchaser
     * @return json
     */
    List<OaOperateSign> searchFilter(String purchaser);

    /**
     * 新增
     *
     * @param oaOperateSign oaOperateSign
     * @return int
     */
    int insertSelective(OaOperateSign oaOperateSign);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaOperateSign selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaOperateSign oaOperateSign
     * @return int
     */
    int updateByPrimaryKeySelective(OaOperateSign oaOperateSign);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);
}
