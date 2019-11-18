package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActSealsBorrow;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActSealsBorrowMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 印章借用审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:29
 */
@Service
public class OaActSealsBorrowServiceImpl implements OaActSealsBorrowService {

    @Resource
    private OaActSealsBorrowMapper oaActSealsBorrowMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int deleteData(String id) {
        return oaActSealsBorrowMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(OaActSealsBorrow oaActSealsBorrow, Integer userId, String randomId, Integer state) {
        oaActSealsBorrow.setCreateTime(new Date());
        oaActSealsBorrow.setId(randomId);
        oaActSealsBorrow.setPromoter(userId);
        oaActSealsBorrow.setUrl("sealsBorrow");
        if (oaActSealsBorrowMapper.insertSelective(oaActSealsBorrow) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActSealsBorrow.getTitle());
            oaCollaboration.setUrl("sealsBorrow");
            oaCollaboration.setTable("oa_act_seals_borrow");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActSealsBorrow oaActSealsBorrow) {
        oaActSealsBorrow.setCreateTime(new Date());
        if (oaActSealsBorrowMapper.updateByPrimaryKey(oaActSealsBorrow) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActSealsBorrow.getId(), 1, oaActSealsBorrow.getTitle());
            return 1;
        }
    }

    @Override
    public OaActSealsBorrow selectByPrimaryKey(String id) {
        OaActSealsBorrow oaActSealsBorrow = oaActSealsBorrowMapper.selectByPrimaryKey(id);
        oaActSealsBorrow.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActSealsBorrow.getCreateTime()));
        oaActSealsBorrow.setPromoterStr(userInfoMapper.getNicknameById(oaActSealsBorrow.getPromoter()));
        return oaActSealsBorrow;
    }

    @Override
    public int updateByPrimaryKeySelective(OaActSealsBorrow oaActSealsBorrow) {
        return oaActSealsBorrowMapper.updateByPrimaryKeySelective(oaActSealsBorrow);
    }
}
