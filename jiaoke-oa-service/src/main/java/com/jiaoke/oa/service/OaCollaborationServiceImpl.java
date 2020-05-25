package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiake.utils.FileUploadUtil;
import com.jiaoke.oa.bean.*;
import com.jiaoke.oa.dao.*;
import io.swagger.models.auth.In;
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

    @Resource
    private OaOvertimeStatisticsMapper oaOvertimeStatisticsMapper;

    @Resource
    private OaOfficeSuppliesMapper oaOfficeSuppliesMapper;

    @Resource
    private OaAcceptanceWarehousingMapper oaAcceptanceWarehousingMapper;

    @Resource
    private OaConfirmMapper oaConfirmMapper;

    @Resource
    private OaUnitPriceMapper oaUnitPriceMapper;

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

                    StringBuilder sb = new StringBuilder();
                    List<String> executorList = collaboration.getCurrentExecutorList();
                    for (int i = 0; i < executorList.size(); i++) {
                        if (!"已结束".equals(executorList.get(i))) {
                            String nickname = userInfoMapper.getNicknameById(Integer.valueOf(executorList.get(i)));
                            sb.append(nickname);
                            if (i != executorList.size() - 1) {
                                sb.append(",");
                            }
                        } else {
                            sb.append(executorList.get(i));
                        }
                    }
                    oc.setCurrentExecutor(sb.toString());
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

                    StringBuilder sb = new StringBuilder();
                    List<String> executorList = collaboration.getCurrentExecutorList();
                    for (int i = 0; i < executorList.size(); i++) {
                        if (!"已结束".equals(executorList.get(i))) {
                            String nickname = userInfoMapper.getNicknameById(Integer.valueOf(executorList.get(i)));
                            sb.append(nickname);
                            if (i != executorList.size() - 1) {
                                sb.append(",");
                            }
                        } else {
                            sb.append(executorList.get(i));
                        }
                    }
                    oaCollaboration.setCurrentExecutor(sb.toString());
                }
            }
        }
        return oaCollaborationList;
    }

    @Override
    public int batchDeleteAlreadySend(String table, String id) {
        return oaCollaborationMapper.batchDeleteAlreadySend(table,id);
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

                        String previousNodeInfo = oaCollaborationMapper.selectPreviousNodeInfo(enforcer, collaboration.getTable(), collaboration.getCorrelationId());
                        //上个节点不为空
                        if (!("".equals(previousNodeInfo ) || previousNodeInfo == null)){
                            oc.setPreviousApprover(previousNodeInfo);

                        }else{
                            if ("principal".equals(enforcer)) {
                                String userId = departmentMapper.selectEnforcer(enforcer, departmentKey);
                                if (userId.contains(",")){
                                    StringBuilder stringBuilder = new StringBuilder();
                                    String[] split = userId.split(",");
                                    for (String s : split) {
                                        stringBuilder.append(userInfoMapper.getNicknameById(Integer.valueOf(s))).append(",");
                                    }
                                    oc.setPreviousApprover(stringBuilder.substring(0,stringBuilder.length()-1));
                                }else{
                                    String nickname = userInfoMapper.getNicknameById(Integer.valueOf(userId));
                                    oc.setPreviousApprover(nickname);
                                }
                            }else if ("supervisor".equals(enforcer)) {
                                String userId = departmentMapper.selectEnforcer(enforcer, departmentKey);
                                String nickname = userInfoMapper.getNicknameById(Integer.valueOf(userId));
                                oc.setPreviousApprover(nickname);
                            } else {
                                //权限
                                oc.setPreviousApprover(oaCollaborationMapper.selectPreviousNodeInfo(enforcer,collaboration.getTable(),collaboration.getCorrelationId()));
                                UserInfo userInfo = userInfoMapper.selectByPermission(enforcer);
                                oc.setPreviousApprover(userInfo.getNickname());
                            }
                        }
//                        oc.setPreviousApprover(oaCollaborationMapper.selectPreviousNodeInfo(enforcer, collaboration.getTable(), collaboration.getCorrelationId()));
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
        //分隔符
        String delimiter = ",";
        //加班统计表关联表
        String overtime = "oa_act_overtime";
        //办公用品计划表
        String officeSupplies = "oa_act_office_supplies";
        //验收入库表
        String acceptanceWarehousing = "oa_act_acceptance_warehousing";
        //确认单
        String confirm = "oa_act_confirm";
        //单价审批单
        String unitPrice = "oa_act_unit_price";
        //删除待发数据
        if (oaCollaborationMapper.deleteByCorrelationId(correlationId) < 0) {
            return -1;
        } else {
            //删除前删除数据中的附件
            String annex = oaCollaborationMapper.selectAnnex(correlationId, table);
            if (annex.contains(delimiter)) {
                String[] strings = annex.split(",");
                for (String string : strings) {
                    FileUploadUtil.deleteFile(string);
                }
            } else if (!"".equals(annex)) {
                FileUploadUtil.deleteFile(annex);
            }

            //删除关联表数据
            if (oaCollaborationMapper.deleteCorrelationTable(correlationId, table) < 0) {
                return -1;
            } else {
                //删除加班统计表关联表
                if (overtime.equals(table)) {
                    oaOvertimeStatisticsMapper.deleteByOvertimeId(correlationId);

                    //删除办公用品关联表数据
                }else if (officeSupplies.equals(table)) {
                    oaOfficeSuppliesMapper.deleteByOfficeSuppliesId(correlationId);

                    //删除验收入库表关联表数据
                }else if (acceptanceWarehousing.equals(table)) {
                    oaAcceptanceWarehousingMapper.deleteByAcceptanceWarehousingId(correlationId);
                }

                    //删除确认单关联表数据
                else if (confirm.equals(table)) {
                    oaConfirmMapper.deleteByConfirmId(correlationId);
                }
                    //删除单价审批表关联表数据
                else if (unitPrice.equals(table)) {
                    oaUnitPriceMapper.deleteByUnitPriceId(correlationId);
                }
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

    @Override
    public int updateStatusCode(String correlationId, String statusCode) {
        return oaCollaborationMapper.updateStatusCode(correlationId,statusCode);
    }
}
