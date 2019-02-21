package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.Permission;
import com.jiaoke.oa.dao.PermissionMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 权限信息
 *
 * @author lihui
 * @version 1.0
 * @date 2018/10/9 9:41
 */
@Service
public class PermissionServiceImpl implements PermissionService {

    @Resource
    private PermissionMapper permissionMapper;

    @Override
    public List<Permission> selectAll() {
        List<Permission> permissionList = permissionMapper.selectAll();
        for (Permission permission : permissionList) {
            permission.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(permission.getCreateTime()));
        }
        return permissionList;
    }

    @Override
    public List<Permission> selectExistingPermission(Integer id) {
        return permissionMapper.selectExistingPermission(id);
    }

    @Override
    public List<Permission> permissionNameFilter(String permissionName) {
        List<Permission> permissionList = permissionMapper.permissionNameFilter(permissionName);
        for (Permission permission : permissionList) {
            permission.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(permission.getCreateTime()));
        }
        return permissionList;
    }
}
