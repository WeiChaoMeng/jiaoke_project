package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActOfficeSupplies;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActOfficeSuppliesMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 办公用品需求计划
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:29
 */
@Service
public class OaActOfficeSuppliesServiceImpl implements OaActOfficeSuppliesService {

    @Resource
    private OaActOfficeSuppliesMapper oaActOfficeSuppliesMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int deleteData(String id) {
        return oaActOfficeSuppliesMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(OaActOfficeSupplies oaActOfficeSupplies, Integer userId, String randomId, Integer state) {
        oaActOfficeSupplies.setCreateTime(new Date());
        oaActOfficeSupplies.setId(randomId);
        oaActOfficeSupplies.setPromoter(userId);
        oaActOfficeSupplies.setUrl("officeSupplies");
        if (oaActOfficeSuppliesMapper.insertSelective(oaActOfficeSupplies) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActOfficeSupplies.getTitle());
            oaCollaboration.setUrl("officeSupplies");
            oaCollaboration.setTable("oa_act_office_supplies");
            oaCollaboration.setName("办公用品需求计划");
            oaCollaboration.setDataOne("申请部门:" + oaActOfficeSupplies.getDepartment());
            oaCollaboration.setDataTwo("合计:" + oaActOfficeSupplies.getTotal());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActOfficeSupplies oaActOfficeSupplies) {
        oaActOfficeSupplies.setCreateTime(new Date());
        if (oaActOfficeSuppliesMapper.updateByPrimaryKey(oaActOfficeSupplies) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActOfficeSupplies.getId(), 1, oaActOfficeSupplies.getTitle());
            return 1;
        }
    }

    @Override
    public OaActOfficeSupplies selectByPrimaryKey(String id) {
        OaActOfficeSupplies oaActOfficeSupplies = oaActOfficeSuppliesMapper.selectByPrimaryKey(id);
        oaActOfficeSupplies.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActOfficeSupplies.getCreateTime()));
        oaActOfficeSupplies.setPromoterStr(userInfoMapper.getNicknameById(oaActOfficeSupplies.getPromoter()));
        return oaActOfficeSupplies;
    }

    @Override
    public int updateByPrimaryKeySelective(OaActOfficeSupplies oaActOfficeSupplies) {
        return oaActOfficeSuppliesMapper.updateByPrimaryKeySelective(oaActOfficeSupplies);
    }
}
