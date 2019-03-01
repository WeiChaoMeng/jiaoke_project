package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaManagementSystem;

import java.util.List;

/**
 * oa-综合办公室档案-管理体系相关
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 12:57
 */
public interface OaManagementSystemService {

    /**
     * 新增
     *
     * @param oaManagementSystem oaManagementSystem
     * @return 影响行数
     */
    int insertSelective(OaManagementSystem oaManagementSystem);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaManagementSystem> selectAll();

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaReleaseDocument
     */
    OaManagementSystem selectByPrimaryKey(int id);

    /**
     * 根据名称模糊查询
     *
     * @param fileName fileName
     * @return list
     */
    List<OaManagementSystem> getSelectByName(String fileName);

    /**
     * 根据日期查询
     *
     * @param data data
     * @return list
     */
    List<OaManagementSystem> getSelectByDate(String data);

    /**
     * 选择性更新
     *
     * @param oaManagementSystem oaManagementSystem
     * @return 影响行数
     */
    int updateByPrimaryKeySelective(OaManagementSystem oaManagementSystem);

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    int delete(int id);
}
