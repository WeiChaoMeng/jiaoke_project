package com.jiaoke.controller.oa;

import org.activiti.bpmn.model.FlowElement;
import org.activiti.bpmn.model.Process;
import org.activiti.engine.ActivitiEngineAgenda;
import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.impl.interceptor.CommandContext;
import org.activiti.engine.impl.persistence.entity.ExecutionEntity;
import org.activiti.engine.impl.persistence.entity.ExecutionEntityManager;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.impl.persistence.entity.TaskEntityManager;
import org.activiti.engine.impl.util.ProcessDefinitionUtil;

/**
 * 目标流节点命令
 *
 * @author lihui
 * @version 1.0
 * @date 2019-7-29 17:23
 */
public class TargetFlowNodeCommand implements Command<Object> {
    /**
     * 当前TaskId
     */
    private String currentTaskId;

    /**
     * 目标流程定义节点Id
     */
    private String targetNodeId;

    public TargetFlowNodeCommand(String currentTaskId, String targetNodeId) {
        this.currentTaskId = currentTaskId;
        this.targetNodeId = targetNodeId;
    }

    public String getCurrentTaskId() {
        return currentTaskId;
    }

    public void setCurrentTaskId(String currentTaskId) {
        this.currentTaskId = currentTaskId;
    }

    public String getTargetNodeId() {
        return targetNodeId;
    }

    public void setTargetNodeId(String targetNodeId) {
        this.targetNodeId = targetNodeId;
    }

    @Override
    public Object execute(CommandContext commandContext) {
        //获取执行实体管理器
        ExecutionEntityManager executionEntityManager = commandContext.getExecutionEntityManager();
        //获取任务实体管理器
        TaskEntityManager taskEntityManager = commandContext.getTaskEntityManager();
        // 获取当前任务的来源任务及来源节点信息
        TaskEntity taskEntity = taskEntityManager.findById(currentTaskId);
        ExecutionEntity executionEntity = executionEntityManager.findById(taskEntity.getExecutionId());
        Process process = ProcessDefinitionUtil.getProcess(executionEntity.getProcessDefinitionId());
        // 删除当前节点
//        taskEntityManager.deleteTask(taskEntity, "", true, true);
        // 获取要跳转的目标节点
        FlowElement targetFlowElement = process.getFlowElement(targetNodeId);
        executionEntity.setCurrentFlowElement(targetFlowElement);
        ActivitiEngineAgenda agenda = commandContext.getAgenda();
        agenda.planContinueProcessInCompensation(executionEntity);
        return null;
    }
}