package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaManagementSystem;
import com.jiaoke.oa.bean.OaOfficeOther;

import java.util.List;

/**
 * oa-综合办公室档案-管理体系相关
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/7 12:57
 */
public interface OaOfficeOtherService {

    /**
     * 新增
     *
     * @param oaOfficeOther oaOfficeOther
     * @return 影响行数
     */
    int insertSelective(OaOfficeOther oaOfficeOther);

    /**
     * 查询全部
     *
     * @return list
     */
    List<OaOfficeOther> selectAll();

    /**
     * 根据主键查询
     *
     * @param id id
     * @return OaReleaseDocument
     */
    OaOfficeOther selectByPrimaryKey(int id);

    /**
     * 根据名称模糊查询
     *
     * @param name name
     * @return list
     */
    List<OaOfficeOther> getSelectByName(String name);

    /**
     * 根据日期查询
     *
     * @param date date
     * @return list
     */
    List<OaOfficeOther> getSelectByDate(String date);

    /**
     * 选择性更新
     *
     * @param oaOfficeOther oaOfficeOther
     * @return 影响行数
     */
    int updateByPrimaryKeySelective(OaOfficeOther oaOfficeOther);

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    int delete(int id);

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDelete(String[] ids);
}
