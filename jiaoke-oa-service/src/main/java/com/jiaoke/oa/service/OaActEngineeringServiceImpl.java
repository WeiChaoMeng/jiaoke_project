package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActEngineering;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActEngineeringMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 工程名称变更记录表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 3:29
 */
@Service
public class OaActEngineeringServiceImpl implements OaActEngineeringService {

    @Resource
    private OaActEngineeringMapper oaActEngineeringMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActEngineering oaActEngineering, Integer userId, String randomId, Integer state) {
        oaActEngineering.setId(randomId);
        oaActEngineering.setPromoter(userId);
        oaActEngineering.setUrl("engineering");
        oaActEngineering.setState(0);
        oaActEngineering.setCreateTime(new Date());

        if (oaActEngineeringMapper.insertSelective(oaActEngineering) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActEngineering.getTitle());
            oaCollaboration.setUrl("engineering");
            oaCollaboration.setTable("oa_act_engineering");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("工程名称变更记录");
            oaCollaboration.setDataOne("变更前工程名称：" + oaActEngineering.getBeforeName());
            oaCollaboration.setDataTwo("变更前用料单位：" + oaActEngineering.getBeforeCompany());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActEngineering oaActEngineering) {
        oaActEngineering.setState(0);
        oaActEngineering.setPrincipal("");
        oaActEngineering.setPrincipalDate("");
        oaActEngineering.setSupervisor("");
        oaActEngineering.setSupervisorDate("");
        oaActEngineering.setCreateTime(new Date());
        if (oaActEngineeringMapper.updateByPrimaryKey(oaActEngineering) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public int deleteData(String id) {
        return oaActEngineeringMapper.deleteByPrimaryKey(id);
    }

    @Override
    public OaActEngineering selectByPrimaryKey(String id) {
        OaActEngineering oaActEngineering = oaActEngineeringMapper.selectByPrimaryKey(id);
        oaActEngineering.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActEngineering.getCreateTime()));
        oaActEngineering.setPromoterStr(userInfoMapper.getNicknameById(oaActEngineering.getPromoter()));
        return oaActEngineering;
    }

    @Override
    public int updateByPrimaryKeySelective(OaActEngineering oaActEngineering) {
        return oaActEngineeringMapper.updateByPrimaryKeySelective(oaActEngineering);
    }
}
