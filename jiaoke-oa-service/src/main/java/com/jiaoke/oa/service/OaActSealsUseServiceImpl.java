package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActSealsBorrow;
import com.jiaoke.oa.bean.OaActSealsUse;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActSealsUseMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 印章使用审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:41
 */
@Service
public class OaActSealsUseServiceImpl implements OaActSealsUseService {

    @Resource
    private OaActSealsUseMapper oaActSealsUseMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int deleteData(String id) {
        return oaActSealsUseMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(OaActSealsUse oaActSealsUse, Integer userId, String randomId, Integer state) {
        oaActSealsUse.setCreateTime(new Date());
        oaActSealsUse.setId(randomId);
        oaActSealsUse.setPromoter(userId);
        oaActSealsUse.setUrl("sealsUse");
        oaActSealsUse.setState(0);
        if (oaActSealsUseMapper.insertSelective(oaActSealsUse) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActSealsUse.getTitle());
            oaCollaboration.setUrl("sealsUse");
            oaCollaboration.setTable("oa_act_seals_use");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("印章使用申请");
            if (oaActSealsUse.getSeal() == 0) {
                oaCollaboration.setDataOne("印章种类:路驰公章");
            } else if (oaActSealsUse.getSeal() == 1) {
                oaCollaboration.setDataOne("印章种类:路驰合同专用章");
            } else if (oaActSealsUse.getSeal() == 2) {
                oaCollaboration.setDataOne("印章种类:路驰党支部章");
            } else if (oaActSealsUse.getSeal() == 3) {
                oaCollaboration.setDataOne("印章种类:路驰工会章");
            } else if (oaActSealsUse.getSeal() == 4) {
                oaCollaboration.setDataOne("印章种类:路驰法人章");
            } else if (oaActSealsUse.getSeal() == 5) {
                oaCollaboration.setDataOne("印章种类:路驰财务专用章");
            } else if (oaActSealsUse.getSeal() == 6) {
                oaCollaboration.setDataOne("印章种类:大兴公章");
            } else {
                oaCollaboration.setDataOne("印章种类:大兴合同章");
            }
            oaCollaboration.setDataTwo("盖章文件内容:" + oaActSealsUse.getName());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActSealsUse oaActSealsUse) {
        oaActSealsUse.setState(0);
        oaActSealsUse.setPrincipal("");
        oaActSealsUse.setPrincipalDate("");
        oaActSealsUse.setSupervisor("");
        oaActSealsUse.setSupervisorDate("");
        oaActSealsUse.setSealSupervisor("");
        oaActSealsUse.setSealSupervisorDate("");
        oaActSealsUse.setSealOperator("");
        oaActSealsUse.setSealOperatorDate("");
        oaActSealsUse.setCreateTime(new Date());
        if (oaActSealsUseMapper.updateByPrimaryKey(oaActSealsUse) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActSealsUse selectByPrimaryKey(String id) {
        OaActSealsUse oaActSealsUse = oaActSealsUseMapper.selectByPrimaryKey(id);
        oaActSealsUse.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActSealsUse.getCreateTime()));
        oaActSealsUse.setPromoterStr(userInfoMapper.getNicknameById(oaActSealsUse.getPromoter()));
        return oaActSealsUse;
    }

    @Override
    public int updateByPrimaryKeySelective(OaActSealsUse oaActSealsUse) {
        return oaActSealsUseMapper.updateByPrimaryKeySelective(oaActSealsUse);
    }
}
