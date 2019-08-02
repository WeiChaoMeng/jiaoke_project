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
        oaActAdjustWages.setEntryDate(DateUtil.stringConvertYYYYMMDD(oaActAdjustWages.getEntryDateStr()));
        oaActAdjustWages.setId(randomId);
        oaActAdjustWages.setCreateTime(new Date());
        oaActAdjustWages.setPromoter(userId);
        oaActAdjustWages.setUrl("adjustWages");
        if (oaActAdjustWagesMapper.insert(oaActAdjustWages) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActAdjustWages.getTitle());
            oaCollaboration.setUrl("adjustWages");
            oaCollaboration.setTable("oa_act_adjust_wages");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActAdjustWages oaActAdjustWages) {
        oaActAdjustWages.setEntryDate(DateUtil.stringConvertYYYYMMDD(oaActAdjustWages.getEntryDateStr()));
        if (oaActAdjustWagesMapper.updateByPrimaryKeySelective(oaActAdjustWages) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActAdjustWages.getId(), 1, oaActAdjustWages.getTitle());
            return 1;
        }
    }

    @Override
    public OaActAdjustWages selectByPrimaryKey(String id) {
        OaActAdjustWages oaActAdjustWages = oaActAdjustWagesMapper.selectByPrimaryKey(id);
        oaActAdjustWages.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActAdjustWages.getCreateTime()));
        oaActAdjustWages.setEntryDateStr(DateUtil.dateConvertYYYYMMDD(oaActAdjustWages.getEntryDate()));
        oaActAdjustWages.setPromoterStr(userInfoMapper.getNicknameById(oaActAdjustWages.getPromoter()));
        return oaActAdjustWages;
    }


    @Override
    public int deleteData(String id) {
        return oaActAdjustWagesMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateAnnexes(String[] array, String id) {
        OaActAdjustWages oaActAdjustWages = new OaActAdjustWages();
        oaActAdjustWages.setId(id);
        if (array != null) {
            oaActAdjustWages.setAnnex(StringUtils.join(array));
        } else {
            oaActAdjustWages.setAnnex("");
        }
        return oaActAdjustWagesMapper.updateByPrimaryKeySelective(oaActAdjustWages);
    }
}
