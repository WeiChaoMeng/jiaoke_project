package com.jiaoke;

import com.jiaoke.controller.SpringHelper;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.dao.OaCollaborationMapper;
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

    private OaCollaborationMapper oaCollaborationMapper;

    @Before
    public void setUp() {
        oaCollaborationMapper = SpringHelper.getBean("oaCollaborationMapper");
    }

    @Test
    public void testUser() {//
        String annex = oaCollaborationMapper.selectAnnex("2019110515543971996543", "oa_act_seals_borrow");
        if (annex.equals("")){
            System.out.println("空的");
        }else if (annex.contains(",")){
            System.out.println("多个");
            String[] strings = annex.split(",");
            for (String string : strings) {
                System.out.println(string);
            }
        }else {
            System.out.println("单个");
            System.out.println(annex);
        }
    }
}
