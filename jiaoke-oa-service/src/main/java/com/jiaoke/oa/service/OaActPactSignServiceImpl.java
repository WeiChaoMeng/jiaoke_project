package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActPactSign;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActPactSignMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 劳务派遣员工协议签订、续订、变更、终止审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActPactSignServiceImpl implements OaActPactSignService {

    @Resource
    private OaActPactSignMapper oaActPactSignMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActPactSign oaActPactSign, Integer userId, String randomId, Integer state) {
        oaActPactSign.setId(randomId);
        oaActPactSign.setCreateTime(new Date());
        oaActPactSign.setPromoter(userId);
        oaActPactSign.setUrl("pactSign");
        oaActPactSign.setState(0);
        if (oaActPactSignMapper.insertSelective(oaActPactSign) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActPactSign.getTitle());
            oaCollaboration.setUrl("pactSign");
            oaCollaboration.setTable("oa_act_pact_sign");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("劳动合同签订、续订、变更、终止审批表");
            oaCollaboration.setDataOne("通知时间：" + DateUtil.dateConvertYYYYMMDD(oaActPactSign.getCreateTime()));
            oaCollaboration.setDataTwo("劳务协议到期时间：" + oaActPactSign.getStartDate());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActPactSign oaActPactSign) {
        oaActPactSign.setState(0);
        oaActPactSign.setPrincipal("");
        oaActPactSign.setPrincipalDate("");
        oaActPactSign.setPrincipalContent("");
        oaActPactSign.setPrincipalT("");
        oaActPactSign.setPrincipalDateT("");
        oaActPactSign.setPrincipalContentT("");
        oaActPactSign.setSupervisor("");
        oaActPactSign.setSupervisorDate("");
        oaActPactSign.setSupervisorContent("");
        oaActPactSign.setPersonnel("");
        oaActPactSign.setPersonnelDate("");
        oaActPactSign.setPersonnelContent("");
        oaActPactSign.setCompanyPrincipal("");
        oaActPactSign.setCompanyPrincipalDate("");
        oaActPactSign.setCompanyPrincipalContent("");
        oaActPactSign.setCreateTime(new Date());
        if (oaActPactSignMapper.updateByPrimaryKeySelective(oaActPactSign) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActPactSign selectByPrimaryKey(String id) {
        OaActPactSign oaActPactSign = oaActPactSignMapper.selectByPrimaryKey(id);
        oaActPactSign.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActPactSign.getCreateTime()));
        oaActPactSign.setPromoterStr(userInfoMapper.getNicknameById(oaActPactSign.getPromoter()));
        oaActPactSign.setNotifiedPersonStr(userInfoMapper.getNicknameById(oaActPactSign.getNotifiedPerson()));
        return oaActPactSign;
    }


    @Override
    public int deleteData(String id) {
        return oaActPactSignMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActPactSign oaActPactSign) {
        return oaActPactSignMapper.updateByPrimaryKeySelective(oaActPactSign);
    }
}
