package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActAcceptance;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActAcceptanceMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
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

    @Resource
    private UserInfoMapper userInfoMapper;


    @Override
    public int insert(OaActAcceptance oaActAcceptance, Integer userId, String randomId, Integer state) {
        oaActAcceptance.setId(randomId);
        oaActAcceptance.setPromoter(userId);
        oaActAcceptance.setUrl("acceptance");
        oaActAcceptance.setState(0);
        oaActAcceptance.setCreateTime(new Date());
        if (oaActAcceptanceMapper.insertSelective(oaActAcceptance) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActAcceptance.getTitle());
            oaCollaboration.setUrl("acceptance");
            oaCollaboration.setTable("oa_act_acceptance");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("设备维修验收申请");
            oaCollaboration.setDataOne("维修厂家:" + oaActAcceptance.getFactory());
            oaCollaboration.setDataTwo("总计:" + oaActAcceptance.getAmount());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public OaActAcceptance selectByPrimaryKey(String id) {
        OaActAcceptance oaActAcceptance = oaActAcceptanceMapper.selectByPrimaryKey(id);
        oaActAcceptance.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActAcceptance.getCreateTime()));
        oaActAcceptance.setPromoterStr(userInfoMapper.getNicknameById(oaActAcceptance.getPromoter()));
        return oaActAcceptance;
    }

    @Override
    public int edit(OaActAcceptance oaActAcceptance) {
        oaActAcceptance.setState(0);
        oaActAcceptance.setAccepter("");
        oaActAcceptance.setAcceptanceDate("");
        oaActAcceptance.setPrincipal("");
        oaActAcceptance.setPrincipalDate("");
        oaActAcceptance.setSupervisor("");
        oaActAcceptance.setSupervisorDate("");
        oaActAcceptance.setCompanyPrincipal("");
        oaActAcceptance.setCompanyPrincipalDate("");
        oaActAcceptance.setCreateTime(new Date());
        if (oaActAcceptanceMapper.updateByPrimaryKey(oaActAcceptance) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public int deleteData(String id) {
        return oaActAcceptanceMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActAcceptance oaActAcceptance) {
        return oaActAcceptanceMapper.updateByPrimaryKeySelective(oaActAcceptance);
    }
}
