package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActRotationHandover;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActRotationHandoverMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 轮岗交接表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActRotationHandoverServiceImpl implements OaActRotationHandoverService {

    @Resource
    private OaActRotationHandoverMapper oaActRotationHandoverMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActRotationHandover oaActRotationHandover, Integer userId, String randomId, Integer state) {
        oaActRotationHandover.setId(randomId);
        oaActRotationHandover.setCreateTime(new Date());
        oaActRotationHandover.setPromoter(userId);
        oaActRotationHandover.setUrl("rotationHandover");
        if (oaActRotationHandoverMapper.insert(oaActRotationHandover) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActRotationHandover.getTitle());
            oaCollaboration.setUrl("rotationHandover");
            oaCollaboration.setTable("oa_act_rotation_handover");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActRotationHandover oaActRotationHandover) {
        if (oaActRotationHandoverMapper.updateByPrimaryKeySelective(oaActRotationHandover) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActRotationHandover.getId(), 1, oaActRotationHandover.getTitle());
            return 1;
        }
    }

    @Override
    public OaActRotationHandover selectByPrimaryKey(String id) {
        OaActRotationHandover oaActRotationHandover = oaActRotationHandoverMapper.selectByPrimaryKey(id);
        oaActRotationHandover.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActRotationHandover.getCreateTime()));
        oaActRotationHandover.setPromoterStr(userInfoMapper.getNicknameById(oaActRotationHandover.getPromoter()));
        return oaActRotationHandover;
    }


    @Override
    public int deleteData(String id) {
        return oaActRotationHandoverMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateAnnexes(String[] array, String id) {
        OaActRotationHandover oaActRotationHandover = new OaActRotationHandover();
        oaActRotationHandover.setId(id);
        if (array != null) {
            oaActRotationHandover.setAnnex(StringUtils.join(array));
        } else {
            oaActRotationHandover.setAnnex("");
        }
        return oaActRotationHandoverMapper.updateByPrimaryKeySelective(oaActRotationHandover);
    }
}
