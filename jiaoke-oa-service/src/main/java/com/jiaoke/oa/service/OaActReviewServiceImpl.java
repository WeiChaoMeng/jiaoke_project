package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActReview;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActReviewMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 合同审查表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:17
 */
@Service
public class OaActReviewServiceImpl implements OaActReviewService {

    @Resource
    private OaActReviewMapper oaActReviewMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActReview oaActReview, Integer userId, String randomId, Integer state) {
        oaActReview.setId(randomId);
        oaActReview.setCreateTime(new Date());
        oaActReview.setPromoter(userId);
        oaActReview.setUrl("review");
        if (oaActReviewMapper.insertSelective(oaActReview) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActReview.getTitle());
            oaCollaboration.setUrl("review");
            oaCollaboration.setTable("oa_act_review");
            oaCollaboration.setName("合同审查申请");
            oaCollaboration.setDataOne("合同名称:" + oaActReview.getName());
            oaCollaboration.setDataTwo("合同金额:" + oaActReview.getAmount());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActReview oaActReview) {
        oaActReview.setCreateTime(new Date());
        if (oaActReviewMapper.updateByPrimaryKey(oaActReview) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActReview.getId(), 1, oaActReview.getTitle());
            return 1;
        }
    }

    @Override
    public OaActReview selectByPrimaryKey(String id) {
        OaActReview oaActReview = oaActReviewMapper.selectByPrimaryKey(id);
        oaActReview.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActReview.getCreateTime()));
        oaActReview.setPromoterStr(userInfoMapper.getNicknameById(oaActReview.getPromoter()));
        return oaActReview;
    }

    @Override
    public int deleteData(String id) {
        return oaActReviewMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActReview oaActReview) {
        return oaActReviewMapper.updateByPrimaryKeySelective(oaActReview);
    }

    @Override
    public List<OaActReview> selectAllByIdList(List<String> idList) {
        List<OaActReview> oaActReviewList = oaActReviewMapper.selectAllByIdList(idList);
        for (OaActReview oaActReview : oaActReviewList) {
            oaActReview.setPromoterStr(userInfoMapper.getNicknameById(oaActReview.getPromoter()));
        }
        return oaActReviewList;
    }
}
