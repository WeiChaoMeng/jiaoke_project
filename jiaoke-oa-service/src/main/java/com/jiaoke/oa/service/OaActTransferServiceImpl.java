package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActTransfer;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 转岗申请表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActTransferServiceImpl implements OaActTransferService {

    @Resource
    private OaActTransferMapper oaActTransferMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private DepartmentMapper departmentMapper;

    @Override
    public int insert(OaActTransfer oaActTransfer, Integer userId, String randomId, Integer state) {
        oaActTransfer.setId(randomId);
        oaActTransfer.setCreateTime(new Date());
        oaActTransfer.setPromoter(userId);
        oaActTransfer.setUrl("transfer");
        if (oaActTransferMapper.insertSelective(oaActTransfer) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActTransfer.getTitle());
            oaCollaboration.setUrl("transfer");
            oaCollaboration.setTable("oa_act_transfer");
            oaCollaboration.setName("转岗审批");
            oaCollaboration.setDataOne("现岗位：" + oaActTransfer.getPresentPost());
            oaCollaboration.setDataTwo("拟转入岗位：" + oaActTransfer.getNewPost());
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActTransfer oaActTransfer) {
        if (oaActTransferMapper.updateByPrimaryKeySelective(oaActTransfer) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActTransfer.getId(), 1, oaActTransfer.getTitle());
            return 1;
        }
    }

    @Override
    public OaActTransfer selectByPrimaryKey(String id) {
        OaActTransfer oaActTransfer = oaActTransferMapper.selectByPrimaryKey(id);
        oaActTransfer.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActTransfer.getCreateTime()));
        oaActTransfer.setPromoterStr(userInfoMapper.getNicknameById(oaActTransfer.getPromoter()));
        oaActTransfer.setNewDepartmentStr(departmentMapper.selectDepartmentNameByDepartmentKey(oaActTransfer.getNewDepartment()));
        return oaActTransfer;
    }


    @Override
    public int deleteData(String id) {
        return oaActTransferMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActTransfer oaActTransfer) {
        return oaActTransferMapper.updateByPrimaryKeySelective(oaActTransfer);
    }
}
