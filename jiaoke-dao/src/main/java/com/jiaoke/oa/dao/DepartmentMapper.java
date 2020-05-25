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
     * 绑定部门负责人
     *
     * @param id        id
     * @param principal principal
     * @return int
     */
    int bindingDepartmentPrincipal(@Param("id") Integer id, @Param("principal") String principal);

    /**
     * 绑定部门主管领导
     *
     * @param id        id
     * @param supervisor supervisor
     * @return int
     */
    int bindingDepartmentSupervisor(@Param("id") Integer id, @Param("supervisor") String supervisor);

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

    /**
     * 获取执行人
     *
     * @param column        字段
     * @param departmentKey 部门id
     * @return 用户id
     */
    String selectEnforcer(@Param("column") String column, @Param("departmentKey") String departmentKey);

    /**
     * 根据部门主键查询部门名称
     *
     * @param departmentKey departmentKey
     * @return String
     */
    String selectDepartmentNameByDepartmentKey(String departmentKey);

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
