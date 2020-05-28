package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaMaterialBidding;
import com.jiaoke.oa.dao.OaMaterialBiddingMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 物资管理部-砂石料招投标资料
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaMaterialBiddingServiceImpl implements OaMaterialBiddingService {

    @Resource
    private OaMaterialBiddingMapper oaMaterialBiddingMapper;

    @Override
    public List<OaMaterialBidding> selectAll() {
        return oaMaterialBiddingMapper.selectAllData();
    }

    @Override
    public List<OaMaterialBidding> searchFilter(String file) {
        return oaMaterialBiddingMapper.searchFilter(file);
    }

    @Override
    public int insertSelective(OaMaterialBidding oaMaterialBidding) {
        oaMaterialBidding.setCreateDate(new Date());
        return oaMaterialBiddingMapper.insertSelective(oaMaterialBidding);
    }

    @Override
    public OaMaterialBidding selectByPrimaryKey(Integer id) {
        return oaMaterialBiddingMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaMaterialBidding oaMaterialBidding) {
        return oaMaterialBiddingMapper.updateByPrimaryKeySelective(oaMaterialBidding);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaMaterialBiddingMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchDelete(String[] ids) {
        return oaMaterialBiddingMapper.batchDelete(ids);
    }
}
