package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaProductionContract;
import com.jiaoke.oa.dao.OaProductionContractMapper;
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
public class OaProductionContractServiceImpl implements OaProductionContractService {

    @Resource
    private OaProductionContractMapper oaProductionContractMapper;

    @Override
    public List<OaProductionContract> selectAll() {
        return oaProductionContractMapper.selectAllData();
    }

    @Override
    public List<OaProductionContract> searchFilter(String projectName) {
        return oaProductionContractMapper.searchFilter(projectName);
    }

    @Override
    public int insertSelective(OaProductionContract oaProductionContract) {
        oaProductionContract.setCreateDate(new Date());
        return oaProductionContractMapper.insertSelective(oaProductionContract);
    }

    @Override
    public OaProductionContract selectByPrimaryKey(Integer id) {
        return oaProductionContractMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaProductionContract oaProductionContract) {
        return oaProductionContractMapper.updateByPrimaryKeySelective(oaProductionContract);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaProductionContractMapper.deleteByPrimaryKey(id);
    }
}
