package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.Permission;
import com.jiaoke.oa.bean.RoleInfo;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.dao.PermissionMapper;
import com.jiaoke.oa.dao.RoleInfoMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import com.jiaoke.oa.dao.UserRoleMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Resource
    private RoleInfoMapper roleInfoMapper;

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
    public int updateRolePermission(Integer userId, String[] array) {
        if (array == null || array.length == 0) {
            if (userRoleMapper.delete(userId) < 0) {
                return -1;
            } else {
                return 1;
            }
        } else {
            if (userRoleMapper.delete(userId) < 0) {
                return -1;
            } else {
                if (userRoleMapper.insert(userId, array) < 0) {
                    return -1;
                } else {
                    return 1;
                }
            }
        }

    }

    @Override
    public int updateUserInfo(UserInfo userInfo) {
        return userInfoMapper.updateByPrimaryKeySelective(userInfo);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        if (userInfoMapper.deleteByPrimaryKey(id) < 0) {
            return -1;
        } else {
            if (userRoleMapper.delete(id) < 0) {
                return -1;
            } else {
                return 1;
            }
        }
    }

    @Override
    public Map<String, Object> bindingInfo(Integer id) {
        HashMap<String, Object> map = new HashMap<>();
        //查询全部角色
        List<RoleInfo> roleInfoList = roleInfoMapper.selectAll();
        //已绑定角色
        List<RoleInfo> existingRoleInfo = roleInfoMapper.selectExistingRoleInfo(id);
        map.put("roleInfoList", roleInfoList);
        map.put("existingRoleInfo", existingRoleInfo);
        return map;
    }

    @Override
    public List<UserInfo> selectIdAndNicknameAndDepartment() {
        return userInfoMapper.selectIdAndNicknameAndDepartment();
    }

    @Override
    public UserInfo getUserInfoByPermission(String url) {
        return userInfoMapper.selectByPermission(url);
    }

    @Override
    public String selectDepartmentByUserId(Integer userId) {
        return userInfoMapper.selectDepartment(userId);
    }
}
