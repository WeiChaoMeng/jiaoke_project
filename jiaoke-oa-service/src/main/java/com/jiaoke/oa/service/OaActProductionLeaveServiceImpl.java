package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActProductionLeave;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActProductionLeaveMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 生产假审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActProductionLeaveServiceImpl implements OaActProductionLeaveService {

    @Resource
    private OaActProductionLeaveMapper oaActProductionLeaveMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActProductionLeave oaActProductionLeave, Integer userId, String randomId, Integer state) {
        oaActProductionLeave.setId(randomId);
        oaActProductionLeave.setCreateTime(new Date());
        oaActProductionLeave.setPromoter(userId);
        oaActProductionLeave.setUrl("productionLeave");
        oaActProductionLeave.setState(0);
        if (oaActProductionLeaveMapper.insertSelective(oaActProductionLeave) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActProductionLeave.getTitle());
            oaCollaboration.setUrl("productionLeave");
            oaCollaboration.setTable("oa_act_production_leave");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("生产假审批");
            oaCollaboration.setDataOne("生育假天数" + oaActProductionLeave.getMaternityLeave());
            oaCollaboration.setDataTwo("申请休假时间" + oaActProductionLeave.getApplyDate());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActProductionLeave oaActProductionLeave) {
        oaActProductionLeave.setState(0);
        oaActProductionLeave.setPersonnel("");
        oaActProductionLeave.setPersonnelDate("");
        oaActProductionLeave.setSupervisor("");
        oaActProductionLeave.setSupervisorDate("");
        oaActProductionLeave.setCompanyPrincipal("");
        oaActProductionLeave.setCompanyPrincipalDate("");
        oaActProductionLeave.setCreateTime(new Date());
        if (oaActProductionLeaveMapper.updateByPrimaryKeySelective(oaActProductionLeave) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActProductionLeave selectByPrimaryKey(String id) {
        OaActProductionLeave oaActProductionLeave = oaActProductionLeaveMapper.selectByPrimaryKey(id);
        oaActProductionLeave.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActProductionLeave.getCreateTime()));
        oaActProductionLeave.setPromoterStr(userInfoMapper.getNicknameById(oaActProductionLeave.getPromoter()));
        return oaActProductionLeave;
    }


    @Override
    public int deleteData(String id) {
        return oaActProductionLeaveMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActProductionLeave oaActProductionLeave) {
        return oaActProductionLeaveMapper.updateByPrimaryKeySelective(oaActProductionLeave);
    }
}
