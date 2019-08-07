package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActAnnualLeave;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActAnnualLeaveMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 年休假审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActAnnualLeaveServiceImpl implements OaActAnnualLeaveService {

    @Resource
    private OaActAnnualLeaveMapper oaActAnnualLeaveMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActAnnualLeave oaActAnnualLeave, Integer userId, String randomId, Integer state) {
        oaActAnnualLeave.setPlanDate(DateUtil.stringConvertYYYYMMDD(oaActAnnualLeave.getPlanDateStr()));
        oaActAnnualLeave.setActualDate(DateUtil.stringConvertYYYYMMDD(oaActAnnualLeave.getActualDateStr()));
        oaActAnnualLeave.setId(randomId);
        oaActAnnualLeave.setCreateTime(new Date());
        oaActAnnualLeave.setPromoter(userId);
        oaActAnnualLeave.setUrl("annualLeave");
        if (oaActAnnualLeaveMapper.insert(oaActAnnualLeave) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActAnnualLeave.getTitle());
            oaCollaboration.setUrl("annualLeave");
            oaCollaboration.setTable("oa_act_annual_leave");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActAnnualLeave oaActAnnualLeave) {
        oaActAnnualLeave.setPlanDate(DateUtil.stringConvertYYYYMMDD(oaActAnnualLeave.getPlanDateStr()));
        oaActAnnualLeave.setActualDate(DateUtil.stringConvertYYYYMMDD(oaActAnnualLeave.getActualDateStr()));
        if (oaActAnnualLeaveMapper.updateByPrimaryKeySelective(oaActAnnualLeave) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActAnnualLeave.getId(), 1, oaActAnnualLeave.getTitle());
            return 1;
        }
    }

    @Override
    public OaActAnnualLeave selectByPrimaryKey(String id) {
        OaActAnnualLeave oaActAnnualLeave = oaActAnnualLeaveMapper.selectByPrimaryKey(id);
        oaActAnnualLeave.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActAnnualLeave.getCreateTime()));
        oaActAnnualLeave.setPlanDateStr(DateUtil.dateConvertYYYYMMDD(oaActAnnualLeave.getPlanDate()));
        oaActAnnualLeave.setActualDateStr(DateUtil.dateConvertYYYYMMDD(oaActAnnualLeave.getActualDate()));
        oaActAnnualLeave.setPromoterStr(userInfoMapper.getNicknameById(oaActAnnualLeave.getPromoter()));
        return oaActAnnualLeave;
    }


    @Override
    public int deleteData(String id) {
        return oaActAnnualLeaveMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateAnnexes(String[] array, String id) {
        OaActAnnualLeave oaActAnnualLeave = new OaActAnnualLeave();
        oaActAnnualLeave.setId(id);
        if (array != null) {
            oaActAnnualLeave.setAnnex(StringUtils.join(array));
        } else {
            oaActAnnualLeave.setAnnex("");
        }
        return oaActAnnualLeaveMapper.updateByPrimaryKeySelective(oaActAnnualLeave);
    }
}