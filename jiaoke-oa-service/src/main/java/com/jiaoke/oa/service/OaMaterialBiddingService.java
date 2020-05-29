package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaMaterialBidding;

import java.util.List;

/**
 * 物资管理部-砂石料招投标资料
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaMaterialBiddingService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaMaterialBidding> selectAll();

    /**
     * 筛选
     *
     * @param file file
     * @return json
     */
    List<OaMaterialBidding> searchFilter(String file);

    /**
     * 新增
     *
     * @param oaMaterialBidding oaMaterialBidding
     * @return int
     */
    int insertSelective(OaMaterialBidding oaMaterialBidding);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaMaterialBidding selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaMaterialBidding oaMaterialBidding
     * @return int
     */
    int updateByPrimaryKeySelective(OaMaterialBidding oaMaterialBidding);

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
