package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActLaborContractStop;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActLaborContractStopMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 劳动合同终止通知书
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActLaborContractStopServiceImpl implements OaActLaborContractStopService {

    @Resource
    private OaActLaborContractStopMapper oaActLaborContractStopMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActLaborContractStop oaActLaborContractStop, Integer userId, String randomId, Integer state) {
        String notifier = userInfoMapper.getNicknameById(oaActLaborContractStop.getPromoter());
        oaActLaborContractStop.setId(randomId);
        oaActLaborContractStop.setCreateTime(new Date());
        oaActLaborContractStop.setPromoter(userId);
        oaActLaborContractStop.setUrl("laborContractStop");
        if (oaActLaborContractStopMapper.insertSelective(oaActLaborContractStop) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActLaborContractStop.getTitle());
            oaCollaboration.setUrl("laborContractStop");
            oaCollaboration.setTable("oa_act_labor_contract_stop");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("劳动合同终止通知书");
            oaCollaboration.setDataOne("合同剩余天数：" + oaActLaborContractStop.getNumber());
            oaCollaboration.setDataTwo("通知人：" + notifier);
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActLaborContractStop oaActLaborContractStop) {
        if (oaActLaborContractStopMapper.updateByPrimaryKeySelective(oaActLaborContractStop) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActLaborContractStop.getId(), 1, oaActLaborContractStop.getTitle());
            return 1;
        }
    }

    @Override
    public OaActLaborContractStop selectByPrimaryKey(String id) {
        OaActLaborContractStop oaActLaborContractStop = oaActLaborContractStopMapper.selectByPrimaryKey(id);
        oaActLaborContractStop.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActLaborContractStop.getCreateTime()));
        oaActLaborContractStop.setPromoterStr(userInfoMapper.getNicknameById(oaActLaborContractStop.getPromoter()));
        oaActLaborContractStop.setNotifiedPersonStr(userInfoMapper.getNicknameById(oaActLaborContractStop.getNotifiedPerson()));
        return oaActLaborContractStop;
    }


    @Override
    public int deleteData(String id) {
        return oaActLaborContractStopMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActLaborContractStop oaActLaborContractStop) {
        return oaActLaborContractStopMapper.updateByPrimaryKeySelective(oaActLaborContractStop);
    }
}
