package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.Permission;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.dao.PermissionMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import com.jiaoke.oa.dao.UserRoleMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
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

    @Resource
    private UserRoleMapper userRoleMapper;

    /**
     * 获取用户信息根据用户名称
     *
     * @param username username
     * @return UserInfo
     */
    @Override
    public UserInfo getUserInfoByUserName(String username) {
        return userInfoMapper.getUserInfoByUserName(username);
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
     * @param department 部门id
     * @return list
     */
    @Override
    public List<UserInfo> getUserByDepartmentKey(String department) {
        return userInfoMapper.getUserByDepartmentKey(department);
    }

    @Override
    public List<UserInfo> selectAll() {
        return userInfoMapper.selectAll();
    }

    @Override
    public List<UserInfo> usernameFilter(String username) {
        if ("".equals(username)) {
            return userInfoMapper.selectAll();
        } else {
            return userInfoMapper.usernameFilter(username);
        }
    }

    @Override
    public UserInfo checkUsername(String username) {
        return userInfoMapper.checkUsername(username);
    }

    @Override
    public int insertSelective(UserInfo userInfo) {
        userInfo.setRegisterTime(new Date());
        return userInfoMapper.insertSelective(userInfo);
    }

    @Override
    public UserInfo selectByPrimaryKey(Integer id) {
        return userInfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateRolePermission(UserInfo userInfo, String[] array) {
        if (array == null || array.length == 0) {
            if (userRoleMapper.delete(userInfo.getId()) < 0) {
                return -1;
            } else {
                if (userInfoMapper.updateByPrimaryKeySelective(userInfo) < 0) {
                    return -1;
                } else {
                    return 1;
                }
            }
        } else {
            if (userRoleMapper.delete(userInfo.getId()) < 0) {
                return -1;
            } else {
                if (userRoleMapper.insert(userInfo.getId(), array) < 0) {
                    return -1;
                } else {
                    if (userInfoMapper.updateByPrimaryKeySelective(userInfo) < 0) {
                        return -1;
                    } else {
                        return 1;
                    }
                }
            }
        }

    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return userInfoMapper.deleteByPrimaryKey(id);
    }
}
