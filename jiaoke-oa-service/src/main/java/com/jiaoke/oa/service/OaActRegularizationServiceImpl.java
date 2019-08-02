package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActRegularization;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActRegularizationMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 转正申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActRegularizationServiceImpl implements OaActRegularizationService {

    @Resource
    private OaActRegularizationMapper oaActRegularizationMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActRegularization oaActRegularization, Integer userId, String randomId, Integer state) {
        oaActRegularization.setEntryDate(DateUtil.stringConvertYYYYMMDD(oaActRegularization.getEntryDateStr()));
        oaActRegularization.setProbationPeriod(DateUtil.stringConvertYYYYMMDD(oaActRegularization.getProbationPeriodStr()));
        oaActRegularization.setId(randomId);
        oaActRegularization.setCreateTime(new Date());
        oaActRegularization.setPromoter(userId);
        oaActRegularization.setUrl("regularization");
        if (oaActRegularizationMapper.insert(oaActRegularization) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActRegularization.getTitle());
            oaCollaboration.setUrl("regularization");
            oaCollaboration.setTable("oa_act_regularization");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActRegularization oaActRegularization) {
        oaActRegularization.setEntryDate(DateUtil.stringConvertYYYYMMDD(oaActRegularization.getEntryDateStr()));
        oaActRegularization.setProbationPeriod(DateUtil.stringConvertYYYYMMDD(oaActRegularization.getProbationPeriodStr()));
        oaActRegularization.setCreateTime(new Date());
        if (oaActRegularizationMapper.updateByPrimaryKeySelective(oaActRegularization) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActRegularization.getId(), 1, oaActRegularization.getTitle());
            return 1;
        }
    }

    @Override
    public OaActRegularization selectByPrimaryKey(String id) {
        OaActRegularization oaActRegularization = oaActRegularizationMapper.selectByPrimaryKey(id);
        oaActRegularization.setEntryDateStr(DateUtil.dateConvertYYYYMMDD(oaActRegularization.getEntryDate()));
        oaActRegularization.setProbationPeriodStr(DateUtil.dateConvertYYYYMMDD(oaActRegularization.getProbationPeriod()));
        oaActRegularization.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActRegularization.getCreateTime()));
        oaActRegularization.setPromoterStr(userInfoMapper.getNicknameById(oaActRegularization.getPromoter()));
        return oaActRegularization;
    }


    @Override
    public int deleteData(String id) {
        return oaActRegularizationMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateAnnexes(String[] array, String id) {
        OaActRegularization oaActRegularization = new OaActRegularization();
        oaActRegularization.setId(id);
        if (array != null) {
            oaActRegularization.setAnnex(StringUtils.join(array));
        } else {
            oaActRegularization.setAnnex("");
        }
        return oaActRegularizationMapper.updateByPrimaryKeySelective(oaActRegularization);
    }

    @Override
    public int updateData(OaActRegularization oaActRegularization) {
        return oaActRegularizationMapper.updateByPrimaryKeySelective(oaActRegularization);
    }
}
