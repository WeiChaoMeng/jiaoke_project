package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActConfirm;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.bean.OaConfirm;
import com.jiaoke.oa.dao.OaActConfirmMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.OaConfirmMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 确认单审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:17
 */
@Service
public class OaActConfirmServiceImpl implements OaActConfirmService {

    @Resource
    private OaActConfirmMapper oaActConfirmMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private OaConfirmMapper oaConfirmMapper;

    @Override
    public int insert(OaActConfirm oaActConfirm, Integer userId, String randomId, Integer state) {

        for (OaConfirm oaConfirm : oaActConfirm.getOaConfirmList()) {
            oaConfirm.setConfirmId(randomId);
        }

        //批量插入
        if (oaConfirmMapper.batchInsertData(oaActConfirm.getOaConfirmList()) < 0) {
            return -1;
        }

        oaActConfirm.setId(randomId);
        oaActConfirm.setCreateTime(new Date());
        oaActConfirm.setPromoter(userId);
        oaActConfirm.setUrl("confirm");
        if (oaActConfirmMapper.insertSelective(oaActConfirm) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActConfirm.getTitle());
            oaCollaboration.setUrl("confirm");
            oaCollaboration.setTable("oa_act_confirm");
            oaCollaboration.setName("确认单审批");
            oaCollaboration.setDataOne("确认名称:" + oaActConfirm.getName());
            oaCollaboration.setDataTwo("确认金额(员):" + oaActConfirm.getMoney());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActConfirm oaActConfirm) {
        oaActConfirm.setCreateTime(new Date());
        if (oaActConfirmMapper.updateByPrimaryKey(oaActConfirm) < 0) {
            return -1;
        } else {
            //删除详情关联数据
            oaConfirmMapper.deleteByConfirmId(oaActConfirm.getId());
            for (OaConfirm oaConfirm : oaActConfirm.getOaConfirmList()) {
                oaConfirm.setConfirmId(oaActConfirm.getId());
            }
            oaConfirmMapper.batchInsertData(oaActConfirm.getOaConfirmList());
            oaCollaborationMapper.updateStateByCorrelationId(oaActConfirm.getId(), 1, oaActConfirm.getTitle());
            return 1;
        }
    }

    @Override
    public OaActConfirm selectByPrimaryKey(String id) {
        OaActConfirm oaActConfirm = oaActConfirmMapper.selectByPrimaryKey(id);
        List<OaConfirm> oaConfirmList = oaConfirmMapper.selectByConfirmId(id);
        oaActConfirm.setOaConfirmList(oaConfirmList);
        oaActConfirm.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActConfirm.getCreateTime()));
        oaActConfirm.setPromoterStr(userInfoMapper.getNicknameById(oaActConfirm.getPromoter()));
        return oaActConfirm;
    }

    @Override
    public int deleteData(String id) {
        //删除详情关联数据
        oaConfirmMapper.deleteByConfirmId(id);
        return oaActConfirmMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActConfirm oaActConfirm) {
        return oaActConfirmMapper.updateByPrimaryKeySelective(oaActConfirm);
    }
}
