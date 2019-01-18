package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaAssetManagement;
import com.jiaoke.oa.dao.OaAssetsManagementMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * oa-资产管理
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Service
public class OaAssetsManagementServiceImpl implements OaAssetsManagementService {

    @Resource
    private OaAssetsManagementMapper oaAssetsManagementMapper;

    @Override
    public int insertSelective(OaAssetManagement oaAssetManagement) {
        oaAssetManagement.setCreateDate(new Date());
        return oaAssetsManagementMapper.insertSelective(oaAssetManagement);
    }

    @Override
    public List<OaAssetManagement> selectAll() {
        return oaAssetsManagementMapper.selectAll();
    }

    @Override
    public List<OaAssetManagement> selectByName(String assetsName) {
        OaAssetManagement oaAssetManagement = new OaAssetManagement();
        oaAssetManagement.setAssetsName(assetsName);
        return oaAssetsManagementMapper.select(oaAssetManagement);
    }

    @Override
    public OaAssetManagement selectByPrimaryKey(Integer id) {
        return oaAssetsManagementMapper.selectByPrimaryKey(id);
    }
}
