package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActAdjustWages;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActAdjustWagesMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 调资审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActAdjustWagesServiceImpl implements OaActAdjustWagesService {

    @Resource
    private OaActAdjustWagesMapper oaActAdjustWagesMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActAdjustWages oaActAdjustWages, Integer userId, String randomId, Integer state) {
        oaActAdjustWages.setId(randomId);
        oaActAdjustWages.setCreateTime(new Date());
        oaActAdjustWages.setPromoter(userId);
        oaActAdjustWages.setUrl("adjustWages");
        oaActAdjustWages.setState(0);
        if (oaActAdjustWagesMapper.insert(oaActAdjustWages) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActAdjustWages.getTitle());
            oaCollaboration.setUrl("adjustWages");
            oaCollaboration.setTable("oa_act_adjust_wages");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("转正申请");
            oaCollaboration.setDataOne("目前薪资:" + oaActAdjustWages.getCurrentSalary());
            oaCollaboration.setDataTwo("期望薪资:" + oaActAdjustWages.getSalaryExpectation());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActAdjustWages oaActAdjustWages) {
        oaActAdjustWages.setState(0);
        oaActAdjustWages.setPersonnelCensor("");
        oaActAdjustWages.setPrincipal("");
        oaActAdjustWages.setPrincipalDate("");
        oaActAdjustWages.setPrincipalContent("");
        oaActAdjustWages.setPrincipalT("");
        oaActAdjustWages.setPrincipalDateT("");
        oaActAdjustWages.setPrincipalContentT("");
        oaActAdjustWages.setSupervisor("");
        oaActAdjustWages.setSupervisorDate("");
        oaActAdjustWages.setSupervisorContent("");
        oaActAdjustWages.setPersonnel("");
        oaActAdjustWages.setPersonnelDate("");
        oaActAdjustWages.setPersonnelContent("");
        oaActAdjustWages.setCompanyPrincipal("");
        oaActAdjustWages.setCompanyPrincipalDate("");
        oaActAdjustWages.setCompanyPrincipalContent("");
        oaActAdjustWages.setCreateTime(new Date());
        if (oaActAdjustWagesMapper.updateByPrimaryKeySelective(oaActAdjustWages) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActAdjustWages selectByPrimaryKey(String id) {
        OaActAdjustWages oaActAdjustWages = oaActAdjustWagesMapper.selectByPrimaryKey(id);
        oaActAdjustWages.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActAdjustWages.getCreateTime()));
        oaActAdjustWages.setPromoterStr(userInfoMapper.getNicknameById(oaActAdjustWages.getPromoter()));
        return oaActAdjustWages;
    }


    @Override
    public int deleteData(String id) {
        return oaActAdjustWagesMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActAdjustWages oaActAdjustWages) {
        return oaActAdjustWagesMapper.updateByPrimaryKeySelective(oaActAdjustWages);
    }
}
