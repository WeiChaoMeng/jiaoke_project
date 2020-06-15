package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActContractSign;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActContractSignMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 劳务派遣员工合同签订、续订、变更、终止审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActContractSignServiceImpl implements OaActContractSignService {

    @Resource
    private OaActContractSignMapper oaActContractSignMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActContractSign oaActContractSign, Integer userId, String randomId, Integer state) {
        oaActContractSign.setId(randomId);
        oaActContractSign.setCreateTime(new Date());
        oaActContractSign.setPromoter(userId);
        oaActContractSign.setUrl("contractSign");
        oaActContractSign.setState(0);
        if (oaActContractSignMapper.insertSelective(oaActContractSign) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActContractSign.getTitle());
            oaCollaboration.setUrl("contractSign");
            oaCollaboration.setTable("oa_act_contract_sign");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("劳务派遣员工合同签订、续订、变更、终止审批");
            oaCollaboration.setDataOne("通知时间：" + DateUtil.dateConvertYYYYMMDD(oaActContractSign.getCreateTime()));
            oaCollaboration.setDataTwo("劳动合同到期时间：" + oaActContractSign.getStartDate());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActContractSign oaActContractSign) {
        oaActContractSign.setState(0);
        oaActContractSign.setPrincipal("");
        oaActContractSign.setPrincipalDate("");
        oaActContractSign.setPrincipalContent("");
        oaActContractSign.setPrincipalT("");
        oaActContractSign.setPrincipalDateT("");
        oaActContractSign.setPrincipalContentT("");
        oaActContractSign.setSupervisor("");
        oaActContractSign.setSupervisorDate("");
        oaActContractSign.setSupervisorContent("");
        oaActContractSign.setPersonnel("");
        oaActContractSign.setPersonnelDate("");
        oaActContractSign.setPersonnelContent("");
        oaActContractSign.setCompanyPrincipal("");
        oaActContractSign.setCompanyPrincipalDate("");
        oaActContractSign.setCompanyPrincipalContent("");
        oaActContractSign.setCreateTime(new Date());
        if (oaActContractSignMapper.updateByPrimaryKeySelective(oaActContractSign) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActContractSign selectByPrimaryKey(String id) {
        OaActContractSign oaActContractSign = oaActContractSignMapper.selectByPrimaryKey(id);
        oaActContractSign.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActContractSign.getCreateTime()));
        oaActContractSign.setPromoterStr(userInfoMapper.getNicknameById(oaActContractSign.getPromoter()));
        oaActContractSign.setNotifiedPersonStr(userInfoMapper.getNicknameById(oaActContractSign.getNotifiedPerson()));
        return oaActContractSign;
    }


    @Override
    public int deleteData(String id) {
        return oaActContractSignMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActContractSign oaActContractSign) {
        return oaActContractSignMapper.updateByPrimaryKeySelective(oaActContractSign);
    }
}
