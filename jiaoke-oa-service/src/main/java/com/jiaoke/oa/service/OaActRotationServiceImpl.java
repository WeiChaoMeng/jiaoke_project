package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActRotation;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActRotationMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 员工轮岗审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActRotationServiceImpl implements OaActRotationService {

    @Resource
    private OaActRotationMapper oaActRotationMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActRotation oaActRotation, Integer userId, String randomId, Integer state) {
        oaActRotation.setBirthday(DateUtil.stringConvertYYYYMMDD(oaActRotation.getBirthdayStr()));
        oaActRotation.setId(randomId);
        oaActRotation.setCreateTime(new Date());
        oaActRotation.setPromoter(userId);
        oaActRotation.setUrl("rotation");
        if (oaActRotationMapper.insert(oaActRotation) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActRotation.getTitle());
            oaCollaboration.setUrl("rotation");
            oaCollaboration.setTable("oa_act_rotation");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActRotation oaActRotation) {
        oaActRotation.setBirthday(DateUtil.stringConvertYYYYMMDD(oaActRotation.getBirthdayStr()));
        if (oaActRotationMapper.updateByPrimaryKeySelective(oaActRotation) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActRotation.getId(), 1, oaActRotation.getTitle());
            return 1;
        }
    }

    @Override
    public OaActRotation selectByPrimaryKey(String id) {
        OaActRotation oaActRotation = oaActRotationMapper.selectByPrimaryKey(id);
        oaActRotation.setBirthdayStr(DateUtil.dateConvertYYYYMMDD(oaActRotation.getBirthday()));
        oaActRotation.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActRotation.getCreateTime()));
        oaActRotation.setPromoterStr(userInfoMapper.getNicknameById(oaActRotation.getPromoter()));
        return oaActRotation;
    }


    @Override
    public int deleteData(String id) {
        return oaActRotationMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateAnnexes(String[] array, String id) {
        OaActRotation oaActRotation = new OaActRotation();
        oaActRotation.setId(id);
        if (array != null) {
            oaActRotation.setAnnex(StringUtils.join(array));
        } else {
            oaActRotation.setAnnex("");
        }
        return oaActRotationMapper.updateByPrimaryKeySelective(oaActRotation);
    }
}
