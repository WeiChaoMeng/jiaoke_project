package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActCard;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActCardMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
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

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insertCard(OaActCard oaActCard, Integer userId, String randomId, Integer state) {
        oaActCard.setId(randomId);
        oaActCard.setCreateTime(new Date());
        oaActCard.setPromoter(userId);
        oaActCard.setUrl("card");
        if (oaActCardMapper.insertSelective(oaActCard) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActCard.getTitle());
            oaCollaboration.setUrl("card");
            oaCollaboration.setTable("oa_act_card");
            oaCollaboration.setName("饭卡申请");
            oaCollaboration.setDataOne("事由:" + oaActCard.getReason());
            oaCollaboration.setDataTwo("拟使用期限:" + oaActCard.getStartTime() + " ~ " + oaActCard.getEndTime());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActCard oaActCard) {
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
        oaActCard.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActCard.getCreateTime()));
        oaActCard.setPromoterStr(userInfoMapper.getNicknameById(oaActCard.getPromoter()));
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
    public int updateByPrimaryKeySelective(OaActCard oaActCard) {
        return oaActCardMapper.updateByPrimaryKeySelective(oaActCard);
    }
}
