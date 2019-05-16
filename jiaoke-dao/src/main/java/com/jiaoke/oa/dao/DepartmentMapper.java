package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.Department;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * 部门
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Repository
public interface DepartmentMapper extends Mapper<Department> {

    /**
     * 部门key和name
     *
     * @return list
     */
    List<Department> selectKeyAndName();

    /**
     * 根据部门名称查询
     *
     * @param departmentName departmentName
     * @return list
     */
    List<Department> departmentNameFilter(String departmentName);

    /**
     * 检查部门是否被注册
     *
     * @param departmentName departmentName
     * @return department
     */
    Department checkDepartmentName(String departmentName);

    /**
     * 绑定部门主管
     *
     * @param id        id
     * @param principal principal
     * @return int
     */
    int bindingDepartmentHead(@Param("id") Integer id, @Param("principal") String principal);

    /**
     * 查询所有部门
     *
     * @return list
     */
    List<Department> selectAllDepartment();

    /**
     * 更新部门名称
     *
     * @param id             id
     * @param departmentName departmentName
     * @return int
     */
    int updateDepartmentName(@Param("id") Integer id, @Param("departmentName") String departmentName);
}
