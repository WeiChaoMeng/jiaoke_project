package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActMaintain;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActMaintainMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 设备维修申请单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 3:10
 */
@Service
public class OaActMaintainServiceImpl implements OaActMaintainService {

    @Resource
    private OaActMaintainMapper oaActMaintainMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActMaintain oaActMaintain, Integer userId, String randomId, Integer state) {
        oaActMaintain.setId(randomId);
        oaActMaintain.setPromoter(userId);
        oaActMaintain.setUrl("maintain");
        oaActMaintain.setState(0);
        oaActMaintain.setCreateTime(new Date());
        if (oaActMaintainMapper.insertSelective(oaActMaintain) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActMaintain.getTitle());
            oaCollaboration.setUrl("maintain");
            oaCollaboration.setTable("oa_act_maintain");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("设备维修申请");
            oaCollaboration.setDataOne("设备名称:" + oaActMaintain.getDeviceName());
            oaCollaboration.setDataTwo("预估金额:" + oaActMaintain.getAmount());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActMaintain oaActMaintain) {
        oaActMaintain.setState(0);
        oaActMaintain.setPrincipal("");
        oaActMaintain.setPrincipalDate("");
        oaActMaintain.setSupervisor("");
        oaActMaintain.setSupervisorDate("");
        oaActMaintain.setCompanyPrincipal("");
        oaActMaintain.setCompanyPrincipalDate("");
        oaActMaintain.setCreateTime(new Date());
        if (oaActMaintainMapper.updateByPrimaryKey(oaActMaintain) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActMaintain selectByPrimaryKey(String id) {
        OaActMaintain oaActMaintain = oaActMaintainMapper.selectByPrimaryKey(id);
        oaActMaintain.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActMaintain.getCreateTime()));
        oaActMaintain.setPromoterStr(userInfoMapper.getNicknameById(oaActMaintain.getPromoter()));
        return oaActMaintain;
    }

    @Override
    public int deleteData(String id) {
        return oaActMaintainMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActMaintain oaActMaintain) {
        return oaActMaintainMapper.updateByPrimaryKeySelective(oaActMaintain);
    }
}
