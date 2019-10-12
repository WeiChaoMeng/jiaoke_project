package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActLicenceBorrow;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActLicenceBorrowMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 证照借用审批单（原件）
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:51
 */
@Service
public class OaActLicenceBorrowServiceImpl implements OaActLicenceBorrowService {

    @Resource
    private OaActLicenceBorrowMapper oaActLicenceBorrowMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActLicenceBorrow oaActLicenceBorrow, Integer userId, String randomId, Integer state) {
        oaActLicenceBorrow.setBorrowTime(DateUtil.stringConvertYYYYMMDDHH(oaActLicenceBorrow.getBorrowTimeStr()));
        oaActLicenceBorrow.setId(randomId);
        oaActLicenceBorrow.setPromoter(userId);
        oaActLicenceBorrow.setUrl("licenceBorrow");
        oaActLicenceBorrow.setCreateTime(new Date());
        if (oaActLicenceBorrowMapper.insertSelective(oaActLicenceBorrow) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActLicenceBorrow.getTitle());
            oaCollaboration.setUrl("licenceBorrow");
            oaCollaboration.setTable("oa_act_licence_borrow");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActLicenceBorrow oaActLicenceBorrow) {
        oaActLicenceBorrow.setBorrowTime(DateUtil.stringConvertYYYYMMDDHH(oaActLicenceBorrow.getBorrowTimeStr()));
        oaActLicenceBorrow.setCreateTime(new Date());
        if (oaActLicenceBorrowMapper.updateByPrimaryKey(oaActLicenceBorrow) < 1) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActLicenceBorrow.getId(), 1, oaActLicenceBorrow.getTitle());
            return 1;
        }
    }

    @Override
    public int savePending(OaActLicenceBorrow oaActLicenceBorrow, Integer userId, String randomId) {
        oaActLicenceBorrow.setBorrowTime(DateUtil.stringConvertYYYYMMDDHH(oaActLicenceBorrow.getBorrowTimeStr()));
        oaActLicenceBorrow.setId(randomId);
        oaActLicenceBorrow.setPromoter(userId);
        oaActLicenceBorrow.setUrl("licenceBorrow");
        oaActLicenceBorrow.setCreateTime(new Date());
        if (oaActLicenceBorrowMapper.insertData(oaActLicenceBorrow) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActLicenceBorrow.getTitle());
            oaCollaboration.setUrl("licenceBorrow");
            oaCollaboration.setTable("oa_act_licence_borrow");
            oaCollaboration.setState(1);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public OaActLicenceBorrow selectByPrimaryKey(String id) {
        OaActLicenceBorrow oaActLicenceBorrow = oaActLicenceBorrowMapper.selectByPrimaryKey(id);
        oaActLicenceBorrow.setBorrowTimeStr(DateUtil.dateConvertYYYYMMDDHH(oaActLicenceBorrow.getBorrowTime()));
        oaActLicenceBorrow.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActLicenceBorrow.getCreateTime()));
        oaActLicenceBorrow.setPromoterStr(userInfoMapper.getNicknameById(oaActLicenceBorrow.getPromoter()));
        return oaActLicenceBorrow;
    }

    @Override
    public int deleteData(String id) {
        return oaActLicenceBorrowMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActLicenceBorrow oaActLicenceBorrow) {
        return oaActLicenceBorrowMapper.updateByPrimaryKeySelective(oaActLicenceBorrow);
    }
}
