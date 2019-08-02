package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.bean.UserInfo;
import com.jiaoke.oa.dao.DepartmentMapper;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 协同
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
@Service
public class OaCollaborationServiceImpl implements OaCollaborationService {

    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private DepartmentMapper departmentMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Override
    public List<OaCollaboration> selectDone(List<OaCollaboration> oaCollaborations, String title) {

        List<String> list = new ArrayList<>();
        for (OaCollaboration oaCollaboration : oaCollaborations) {
            list.add(oaCollaboration.getCorrelationId());
        }
        //根据idList查询
        List<OaCollaboration> oaCollaborationList = oaCollaborationMapper.selectDone(list, title);

        for (OaCollaboration oc : oaCollaborationList) {

            for (OaCollaboration collaboration : oaCollaborations) {
                if (oc.getCorrelationId().equals(collaboration.getCorrelationId())) {
                    oc.setProcessInstanceId(collaboration.getProcessInstanceId());
                    oc.setPromoterStr(userInfoMapper.getNicknameById(oc.getPromoter()));
                    oc.setStartTimeStr(collaboration.getStartTimeStr());
                    if (!"已结束".equals(collaboration.getCurrentExecutor())) {
                        oc.setCurrentExecutor(userInfoMapper.getNicknameById(Integer.valueOf(collaboration.getCurrentExecutor())));
                    } else {
                        oc.setCurrentExecutor(collaboration.getCurrentExecutor());
                    }
                }
            }
        }
        return oaCollaborationList;
    }

    @Override
    public List<OaCollaboration> selectAlreadySend(List<OaCollaboration> oaCollaborations, String title) {

        List<String> list = new ArrayList<>();
        for (OaCollaboration oaCollaboration : oaCollaborations) {
            list.add(oaCollaboration.getCorrelationId());
        }
        //根据idList查询
        List<OaCollaboration> oaCollaborationList = oaCollaborationMapper.selectAlreadySend(list, title);

        for (OaCollaboration oaCollaboration : oaCollaborationList) {
            for (OaCollaboration collaboration : oaCollaborations) {
                if (oaCollaboration.getCorrelationId().equals(collaboration.getCorrelationId())) {
                    oaCollaboration.setStartTimeStr(collaboration.getStartTimeStr());
                    oaCollaboration.setProcessInstanceId(collaboration.getProcessInstanceId());
                    if (!"已结束".equals(collaboration.getCurrentExecutor())) {
                        oaCollaboration.setCurrentExecutor(userInfoMapper.getNicknameById(Integer.valueOf(collaboration.getCurrentExecutor())));
                    } else {
                        oaCollaboration.setCurrentExecutor(collaboration.getCurrentExecutor());
                    }
                }
            }
        }
        return oaCollaborationList;
    }

    @Override
    public List<OaCollaboration> selectPending(List<OaCollaboration> oaCollaborations, String title) {
        List<String> list = new ArrayList<>();
        for (OaCollaboration oaCollaboration : oaCollaborations) {
            list.add(oaCollaboration.getCorrelationId());
        }
        //根据idList查询
        List<OaCollaboration> oaCollaborationList = oaCollaborationMapper.selectPending(list, title);

        for (OaCollaboration oc : oaCollaborationList) {
            for (OaCollaboration collaboration : oaCollaborations) {
                if (oc.getCorrelationId().equals(collaboration.getCorrelationId())) {
                    oc.setStartTimeStr(collaboration.getStartTimeStr());
                    oc.setProcessInstanceId(collaboration.getProcessInstanceId());
                    oc.setTaskId(collaboration.getTaskId());
                    oc.setCreateTimeStr(collaboration.getCreateTimeStr());
                    oc.setReceiptTimeStr(collaboration.getReceiptTimeStr());
                    //上一个处理人
                    if (collaboration.getPreviousApprover().contains("${")) {
                        String departmentKey = userInfoMapper.selectDepartment(collaboration.getPromoter());
                        String assignee = collaboration.getPreviousApprover();
                        String enforcer = assignee.substring(assignee.indexOf("{") + 1, assignee.indexOf("}"));

                        //部门
                        if ("principal".equals(enforcer) || "supervisor".equals(enforcer)) {
                            String userId = departmentMapper.selectEnforcer(enforcer, departmentKey);
                            String nickname = userInfoMapper.getNicknameById(Integer.valueOf(userId));
                            oc.setPreviousApprover(nickname);
                        } else {
                            //权限
                            UserInfo userInfo = userInfoMapper.selectByPermission(enforcer);
                            oc.setPreviousApprover(userInfo.getNickname());
                        }
                    } else if ("网关".equals(collaboration.getPreviousApprover())) {
                        oc.setPreviousApprover(collaboration.getPreviousApprover());
                    } else {
                        //上个处理人是发起人的处理
                        String nickname = userInfoMapper.getNicknameById(Integer.valueOf(collaboration.getPreviousApprover()));
                        oc.setPreviousApprover(nickname);
                    }
                    //设置发起人
                    oc.setPromoterStr(userInfoMapper.getNicknameById(collaboration.getPromoter()));
                }
            }
        }
        return oaCollaborationList;
    }

    @Override
    public List<OaCollaboration> selectWaitSend(Integer userId, String title) {
        List<OaCollaboration> oaCollaborationList = oaCollaborationMapper.selectWaitSend(userId, title);
        for (OaCollaboration oaCollaboration : oaCollaborationList) {
            oaCollaboration.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(oaCollaboration.getCreateTime()));
        }
        return oaCollaborationList;
    }

    @Override
    public int updateStateByCorrelationId(String correlationId, Integer state, String title) {
        return oaCollaborationMapper.updateStateByCorrelationId(correlationId, state, title);
    }

    @Override
    public int delete(String correlationId, String table) {
        //删除待发数据
        if (oaCollaborationMapper.deleteByCorrelationId(correlationId) < 0) {
            return -1;
        } else {
            //删除关联表数据
            if (oaCollaborationMapper.deleteCorrelationTable(correlationId, table) < 0) {
                return -1;
            } else {
                return 1;
            }
        }
    }

    @Override
    public int deleteByCorrelationId(String correlationId) {
        return oaCollaborationMapper.deleteByCorrelationId(correlationId);
    }

    @Override
    public int updateState(String correlationId, Integer state) {
        return oaCollaborationMapper.updateState(correlationId, state);
    }
}
