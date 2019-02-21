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
     * @param username username
     * @return UserInfo
     */
    UserInfo getUserInfoByUserName(String username);

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

    /**
     * 获取全部
     *
     * @return list
     */
    List<UserInfo> selectAll();

    /**
     * 根据名字搜索
     *
     * @param username 用户名
     * @return
     */
    List<UserInfo> usernameFilter(String username);

    /**
     * 根据名字查询
     *
     * @param username username
     * @return userInfo
     */
    UserInfo checkUsername(String username);

    /**
     * 选择性插入
     *
     * @param userInfo userInfo
     * @return 影响行数
     */
    int insertSelective(UserInfo userInfo);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return UserInfo
     */
    UserInfo selectByPrimaryKey(Integer id);

    /**
     * 选择性修改
     *
     * @param userInfo UserInfo
     * @param array    角色列表
     * @return 影响行数
     */
    int updateRolePermission(UserInfo userInfo, String[] array);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return 影响行数
     */
    int deleteByPrimaryKey(Integer id);
}
