package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaQualityDevise;

import java.util.List;

/**
 * 质量技术部-设计文件
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaQualityDeviseService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaQualityDevise> selectAll();

    /**
     * 筛选
     *
     * @param remarks remarks
     * @return json
     */
    List<OaQualityDevise> searchFilter(String remarks);

    /**
     * 新增
     *
     * @param oaQualityDevise oaQualityDevise
     * @return int
     */
    int insertSelective(OaQualityDevise oaQualityDevise);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaQualityDevise selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaQualityDevise oaQualityDevise
     * @return int
     */
    int updateByPrimaryKeySelective(OaQualityDevise oaQualityDevise);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);
}
