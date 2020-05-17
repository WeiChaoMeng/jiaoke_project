package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActEngage;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActEngageMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 职称（技术等级）评聘申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActEngageServiceImpl implements OaActEngageService {

    @Resource
    private OaActEngageMapper oaActEngageMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActEngage oaActEngage, Integer userId, String randomId, Integer state) {
        oaActEngage.setId(randomId);
        oaActEngage.setCreateTime(new Date());
        oaActEngage.setPromoter(userId);
        oaActEngage.setUrl("engage");
        oaActEngage.setState(0);
        if (oaActEngageMapper.insertSelective(oaActEngage) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActEngage.getTitle());
            oaCollaboration.setUrl("engage");
            oaCollaboration.setTable("oa_act_engage");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("职称(技术等级)评聘申请表");
            oaCollaboration.setDataOne("拟评聘职称（技术等级）名称:" + oaActEngage.getUndoutedly());
            oaCollaboration.setDataTwo("考试时间:" + oaActEngage.getExamTime());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActEngage oaActEngage) {
        oaActEngage.setState(0);
        oaActEngage.setPrincipal("");
        oaActEngage.setPrincipalDate("");
        oaActEngage.setPrincipalContent("");
        oaActEngage.setPrincipalT("");
        oaActEngage.setPrincipalDateT("");
        oaActEngage.setPrincipalContentT("");
        oaActEngage.setSupervisor("");
        oaActEngage.setSupervisorDate("");
        oaActEngage.setSupervisorContent("");
        oaActEngage.setPersonnel("");
        oaActEngage.setPersonnelDate("");
        oaActEngage.setPersonnelContent("");
        oaActEngage.setCompanyPrincipal("");
        oaActEngage.setCompanyPrincipalDate("");
        oaActEngage.setCompanyPrincipalContent("");
        oaActEngage.setUndoutedlyTeam("");
        oaActEngage.setRankAllowance("");
        oaActEngage.setRankDate("");
        oaActEngage.setRankName("");
        oaActEngage.setCreateTime(new Date());
        if (oaActEngageMapper.updateByPrimaryKeySelective(oaActEngage) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActEngage selectByPrimaryKey(String id) {
        OaActEngage oaActEngage = oaActEngageMapper.selectByPrimaryKey(id);
        oaActEngage.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActEngage.getCreateTime()));
        oaActEngage.setPromoterStr(userInfoMapper.getNicknameById(oaActEngage.getPromoter()));
        return oaActEngage;
    }


    @Override
    public int deleteData(String id) {
        return oaActEngageMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActEngage oaActEngage) {
        return oaActEngageMapper.updateByPrimaryKeySelective(oaActEngage);
    }
}
