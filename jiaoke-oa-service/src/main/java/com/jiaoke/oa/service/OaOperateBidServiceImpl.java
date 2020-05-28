package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaOperateBid;
import com.jiaoke.oa.dao.OaOperateBidMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 经营开发档案
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaOperateBidServiceImpl implements OaOperateBidService {

    @Resource
    private OaOperateBidMapper oaOperateBidMapper;

    @Override
    public List<OaOperateBid> selectAll() {
        List<OaOperateBid> oaOperateBidList = oaOperateBidMapper.selectAllData();
        for (OaOperateBid oaOperateBid : oaOperateBidList) {
            oaOperateBid.setYearStr(DateUtil.dateConvertYYYY(oaOperateBid.getYear()));
        }
        return oaOperateBidList;
    }

    @Override
    public List<OaOperateBid> searchFilter(String projectName) {
        List<OaOperateBid> oaOperateBidList = oaOperateBidMapper.searchFilter(projectName);
        for (OaOperateBid oaOperateBid : oaOperateBidList) {
            oaOperateBid.setYearStr(DateUtil.dateConvertYYYY(oaOperateBid.getYear()));
        }
        return oaOperateBidList;
    }

    @Override
    public int insertSelective(OaOperateBid oaOperateBid) {
        oaOperateBid.setYear(DateUtil.stringConvertYYYY(oaOperateBid.getYearStr()));
        oaOperateBid.setCreateDate(new Date());
        return oaOperateBidMapper.insertSelective(oaOperateBid);
    }

    @Override
    public OaOperateBid selectByPrimaryKey(Integer id) {
        OaOperateBid oaOperateBid = oaOperateBidMapper.selectByPrimaryKey(id);
        oaOperateBid.setYearStr(DateUtil.dateConvertYYYY(oaOperateBid.getYear()));
        return oaOperateBid;
    }

    @Override
    public int updateByPrimaryKeySelective(OaOperateBid oaOperateBid) {
        return oaOperateBidMapper.updateByPrimaryKeySelective(oaOperateBid);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaOperateBidMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int batchDelete(String[] ids) {
        return oaOperateBidMapper.batchDelete(ids);
    }
}
