package com.jiaoke;

import com.jiaoke.controller.SpringHelper;
import com.jiaoke.oa.bean.OaAssetManagement;
import com.jiaoke.oa.bean.OaReleaseDocument;
import com.jiaoke.oa.dao.OaAssetsManagementMapper;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

/**
 * @author lihui
 * @version 1.0
 * @date 2018/12/20 14:04
 */
public class qualityTest {

    private OaAssetsManagementMapper oaAssetsManagementMapper;

    @Before
    public void setUp() {
        oaAssetsManagementMapper = SpringHelper.getBean("oaAssetsManagementMapper");
    }

    @Test
    public void testUser() {
        OaAssetManagement assetManagement = new OaAssetManagement();
        assetManagement.setId(1);
        OaAssetManagement oaAssetManagement = oaAssetsManagementMapper.selectByPrimaryKey(1);
        System.out.println(oaAssetManagement);
    }

}
