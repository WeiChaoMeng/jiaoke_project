package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActProductionLeave;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActProductionLeaveMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 生产假审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActProductionLeaveServiceImpl implements OaActProductionLeaveService {

    @Resource
    private OaActProductionLeaveMapper oaActProductionLeaveMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActProductionLeave oaActProductionLeave, Integer userId, String randomId, Integer state) {
        oaActProductionLeave.setApplyDate(DateUtil.stringConvertYYYYMMDD(oaActProductionLeave.getApplyDateStr()));
        oaActProductionLeave.setActualDate(DateUtil.stringConvertYYYYMMDD(oaActProductionLeave.getActualDateStr()));
        oaActProductionLeave.setId(randomId);
        oaActProductionLeave.setCreateTime(new Date());
        oaActProductionLeave.setPromoter(userId);
        oaActProductionLeave.setUrl("productionLeave");
        if (oaActProductionLeaveMapper.insert(oaActProductionLeave) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActProductionLeave.getTitle());
            oaCollaboration.setUrl("productionLeave");
            oaCollaboration.setTable("oa_act_production_leave");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActProductionLeave oaActProductionLeave) {
        oaActProductionLeave.setApplyDate(DateUtil.stringConvertYYYYMMDD(oaActProductionLeave.getApplyDateStr()));
        oaActProductionLeave.setActualDate(DateUtil.stringConvertYYYYMMDD(oaActProductionLeave.getActualDateStr()));
        if (oaActProductionLeaveMapper.updateByPrimaryKeySelective(oaActProductionLeave) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActProductionLeave.getId(), 1, oaActProductionLeave.getTitle());
            return 1;
        }
    }

    @Override
    public OaActProductionLeave selectByPrimaryKey(String id) {
        OaActProductionLeave oaActProductionLeave = oaActProductionLeaveMapper.selectByPrimaryKey(id);
        oaActProductionLeave.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActProductionLeave.getCreateTime()));
        oaActProductionLeave.setApplyDateStr(DateUtil.dateConvertYYYYMMDD(oaActProductionLeave.getApplyDate()));
        oaActProductionLeave.setActualDateStr(DateUtil.dateConvertYYYYMMDD(oaActProductionLeave.getActualDate()));
        oaActProductionLeave.setPromoterStr(userInfoMapper.getNicknameById(oaActProductionLeave.getPromoter()));
        return oaActProductionLeave;
    }


    @Override
    public int deleteData(String id) {
        return oaActProductionLeaveMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateAnnexes(String[] array, String id) {
        OaActProductionLeave oaActProductionLeave = new OaActProductionLeave();
        oaActProductionLeave.setId(id);
        if (array != null) {
            oaActProductionLeave.setAnnex(StringUtils.join(array));
        } else {
            oaActProductionLeave.setAnnex("");
        }
        return oaActProductionLeaveMapper.updateByPrimaryKeySelective(oaActProductionLeave);
    }
}
