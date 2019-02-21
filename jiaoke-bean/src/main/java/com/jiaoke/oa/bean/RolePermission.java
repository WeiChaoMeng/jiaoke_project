package com.jiaoke.oa.bean;

import java.io.Serializable;

/**
 * 角色权限关联表
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/10 11:00
 */
public class RolePermission implements Serializable {

    /**
     * 角色id
     */
    private Integer roleId;

    /**
     * 权限id
     */
    private String permissionId;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(String permissionId) {
        this.permissionId = permissionId;
    }
}