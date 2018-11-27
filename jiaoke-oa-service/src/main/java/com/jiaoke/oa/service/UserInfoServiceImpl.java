package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.Permission;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.dao.PermissionMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 用户信息
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private PermissionMapper permissionMapper;

    /**
     * 获取用户信息根据用户名称
     *
     * @param userName userName
     * @return UserInfo
     */
    @Override
    public UserInfo getUserInfoByUserName(String userName) {
        return userInfoMapper.getUserInfoByUserName(userName);
    }

    /**
     * 获取权限根据用户id
     *
     * @param userInfoId userInfoId
     * @return permission
     */
    @Override
    public List<Permission> getPermissionsByUserInfoId(Integer userInfoId) {
        return permissionMapper.getPermissionsByUserInfoId(userInfoId);
    }

    /**
     * 获取部门成员
     *
     * @param departmentKey 部门id
     * @return list
     */
    @Override
    public List<UserInfo> getUserByDepartmentKey(String departmentKey) {
        return userInfoMapper.getUserByDepartmentKey(departmentKey);
    }
}
