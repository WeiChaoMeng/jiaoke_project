package com.jiaoke;

import com.jiaoke.controller.SpringHelper;
import com.jiaoke.oa.bean.OaActReview;
import com.jiaoke.oa.bean.OaAssetManagement;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.dao.*;
import org.apache.commons.lang3.StringUtils;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * @author lihui
 * @version 1.0
 * @date 2018/12/20 14:04
 */
public class qualityTest {

    private OaActReviewMapper oaActReviewMapper;

    @Before
    public void setUp() {
        oaActReviewMapper = SpringHelper.getBean("oaActReviewMapper");
    }

    @Test
    public void testUser() {
//        ArrayList<String> list = new ArrayList<>();
//        list.add("2020031320210936010192");
//        list.add("2020032503532929552846");
//        List<OaActReview> oaActReviews = oaActReviewMapper.selectAllByIdList(list);
//        for (OaActReview oaActReview : oaActReviews) {
//            System.out.println(oaActReview.getName());
//        }
//
        Integer integer = 000;
        if (integer.equals(0)){
            System.out.println("ok");
        }else {
            System.out.println("no");
        }
    }
}
