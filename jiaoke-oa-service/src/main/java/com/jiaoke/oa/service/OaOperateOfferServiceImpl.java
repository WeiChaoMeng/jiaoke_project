package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaOperateOffer;
import com.jiaoke.oa.dao.OaOperateOfferMapper;
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
public class OaOperateOfferServiceImpl implements OaOperateOfferService {

    @Resource
    private OaOperateOfferMapper oaOperateOfferMapper;

    @Override
    public List<OaOperateOffer> selectAll() {
        List<OaOperateOffer> oaOperateOfferList = oaOperateOfferMapper.selectAllData();
        for (OaOperateOffer oaOperateOffer : oaOperateOfferList) {
            oaOperateOffer.setQuoteDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateOffer.getQuoteDate()));
        }
        return oaOperateOfferList;
    }

    @Override
    public List<OaOperateOffer> searchFilter(String projectName) {
        List<OaOperateOffer> oaOperateOfferList = oaOperateOfferMapper.searchFilter(projectName);
        for (OaOperateOffer oaOperateOffer : oaOperateOfferList) {
            oaOperateOffer.setQuoteDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateOffer.getQuoteDate()));
        }
        return oaOperateOfferList;
    }

    @Override
    public int insertSelective(OaOperateOffer oaOperateOffer) {
        oaOperateOffer.setQuoteDate(DateUtil.stringConvertYYYYMMDD(oaOperateOffer.getQuoteDateStr()));
        oaOperateOffer.setCreateDate(new Date());
        return oaOperateOfferMapper.insertSelective(oaOperateOffer);
    }

    @Override
    public OaOperateOffer selectByPrimaryKey(Integer id) {
        OaOperateOffer oaOperateOffer = oaOperateOfferMapper.selectByPrimaryKey(id);
        oaOperateOffer.setQuoteDateStr(DateUtil.dateConvertYYYYMMDD(oaOperateOffer.getQuoteDate()));
        return oaOperateOffer;
    }

    @Override
    public int updateByPrimaryKeySelective(OaOperateOffer oaOperateOffer) {
        oaOperateOffer.setQuoteDate(DateUtil.stringConvertYYYYMMDD(oaOperateOffer.getQuoteDateStr()));
        return oaOperateOfferMapper.updateByPrimaryKeySelective(oaOperateOffer);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return oaOperateOfferMapper.deleteByPrimaryKey(id);
    }
}
