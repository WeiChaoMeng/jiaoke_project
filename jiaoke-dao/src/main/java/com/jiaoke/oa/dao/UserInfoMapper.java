package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.UserInfo;



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
}