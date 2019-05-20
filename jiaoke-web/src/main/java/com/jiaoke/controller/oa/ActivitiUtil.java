package com.jiaoke.controller.oa;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.Comments;
import org.activiti.bpmn.model.FlowElement;
import org.activiti.bpmn.model.FlowNode;
import org.activiti.bpmn.model.Process;
import org.activiti.bpmn.model.SequenceFlow;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.RepositoryServiceImpl;
import org.activiti.engine.impl.identity.Authentication;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.util.ProcessDefinitionUtil;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.*;

/**
 * 工作流工具类
 *
 * @author lihui
 * @version 1.0
 * @date 2018/11/1 15:26
 */

@Component("activitiUtils")
public class ActivitiUtil {

    @Resource
    private RepositoryService repositoryService;

    @Resource
    private RuntimeService runtimeService;

    @Resource
    private TaskService taskService;

    @Resource
    private HistoryService historyService;

    /**
     * 查询所有部署信息
     *
     * @return list
     */
    public List<Deployment> getAllDeployment() {
        return repositoryService.createDeploymentQuery().orderByDeploymenTime().desc().list();
    }

    /**
     * 查询所有的流程定义信息
     *
     * @return list
     */
    public List<ProcessDefinition> getAllProcessDefinition() {
        return repositoryService.createProcessDefinitionQuery().list();
    }

    /**
     * 开启流程实例
     *
     * @param processDefinitionKey key
     * @param businessKey          businessKey
     * @param variables            variables
     */
    public String startProceesInstance(String processDefinitionKey, String businessKey, Map<String, Object> variables) {
        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(processDefinitionKey, businessKey, variables);
        return processInstance.getId();
    }

    /**
     * 通过流程实例Id获取任务Id
     *
     * @param processInstanceId 流程实例ID
     * @return Task
     */
    public Task getTaskIdByProcessInstanceId(String processInstanceId) {
        return taskService.createTaskQuery().processInstanceId(processInstanceId).singleResult();
    }

    /**
     * 指定公文会签人员
     *
     * @param taskId 任务ID
     * @param map    会签人名单
     */
    public void designatedCountersignPersonnel(String taskId, Map<String, Object> map) {
        taskService.complete(taskId, map);
    }

    /**
     * 获取任务根据Assignee
     *
     * @param assignee assignee
     * @return TaskList
     */
    public List<Task> getTaskByAssignee(Integer assignee, String processDefinitionKey) {
        return taskService.createTaskQuery().processDefinitionKey(processDefinitionKey).taskAssignee(assignee.toString()).orderByTaskCreateTime().desc().list();
    }

    /**
     * 查询已办任务
     *
     * @return list
     */
    public List<HistoricProcessInstance> getHistoricBusinessKey(String assignee, String processDefinitionKey) {
        Set<String> processInstanceIds = new HashSet<>();
        List<HistoricTaskInstance> historicTaskInstanceList = historyService.createHistoricTaskInstanceQuery().processDefinitionKey(processDefinitionKey).taskAssignee(assignee).orderByTaskId().desc().list();
        for (HistoricTaskInstance historicTaskInstance : historicTaskInstanceList) {
            processInstanceIds.add(historicTaskInstance.getProcessInstanceId());
        }
        return historyService.createHistoricProcessInstanceQuery().processInstanceIds(processInstanceIds).finished().orderByProcessInstanceId().desc().list();
    }

    /**
     * 查询历史任务实例
     *
     * @return list
     */
    public List<HistoricTaskInstance> selectHistoricTaskInstance(String assignee, String processDefinitionKey) {
        return historyService.createHistoricTaskInstanceQuery().processDefinitionKey(processDefinitionKey).taskAssignee(assignee).orderByTaskId().desc().list();
    }

    /**
     * 查询历史流程实例
     *
     * @return list
     */
    public List<HistoricProcessInstance> selectHistoricProcessInstance(List<HistoricTaskInstance> historicTaskInstanceList) {
        Set<String> processInstanceIds = new HashSet<>();
        for (HistoricTaskInstance historicTaskInstance : historicTaskInstanceList) {
            processInstanceIds.add(historicTaskInstance.getProcessInstanceId());
        }
        return historyService.createHistoricProcessInstanceQuery().processInstanceIds(processInstanceIds).finished().orderByProcessInstanceId().desc().list();
    }

    /**
     * 获取业务id根据任务id
     *
     * @param taskId 任务id
     * @return 业务id
     */
    public String getBusinessByTaskId(String taskId) {
        String processInstanceId = taskService.createTaskQuery().taskId(taskId).singleResult().getProcessInstanceId();
        return runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult().getBusinessKey();
    }

    /**
     * 完成任务
     *
     * @param taskId 任务id
     */
    public void completeTaskByTaskId(String taskId, Map<String, Object> map) {
        taskService.complete(taskId, map);
    }

    /**
     * 完成会签
     *
     * @param taskId 任务id
     */
    public void finishNotifyTask(String taskId) {
        taskService.complete(taskId);
    }

    /**
     * 获取已办任务
     *
     * @param userInfoId id
     * @return list
     */
    public List<String> historicTask(String userInfoId) {
        //获得当前用户处理的历史流程实例
        ArrayList<String> list = new ArrayList<>();
        List<HistoricTaskInstance> historicTaskInstanceList = historyService.createHistoricTaskInstanceQuery().taskAssignee(userInfoId).orderByTaskId().desc().list();
        if (historicTaskInstanceList.size() == 0) {
            return list;
        } else {
            Set<String> processInstanceIds = new HashSet<>();
            for (HistoricTaskInstance t : historicTaskInstanceList) {
                String processId = t.getProcessInstanceId();
                if (!processInstanceIds.contains(processId)) {
                    processInstanceIds.add(processId);
                }
            }

            //根据历史流程实例，获得业务key
            List<HistoricProcessInstance> hisProcessList = historyService.createHistoricProcessInstanceQuery().processInstanceIds(processInstanceIds).orderByProcessInstanceId().desc().list();
            for (HistoricProcessInstance p : hisProcessList) {
                list.add(p.getBusinessKey());
            }
            return list;
        }

    }

    public List<SequenceFlow> reject(String abc) {
        // 取得当前任务
        HistoricTaskInstance currTask = historyService
                .createHistoricTaskInstanceQuery().taskId(abc)
                .singleResult();


        // 取得流程实例(act_hi_procinst)
        ProcessInstance instance = runtimeService
                .createProcessInstanceQuery()
                .processInstanceId(currTask.getProcessInstanceId())
                .singleResult();

        // 取得流程定义(act_re_procdef)
        ProcessDefinitionEntity definition = (ProcessDefinitionEntity) ((RepositoryServiceImpl) repositoryService)
                .getDeployedProcessDefinition(currTask
                        .getProcessDefinitionId());

        System.out.println("哦哦哦" + currTask.getProcessDefinitionId());
        Process process = ProcessDefinitionUtil.getProcess(currTask.getProcessDefinitionId());
        FlowElement flowElement = process.getInitialFlowElement();
        FlowNode startActivity = (FlowNode) flowElement;
        System.out.println("坎坎坷坷" + startActivity.getOutgoingFlows());

        // 取得上一步活动
//        ActivityImpl currActivity = ((ProcessDefinitionImpl) definition)
//                .findActivity(currTask.getTaskDefinitionKey());

        return startActivity.getOutgoingFlows();
    }

    public void finishCountersignTask(String taskId, Map<String, Object> map, String annotationText) {
        taskService.addComment(taskId, null, annotationText);
        taskService.complete(taskId, map);
    }

    public List<Comments> selectComments(String taskId) {
        List<Comments> commentsList = new ArrayList<>();
        ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();
        TaskService taskService = processEngine.getTaskService();
        //1) 获取流程实例的ID
        Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
        ProcessInstance pi = processEngine.getRuntimeService().createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult();
        //2）通过流程实例查询所有的(用户任务类型)历史活动
        List<HistoricActivityInstance> hais = processEngine.getHistoryService().createHistoricActivityInstanceQuery().processInstanceId(pi.getId()).activityType("userTask").list();
        //3）查询每个历史任务的批注
        for (HistoricActivityInstance hai : hais) {
            List<Comment> comments = taskService.getTaskComments(hai.getTaskId());
            if (comments != null && comments.size() > 0) {
                for (Comment comment : comments) {
                    Comments comments1 = new Comments();
                    comments1.setUserName(comment.getUserId());
                    comments1.setTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(comment.getTime()));
                    comments1.setMessage(comment.getFullMessage());
                    commentsList.add(comments1);
                }
            }
        }

        return commentsList;
    }

    /**
     * 历史批注信息
     *
     * @param processInstance processInstance
     * @return list
     */
    public List<Comments> selectHistoryComment(String processInstance) {
        List<Comments> commentsList = new ArrayList<>();
        List<Comment> commentList = taskService.getProcessInstanceComments(processInstance);
        for (Comment comment : commentList) {
            Comments comments = new Comments();
            comments.setUserName(comment.getUserId());
            comments.setMessage(comment.getFullMessage());
            comments.setTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(comment.getTime()));
            commentsList.add(comments);
        }
        return commentsList;
    }

    public String finishTask(String processInstanceId, String processingOpinion, String taskId, String userName) {
        Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
        if (task == null) {
            return "error";
        } else {
            Authentication.setAuthenticatedUserId(userName);
            taskService.addComment(taskId, processInstanceId, processingOpinion);
            taskService.complete(taskId);
            return "success";
        }
    }
}
