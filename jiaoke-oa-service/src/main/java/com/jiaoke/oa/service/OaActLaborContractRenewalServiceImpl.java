package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActLaborContractRenewal;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActLaborContractRenewalMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 劳动合同签订、续订、变更、终止审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActLaborContractRenewalServiceImpl implements OaActLaborContractRenewalService {

    @Resource
    private OaActLaborContractRenewalMapper oaActLaborContractRenewalMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActLaborContractRenewal oaActLaborContractRenewal, Integer userId, String randomId, Integer state) {
        oaActLaborContractRenewal.setStartDate(DateUtil.stringConvertYYYYMMDD(oaActLaborContractRenewal.getStartDateStr()));
        oaActLaborContractRenewal.setEndDate(DateUtil.stringConvertYYYYMMDD(oaActLaborContractRenewal.getEndDateStr()));
        oaActLaborContractRenewal.setId(randomId);
        oaActLaborContractRenewal.setCreateTime(new Date());
        oaActLaborContractRenewal.setPromoter(userId);
        oaActLaborContractRenewal.setUrl("laborContractRenewal");
        if (oaActLaborContractRenewalMapper.insert(oaActLaborContractRenewal) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActLaborContractRenewal.getTitle());
            oaCollaboration.setUrl("laborContractRenewal");
            oaCollaboration.setTable("oa_act_labor_contract_renewal");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActLaborContractRenewal oaActLaborContractRenewal) {
        oaActLaborContractRenewal.setStartDate(DateUtil.stringConvertYYYYMMDD(oaActLaborContractRenewal.getStartDateStr()));
        oaActLaborContractRenewal.setEndDate(DateUtil.stringConvertYYYYMMDD(oaActLaborContractRenewal.getEndDateStr()));
        if (oaActLaborContractRenewalMapper.updateByPrimaryKeySelective(oaActLaborContractRenewal) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActLaborContractRenewal.getId(), 1, oaActLaborContractRenewal.getTitle());
            return 1;
        }
    }

    @Override
    public OaActLaborContractRenewal selectByPrimaryKey(String id) {
        OaActLaborContractRenewal oaActLaborContractRenewal = oaActLaborContractRenewalMapper.selectByPrimaryKey(id);
        oaActLaborContractRenewal.setStartDateStr(DateUtil.dateConvertYYYYMMDD(oaActLaborContractRenewal.getStartDate()));
        oaActLaborContractRenewal.setEndDateStr(DateUtil.dateConvertYYYYMMDD(oaActLaborContractRenewal.getEndDate()));
        oaActLaborContractRenewal.setCreateTimeStr(DateUtil.dateConvertYYYYMMDD(oaActLaborContractRenewal.getCreateTime()));
        oaActLaborContractRenewal.setPromoterStr(userInfoMapper.getNicknameById(oaActLaborContractRenewal.getPromoter()));
        return oaActLaborContractRenewal;
    }


    @Override
    public int deleteData(String id) {
        return oaActLaborContractRenewalMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateAnnexes(String[] array, String id) {
        OaActLaborContractRenewal oaActLaborContractRenewal = new OaActLaborContractRenewal();
        oaActLaborContractRenewal.setId(id);
        if (array != null) {
            oaActLaborContractRenewal.setAnnex(StringUtils.join(array));
        } else {
            oaActLaborContractRenewal.setAnnex("");
        }
        return oaActLaborContractRenewalMapper.updateByPrimaryKeySelective(oaActLaborContractRenewal);
    }
}
