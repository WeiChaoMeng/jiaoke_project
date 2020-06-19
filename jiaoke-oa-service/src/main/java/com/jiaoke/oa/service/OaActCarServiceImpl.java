package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActCar;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActCarMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 用车审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-4 23:59
 */
@Service
public class OaActCarServiceImpl implements OaActCarService {

    @Resource
    private OaActCarMapper oaActCarMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActCar oaActCar, Integer userId, String randomId, Integer state) {
        oaActCar.setId(randomId);
        oaActCar.setPromoter(userId);
        oaActCar.setUrl("car");
        oaActCar.setState(0);
        oaActCar.setCreateTime(new Date());
        if (oaActCarMapper.insertSelective(oaActCar) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActCar.getTitle());
            oaCollaboration.setUrl("car");
            oaCollaboration.setTable("oa_act_car");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("用车审批");
            oaCollaboration.setDataOne("事由:" + oaActCar.getCause());
            oaCollaboration.setDataTwo("用车时间:" + oaActCar.getStartTime());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActCar oaActCar) {
        oaActCar.setState(0);
        oaActCar.setAfter("");
        oaActCar.setDrivingNumber("");
        oaActCar.setBilling("");
        oaActCar.setLookup("");
        oaActCar.setEndTime("");
        oaActCar.setPrincipal("");
        oaActCar.setPrincipalDate("");
        oaActCar.setCreateTime(new Date());
        if (oaActCarMapper.updateByPrimaryKey(oaActCar) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActCar selectByPrimaryKey(String id) {
        OaActCar oaActCar = oaActCarMapper.selectByPrimaryKey(id);
        oaActCar.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActCar.getCreateTime()));
        oaActCar.setPromoterStr(userInfoMapper.getNicknameById(oaActCar.getPromoter()));
        return oaActCar;
    }

    @Override
    public int deleteData(String id) {
        if (oaActCarMapper.deleteByPrimaryKey(id) < 0) {
            return -1;
        } else {
            if (oaCollaborationMapper.deleteByCorrelationId(id) < 0) {
                return -1;
            } else {
                return 1;
            }
        }
    }

    @Override
    public int updateByPrimaryKeySelective(OaActCar oaActCar) {
        return oaActCarMapper.updateByPrimaryKeySelective(oaActCar);
    }
}
