package com.jiaoke;

import com.jiaoke.controller.SpringHelper;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.dao.PersonnelManageMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

/**
 * @author lihui
 * @version 1.0
 * @date 2018/12/20 14:04
 */
public class qualityTest {

    private UserInfoMapper userInfoMapper;

    @Before
    public void setUp() {
        userInfoMapper = SpringHelper.getBean("userInfoMapper");
    }

    @Test
    public void testUser() {
        List<UserInfo> userInfoList = userInfoMapper.selectMultipleByPermission("materialPrincipal");
        for (UserInfo userInfo : userInfoList) {
            System.out.println(userInfo.getId());
        }
    }
}
