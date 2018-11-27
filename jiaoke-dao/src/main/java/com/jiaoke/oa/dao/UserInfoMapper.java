package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.UserInfo;

import java.util.List;


public interface UserInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);

    /**
     * 获取用户信息根据用户名称
     *
     * @param userName userName
     * @return UserInfo
     */
    UserInfo getUserInfoByUserName(String userName);

    /**
     * 获取部门成员
     *
     * @param departmentKey 部门id
     * @return list
     */
    List<UserInfo> getUserByDepartmentKey(String departmentKey);

    /**
     * 根据昵称获取id
     *
     * @param nickName 昵称
     * @return id
     */
    Integer getIdByNickName(String nickName);
}