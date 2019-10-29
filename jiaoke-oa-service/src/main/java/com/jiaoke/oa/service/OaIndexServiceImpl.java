package com.jiaoke.oa.service;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.OaCollaboration;
import com.jiaoke.oa.dao.OaCollaborationMapper;
import com.jiaoke.oa.dao.UserInfoMapper;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * OA模块首页
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:44
 */
@Service
public class OaIndexServiceImpl implements OaIndexService {

    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private OaCollaborationMapper oaCollaborationMapper;

    @Resource
    private TaskService taskService;

    @Resource
    private RuntimeService runtimeService;

    @Override
    public List<OaCollaboration> upcomingMatterData(List<Task> taskList) {

        Map<String, String> map = new HashMap<>(16);
        List<String> ids = new ArrayList<>();
        for (int i = 0; i < taskList.size(); i++) {
            if (i < 8) {
                //根据taskId获取businessKey
                String processInstanceId = taskService.createTaskQuery().taskId(taskList.get(i).getId()).singleResult().getProcessInstanceId();
                String businessKey = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult().getBusinessKey();
                String correlationId = businessKey.substring(businessKey.lastIndexOf(":") + 1);
                ids.add(correlationId);
                map.put(correlationId,taskList.get(i).getId());
            }
        }

        //根据idList查询数据
        List<OaCollaboration> oaCollaborationList = oaCollaborationMapper.selectMultipleData(ids);

        for (OaCollaboration collaboration : oaCollaborationList) {

            //封装taskId,发起人
            for (Map.Entry<String, String> entry : map.entrySet()) {

                if (collaboration.getCorrelationId().equals(entry.getKey())){
                    collaboration.setTaskId(entry.getValue());
                    collaboration.setPromoterStr(userInfoMapper.getNicknameById(collaboration.getPromoter()));
                    collaboration.setCreateTimeStr(DateUtil.dateConvertYYYYMMDD(collaboration.getCreateTime()));
                }
            }
        }

        return oaCollaborationList;
    }

    @Override
    public List<OaCollaboration> trackingMatterData(List<HistoricProcessInstance> processInstanceList) {

        List<String> ids = new ArrayList<>();
        //OA首页显示8条数据
        for (int i = 0; i < processInstanceList.size(); i++) {
            if (i < 8) {
                ids.add(processInstanceList.get(i).getBusinessKey().substring(processInstanceList.get(i).getBusinessKey().lastIndexOf(":") + 1));
            }
        }

        //根据idList查询数据
        List<OaCollaboration> oaCollaborationList = oaCollaborationMapper.selectMultipleData(ids);

        //封装数据
        for (OaCollaboration collaboration : oaCollaborationList) {

            for (HistoricProcessInstance processInstance : processInstanceList) {
                //获取审批表主键
                String s = processInstance.getBusinessKey().substring(processInstance.getBusinessKey().lastIndexOf(":") + 1);

                //封装TaskId和CurrentExecutor
                if (collaboration.getCorrelationId().equals(s)) {
                    collaboration.setCreateTimeStr(DateUtil.dateConvertYYYYMMDD(collaboration.getCreateTime()));
                    collaboration.setTaskId(processInstance.getId());
                    List<Task> taskList = taskService.createTaskQuery().processInstanceId(processInstance.getId()).list();

                    StringBuilder sb = new StringBuilder();
                    for (int i = 0; i < taskList.size(); i++) {
                        String nickname = userInfoMapper.getNicknameById(Integer.valueOf(taskList.get(i).getAssignee()));
                        sb.append(nickname);
                        if (i != taskList.size() -1){
                            sb.append(",");
                        }
                    }
                    collaboration.setCurrentExecutor(sb.toString());
                }
            }
        }
        return oaCollaborationList;
    }
}
