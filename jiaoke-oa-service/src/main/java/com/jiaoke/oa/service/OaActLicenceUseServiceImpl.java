package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActLicenceUse;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActLicenceUseMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 证照使用审批单（复印件）
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 3:01
 */
@Service
public class OaActLicenceUseServiceImpl implements OaActLicenceUseService {

    @Resource
    private OaActLicenceUseMapper oaActLicenceUseMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActLicenceUse oaActLicenceUse, Integer userId, String randomId, Integer state) {
        oaActLicenceUse.setId(randomId);
        oaActLicenceUse.setCreateTime(new Date());
        oaActLicenceUse.setPromoter(userId);
        oaActLicenceUse.setUrl("licenceUse");
        if (oaActLicenceUseMapper.insertSelective(oaActLicenceUse) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActLicenceUse.getTitle());
            oaCollaboration.setUrl("licenceUse");
            oaCollaboration.setTable("oa_act_licence_use");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActLicenceUse oaActLicenceUse) {
        oaActLicenceUse.setCreateTime(new Date());
        if (oaActLicenceUseMapper.updateByPrimaryKey(oaActLicenceUse) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActLicenceUse.getId(), 1, oaActLicenceUse.getTitle());
            return 1;
        }
    }

    @Override
    public OaActLicenceUse selectByPrimaryKey(String id) {
        OaActLicenceUse oaActLicenceUse = oaActLicenceUseMapper.selectByPrimaryKey(id);
        oaActLicenceUse.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActLicenceUse.getCreateTime()));
        oaActLicenceUse.setPromoterStr(userInfoMapper.getNicknameById(oaActLicenceUse.getPromoter()));
        return oaActLicenceUse;
    }

    @Override
    public int deleteData(String id) {
        return oaActLicenceUseMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActLicenceUse oaActLicenceUse) {
        return oaActLicenceUseMapper.updateByPrimaryKeySelective(oaActLicenceUse);
    }
}
