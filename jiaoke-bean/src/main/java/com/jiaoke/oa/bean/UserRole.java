package com.jiaoke.oa.bean;

import java.io.Serializable;

/**
 * 用户角色关联表
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/10 11:00
 */
public class UserRole implements Serializable {

    /**
     * 用户信息id
     */
    private Integer userInfoId;

    /**
     * 角色信息id
     */
    private String roleInfoId;

    public Integer getUserInfoId() {
        return userInfoId;
    }

    public void setUserInfoId(Integer userInfoId) {
        this.userInfoId = userInfoId;
    }

    public String getRoleInfoId() {
        return roleInfoId;
    }

    public void setRoleInfoId(String roleInfoId) {
        this.roleInfoId = roleInfoId;
    }
}