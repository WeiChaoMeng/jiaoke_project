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
}
