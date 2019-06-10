package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActCar;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActCarMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
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

    @Override
    public int savePending(OaActCar oaActCar, Integer userId, String randomId) {
        oaActCar.setStartTime(DateUtil.stringConvertYYYYMMDDHHMM(oaActCar.getStartTimeStr()));
        oaActCar.setEndTime(DateUtil.stringConvertYYYYMMDDHHMM(oaActCar.getEndTimeStr()));
        oaActCar.setId(randomId);
        oaActCar.setPromoter(userId);
        oaActCar.setUrl("car");
        oaActCar.setState(1);
        oaActCar.setCreateTime(new Date());
        if (oaActCarMapper.insertData(oaActCar) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActCar.getTitle());
            oaCollaboration.setUrl("car");
            oaCollaboration.setTable("oa_act_car");
            oaCollaboration.setState(1);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int insert(OaActCar oaActCar, Integer userId, String randomId) {
        oaActCar.setStartTime(DateUtil.stringConvertYYYYMMDDHHMM(oaActCar.getStartTimeStr()));
        oaActCar.setEndTime(DateUtil.stringConvertYYYYMMDDHHMM(oaActCar.getEndTimeStr()));
        oaActCar.setId(randomId);
        oaActCar.setPromoter(userId);
        oaActCar.setUrl("car");
        oaActCar.setState(0);
        oaActCar.setCreateTime(new Date());
        if (oaActCarMapper.insertData(oaActCar) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActCar.getTitle());
            oaCollaboration.setUrl("car");
            oaCollaboration.setTable("oa_act_car");
            oaCollaboration.setState(0);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActCar oaActCar) {
        oaActCar.setStartTime(DateUtil.stringConvertYYYYMMDDHHMM(oaActCar.getStartTimeStr()));
        oaActCar.setEndTime(DateUtil.stringConvertYYYYMMDDHHMM(oaActCar.getEndTimeStr()));
        oaActCar.setCreateTime(new Date());
        if (oaActCarMapper.updateByPrimaryKey(oaActCar) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActCar.getId(), 1, oaActCar.getTitle());
            return 1;
        }
    }

    @Override
    public OaActCar selectByPrimaryKey(String id) {
        OaActCar oaActCar = oaActCarMapper.selectByPrimaryKey(id);
        oaActCar.setStartTimeStr(DateUtil.dateConvertYYYYMMDDHHMM(oaActCar.getStartTime()));
        oaActCar.setEndTimeStr(DateUtil.dateConvertYYYYMMDDHHMM(oaActCar.getEndTime()));
        oaActCar.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActCar.getCreateTime()));
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
    public int updateState(String id, Integer state) {
        if (oaActCarMapper.updateStateById(id, state) < 0) {
            return -1;
        } else {
            if (oaCollaborationMapper.updateState(id, state) < 0) {
                return -1;
            } else {
                return 1;
            }
        }
    }
}
