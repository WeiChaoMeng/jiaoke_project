package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.Department;
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
}
