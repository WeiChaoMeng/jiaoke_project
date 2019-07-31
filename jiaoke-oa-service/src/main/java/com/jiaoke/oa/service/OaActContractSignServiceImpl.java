package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActContractSign;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActContractSignMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.commons.lang3.StringUtils;
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
        if (oaActContractSignMapper.insert(oaActContractSign) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActContractSign.getTitle());
            oaCollaboration.setUrl("contractSign");
            oaCollaboration.setTable("oa_act_contract_sign");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActContractSign oaActContractSign) {
        if (oaActContractSignMapper.updateByPrimaryKeySelective(oaActContractSign) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActContractSign.getId(), 1, oaActContractSign.getTitle());
            return 1;
        }
    }

    @Override
    public OaActContractSign selectByPrimaryKey(String id) {
        OaActContractSign oaActContractSign = oaActContractSignMapper.selectByPrimaryKey(id);
        oaActContractSign.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActContractSign.getCreateTime()));
        oaActContractSign.setPromoterStr(userInfoMapper.getNicknameById(oaActContractSign.getPromoter()));
        return oaActContractSign;
    }


    @Override
    public int deleteData(String id) {
        return oaActContractSignMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateAnnexes(String[] array, String id) {
        OaActContractSign oaActContractSign = new OaActContractSign();
        oaActContractSign.setId(id);
        if (array != null) {
            oaActContractSign.setAnnex(StringUtils.join(array));
        } else {
            oaActContractSign.setAnnex("");
        }
        return oaActContractSignMapper.updateByPrimaryKeySelective(oaActContractSign);
    }
}
