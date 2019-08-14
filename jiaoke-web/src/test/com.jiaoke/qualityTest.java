package com.jiaoke;

import com.jiaoke.controller.SpringHelper;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.junit.Before;
import org.junit.Test;

import java.util.List;
import java.util.Map;

/**
 * @author lihui
 * @version 1.0
 * @date 2018/12/20 14:04
 */
public class qualityTest {

    //    private RoleInfoMapper roleInfoMapper;
    private UserInfoMapper userInfoMapper;
//    private DingDingPunchRecordMapper dingDingPunchRecordMapper;

    @Before
    public void setUp() {
        userInfoMapper = SpringHelper.getBean("userInfoMapper");
    }

    @Test
    public void testUser() {
    }
}
