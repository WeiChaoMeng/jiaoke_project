package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActRead;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.dao.*;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 收文阅办审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 3:36
 */
@Service
public class OaActReadServiceImpl implements OaActReadService {

    @Resource
    private OaActReadMapper oaActReadMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActRead oaActRead, Integer userId, String randomId, Integer state) {
        oaActRead.setId(randomId);
        oaActRead.setCreateTime(new Date());
        oaActRead.setPromoter(userId);
        oaActRead.setUrl("read");
        UserInfo userInfo = userInfoMapper.selectByPermission("handling_result");
        oaActRead.setHandlingResult(userInfo.getNickname());
        oaActRead.setState(0);
        if (oaActReadMapper.insertSelective(oaActRead) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActRead.getTitle());
            oaCollaboration.setUrl("read");
            oaCollaboration.setTable("oa_act_read");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("收文阅办单");
            oaCollaboration.setDataOne("来文机关" + oaActRead.getOrgan());
            oaCollaboration.setDataTwo("收文字号" + oaActRead.getReceiptTime());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActRead oaActRead) {
        oaActRead.setState(0);
        oaActRead.setReceiptProposed("");
        oaActRead.setReceiptProposedDate("");
        oaActRead.setReceiptProposedContent("");
        oaActRead.setCompanyPrincipal("");
        oaActRead.setCompanyPrincipalDate("");
        oaActRead.setCompanyPrincipalContent("");
        oaActRead.setOutcome("");
        oaActRead.setOutcomeDate("");
        oaActRead.setOutcomeContent("");
        oaActRead.setCreateTime(new Date());
        if (oaActReadMapper.updateByPrimaryKey(oaActRead) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActRead selectByPrimaryKey(String id) {
        OaActRead oaActRead = oaActReadMapper.selectByPrimaryKey(id);
        oaActRead.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActRead.getCreateTime()));
        oaActRead.setPromoterStr(userInfoMapper.getNicknameById(oaActRead.getPromoter()));
        return oaActRead;
    }

    @Override
    public int deleteData(String id) {
        return oaActReadMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActRead oaActRead) {
        return oaActReadMapper.updateByPrimaryKeySelective(oaActRead);
    }
}
