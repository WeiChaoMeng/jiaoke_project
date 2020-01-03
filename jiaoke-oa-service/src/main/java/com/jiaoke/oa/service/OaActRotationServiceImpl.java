package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActRotation;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.DepartmentMapper;
import com.jiaoke.oa.dao.OaActRotationMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 员工轮岗审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActRotationServiceImpl implements OaActRotationService {

    @Resource
    private OaActRotationMapper oaActRotationMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private DepartmentMapper departmentMapper;

    @Override
    public int insert(OaActRotation oaActRotation, Integer userId, String randomId, Integer state) {
        oaActRotation.setId(randomId);
        oaActRotation.setCreateTime(new Date());
        oaActRotation.setPromoter(userId);
        oaActRotation.setUrl("rotation");
        if (oaActRotationMapper.insertSelective(oaActRotation) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActRotation.getTitle());
            oaCollaboration.setUrl("rotation");
            oaCollaboration.setTable("oa_act_rotation");
            oaCollaboration.setName("员工轮岗审请");
            oaCollaboration.setDataOne("转入部门：" + departmentMapper.selectDepartmentNameByDepartmentKey(oaActRotation.getNewDepartment()));
            if (oaActRotation.getAdjust() == 0) {
                oaCollaboration.setDataTwo("调整原因：关键岗位工作满5年");
            } else if (oaActRotation.getAdjust() == 1) {
                oaCollaboration.setDataTwo("调整原因：自愿申请");
            } else {
                oaCollaboration.setDataTwo("调整原因：工作需要");
            }

            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActRotation oaActRotation) {
        if (oaActRotationMapper.updateByPrimaryKeySelective(oaActRotation) < 0) {
            return -1;
        } else {
            oaCollaborationMapper.updateStateByCorrelationId(oaActRotation.getId(), 1, oaActRotation.getTitle());
            return 1;
        }
    }

    @Override
    public OaActRotation selectByPrimaryKey(String id) {
        OaActRotation oaActRotation = oaActRotationMapper.selectByPrimaryKey(id);
        oaActRotation.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActRotation.getCreateTime()));
        oaActRotation.setPromoterStr(userInfoMapper.getNicknameById(oaActRotation.getPromoter()));
        oaActRotation.setNewDepartmentStr(departmentMapper.selectDepartmentNameByDepartmentKey(oaActRotation.getNewDepartment()));
        return oaActRotation;
    }


    @Override
    public int deleteData(String id) {
        return oaActRotationMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActRotation oaActRotation) {
        return oaActRotationMapper.updateByPrimaryKeySelective(oaActRotation);
    }
}
