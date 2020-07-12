package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActLeave;
import com.jiaoke.oa.bean.OaActTaxiUse;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActTaxiUseMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 用车审批表（出租车）
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActTaxiUseServiceImpl implements OaActTaxiUseService {

    @Resource
    private OaActTaxiUseMapper oaActTaxiUseMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActTaxiUse oaActTaxiUse, Integer userId, String randomId, Integer state) {
        oaActTaxiUse.setId(randomId);
        oaActTaxiUse.setCreateTime(new Date());
        oaActTaxiUse.setPromoter(userId);
        oaActTaxiUse.setUrl("taxiUse");
        oaActTaxiUse.setState(0);
        if (oaActTaxiUseMapper.insertSelective(oaActTaxiUse) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActTaxiUse.getTitle());
            oaCollaboration.setUrl("taxiUse");
            oaCollaboration.setTable("oa_act_taxi_use");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("用车审批表（出租车）");
            oaCollaboration.setDataOne("用车时间:" + oaActTaxiUse.getUseTime());
            oaCollaboration.setDataTwo("事由:" + oaActTaxiUse.getReason());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActTaxiUse oaActTaxiUse) {
        oaActTaxiUse.setState(0);
        oaActTaxiUse.setPrincipal("");
        oaActTaxiUse.setPrincipalDate("");
        oaActTaxiUse.setSupervisor("");
        oaActTaxiUse.setSupervisorDate("");
        if (oaActTaxiUseMapper.updateByPrimaryKeySelective(oaActTaxiUse) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActTaxiUse selectByPrimaryKey(String id) {
        OaActTaxiUse oaActTaxiUse = oaActTaxiUseMapper.selectByPrimaryKey(id);
        oaActTaxiUse.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActTaxiUse.getCreateTime()));
        oaActTaxiUse.setPromoterStr(userInfoMapper.getNicknameById(oaActTaxiUse.getPromoter()));
        return oaActTaxiUse;
    }


    @Override
    public int deleteData(String id) {
        return oaActTaxiUseMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActTaxiUse oaActTaxiUse) {
        return oaActTaxiUseMapper.updateByPrimaryKeySelective(oaActTaxiUse);
    }
}
