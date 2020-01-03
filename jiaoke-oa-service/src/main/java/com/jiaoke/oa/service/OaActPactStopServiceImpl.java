package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActPactStop;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActPactStopMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 劳务协议终止通知书
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActPactStopServiceImpl implements OaActPactStopService {

    @Resource
    private OaActPactStopMapper oaActPactStopMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActPactStop oaActPactStop, Integer userId, String randomId, Integer state) {
        String notifier = userInfoMapper.getNicknameById(oaActPactStop.getPromoter());
        oaActPactStop.setId(randomId);
        oaActPactStop.setCreateTime(new Date());
        oaActPactStop.setPromoter(userId);
        oaActPactStop.setUrl("pactStop");
        if (oaActPactStopMapper.insertSelective(oaActPactStop) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActPactStop.getTitle());
            oaCollaboration.setUrl("pactStop");
            oaCollaboration.setTable("oa_act_pact_stop");
            oaCollaboration.setName("劳务协议终止通知书");
            oaCollaboration.setDataOne("合同剩余天数：" + oaActPactStop.getNumber());
            oaCollaboration.setDataTwo("通知人：" + notifier);
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActPactStop oaActPactStop) {
        if (oaActPactStopMapper.updateByPrimaryKeySelective(oaActPactStop) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActPactStop.getId(), 1, oaActPactStop.getTitle());
            return 1;
        }
    }

    @Override
    public OaActPactStop selectByPrimaryKey(String id) {
        OaActPactStop oaActPactStop = oaActPactStopMapper.selectByPrimaryKey(id);
        oaActPactStop.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActPactStop.getCreateTime()));
        oaActPactStop.setPromoterStr(userInfoMapper.getNicknameById(oaActPactStop.getPromoter()));
        oaActPactStop.setNotifiedPersonStr(userInfoMapper.getNicknameById(oaActPactStop.getNotifiedPerson()));
        return oaActPactStop;
    }


    @Override
    public int deleteData(String id) {
        return oaActPactStopMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActPactStop oaActPactStop) {
        return oaActPactStopMapper.updateByPrimaryKeySelective(oaActPactStop);
    }
}
