package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.Permission;
import com.jiaoke.oa.bean.UserInfo;

import java.util.List;

/**
 * 用户信息
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
public interface UserInfoService {

    /**
     * 获取用户信息根据用户名称
     *
     * @param userName userName
     * @return UserInfo
     */
    UserInfo getUserInfoByUserName(String userName);

    /**
     * 获取权限根据用户id
     *
     * @param userInfoId userInfoId
     * @return permission
     */
    List<Permission> getPermissionsByUserInfoId(Integer userInfoId);

    /**
     * 获取部门成员
     *
     * @param departmentKey 部门id
     * @return list
     */
    List<UserInfo> getUserByDepartmentKey(String departmentKey);
}
