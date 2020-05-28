package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaOperateLawsuit;
import com.jiaoke.oa.dao.OaOperateLawsuitMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 经营报价档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaOperateLawsuitServiceImpl implements OaOperateLawsuitService {

    @Resource
    private OaOperateLawsuitMapper oaOperateLawsuitMapper;

    @Override
    public List<OaOperateLawsuit> selectAll() {
        return oaOperateLawsuitMapper.selectAllData();
    }

    @Override
    public List<OaOperateLawsuit> searchFilter(String projectName) {
        return oaOperateLawsuitMapper.searchFilter(projectName);
    }

    @Override
    public int insertSelective(OaOperateLawsuit oaOperateLawsuit) {
        oaOperateLawsuit.setCreateDate(new Date());
        return oaOperateLawsuitMapper.insertSelective(oaOperateLawsuit);
    }

    @Override
    public OaOperateLawsuit selectByPrimaryKey(Integer id) {
        return oaOperateLawsuitMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaOperateLawsuit oaOperateLawsuit) {
        return oaOperateLawsuitMapper.updateByPrimaryKeySelective(oaOperateLawsuit);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaOperateLawsuitMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchDelete(String[] ids) {
        return oaOperateLawsuitMapper.batchDelete(ids);
    }
}
