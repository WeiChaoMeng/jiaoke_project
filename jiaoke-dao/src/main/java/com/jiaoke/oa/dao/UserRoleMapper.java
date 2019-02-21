package com.jiaoke.oa.dao;

import org.apache.ibatis.annotations.Param;


/**
 * 用户角色关联表
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */

public interface UserRoleMapper {

    /**
     * 删除
     *
     * @param userInfoId 用户id
     * @return 影响行数
     */
    int delete(Integer userInfoId);

    /**
     * 添加
     *
     * @param userInfoId 用户id
     * @param array      角色idList
     * @return 影响函数
     */
    int insert(@Param("userInfoId") Integer userInfoId, @Param("array") String[] array);
}