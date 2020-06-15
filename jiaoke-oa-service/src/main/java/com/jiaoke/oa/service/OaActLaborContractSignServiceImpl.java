package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActLaborContractSign;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActLaborContractSignMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 劳动合同签订通知书
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActLaborContractSignServiceImpl implements OaActLaborContractSignService {

    @Resource
    private OaActLaborContractSignMapper oaActLaborContractSignMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActLaborContractSign oaActLaborContractSign, Integer userId, String randomId, Integer state) {
        String notifier = userInfoMapper.getNicknameById(oaActLaborContractSign.getNotifiedPerson());
        oaActLaborContractSign.setId(randomId);
        oaActLaborContractSign.setCreateTime(new Date());
        oaActLaborContractSign.setPromoter(userId);
        oaActLaborContractSign.setUrl("laborContractSign");
        oaActLaborContractSign.setState(0);
        if (oaActLaborContractSignMapper.insertSelective(oaActLaborContractSign) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActLaborContractSign.getTitle());
            oaCollaboration.setUrl("laborContractSign");
            oaCollaboration.setTable("oa_act_labor_contract_sign");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("劳动合同签订审批表");
            oaCollaboration.setDataOne("通知人：" + notifier);
            oaCollaboration.setDataTwo("通知时间：" + DateUtil.dateConvertYYYYMMDD(oaActLaborContractSign.getCreateTime()));
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActLaborContractSign oaActLaborContractSign) {
        oaActLaborContractSign.setState(0);
        oaActLaborContractSign.setPrincipal("");
        oaActLaborContractSign.setPrincipalDate("");
        oaActLaborContractSign.setPrincipalContent("");
        oaActLaborContractSign.setPrincipalT("");
        oaActLaborContractSign.setPrincipalDateT("");
        oaActLaborContractSign.setPrincipalContentT("");
        oaActLaborContractSign.setSupervisor("");
        oaActLaborContractSign.setSupervisorDate("");
        oaActLaborContractSign.setSupervisorContent("");
        oaActLaborContractSign.setPersonnel("");
        oaActLaborContractSign.setPersonnelDate("");
        oaActLaborContractSign.setPersonnelContent("");
        oaActLaborContractSign.setCompanyPrincipal("");
        oaActLaborContractSign.setCompanyPrincipalDate("");
        oaActLaborContractSign.setCompanyPrincipalContent("");
        oaActLaborContractSign.setCreateTime(new Date());
        if (oaActLaborContractSignMapper.updateByPrimaryKeySelective(oaActLaborContractSign) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActLaborContractSign selectByPrimaryKey(String id) {
        OaActLaborContractSign oaActLaborContractSign = oaActLaborContractSignMapper.selectByPrimaryKey(id);
        oaActLaborContractSign.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActLaborContractSign.getCreateTime()));
        oaActLaborContractSign.setPromoterStr(userInfoMapper.getNicknameById(oaActLaborContractSign.getPromoter()));
        oaActLaborContractSign.setNotifiedPersonStr(userInfoMapper.getNicknameById(oaActLaborContractSign.getNotifiedPerson()));
        return oaActLaborContractSign;
    }


    @Override
    public int deleteData(String id) {
        return oaActLaborContractSignMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActLaborContractSign oaActLaborContractSign) {
        return oaActLaborContractSignMapper.updateByPrimaryKeySelective(oaActLaborContractSign);
    }
}
