package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.Permission;
import com.jiaoke.oa.bean.RolePermission;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 角色权限关联表
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */

public interface RolePermissionMapper {

    /**
     * 删除
     *
     * @param roleId 角色id
     * @return 影响行数
     */
    int delete(Integer roleId);

    /**
     * 添加
     *
     * @return 影响函数
     */
    int insert(@Param("roleId") Integer roleId, @Param("array") String[] array);
}