package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActIntegrity;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActIntegrityMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 廉政谈话审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActIntegrityServiceImpl implements OaActIntegrityService {

    @Resource
    private OaActIntegrityMapper oaActIntegrityMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActIntegrity oaActIntegrity, Integer userId, String randomId, Integer state) {
        oaActIntegrity.setDate(DateUtil.stringConvertYYYYMMDD(oaActIntegrity.getDateStr()));
        oaActIntegrity.setId(randomId);
        oaActIntegrity.setCreateTime(new Date());
        oaActIntegrity.setPromoter(userId);
        oaActIntegrity.setUrl("integrity");
        if (oaActIntegrityMapper.insert(oaActIntegrity) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActIntegrity.getTitle());
            oaCollaboration.setUrl("integrity");
            oaCollaboration.setTable("oa_act_integrity");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActIntegrity oaActIntegrity) {
        oaActIntegrity.setDate(DateUtil.stringConvertYYYYMMDD(oaActIntegrity.getDateStr()));
        if (oaActIntegrityMapper.updateByPrimaryKeySelective(oaActIntegrity) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActIntegrity.getId(), 1, oaActIntegrity.getTitle());
            return 1;
        }
    }

    @Override
    public OaActIntegrity selectByPrimaryKey(String id) {
        OaActIntegrity oaActIntegrity = oaActIntegrityMapper.selectByPrimaryKey(id);
        oaActIntegrity.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActIntegrity.getCreateTime()));
        oaActIntegrity.setDateStr(DateUtil.dateConvertYYYYMMDD(oaActIntegrity.getDate()));
        oaActIntegrity.setPromoterStr(userInfoMapper.getNicknameById(oaActIntegrity.getPromoter()));
        return oaActIntegrity;
    }


    @Override
    public int deleteData(String id) {
        return oaActIntegrityMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateAnnexes(String[] array, String id) {
        OaActIntegrity oaActIntegrity = new OaActIntegrity();
        oaActIntegrity.setId(id);
        if (array != null) {
            oaActIntegrity.setAnnex(StringUtils.join(array));
        } else {
            oaActIntegrity.setAnnex("");
        }
        return oaActIntegrityMapper.updateByPrimaryKeySelective(oaActIntegrity);
    }
}
