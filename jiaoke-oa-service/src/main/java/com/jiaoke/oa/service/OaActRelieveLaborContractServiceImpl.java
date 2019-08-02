package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActRelieveLaborContract;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActRelieveLaborContractMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.commons.lang3.StringUtils;
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
        oaActRelieveLaborContract.setEntryDate(DateUtil.stringConvertYYYYMMDD(oaActRelieveLaborContract.getEntryDateStr()));
        oaActRelieveLaborContract.setApplyDepartureDate(DateUtil.stringConvertYYYYMMDD(oaActRelieveLaborContract.getApplyDepartureDateStr()));
        oaActRelieveLaborContract.setId(randomId);
        oaActRelieveLaborContract.setCreateTime(new Date());
        oaActRelieveLaborContract.setPromoter(userId);
        oaActRelieveLaborContract.setUrl("relieveLaborContract");
        if (oaActRelieveLaborContractMapper.insert(oaActRelieveLaborContract) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActRelieveLaborContract.getTitle());
            oaCollaboration.setUrl("relieveLaborContract");
            oaCollaboration.setTable("oa_act_relieve_labor_contract");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActRelieveLaborContract oaActRelieveLaborContract) {
        oaActRelieveLaborContract.setEntryDate(DateUtil.stringConvertYYYYMMDD(oaActRelieveLaborContract.getEntryDateStr()));
        oaActRelieveLaborContract.setApplyDepartureDate(DateUtil.stringConvertYYYYMMDD(oaActRelieveLaborContract.getApplyDepartureDateStr()));
        if (oaActRelieveLaborContractMapper.updateByPrimaryKeySelective(oaActRelieveLaborContract) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActRelieveLaborContract.getId(), 1, oaActRelieveLaborContract.getTitle());
            return 1;
        }
    }

    @Override
    public OaActRelieveLaborContract selectByPrimaryKey(String id) {
        OaActRelieveLaborContract oaActRelieveLaborContract = oaActRelieveLaborContractMapper.selectByPrimaryKey(id);
        oaActRelieveLaborContract.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActRelieveLaborContract.getCreateTime()));
        oaActRelieveLaborContract.setEntryDateStr(DateUtil.dateConvertYYYYMMDD(oaActRelieveLaborContract.getEntryDate()));
        oaActRelieveLaborContract.setApplyDepartureDateStr(DateUtil.dateConvertYYYYMMDD(oaActRelieveLaborContract.getApplyDepartureDate()));
        oaActRelieveLaborContract.setPromoterStr(userInfoMapper.getNicknameById(oaActRelieveLaborContract.getPromoter()));
        return oaActRelieveLaborContract;
    }


    @Override
    public int deleteData(String id) {
        return oaActRelieveLaborContractMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateAnnexes(String[] array, String id) {
        OaActRelieveLaborContract oaActRelieveLaborContract = new OaActRelieveLaborContract();
        oaActRelieveLaborContract.setId(id);
        if (array != null) {
            oaActRelieveLaborContract.setAnnex(StringUtils.join(array));
        } else {
            oaActRelieveLaborContract.setAnnex("");
        }
        return oaActRelieveLaborContractMapper.updateByPrimaryKeySelective(oaActRelieveLaborContract);
    }
}
