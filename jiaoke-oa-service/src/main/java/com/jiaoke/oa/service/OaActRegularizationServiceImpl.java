package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActRegularization;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActRegularizationMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 转正申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActRegularizationServiceImpl implements OaActRegularizationService {

    @Resource
    private OaActRegularizationMapper oaActRegularizationMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActRegularization oaActRegularization, Integer userId, String randomId, Integer state) {
        oaActRegularization.setId(randomId);
        oaActRegularization.setCreateTime(new Date());
        oaActRegularization.setPromoter(userId);
        oaActRegularization.setUrl("regularization");
        oaActRegularization.setState(0);
        if (oaActRegularizationMapper.insertSelective(oaActRegularization) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActRegularization.getTitle());
            oaCollaboration.setUrl("regularization");
            oaCollaboration.setTable("oa_act_regularization");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("转正申请");
            oaCollaboration.setDataOne("入职日期:" + oaActRegularization.getEntryDate());
            oaCollaboration.setDataTwo("试用期日期:" + oaActRegularization.getProbationPeriod());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActRegularization oaActRegularization) {
        oaActRegularization.setState(0);
        oaActRegularization.setPrincipal("");
        oaActRegularization.setPrincipalDate("");
        oaActRegularization.setPrincipalContent("");
        oaActRegularization.setSupervisor("");
        oaActRegularization.setSupervisorDate("");
        oaActRegularization.setSupervisorContent("");
        oaActRegularization.setPersonnel("");
        oaActRegularization.setPersonnelDate("");
        oaActRegularization.setPersonnelContent("");
        oaActRegularization.setCompanyPrincipal("");
        oaActRegularization.setCompanyPrincipalDate("");
        oaActRegularization.setCompanyPrincipalContent("");
        oaActRegularization.setCreateTime(new Date());
        if (oaActRegularizationMapper.updateByPrimaryKeySelective(oaActRegularization) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActRegularization selectByPrimaryKey(String id) {
        OaActRegularization oaActRegularization = oaActRegularizationMapper.selectByPrimaryKey(id);
        oaActRegularization.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActRegularization.getCreateTime()));
        oaActRegularization.setPromoterStr(userInfoMapper.getNicknameById(oaActRegularization.getPromoter()));
        return oaActRegularization;
    }


    @Override
    public int deleteData(String id) {
        return oaActRegularizationMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActRegularization oaActRegularization) {
        return oaActRegularizationMapper.updateByPrimaryKeySelective(oaActRegularization);
    }
}
