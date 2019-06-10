package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActAcceptance;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActAcceptanceMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 验收单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 3:18
 */
@Service
public class OaActAcceptanceServiceImpl implements OaActAcceptanceService {

    @Resource
    private OaActAcceptanceMapper oaActAcceptanceMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Override
    public int insert(OaActAcceptance oaActAcceptance, Integer userId, String randomId) {
        oaActAcceptance.setAcceptanceDate(DateUtil.stringConvertYYYYMMDD(oaActAcceptance.getAcceptanceDateStr()));
        oaActAcceptance.setId(randomId);
        oaActAcceptance.setPromoter(userId);
        oaActAcceptance.setUrl("acceptance");
        oaActAcceptance.setCreateTime(new Date());
        if (oaActAcceptanceMapper.insertData(oaActAcceptance) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaActAcceptance.setPromoter(userId);
            oaCollaboration.setTitle(oaActAcceptance.getTitle());
            oaCollaboration.setUrl("acceptance");
            oaCollaboration.setTable("oa_act_acceptance");
            oaCollaboration.setState(0);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int savePending(OaActAcceptance oaActAcceptance, Integer userId, String randomId) {
        oaActAcceptance.setAcceptanceDate(DateUtil.stringConvertYYYYMMDD(oaActAcceptance.getAcceptanceDateStr()));
        oaActAcceptance.setId(randomId);
        oaActAcceptance.setPromoter(userId);
        oaActAcceptance.setUrl("acceptance");
        oaActAcceptance.setCreateTime(new Date());
        if (oaActAcceptanceMapper.insertData(oaActAcceptance) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActAcceptance.getTitle());
            oaCollaboration.setUrl("acceptance");
            oaCollaboration.setTable("oa_act_acceptance");
            oaCollaboration.setState(1);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public OaActAcceptance selectByPrimaryKey(String id) {
        OaActAcceptance oaActAcceptance = oaActAcceptanceMapper.selectByPrimaryKey(id);
        oaActAcceptance.setAcceptanceDateStr(DateUtil.dateConvertYYYYMMDD(oaActAcceptance.getAcceptanceDate()));
        oaActAcceptance.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActAcceptance.getCreateTime()));
        return oaActAcceptance;
    }

    @Override
    public int edit(OaActAcceptance oaActAcceptance) {
        oaActAcceptance.setAcceptanceDate(DateUtil.stringConvertYYYYMMDD(oaActAcceptance.getAcceptanceDateStr()));
        oaActAcceptance.setCreateTime(new Date());
        if (oaActAcceptanceMapper.updateByPrimaryKey(oaActAcceptance) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActAcceptance.getId(), 1, oaActAcceptance.getTitle());
            return 1;
        }
    }

    @Override
    public int deleteData(String id) {
        return oaActAcceptanceMapper.deleteByPrimaryKey(id);
    }
}
