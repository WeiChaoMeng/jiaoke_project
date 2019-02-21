package com.jiaoke;

import com.jiaoke.controller.SpringHelper;
import com.jiaoke.oa.bean.Permission;
import com.jiaoke.oa.bean.RoleInfo;
import com.jiaoke.oa.dao.PermissionMapper;
import com.jiaoke.oa.dao.RoleInfoMapper;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

/**
 * @author lihui
 * @version 1.0
 * @date 2018/12/20 14:04
 */
public class qualityTest {

    private RoleInfoMapper roleInfoMapper;

    @Before
    public void setUp() {
        roleInfoMapper = SpringHelper.getBean("roleInfoMapper");
    }

    @Test
    public void testUser() {
        List<RoleInfo> roleInfoList = roleInfoMapper.roleNameFilter("测试");
        for (RoleInfo roleInfo : roleInfoList) {
            System.out.println(roleInfo.getName());
        }

    }

}
