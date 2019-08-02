package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActTransfer;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActTransferMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 转岗申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActTransferServiceImpl implements OaActTransferService {

    @Resource
    private OaActTransferMapper oaActTransferMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActTransfer oaActTransfer, Integer userId, String randomId, Integer state) {
        oaActTransfer.setEntryDate(DateUtil.stringConvertYYYYMMDD(oaActTransfer.getEntryDateStr()));
        oaActTransfer.setId(randomId);
        oaActTransfer.setCreateTime(new Date());
        oaActTransfer.setPromoter(userId);
        oaActTransfer.setUrl("transfer");
        if (oaActTransferMapper.insert(oaActTransfer) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActTransfer.getTitle());
            oaCollaboration.setUrl("transfer");
            oaCollaboration.setTable("oa_act_transfer");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActTransfer oaActTransfer) {
        oaActTransfer.setEntryDate(DateUtil.stringConvertYYYYMMDD(oaActTransfer.getEntryDateStr()));
        if (oaActTransferMapper.updateByPrimaryKeySelective(oaActTransfer) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActTransfer.getId(), 1, oaActTransfer.getTitle());
            return 1;
        }
    }

    @Override
    public OaActTransfer selectByPrimaryKey(String id) {
        OaActTransfer oaActTransfer = oaActTransferMapper.selectByPrimaryKey(id);
        oaActTransfer.setEntryDateStr(DateUtil.dateConvertYYYYMMDD(oaActTransfer.getEntryDate()));
        oaActTransfer.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActTransfer.getCreateTime()));
        oaActTransfer.setPromoterStr(userInfoMapper.getNicknameById(oaActTransfer.getPromoter()));
        return oaActTransfer;
    }


    @Override
    public int deleteData(String id) {
        return oaActTransferMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateAnnexes(String[] array, String id) {
        OaActTransfer oaActTransfer = new OaActTransfer();
        oaActTransfer.setId(id);
        if (array != null) {
            oaActTransfer.setAnnex(StringUtils.join(array));
        } else {
            oaActTransfer.setAnnex("");
        }
        return oaActTransferMapper.updateByPrimaryKeySelective(oaActTransfer);
    }
}
