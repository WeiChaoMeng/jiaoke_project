package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActOvertimeRest;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActOvertimeRestMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 加班（倒休）审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActOvertimeRestServiceImpl implements OaActOvertimeRestService {

    @Resource
    private OaActOvertimeRestMapper oaActOvertimeRestMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActOvertimeRest oaActOvertimeRest, Integer userId, String randomId, Integer state) {
        oaActOvertimeRest.setApplyDate(DateUtil.stringConvertYYYYMMDD(oaActOvertimeRest.getApplyDateStr()));
        oaActOvertimeRest.setId(randomId);
        oaActOvertimeRest.setCreateTime(new Date());
        oaActOvertimeRest.setPromoter(userId);
        oaActOvertimeRest.setUrl("overtimeRest");
        if (oaActOvertimeRestMapper.insert(oaActOvertimeRest) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActOvertimeRest.getTitle());
            oaCollaboration.setUrl("overtimeRest");
            oaCollaboration.setTable("oa_act_overtime_rest");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActOvertimeRest oaActOvertimeRest) {
        oaActOvertimeRest.setApplyDate(DateUtil.stringConvertYYYYMMDD(oaActOvertimeRest.getApplyDateStr()));
        if (oaActOvertimeRestMapper.updateByPrimaryKeySelective(oaActOvertimeRest) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActOvertimeRest.getId(), 1, oaActOvertimeRest.getTitle());
            return 1;
        }
    }

    @Override
    public OaActOvertimeRest selectByPrimaryKey(String id) {
        OaActOvertimeRest oaActOvertimeRest = oaActOvertimeRestMapper.selectByPrimaryKey(id);
        oaActOvertimeRest.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActOvertimeRest.getCreateTime()));
        oaActOvertimeRest.setApplyDateStr(DateUtil.dateConvertYYYYMMDD(oaActOvertimeRest.getApplyDate()));
        oaActOvertimeRest.setPromoterStr(userInfoMapper.getNicknameById(oaActOvertimeRest.getPromoter()));
        return oaActOvertimeRest;
    }


    @Override
    public int deleteData(String id) {
        return oaActOvertimeRestMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateAnnexes(String[] array, String id) {
        OaActOvertimeRest oaActOvertimeRest = new OaActOvertimeRest();
        oaActOvertimeRest.setId(id);
        if (array != null) {
            oaActOvertimeRest.setAnnex(StringUtils.join(array));
        } else {
            oaActOvertimeRest.setAnnex("");
        }
        return oaActOvertimeRestMapper.updateByPrimaryKeySelective(oaActOvertimeRest);
    }
}
