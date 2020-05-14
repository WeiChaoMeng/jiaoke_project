package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActEmployment;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActEmploymentMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 部室用人申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActEmploymentServiceImpl implements OaActEmploymentService {

    @Resource
    private OaActEmploymentMapper oaActEmploymentMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActEmployment oaActEmployment, Integer userId, String randomId, Integer state) {
        oaActEmployment.setId(randomId);
        oaActEmployment.setCreateTime(new Date());
        oaActEmployment.setPromoter(userId);
        oaActEmployment.setUrl("employment");
        oaActEmployment.setState(0);
        if (oaActEmploymentMapper.insertSelective(oaActEmployment) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActEmployment.getTitle());
            oaCollaboration.setUrl("employment");
            oaCollaboration.setTable("oa_act_employment");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("部室用人申请表");
            oaCollaboration.setDataOne("用人岗位:" + oaActEmployment.getJob());
            oaCollaboration.setDataTwo("人数:" + oaActEmployment.getPeopleNumber());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActEmployment oaActEmployment) {
        oaActEmployment.setState(0);
        oaActEmployment.setPrincipal("");
        oaActEmployment.setPrincipalDate("");
        oaActEmployment.setPrincipalContent("");
        oaActEmployment.setPrincipalT("");
        oaActEmployment.setPrincipalDateT("");
        oaActEmployment.setPrincipalContentT("");
        oaActEmployment.setSupervisor("");
        oaActEmployment.setSupervisorDate("");
        oaActEmployment.setSupervisorContent("");
        oaActEmployment.setPersonnel("");
        oaActEmployment.setPersonnelDate("");
        oaActEmployment.setPersonnelContent("");
        oaActEmployment.setCompanyPrincipal("");
        oaActEmployment.setCompanyPrincipalDate("");
        oaActEmployment.setCompanyPrincipalContent("");
        oaActEmployment.setCreateTime(new Date());
        if (oaActEmploymentMapper.updateByPrimaryKeySelective(oaActEmployment) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActEmployment selectByPrimaryKey(String id) {
        OaActEmployment oaActEmployment = oaActEmploymentMapper.selectByPrimaryKey(id);
        oaActEmployment.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActEmployment.getCreateTime()));
        oaActEmployment.setPromoterStr(userInfoMapper.getNicknameById(oaActEmployment.getPromoter()));
        return oaActEmployment;
    }


    @Override
    public int deleteData(String id) {
        return oaActEmploymentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActEmployment oaActEmployment) {
        return oaActEmploymentMapper.updateByPrimaryKeySelective(oaActEmployment);
    }
}
