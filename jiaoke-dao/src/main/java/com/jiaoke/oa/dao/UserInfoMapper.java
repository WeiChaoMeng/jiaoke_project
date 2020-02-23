package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 用户信息
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
public interface UserInfoMapper {

    /**
     * 选择性插入
     *
     * @param record userInfo
     * @return 影响行数
     */
    int insertSelective(UserInfo record);

    /**
     * 获取用户信息根据用户名称
     *
     * @param username username
     * @return UserInfo
     */
    UserInfo getUserInfoByUserName(String username);

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
     * @return list
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
     * 根据主键查询
     *
     * @param id id
     * @return UserInfo
     */
    UserInfo selectByPrimaryKey(Integer id);

    /**
     * 选择性修改
     *
     * @param record UserInfo
     * @return 影响行数
     */
    int updateByPrimaryKeySelective(UserInfo record);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return 影响行数
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 查询所有id和name
     *
     * @return list
     */
    List<UserInfo> selectIdAndNicknameAndDepartment();

    /**
     * 根据权限获取用户信息
     *
     * @param url 权限访问地址
     * @return userInfo
     */
    UserInfo selectByPermission(String url);

    /**
     * 根据权限获取用户信息(多个)
     *
     * @param url 权限访问地址
     * @return userInfo
     */
    List<UserInfo> selectMultipleByPermission(String url);

    /**
     * 根据用户id获取部门id
     *
     * @param id 用户id
     * @return 部门id
     */
    String selectDepartment(Integer id);

    /**
     * 根据id获取nickname
     *
     * @param id id
     * @return nickname
     */
    String getNicknameById(Integer id);

    /**
     * 根据ID修改密码
     *
     * @param id       id
     * @param password password
     * @return int
     */
    int updatePasswordById(@Param("id") Integer id, @Param("password") String password);
}