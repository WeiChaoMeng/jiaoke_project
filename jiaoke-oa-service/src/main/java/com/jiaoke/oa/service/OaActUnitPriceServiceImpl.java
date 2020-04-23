package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.dao.*;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 单价审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:17
 */
@Service
public class OaActUnitPriceServiceImpl implements OaActUnitPriceService {

    @Resource
    private OaActUnitPriceMapper oaActUnitPriceMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private OaUnitPriceMapper oaUnitPriceMapper;

    @Override
    public int insert(OaActUnitPrice oaActUnitPrice, Integer userId, String randomId, Integer state) {

        for (OaUnitPrice oaUnitPrice: oaActUnitPrice.getOaUnitPriceList()) {
            oaUnitPrice.setUnitPriceId(randomId);
        }

        //批量插入
        if (oaUnitPriceMapper.batchInsertData(oaActUnitPrice.getOaUnitPriceList()) < 0) {
            return -1;
        }

        oaActUnitPrice.setId(randomId);
        oaActUnitPrice.setCreateTime(new Date());
        oaActUnitPrice.setPromoter(userId);
        oaActUnitPrice.setUrl("unitPrice");
        oaActUnitPrice.setState(0);
        if (oaActUnitPriceMapper.insertSelective(oaActUnitPrice) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActUnitPrice.getTitle());
            oaCollaboration.setUrl("unitPrice");
            oaCollaboration.setTable("oa_act_unit_price");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("单价审批单");
            oaCollaboration.setDataOne("客户名称:" + oaActUnitPrice.getCustomer());
            oaCollaboration.setDataTwo("工程名称:" + oaActUnitPrice.getEngineering());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActUnitPrice oaActUnitPrice) {
        oaActUnitPrice.setState(0);
        oaActUnitPrice.setBusinessPrincipal("");
        oaActUnitPrice.setBusinessPrincipalDate("");
        oaActUnitPrice.setBusinessSupervisor("");
        oaActUnitPrice.setBusinessSupervisorDate("");
        oaActUnitPrice.setCompanyPrincipal("");
        oaActUnitPrice.setCompanyPrincipalDate("");
        oaActUnitPrice.setCreateTime(new Date());
        if (oaActUnitPriceMapper.updateByPrimaryKey(oaActUnitPrice) < 0) {
            return -1;
        } else {
            //删除详情关联数据
            oaUnitPriceMapper.deleteByUnitPriceId(oaActUnitPrice.getId());
            for (OaUnitPrice oaUnitPrice : oaActUnitPrice.getOaUnitPriceList()) {
                oaUnitPrice.setUnitPriceId(oaActUnitPrice.getId());
            }
            oaUnitPriceMapper.batchInsertData(oaActUnitPrice.getOaUnitPriceList());
            oaCollaborationMapper.updateStateByCorrelationId(oaActUnitPrice.getId(), 1, oaActUnitPrice.getTitle());
            return 1;
        }
    }

    @Override
    public OaActUnitPrice selectByPrimaryKey(String id) {
        OaActUnitPrice oaActUnitPrice = oaActUnitPriceMapper.selectByPrimaryKey(id);
        List<OaUnitPrice> oaUnitPriceList = oaUnitPriceMapper.selectByUnitPriceId(id);
        oaActUnitPrice.setOaUnitPriceList(oaUnitPriceList);
        oaActUnitPrice.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActUnitPrice.getCreateTime()));
        oaActUnitPrice.setPromoterStr(userInfoMapper.getNicknameById(oaActUnitPrice.getPromoter()));
        return oaActUnitPrice;
    }

    @Override
    public int deleteData(String id) {
        //删除详情关联数据
        oaUnitPriceMapper.deleteByUnitPriceId(id);
        return oaActUnitPriceMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActUnitPrice oaActUnitPrice) {
        return oaActUnitPriceMapper.updateByPrimaryKeySelective(oaActUnitPrice);
    }
}
