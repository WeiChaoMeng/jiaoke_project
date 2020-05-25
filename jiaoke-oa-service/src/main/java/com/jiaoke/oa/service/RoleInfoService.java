package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.Permission;
import com.jiaoke.oa.bean.RoleInfo;

import java.util.List;
import java.util.Map;

/**
 * 角色信息
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
public interface RoleInfoService {

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
     * 更新用户权限
     *
     * @param array  权限id集合
     * @param roleId 角色id
     * @return 影响行数
     */
    int updateRolePermission(Integer roleId, String[] array);


    int updateRole(Integer roleId, String description);

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

    /**
     * 查询已绑定权限
     *
     * @param id id
     * @return list
     */
    List<Permission> bindingInfo(Integer id);

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDeleteRole(String[] ids);
}
