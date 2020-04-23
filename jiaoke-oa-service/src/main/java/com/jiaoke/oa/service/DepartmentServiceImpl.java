package com.jiaoke.oa.service;

import com.jiake.utils.RandomUtil;
import com.jiaoke.oa.bean.Department;
import com.jiaoke.oa.dao.DepartmentMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

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

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public List<Department> selectAll() {
        List<Department> departmentList = departmentMapper.selectAllDepartment();
        for (Department department : departmentList) {
            if (department.getPrincipal().contains(",")){
                StringBuilder stringBuilder = new StringBuilder();
                for (String s : department.getPrincipal().split(",")) {
                    stringBuilder.append(userInfoMapper.getNicknameById(Integer.valueOf(s))).append(",");
                }
                department.setPrincipal(stringBuilder.substring(0,stringBuilder.length()-1));
            }else {
                String nickname = userInfoMapper.getNicknameById(Integer.valueOf(department.getPrincipal()));
                department.setPrincipal(nickname);
            }
        }
        return departmentList;
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
    public int bindingDepartmentPrincipal(Integer id,String principal) {
        return departmentMapper.bindingDepartmentPrincipal(id,principal);
    }

    @Override
    public int bindingDepartmentSupervisor(Integer id,String supervisor) {
        return departmentMapper.bindingDepartmentSupervisor(id,supervisor);
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
