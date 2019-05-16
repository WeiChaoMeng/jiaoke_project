package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.Department;

import java.util.List;

/**
 * 部门
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
public interface DepartmentService {

    /**
     * 查询所有
     *
     * @return list
     */
    List<Department> selectAll();

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
     * 选择性插入
     *
     * @param departmentName departmentName
     * @return int
     */
    int insertSelective(String departmentName);

    /**
     * 根据主键删除
     *
     * @param id id
     * @return int
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 绑定部门主管
     *
     * @param id        id
     * @param principal principal
     * @return int
     */
    int bindingDepartmentHead(Integer id, String principal);

    /**
     * 根据主键查询
     *
     * @param id id
     * @return department
     */
    Department selectByPrimaryKey(Integer id);

    /**
     * 更新部门名称
     *
     * @param id             id
     * @param departmentName departmentName
     * @return int
     */
    int updateDepartmentName(Integer id, String departmentName);
}
