package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActExamination;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActExaminationMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 职称（技术等级）考试申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActExaminationServiceImpl implements OaActExaminationService {

    @Resource
    private OaActExaminationMapper oaActExaminationMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActExamination oaActExamination, Integer userId, String randomId, Integer state) {
        oaActExamination.setId(randomId);
        oaActExamination.setCreateTime(new Date());
        oaActExamination.setPromoter(userId);
        oaActExamination.setUrl("examination");
        oaActExamination.setState(0);
        if (oaActExaminationMapper.insertSelective(oaActExamination) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActExamination.getTitle());
            oaCollaboration.setUrl("examination");
            oaCollaboration.setTable("oa_act_examination");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("职称(技术等级)考试申请表");
            oaCollaboration.setDataOne("拟考试职称（技术等级）名称:" + oaActExamination.getTechLevel());
            oaCollaboration.setDataTwo("拟考试时间:" + oaActExamination.getExamTime());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActExamination oaActExamination) {
        oaActExamination.setState(0);
        oaActExamination.setPrincipal("");
        oaActExamination.setPrincipalDate("");
        oaActExamination.setPrincipalContent("");
        oaActExamination.setPrincipalT("");
        oaActExamination.setPrincipalDateT("");
        oaActExamination.setPrincipalContentT("");
        oaActExamination.setSupervisor("");
        oaActExamination.setSupervisorDate("");
        oaActExamination.setSupervisorContent("");
        oaActExamination.setPersonnel("");
        oaActExamination.setPersonnelDate("");
        oaActExamination.setPersonnelContent("");
        oaActExamination.setCompanyPrincipal("");
        oaActExamination.setCompanyPrincipalDate("");
        oaActExamination.setCompanyPrincipalContent("");
        oaActExamination.setCreateTime(new Date());
        if (oaActExaminationMapper.updateByPrimaryKeySelective(oaActExamination) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActExamination selectByPrimaryKey(String id) {
        OaActExamination oaActExamination = oaActExaminationMapper.selectByPrimaryKey(id);
        oaActExamination.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActExamination.getCreateTime()));
        oaActExamination.setPromoterStr(userInfoMapper.getNicknameById(oaActExamination.getPromoter()));
        return oaActExamination;
    }


    @Override
    public int deleteData(String id) {
        return oaActExaminationMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActExamination oaActExamination) {
        return oaActExaminationMapper.updateByPrimaryKeySelective(oaActExamination);
    }
}
