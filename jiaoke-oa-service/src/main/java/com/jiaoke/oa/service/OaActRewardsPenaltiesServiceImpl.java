package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActRewardsPenalties;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActRewardsPenaltiesMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 奖罚意见表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActRewardsPenaltiesServiceImpl implements OaActRewardsPenaltiesService {

    @Resource
    private OaActRewardsPenaltiesMapper oaActRewardsPenaltiesMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActRewardsPenalties oaActRewardsPenalties, Integer userId, String randomId, Integer state) {
        oaActRewardsPenalties.setId(randomId);
        oaActRewardsPenalties.setCreateTime(new Date());
        oaActRewardsPenalties.setPromoter(userId);
        oaActRewardsPenalties.setUrl("rewardsPenalties");
        oaActRewardsPenalties.setSupervisorCountersign("各部门主管");
        oaActRewardsPenalties.setState(0);
        if (oaActRewardsPenaltiesMapper.insertSelective(oaActRewardsPenalties) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActRewardsPenalties.getTitle());
            oaCollaboration.setUrl("rewardsPenalties");
            oaCollaboration.setTable("oa_act_rewards_penalties");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("奖罚意见表");
            oaCollaboration.setDataOne("奖罚月份:" + oaActRewardsPenalties.getMonth());
            oaCollaboration.setDataTwo("申请时间：" + DateUtil.dateConvertYYYYMMDDHHMMSS(new Date()));
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActRewardsPenalties oaActRewardsPenalties) {
        oaActRewardsPenalties.setState(0);
        oaActRewardsPenalties.setOffice("");
        oaActRewardsPenalties.setOfficeDate("");
        oaActRewardsPenalties.setOfficeContent("");
        oaActRewardsPenalties.setQuality("");
        oaActRewardsPenalties.setQualityDate("");
        oaActRewardsPenalties.setQualityContent("");
        oaActRewardsPenalties.setBusiness("");
        oaActRewardsPenalties.setBusinessDate("");
        oaActRewardsPenalties.setBusinessContent("");
        oaActRewardsPenalties.setProduction("");
        oaActRewardsPenalties.setProductionDate("");
        oaActRewardsPenalties.setProductionContent("");
        oaActRewardsPenalties.setFinancial("");
        oaActRewardsPenalties.setFinancialDate("");
        oaActRewardsPenalties.setFinancialContent("");
        oaActRewardsPenalties.setPersonnelCensor("");
        oaActRewardsPenalties.setPersonnelCensorDate("");
        oaActRewardsPenalties.setPersonnelCensorContent("");
        oaActRewardsPenalties.setPersonnel("");
        oaActRewardsPenalties.setPersonnelDate("");
        oaActRewardsPenalties.setPersonnelContent("");
        oaActRewardsPenalties.setCompanyPrincipal("");
        oaActRewardsPenalties.setCompanyPrincipalDate("");
        oaActRewardsPenalties.setCompanyPrincipalContent("");
        oaActRewardsPenalties.setCreateTime(new Date());
        if (oaActRewardsPenaltiesMapper.updateByPrimaryKeySelective(oaActRewardsPenalties) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActRewardsPenalties selectByPrimaryKey(String id) {
        OaActRewardsPenalties oaActRewardsPenalties = oaActRewardsPenaltiesMapper.selectByPrimaryKey(id);
        oaActRewardsPenalties.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActRewardsPenalties.getCreateTime()));
        oaActRewardsPenalties.setPromoterStr(userInfoMapper.getNicknameById(oaActRewardsPenalties.getPromoter()));
        return oaActRewardsPenalties;
    }


    @Override
    public int deleteData(String id) {
        return oaActRewardsPenaltiesMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateAnnexes(String[] array, String id) {
        OaActRewardsPenalties oaActRewardsPenalties = new OaActRewardsPenalties();
        oaActRewardsPenalties.setId(id);
        if (array != null) {
            oaActRewardsPenalties.setAnnex(StringUtils.join(array));
        } else {
            oaActRewardsPenalties.setAnnex("");
        }
        return oaActRewardsPenaltiesMapper.updateByPrimaryKeySelective(oaActRewardsPenalties);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActRewardsPenalties oaActRewardsPenalties) {
        return oaActRewardsPenaltiesMapper.updateByPrimaryKeySelective(oaActRewardsPenalties);
    }
}
