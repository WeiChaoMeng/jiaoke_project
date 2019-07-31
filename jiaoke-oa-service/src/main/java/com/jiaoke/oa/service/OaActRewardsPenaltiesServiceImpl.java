package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActRewardsPenalties;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActRewardsPenaltiesMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
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

    @Override
    public int insert(OaActRewardsPenalties oaActRewardsPenalties, Integer userId, String randomId, Integer state) {
        oaActRewardsPenalties.setMonth(DateUtil.stringConvertYYYYMMDD(oaActRewardsPenalties.getMonthStr()));
        oaActRewardsPenalties.setId(randomId);
        oaActRewardsPenalties.setCreateTime(new Date());
        oaActRewardsPenalties.setPromoter(userId);
        oaActRewardsPenalties.setUrl("rewardsPenalties");
        if (oaActRewardsPenaltiesMapper.insert(oaActRewardsPenalties) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActRewardsPenalties.getTitle());
            oaCollaboration.setUrl("rewardsPenalties");
            oaCollaboration.setTable("oa_act_rewards_penalties");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActRewardsPenalties oaActRewardsPenalties) {
        oaActRewardsPenalties.setMonth(DateUtil.stringConvertYYYYMMDD(oaActRewardsPenalties.getMonthStr()));
        if (oaActRewardsPenaltiesMapper.updateByPrimaryKeySelective(oaActRewardsPenalties) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActRewardsPenalties.getId(), 1, oaActRewardsPenalties.getTitle());
            return 1;
        }
    }

    @Override
    public OaActRewardsPenalties selectByPrimaryKey(String id) {
        OaActRewardsPenalties oaActRewardsPenalties = oaActRewardsPenaltiesMapper.selectByPrimaryKey(id);
        oaActRewardsPenalties.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActRewardsPenalties.getCreateTime()));
        oaActRewardsPenalties.setMonthStr(DateUtil.dateConvertYYYYMMDD(oaActRewardsPenalties.getMonth()));
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
}
