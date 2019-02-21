package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.RoleInfo;

import java.util.List;


/**
 * 角色管理
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */

public interface RoleInfoMapper {

    /**
     * 获取全部
     *
     * @return list
     */
    List<RoleInfo> selectAll();

    /**
     * 根据主键查询
     *
     * @param id id
     * @return role
     */
    RoleInfo selectByPrimaryKey(Integer id);

    /**
     * 选择性插入
     *
     * @param roleInfo roleInfo
     * @return 影响行数
     */
    int insertSelective(RoleInfo roleInfo);

    /**
     * 删除
     *
     * @param id id
     * @return 影响行数
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 根据角色名查询
     *
     * @param name name
     * @return roleInfo
     */
    RoleInfo checkRoleName(String name);

    /**
     * 选择性更新
     *
     * @param roleInfo roleInfo
     * @return 影响行数
     */
    int updateByPrimaryKeySelective(RoleInfo roleInfo);

    /**
     * 根据角色名筛选
     *
     * @param name 权限名
     * @return list
     */
    List<RoleInfo> roleNameFilter(String name);

    /**
     * 查询现有角色信息
     *
     * @param id id
     * @return list
     */
    List<RoleInfo> selectExistingRoleInfo(Integer id);
}