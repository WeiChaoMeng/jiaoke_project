package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaNewsCenter;

import java.util.List;

/**
 * oa-新闻中心
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
public interface OaNewsCenterService {

    /**
     * 选择性插入
     *
     * @param oaNewsCenter oaNewsCenter
     * @return 影响行数
     */
    int insertSelective(OaNewsCenter oaNewsCenter);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaNewsCenter> selectAll();

    /**
     * 根据id查询
     *
     * @param id id
     * @return OaAssetManagement
     */
    OaNewsCenter selectByPrimaryKey(Integer id);

    /**
     * 查询最新数据
     *
     * @return list
     */
    List<OaNewsCenter> selectLatestData();
}
