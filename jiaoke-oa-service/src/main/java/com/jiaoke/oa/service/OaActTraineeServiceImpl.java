package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaActTrainee;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaActTraineeMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 毕业生见习期满考核鉴定表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
@Service
public class OaActTraineeServiceImpl implements OaActTraineeService {

    @Resource
    private OaActTraineeMapper oaActTraineeMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(OaActTrainee oaActTrainee, Integer userId, String randomId, Integer state) {
        oaActTrainee.setId(randomId);
        oaActTrainee.setCreateTime(new Date());
        oaActTrainee.setPromoter(userId);
        oaActTrainee.setUrl("trainee");
        oaActTrainee.setState(0);
        if (oaActTraineeMapper.insertSelective(oaActTrainee) < 0) {
            return -1;
        } else {
            OaCollaboration oaCollaboration = new OaCollaboration();
            oaCollaboration.setCorrelationId(randomId);
            oaCollaboration.setPromoter(userId);
            oaCollaboration.setTitle(oaActTrainee.getTitle());
            oaCollaboration.setUrl("trainee");
            oaCollaboration.setTable("oa_act_trainee");
            oaCollaboration.setStatusCode("协同");
            oaCollaboration.setName("毕业生见习期满考核鉴定表");
            oaCollaboration.setDataOne("见习期:从" + oaActTrainee.getInternship());
            oaCollaboration.setDataTwo("见习期工资:" + oaActTrainee.getWages() + "月/元");
            oaCollaboration.setState(state);
            oaCollaboration.setCreateTime(new Date());
            oaCollaborationMapper.insertData(oaCollaboration);
            return 1;
        }
    }

    @Override
    public int edit(OaActTrainee oaActTrainee) {
        oaActTrainee.setState(0);
        oaActTrainee.setCompanyPrincipal("");
        oaActTrainee.setCompanyPrincipalDate("");
        oaActTrainee.setCompanyPrincipalContent("");
        oaActTrainee.setCreateTime(new Date());
        if (oaActTraineeMapper.updateByPrimaryKeySelective(oaActTrainee) < 0) {
            return -1;
        } else {
            return 1;
        }
    }

    @Override
    public OaActTrainee selectByPrimaryKey(String id) {
        OaActTrainee oaActTrainee = oaActTraineeMapper.selectByPrimaryKey(id);
        oaActTrainee.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaActTrainee.getCreateTime()));
        oaActTrainee.setPromoterStr(userInfoMapper.getNicknameById(oaActTrainee.getPromoter()));
        return oaActTrainee;
    }


    @Override
    public int deleteData(String id) {
        return oaActTraineeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OaActTrainee oaActTrainee) {
        return oaActTraineeMapper.updateByPrimaryKeySelective(oaActTrainee);
    }
}
