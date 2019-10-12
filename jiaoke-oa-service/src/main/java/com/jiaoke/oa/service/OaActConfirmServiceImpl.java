package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActConfirm;
import com.jiaoke.oa.bean.OaActReview;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActConfirmMapper;
import com.jiaoke.oa.dao.OaActReviewMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 确认单审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:17
 */
@Service
public class OaActConfirmServiceImpl implements OaActConfirmService {

    @Resource
    private OaActConfirmMapper oaActConfirmMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActConfirm oaActConfirm, Integer userId, String randomId, Integer state) {
        oaActConfirm.setId(randomId);
        oaActConfirm.setCreateTime(new Date());
        oaActConfirm.setPromoter(userId);
        oaActConfirm.setUrl("confirm");
        if (oaActConfirmMapper.insertSelective(oaActConfirm) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActConfirm.getTitle());
            oaCollaboration.setUrl("confirm");
            oaCollaboration.setTable("oa_act_confirm");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActConfirm oaActConfirm) {
        oaActConfirm.setCreateTime(new Date());
        if (oaActConfirmMapper.updateByPrimaryKey(oaActConfirm) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActConfirm.getId(), 1, oaActConfirm.getTitle());
            return 1;
        }
    }

    @Override
    public OaActConfirm selectByPrimaryKey(String id) {
        OaActConfirm oaActConfirm = oaActConfirmMapper.selectByPrimaryKey(id);
        oaActConfirm.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActConfirm.getCreateTime()));
        return oaActConfirm;
    }

    @Override
    public int deleteData(String id) {
        return oaActConfirmMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActConfirm oaActConfirm) {
        return oaActConfirmMapper.updateByPrimaryKeySelective(oaActConfirm);
    }
}
