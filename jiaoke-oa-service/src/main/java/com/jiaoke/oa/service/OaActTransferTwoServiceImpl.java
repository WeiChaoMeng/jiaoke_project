package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActTransferTwo;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActTransferTwoMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 转岗申请表2
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActTransferTwoServiceImpl implements OaActTransferTwoService {

    @Resource
    private OaActTransferTwoMapper oaActTransferTwoMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActTransferTwo oaActTransferTwo, Integer userId, String randomId, Integer state) {
        oaActTransferTwo.setEntryDate(DateUtil.stringConvertYYYYMMDD(oaActTransferTwo.getEntryDateStr()));
        oaActTransferTwo.setId(randomId);
        oaActTransferTwo.setCreateTime(new Date());
        oaActTransferTwo.setPromoter(userId);
        oaActTransferTwo.setUrl("transferTwo");
        if (oaActTransferTwoMapper.insert(oaActTransferTwo) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActTransferTwo.getTitle());
            oaCollaboration.setUrl("transferTwo");
            oaCollaboration.setTable("oa_act_transfer_two");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActTransferTwo oaActTransferTwo) {
        oaActTransferTwo.setEntryDate(DateUtil.stringConvertYYYYMMDD(oaActTransferTwo.getEntryDateStr()));
        if (oaActTransferTwoMapper.updateByPrimaryKeySelective(oaActTransferTwo) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActTransferTwo.getId(), 1, oaActTransferTwo.getTitle());
            return 1;
        }
    }

    @Override
    public OaActTransferTwo selectByPrimaryKey(String id) {
        OaActTransferTwo oaActTransferTwo = oaActTransferTwoMapper.selectByPrimaryKey(id);
        oaActTransferTwo.setEntryDateStr(DateUtil.dateConvertYYYYMMDD(oaActTransferTwo.getEntryDate()));
        oaActTransferTwo.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActTransferTwo.getCreateTime()));
        oaActTransferTwo.setPromoterStr(userInfoMapper.getNicknameById(oaActTransferTwo.getPromoter()));
        return oaActTransferTwo;
    }


    @Override
    public int deleteData(String id) {
        return oaActTransferTwoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateAnnexes(String[] array, String id) {
        OaActTransferTwo oaActTransferTwo = new OaActTransferTwo();
        oaActTransferTwo.setId(id);
        if (array != null) {
            oaActTransferTwo.setAnnex(StringUtils.join(array));
        } else {
            oaActTransferTwo.setAnnex("");
        }
        return oaActTransferTwoMapper.updateByPrimaryKeySelective(oaActTransferTwo);
    }
}
