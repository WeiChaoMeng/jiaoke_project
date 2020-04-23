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
        oaActLicenceUse.setState(0);
        if (oaActLicenceUseMapper.insertSelective(oaActLicenceUse) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActLicenceUse.getTitle());
            oaCollaboration.setUrl("licenceUse");
            oaCollaboration.setTable("oa_act_licence_use");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("证照使用申请");
            if (oaActLicenceUse.getSeal() == 0) {
                oaCollaboration.setDataOne("证照种类:路驰营业执照正本");
            } else if (oaActLicenceUse.getSeal() == 1) {
                oaCollaboration.setDataOne("证照种类:路驰营业执照副本");
            } else if (oaActLicenceUse.getSeal() == 2) {
                oaCollaboration.setDataOne("证照种类:路驰工会法人资格证书");
            } else if (oaActLicenceUse.getSeal() == 3) {
                oaCollaboration.setDataOne("证照种类:大兴营业执照正本");
            } else {
                oaCollaboration.setDataOne("证照种类:大兴营业执照副本");
            }
            oaCollaboration.setDataTwo("用途:" + oaActLicenceUse.getPurpose());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActLicenceUse oaActLicenceUse) {
        oaActLicenceUse.setState(0);
        oaActLicenceUse.setPrincipal("");
        oaActLicenceUse.setPrincipalDate("");
        oaActLicenceUse.setLicenceManage("");
        oaActLicenceUse.setLicenceManageDate("");
        oaActLicenceUse.setLicenceOperator("");
        oaActLicenceUse.setLicenceOperatorDate("");
        oaActLicenceUse.setCreateTime(new Date());
        if (oaActLicenceUseMapper.updateByPrimaryKey(oaActLicenceUse) < 0) {
            return -1;
        } else {
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
