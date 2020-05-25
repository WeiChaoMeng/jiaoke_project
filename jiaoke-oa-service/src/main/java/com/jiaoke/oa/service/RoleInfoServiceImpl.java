package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.Permission;
import com.jiaoke.oa.bean.RoleInfo;
import com.jiaoke.oa.dao.PermissionMapper;
import com.jiaoke.oa.dao.RoleInfoMapper;
import com.jiaoke.oa.dao.RolePermissionMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 权限信息
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
@Service
public class RoleInfoServiceImpl implements RoleInfoService {

    @Resource
    private RoleInfoMapper roleInfoMapper;

    @Resource
    private RolePermissionMapper rolePermissionMapper;

    @Resource
    private PermissionMapper permissionMapper;

    @Override
    public List<RoleInfo> selectAll() {
        List<RoleInfo> roleInfoList = roleInfoMapper.selectAll();
        for (RoleInfo roleInfo : roleInfoList) {
            roleInfo.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(roleInfo.getCreateTime()));
        }
        return roleInfoList;
    }

    @Override
    public RoleInfo selectByPrimaryKey(Integer id) {
        return roleInfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateRolePermission(Integer roleId, String[] array) {
        if (array == null || array.length == 0) {
            if (rolePermissionMapper.delete(roleId) < 0) {
                return -1;
            } else {
                return 2;
            }
        } else {
            //删除现有权限
            if (rolePermissionMapper.delete(roleId) < 0) {
                return -1;
            } else {
                //添加所选权限
                if (rolePermissionMapper.insert(roleId, array) < 0) {
                    return -1;
                } else {
                    return 2;
                }
            }
        }
    }

    @Override
    public int updateRole(Integer roleId, String description) {
        RoleInfo roleInfo = new RoleInfo();
        roleInfo.setId(roleId);
        roleInfo.setDescription(description);
        if (roleInfoMapper.updateByPrimaryKeySelective(roleInfo) < 0) {
            return -1;
        }
        return 0;
    }

    @Override
    public int insertSelective(RoleInfo roleInfo) {
        roleInfo.setCreateTime(new Date());
        return roleInfoMapper.insertSelective(roleInfo);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return roleInfoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public RoleInfo checkRoleName(String name) {
        return roleInfoMapper.checkRoleName(name);
    }

    @Override
    public List<RoleInfo> roleNameFilter(String name) {
        List<RoleInfo> roleInfoList = roleInfoMapper.roleNameFilter(name);
        for (RoleInfo roleInfo : roleInfoList) {
            roleInfo.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(roleInfo.getCreateTime()));
        }
        return roleInfoList;
    }

    @Override
    public List<RoleInfo> selectExistingRoleInfo(Integer id) {
        return roleInfoMapper.selectExistingRoleInfo(id);
    }

    @Override
    public List<Permission> bindingInfo(Integer id) {
        List<Permission> permissionList = permissionMapper.selectAll();
        //已绑定角色
        List<Permission> existingPermission = permissionMapper.selectExistingPermission(id);

        for (Permission per : permissionList) {

            for (Permission permission : existingPermission) {
                if (permission.getId().equals(per.getId())){
                    per.setLAY_CHECKED("true");
                }
            }
        }
        return permissionList;
    }

    @Override
    public int batchDeleteRole(String[] ids) {
        return roleInfoMapper.batchDeleteRole(ids);
    }
}
