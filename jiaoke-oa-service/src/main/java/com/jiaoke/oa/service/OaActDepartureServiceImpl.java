package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActDeparture;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActDepartureMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 离职会签表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActDepartureServiceImpl implements OaActDepartureService {

    @Resource
    private OaActDepartureMapper oaActDepartureMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActDeparture oaActDeparture, Integer userId, String randomId, Integer state) {
        oaActDeparture.setId(randomId);
        oaActDeparture.setCreateTime(new Date());
        oaActDeparture.setPromoter(userId);
        oaActDeparture.setUrl("departure");
        if (oaActDepartureMapper.insertSelective(oaActDeparture) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActDeparture.getTitle());
            oaCollaboration.setUrl("departure");
            oaCollaboration.setTable("oa_act_departure");
            oaCollaboration.setName("离职会签");
            oaCollaboration.setDataOne("姓名：" + oaActDeparture.getName());
            oaCollaboration.setDataTwo("离职日期：" + oaActDeparture.getDepartureDate());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActDeparture oaActDeparture) {
        if (oaActDepartureMapper.updateByPrimaryKeySelective(oaActDeparture) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActDeparture.getId(), 1, oaActDeparture.getTitle());
            return 1;
        }
    }

    @Override
    public OaActDeparture selectByPrimaryKey(String id) {
        OaActDeparture oaActDeparture = oaActDepartureMapper.selectByPrimaryKey(id);
        oaActDeparture.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActDeparture.getCreateTime()));
        oaActDeparture.setPromoterStr(userInfoMapper.getNicknameById(oaActDeparture.getPromoter()));
        return oaActDeparture;
    }


    @Override
    public int deleteData(String id) {
        return oaActDepartureMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActDeparture oaActDeparture) {
        return oaActDepartureMapper.updateByPrimaryKeySelective(oaActDeparture);
    }
}
