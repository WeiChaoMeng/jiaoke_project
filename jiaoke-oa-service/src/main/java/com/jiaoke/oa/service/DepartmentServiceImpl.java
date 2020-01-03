package com.jiaoke.oa.service;

import com.jiake.utils.RandomUtil;
import com.jiaoke.oa.bean.Department;
import com.jiaoke.oa.dao.DepartmentMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * 部门
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Resource
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> selectAll() {
        return departmentMapper.selectAllDepartment();
    }

    @Override
    public List<Department> selectKeyAndName() {
        return departmentMapper.selectKeyAndName();
    }

    @Override
    public List<Department> departmentNameFilter(String departmentName) {
        return departmentMapper.departmentNameFilter(departmentName);
    }

    @Override
    public Department checkDepartmentName(String departmentName) {
        return departmentMapper.checkDepartmentName(departmentName);
    }

    @Override
    public int insertSelective(String departmentName) {
        Department department = new Department();
        department.setDepartmentName(departmentName);
        department.setDepartmentKey(RandomUtil.random().toString());
        department.setCreateTime(new Date());
        return departmentMapper.insertSelective(department);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return departmentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int bindingDepartmentHead(Integer id,String principal) {
        return departmentMapper.bindingDepartmentHead(id,principal);
    }

    @Override
    public Department selectByPrimaryKey(Integer id) {
        return departmentMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateDepartmentName(Integer id, String departmentName) {
        return departmentMapper.updateDepartmentName(id ,departmentName);
    }

    @Override
    public String selectEnforcerId(String column, String departmentKey) {
        return departmentMapper.selectEnforcer(column, departmentKey);
    }

    @Override
    public List<Department> selectPrincipalAndSupervisor() {
        return departmentMapper.selectPrincipalAndSupervisor();
    }
}
