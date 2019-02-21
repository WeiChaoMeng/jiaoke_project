package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.RoleInfo;
import com.jiaoke.oa.dao.RoleInfoMapper;
import com.jiaoke.oa.dao.RolePermissionMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

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
    public int updateRolePermission(String[] array, Integer roleId, String description) {
        RoleInfo roleInfo = new RoleInfo();
        roleInfo.setId(roleId);
        roleInfo.setDescription(description);

        if (array == null || array.length == 0) {
            if (rolePermissionMapper.delete(roleId) < 0) {
                return -1;
            } else {
                //更新权限信息
                if (roleInfoMapper.updateByPrimaryKeySelective(roleInfo) < 0) {
                    return -1;
                }
                return 0;
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
                    if (roleInfoMapper.updateByPrimaryKeySelective(roleInfo) < 0) {
                        return -1;
                    }
                    return 0;
                }
            }
        }
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

}
