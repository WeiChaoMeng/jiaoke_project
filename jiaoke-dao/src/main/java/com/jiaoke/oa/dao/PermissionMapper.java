package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.Permission;


import java.util.List;


/**
 * 权限管理
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */

public interface PermissionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);


    /**
     * 获取权限根据用户id
     *
     * @param userInfoId userInfoId
     * @return permission
     */
    List<Permission> getPermissionsByUserInfoId(Integer userInfoId);
}