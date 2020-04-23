package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActRelieveLaborContract;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActRelieveLaborContractMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 解除劳动合同审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActRelieveLaborContractServiceImpl implements OaActRelieveLaborContractService {

    @Resource
    private OaActRelieveLaborContractMapper oaActRelieveLaborContractMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActRelieveLaborContract oaActRelieveLaborContract, Integer userId, String randomId, Integer state) {
        oaActRelieveLaborContract.setId(randomId);
        oaActRelieveLaborContract.setCreateTime(new Date());
        oaActRelieveLaborContract.setPromoter(userId);
        oaActRelieveLaborContract.setUrl("relieveLaborContract");
        oaActRelieveLaborContract.setState(0);
        if (oaActRelieveLaborContractMapper.insertSelective(oaActRelieveLaborContract) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActRelieveLaborContract.getTitle());
            oaCollaboration.setUrl("relieveLaborContract");
            oaCollaboration.setTable("oa_act_relieve_labor_contract");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("解除劳动合同审批");
            if (oaActRelieveLaborContract.getRelieveType() == 0) {
                oaCollaboration.setDataOne("解除类型：个人提出辞职");
            } else if (oaActRelieveLaborContract.getRelieveType() == 1) {
                oaCollaboration.setDataOne("解除类型：单位解除劳动合同");
            } else {
                oaCollaboration.setDataOne("解除类型：协商一致解除劳动合同");
            }
            oaCollaboration.setDataTwo("申请离职日期：" + oaActRelieveLaborContract.getApplyDepartureDate());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActRelieveLaborContract oaActRelieveLaborContract) {
        oaActRelieveLaborContract.setState(0);
        oaActRelieveLaborContract.setPrincipal("");
        oaActRelieveLaborContract.setPrincipalDate("");
        oaActRelieveLaborContract.setPrincipalContent("");
        oaActRelieveLaborContract.setSupervisor("");
        oaActRelieveLaborContract.setSupervisorDate("");
        oaActRelieveLaborContract.setSupervisorContent("");
        oaActRelieveLaborContract.setPersonnel("");
        oaActRelieveLaborContract.setPersonnelDate("");
        oaActRelieveLaborContract.setPersonnelContent("");
        oaActRelieveLaborContract.setCompanyPrincipal("");
        oaActRelieveLaborContract.setCompanyPrincipalDate("");
        oaActRelieveLaborContract.setCompanyPrincipalContent("");
        oaActRelieveLaborContract.setCreateTime(new Date());
        if (oaActRelieveLaborContractMapper.updateByPrimaryKeySelective(oaActRelieveLaborContract) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActRelieveLaborContract selectByPrimaryKey(String id) {
        OaActRelieveLaborContract oaActRelieveLaborContract = oaActRelieveLaborContractMapper.selectByPrimaryKey(id);
        oaActRelieveLaborContract.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActRelieveLaborContract.getCreateTime()));
        oaActRelieveLaborContract.setPromoterStr(userInfoMapper.getNicknameById(oaActRelieveLaborContract.getPromoter()));
        return oaActRelieveLaborContract;
    }


    @Override
    public int deleteData(String id) {
        return oaActRelieveLaborContractMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActRelieveLaborContract oaActRelieveLaborContract) {
        return oaActRelieveLaborContractMapper.updateByPrimaryKeySelective(oaActRelieveLaborContract);
    }
}
