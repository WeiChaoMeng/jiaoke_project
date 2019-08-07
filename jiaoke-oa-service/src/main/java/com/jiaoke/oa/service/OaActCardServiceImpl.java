package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActCard;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActCardMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 饭卡审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 0:32
 */
@Service
public class OaActCardServiceImpl implements OaActCardService {

    @Resource
    private OaActCardMapper oaActCardMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Override
    public int savePendingCard(OaActCard oaActCard, Integer userId, String randomId) {
        oaActCard.setApplyTime(DateUtil.stringConvertYYYYMMDD(oaActCard.getApplyTimeStr()));
        oaActCard.setStartTime(DateUtil.stringConvertYYYYMMDD(oaActCard.getStartTimeStr()));
        oaActCard.setEndTime(DateUtil.stringConvertYYYYMMDD(oaActCard.getEndTimeStr()));
        oaActCard.setId(randomId);
        oaActCard.setPromoter(userId);
        oaActCard.setUrl("card");
        oaActCard.setState(1);
        oaActCard.setCreateTime(new Date());
        if (oaActCardMapper.insertData(oaActCard) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActCard.getTitle());
            oaCollaboration.setUrl("card");
            oaCollaboration.setTable("oa_act_card");
            oaCollaboration.setState(1);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int insertCard(OaActCard oaActCard, Integer userId, String randomId) {
        oaActCard.setId(randomId);
        oaActCard.setApplyTime(DateUtil.stringConvertYYYYMMDD(oaActCard.getApplyTimeStr()));
        oaActCard.setStartTime(DateUtil.stringConvertYYYYMMDD(oaActCard.getStartTimeStr()));
        oaActCard.setEndTime(DateUtil.stringConvertYYYYMMDD(oaActCard.getEndTimeStr()));
        oaActCard.setCreateTime(new Date());
        oaActCard.setPromoter(userId);
        oaActCard.setUrl("card");
        if (oaActCardMapper.insertData(oaActCard) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActCard.getTitle());
            oaCollaboration.setUrl("card");
            oaCollaboration.setTable("oa_act_card");
            oaCollaboration.setState(0);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActCard oaActCard) {
        oaActCard.setApplyTime(DateUtil.stringConvertYYYYMMDD(oaActCard.getApplyTimeStr()));
        oaActCard.setStartTime(DateUtil.stringConvertYYYYMMDD(oaActCard.getStartTimeStr()));
        oaActCard.setEndTime(DateUtil.stringConvertYYYYMMDD(oaActCard.getEndTimeStr()));
        oaActCard.setCreateTime(new Date());

        if (oaActCardMapper.updateByPrimaryKey(oaActCard) < 1) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActCard.getId(), 1, oaActCard.getTitle());
            return 1;
        }
    }

    @Override
    public OaActCard selectByPrimaryKey(String id) {
        OaActCard oaActCard = oaActCardMapper.selectByPrimaryKey(id);
        oaActCard.setApplyTimeStr(DateUtil.dateConvertYYYYMMDD(oaActCard.getApplyTime()));
        oaActCard.setStartTimeStr(DateUtil.dateConvertYYYYMMDD(oaActCard.getStartTime()));
        oaActCard.setEndTimeStr(DateUtil.dateConvertYYYYMMDD(oaActCard.getEndTime()));
        oaActCard.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActCard.getCreateTime()));
        return oaActCard;
    }

    @Override
    public int delete(String id) {
        if (oaActCardMapper.deleteByPrimaryKey(id) < 0) {
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
    public int updateStateById(String id, Integer state) {
        if (oaActCardMapper.updateStateById(id, state) < 0) {
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