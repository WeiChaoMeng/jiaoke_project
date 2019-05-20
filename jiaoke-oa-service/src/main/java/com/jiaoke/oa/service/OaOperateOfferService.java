package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaOperateOffer;

import java.util.List;

/**
 * 经营报价档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaOperateOfferService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaOperateOffer> selectAll();

    /**
     * 筛选
     *
     * @param projectName projectName
     * @return json
     */
    List<OaOperateOffer> searchFilter(String projectName);

    /**
     * 新增
     *
     * @param oaOperateOffer oaOperateOffer
     * @return int
     */
    int insertSelective(OaOperateOffer oaOperateOffer);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaOperateOffer selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaOperateOffer oaOperateOffer
     * @return int
     */
    int updateByPrimaryKeySelective(OaOperateOffer oaOperateOffer);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);
}
