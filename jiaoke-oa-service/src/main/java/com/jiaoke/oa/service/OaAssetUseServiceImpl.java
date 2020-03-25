package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaAssetUse;
import com.jiaoke.oa.dao.OaAssetUseMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * oa-领用记录
 *
 * @author lihui
 * @version 1.0
 * @date 2019/1/16 11:08
 */
@Service
public class OaAssetUseServiceImpl implements OaAssetUseService {

    @Resource
    private OaAssetUseMapper oaAssetUseMapper;

    @Override
    public List<OaAssetUse> selectAll() {
        return oaAssetUseMapper.selectAll();
    }

    @Override
    public List<OaAssetUse> fuzzyQueryByName(String assetsName) {
        return oaAssetUseMapper.fuzzyQueryByName(assetsName);
    }
}
