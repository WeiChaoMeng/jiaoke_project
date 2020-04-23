package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActLeave;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActLeaveMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 请假审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActLeaveServiceImpl implements OaActLeaveService {

    @Resource
    private OaActLeaveMapper oaActLeaveMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActLeave oaActLeave, Integer userId, String randomId, Integer state) {
        oaActLeave.setId(randomId);
        oaActLeave.setCreateTime(new Date());
        oaActLeave.setPromoter(userId);
        oaActLeave.setUrl("leave");
        oaActLeave.setState(0);
        if (oaActLeaveMapper.insertSelective(oaActLeave) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActLeave.getTitle());
            oaCollaboration.setUrl("leave");
            oaCollaboration.setTable("oa_act_leave");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("请假审请");
            oaCollaboration.setDataOne("申请时间:" + oaActLeave.getApplyDate());
            oaCollaboration.setDataTwo("事由:" + oaActLeave.getReason());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActLeave oaActLeave) {
        oaActLeave.setState(0);
        oaActLeave.setPrincipal("");
        oaActLeave.setPrincipalDate("");
        oaActLeave.setPrincipalContent("");
        oaActLeave.setSupervisor("");
        oaActLeave.setSupervisorDate("");
        oaActLeave.setSupervisorContent("");
        if (oaActLeaveMapper.updateByPrimaryKeySelective(oaActLeave) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActLeave selectByPrimaryKey(String id) {
        OaActLeave oaActLeave = oaActLeaveMapper.selectByPrimaryKey(id);
        oaActLeave.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActLeave.getCreateTime()));
        oaActLeave.setPromoterStr(userInfoMapper.getNicknameById(oaActLeave.getPromoter()));
        return oaActLeave;
    }


    @Override
    public int deleteData(String id) {
        return oaActLeaveMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActLeave oaActLeave) {
        return oaActLeaveMapper.updateByPrimaryKeySelective(oaActLeave);
    }
}
