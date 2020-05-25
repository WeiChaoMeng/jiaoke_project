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
     * 绑定部门负责人
     *
     * @param id        id
     * @param principal principal
     * @return int
     */
    int bindingDepartmentPrincipal(Integer id, String principal);

    /**
     * 绑定部门主管领导
     *
     * @param id         id
     * @param supervisor supervisor
     * @return int
     */
    int bindingDepartmentSupervisor(Integer id, String supervisor);

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

    /**
     * 查询执行者id
     *
     * @param column        column
     * @param departmentKey departmentKey
     * @return string
     */
    String selectEnforcerId(String column, String departmentKey);

    /**
     * 查询部门负责人和主管领导（五部一室）
     *
     * @return list
     */
    List<Department> selectPrincipalAndSupervisor();

    /**
     * 批量删除数据
     *
     * @param ids ids
     * @return int
     */
    int batchDeleteDepartment(String[] ids);
}
