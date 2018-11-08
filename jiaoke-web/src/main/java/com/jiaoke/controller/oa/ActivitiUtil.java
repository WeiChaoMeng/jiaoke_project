package com.jiaoke.controller.oa;

import org.activiti.engine.*;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
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
    public List<Task> getTaskByAssignee(Integer assignee) {
        return taskService.createTaskQuery().taskAssignee(assignee.toString()).orderByTaskCreateTime().desc().list();
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
     * @param taskId        任务id
     * @param variableName  变量名
     * @param variableValue 变量值
     */
    public void completeTaskByTaskId(String taskId, String variableName, Object variableValue) {
        taskService.setVariable(taskId, variableName, variableValue);
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
        List<HistoricTaskInstance> historicTaskInstanceList = historyService.createHistoricTaskInstanceQuery().taskAssignee(userInfoId).orderByTaskId().desc().list();
        Set<String> processInstanceIds = new HashSet<>();
        for (HistoricTaskInstance t : historicTaskInstanceList) {
            String processId = t.getProcessInstanceId();
            if (!processInstanceIds.contains(processId)) {
                processInstanceIds.add(processId);
            }
        }

        //根据历史流程实例，获得业务key
        ArrayList<String> list = new ArrayList<>();
        List<HistoricProcessInstance> hisProcessList = historyService.createHistoricProcessInstanceQuery().processInstanceIds(processInstanceIds).orderByProcessInstanceId().desc().list();
        for (HistoricProcessInstance p : hisProcessList) {
            list.add(p.getBusinessKey());
        }
        return list;
    }
}
