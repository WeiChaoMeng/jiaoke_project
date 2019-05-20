package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaOperateDevelop;
import com.jiaoke.oa.dao.OaOperateDevelopMapper;
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
public class OaOperateDevelopServiceImpl implements OaOperateDevelopService {

    @Resource
    private OaOperateDevelopMapper oaOperateDevelopMapper;

    @Override
    public List<OaOperateDevelop> selectAll() {
        List<OaOperateDevelop> oaOperateDevelopList = oaOperateDevelopMapper.selectAllData();
        for (OaOperateDevelop oaOperateDevelop : oaOperateDevelopList) {
            oaOperateDevelop.setSettlementDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateDevelop.getSettlementDate()));
            oaOperateDevelop.setSigningDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateDevelop.getSigningDate()));
        }
        return oaOperateDevelopList;
    }

    @Override
    public List<OaOperateDevelop> searchFilter(String purchaser) {
        List<OaOperateDevelop> oaOperateDevelopList = oaOperateDevelopMapper.searchFilter(purchaser);
        for (OaOperateDevelop oaOperateDevelop : oaOperateDevelopList) {
            oaOperateDevelop.setSettlementDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateDevelop.getSettlementDate()));
            oaOperateDevelop.setSigningDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateDevelop.getSigningDate()));
        }
        return oaOperateDevelopList;
    }

    @Override
    public int insertSelective(OaOperateDevelop oaOperateDevelop) {
        oaOperateDevelop.setSigningDate(DateUtil.stringConvertYYYYMMDD(oaOperateDevelop.getSigningDateStr()));
        oaOperateDevelop.setSettlementDate(DateUtil.stringConvertYYYYMMDD(oaOperateDevelop.getSettlementDateStr()));
        oaOperateDevelop.setCreateDate(new Date());
        return oaOperateDevelopMapper.insertSelective(oaOperateDevelop);
    }

    @Override
    public OaOperateDevelop selectByPrimaryKey(Integer id) {
        OaOperateDevelop oaOperateDevelop = oaOperateDevelopMapper.selectByPrimaryKey(id);
        oaOperateDevelop.setSettlementDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateDevelop.getSettlementDate()));
        oaOperateDevelop.setSigningDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateDevelop.getSigningDate()));
        return oaOperateDevelop;
    }

    @Override
    public int updateByPrimaryKeySelective(OaOperateDevelop oaOperateDevelop) {
        oaOperateDevelop.setSigningDate(DateUtil.stringConvertYYYYMMDD(oaOperateDevelop.getSigningDateStr()));
        oaOperateDevelop.setSettlementDate(DateUtil.stringConvertYYYYMMDD(oaOperateDevelop.getSettlementDateStr()));
        return oaOperateDevelopMapper.updateByPrimaryKeySelective(oaOperateDevelop);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaOperateDevelopMapper.deleteByPrimaryKey(id);
    }
}
