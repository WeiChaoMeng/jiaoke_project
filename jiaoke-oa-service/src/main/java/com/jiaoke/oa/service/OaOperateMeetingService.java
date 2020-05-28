package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaOperateMeeting;

import java.util.List;

/**
 * 经营报价档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaOperateMeetingService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<OaOperateMeeting> selectAll();

    /**
     * 筛选
     *
     * @param theme theme
     * @return json
     */
    List<OaOperateMeeting> searchFilter(String theme);

    /**
     * 新增
     *
     * @param oaOperateMeeting oaOperateMeeting
     * @return int
     */
    int insertSelective(OaOperateMeeting oaOperateMeeting);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaOperateDevelop
     */
    OaOperateMeeting selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     *
     * @param oaOperateMeeting oaOperateMeeting
     * @return int
     */
    int updateByPrimaryKeySelective(OaOperateMeeting oaOperateMeeting);

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
