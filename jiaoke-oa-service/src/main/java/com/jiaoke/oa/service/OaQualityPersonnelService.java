package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaQualityPersonnel;

import java.util.List;

/**
 * 质量技术部-人员情况
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaQualityPersonnelService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaQualityPersonnel> selectAll();

    /**
     * 筛选
     *
     * @param name name
     * @return json
     */
    List<OaQualityPersonnel> searchFilter(String name);

    /**
     * 新增
     *
     * @param oaQualityPersonnel oaQualityPersonnel
     * @return int
     */
    int insertSelective(OaQualityPersonnel oaQualityPersonnel);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaQualityPersonnel selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaQualityPersonnel oaQualityPersonnel
     * @return int
     */
    int updateByPrimaryKeySelective(OaQualityPersonnel oaQualityPersonnel);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);
}
