package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActMeals;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActMealsMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 客饭审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActMealsServiceImpl implements OaActMealsService {

    @Resource
    private OaActMealsMapper oaActMealsMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Override
    public int insert(OaActMeals oaActMeals, Integer userId, String randomId, Integer state) {
        oaActMeals.setDiningTime(DateUtil.stringConvertYYYYMMDDHHMM(oaActMeals.getDiningTimeStr()));
        oaActMeals.setId(randomId);
        oaActMeals.setCreateTime(new Date());
        oaActMeals.setPromoter(userId);
        oaActMeals.setUrl("meals");
        if (oaActMealsMapper.insertData(oaActMeals) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActMeals.getTitle());
            oaCollaboration.setUrl("meals");
            oaCollaboration.setTable("oa_act_meals");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActMeals oaActMeals) {
        oaActMeals.setDiningTime(DateUtil.stringConvertYYYYMMDDHHMM(oaActMeals.getDiningTimeStr()));
        oaActMeals.setCreateTime(new Date());
        if (oaActMealsMapper.updateByPrimaryKey(oaActMeals) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActMeals.getId(), 1, oaActMeals.getTitle());
            return 1;
        }
    }

    @Override
    public OaActMeals selectByPrimaryKey(String id) {
        OaActMeals oaActMeals = oaActMealsMapper.selectByPrimaryKey(id);
        oaActMeals.setDiningTimeStr(DateUtil.dateConvertYYYYMMDDHHMM(oaActMeals.getDiningTime()));
        oaActMeals.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActMeals.getCreateTime()));
        return oaActMeals;
    }


    @Override
    public int deleteData(String id) {
        return oaActMealsMapper.deleteByPrimaryKey(id);
    }
}
