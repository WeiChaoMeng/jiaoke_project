package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.Permission;

import java.util.List;

/**
 * 权限信息
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
public interface PermissionService {

    /**
     * 获取全部
     *
     * @return list
     */
    List<Permission> selectAll();

    /**
     * 查询已有权限
     *
     * @param id id
     * @return list
     */
    List<Permission> selectExistingPermission(Integer id);

    /**
     * 根据名字搜索
     *
     * @param permissionName 权限名称
     * @return list
     */
    List<Permission> permissionNameFilter(String permissionName);
}
