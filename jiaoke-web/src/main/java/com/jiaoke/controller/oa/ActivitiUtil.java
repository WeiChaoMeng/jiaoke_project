package com.jiaoke.controller.oa;

import com.jiake.utils.DateUtil;
import com.jiaoke.oa.bean.Comments;
import com.jiaoke.oa.bean.OaActTemporary;
import com.jiaoke.oa.bean.OaCollaboration;
import org.activiti.bpmn.model.*;
import org.activiti.bpmn.model.Process;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
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
     * @param processDefinitionKey 流程定义键
     * @param businessKey          业务键
     * @param variables            变量
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
     * 获取任务根据Assignee和processDefinitionKey
     *
     * @param assignee             assignee
     * @param processDefinitionKey processDefinitionKey
     * @return TaskList
     */
    public List<Task> getTaskByProcessDefinitionKey(Integer assignee, String processDefinitionKey) {
        return taskService.createTaskQuery().processDefinitionKey(processDefinitionKey).taskAssignee(assignee.toString()).orderByTaskCreateTime().desc().list();
    }

    /**
     * 获取任务根据Assignee
     *
     * @param assignee assignee
     * @return TaskList
     */
    public List<Task> getTaskByAssignee(String assignee) {
        return taskService.createTaskQuery().taskAssignee(assignee).orderByTaskCreateTime().desc().list();
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
     * 获取业务id根据任务id
     *
     * @param processInstanceId 流程实例Id
     * @return 业务id
     */
    public String getBusinessById(String processInstanceId) {
        return historyService.createHistoricProcessInstanceQuery().processInstanceId(processInstanceId).singleResult().getBusinessKey();
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
        //倒序list
        Collections.reverse(commentList);
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

    public String finishTaskAndAppointNext(String processInstanceId, String processingOpinion, String taskId, String userName, String assignee) {
        Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
        if (task == null) {
            return "error";
        } else {
            Map<String, Object> map = new HashMap<>(16);
            map.put("principal", assignee);
            Authentication.setAuthenticatedUserId(userName);
            taskService.addComment(taskId, processInstanceId, processingOpinion);
            taskService.complete(taskId, map);
            return "success";
        }
    }

    /**
     * 开启流程实例
     *
     * @param processDefinitionKey 流程定义键
     * @param businessKey          业务键
     * @param variables            变量
     * @param startUserId          发起用户id
     */
    public String startProcessInstanceByKey(String processDefinitionKey, String businessKey, Map<String, Object> variables, String startUserId) {
        //设置发起人信息 act_hi_procinst - START_USER_ID_
        ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();
        processEngine.getIdentityService().setAuthenticatedUserId(startUserId);
        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(processDefinitionKey, businessKey, variables);
        return processInstance.getId();
    }

    /**
     * 开启流程实例（支持驳回）
     *
     * @param processDefinitionKey 流程定义键
     * @param businessKey          业务键
     * @param variables            变量
     * @param startUserId          发起用户id
     */
    public ProcessInstance startProcessInstance(String processDefinitionKey, String businessKey, Map<String, Object> variables, String startUserId) {
        //设置发起人act_hi_procinst - START_USER_ID_
        ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();
        processEngine.getIdentityService().setAuthenticatedUserId(startUserId);
        //启动流程实例
        return runtimeService.startProcessInstanceByKey(processDefinitionKey, businessKey, variables);
    }

    /**
     * 根据任务id获取任务
     *
     * @param taskId 任务id
     * @return 流程实例id
     */
    public Task getTaskByTaskId(String taskId) {
        return taskService.createTaskQuery().taskId(taskId).singleResult();
    }

    /**
     * 根据任务id获取任务
     *
     * @param processInstanceId 流程实例Id
     * @return 流程实例id
     */
    public Task getAssigneeByProcessInstanceId(String processInstanceId) {
        return taskService.createTaskQuery().processInstanceId(processInstanceId).singleResult();
    }

    /**
     * 获取下个节点
     *
     * @param processDefinitionId 流程定义Id
     * @param taskDefinitionKey   任务定义的关键
     * @return
     */
    public String getNextNode(String processDefinitionId, String taskDefinitionKey) {
        String targetRef = "";
        BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinitionId);
        FlowNode myFlowNode = (FlowNode) bpmnModel.getMainProcess().getFlowElement(taskDefinitionKey);
        List<SequenceFlow> flows = myFlowNode.getOutgoingFlows();
        for (SequenceFlow flow : flows) {
            targetRef = flow.getTargetRef();
        }
        return targetRef;
    }

    /**
     * 获取用户的任务
     *
     * @param processDefinitionId 流程定义Id
     * @return UserTask
     */
    public UserTask getUserTask(String processDefinitionId, String nextNode) {
        UserTask userTask = null;
        BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinitionId);
        Collection<FlowElement> flowElements = bpmnModel.getProcesses().get(0).getFlowElements();
        for (FlowElement flowElement : flowElements) {
            if (flowElement instanceof UserTask) {
                UserTask userTasks = (UserTask) flowElement;
                if (userTasks.getId().equals(nextNode)) {
                    userTask = userTasks;
                }
            }
        }
        return userTask;
    }

    /**
     * 完成审批
     *
     * @param processInstanceId 流程实例Id
     * @param processingOpinion 处理意见
     * @param taskId            任务Id
     * @param userName          用户名
     */
    public void complete(String processInstanceId, String processingOpinion, String taskId, String userName) {
        //当前执行人批注
        Authentication.setAuthenticatedUserId(userName);
        taskService.addComment(taskId, processInstanceId, processingOpinion);

        //完成并结束
        taskService.complete(taskId);
    }

    /**
     * 完成审批（无批注）
     *
     * @param taskId 任务Id
     */
    public void endProcess(String taskId) {
        //完成并结束
        taskService.complete(taskId);
    }

    /**
     * 完成并指定下一个节点
     *
     * @param processInstanceId 流程实例Id
     * @param processingOpinion 处理意见
     * @param taskId            任务Id
     * @param userName          用户名
     * @param map               变量
     */
    public void completeAndAppointNextNode(String processInstanceId, String processingOpinion, String taskId, String userName, Map<String, Object> map) {
        //当前执行人批注
        Authentication.setAuthenticatedUserId(userName);
        taskService.addComment(taskId, processInstanceId, processingOpinion);

        //指定下个执行人
        taskService.complete(taskId, map);
    }

    /**
     * 流程启动成功后内部完成并指定下个节点（驳回）
     *
     * @param taskId 任务Id
     * @param map    变量
     */
    public void internalCompletion(String taskId, Map<String, Object> map) {
        taskService.complete(taskId, map);
    }

    /**
     * 获取启动流程用户Id
     *
     * @param processInstanceId processInstanceId
     * @return startUserId
     */
    public String getStartUserId(String processInstanceId) {
        return historyService.createHistoricProcessInstanceQuery().processInstanceId(processInstanceId).singleResult().getStartUserId();
    }

    /**
     * 获取启动流程用户Id
     *
     * @param processInstanceId processInstanceId
     * @return startUserId
     */
    public HistoricProcessInstance getHistoricProcessInstance(String processInstanceId) {
        return historyService.createHistoricProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
    }

    /**
     * 查询历史任务
     *
     * @return list
     */
    public List<HistoricTaskInstance> selectHistoricTask(String assignee) {
        return historyService.createHistoricTaskInstanceQuery().taskAssignee(assignee).orderByTaskId().desc().list();
    }

    /**
     * 根据startUserId查询未完成的流程实例
     *
     * @param userId 用户id
     * @return list
     */
    public List<HistoricProcessInstance> getUnfinishedProcessInstance(String userId) {
        return historyService.createHistoricProcessInstanceQuery().startedBy(userId).unfinished().list();
    }

    /**
     * 查询历史任务
     *
     * @return list
     */
    public List<HistoricTaskInstance> getHistoricTask(String assignee) {
        return historyService.createHistoricTaskInstanceQuery().taskAssignee(assignee).orderByTaskId().desc().list();
    }

    /**
     * 根据业务Key获取流程实例ID
     *
     * @param businessKey 关联业务主键
     * @return 流程实例id
     */
    public HistoricProcessInstance getProcessInstanceByBusinessKey(String businessKey) {
        return historyService.createHistoricProcessInstanceQuery().processInstanceBusinessKey(businessKey).singleResult();
    }

    /**
     * 已发布的流程实例
     *
     * @param userId 用户id
     * @return list
     */
    public List<OaCollaboration> alreadyIssuedProcessInstance(String userId) {
        List<OaCollaboration> list = new ArrayList<>();

        //查询当前用户开启的流程实例
        List<HistoricProcessInstance> processInstanceList = historyService.createHistoricProcessInstanceQuery().startedBy(userId).list();
        for (HistoricProcessInstance hpi : processInstanceList) {
            //判断流程是否已经结束
            ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(hpi.getId()).singleResult();
            if (processInstance == null) {
                //结束
                OaCollaboration oaCollaboration = new OaCollaboration();
                oaCollaboration.setCorrelationId(hpi.getBusinessKey().substring(hpi.getBusinessKey().lastIndexOf(":") + 1));
                oaCollaboration.setTable(hpi.getBusinessKey().substring(0, hpi.getBusinessKey().indexOf(":")));
                oaCollaboration.setStartTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(hpi.getStartTime()));
                oaCollaboration.setCurrentExecutor("已结束");
                oaCollaboration.setProcessInstanceId(hpi.getId());
                list.add(oaCollaboration);
            } else {
                //正在执行中
                Task task = taskService.createTaskQuery().processInstanceId(hpi.getId()).singleResult();
                OaCollaboration oaCollaboration = new OaCollaboration();
                oaCollaboration.setCorrelationId(hpi.getBusinessKey().substring(hpi.getBusinessKey().lastIndexOf(":") + 1));
                oaCollaboration.setTable(hpi.getBusinessKey().substring(0, hpi.getBusinessKey().indexOf(":")));
                oaCollaboration.setStartTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(hpi.getStartTime()));
                oaCollaboration.setCurrentExecutor(task.getAssignee());
                oaCollaboration.setProcessInstanceId(hpi.getId());
                list.add(oaCollaboration);
            }
        }
        return list;
    }

    /**
     * 协同 - 已办事项流程实例
     *
     * @return list
     */
    public List<OaCollaboration> selectDoneProcessInstance(String assignee) {
        //存储流程实例Id
        List<String> processInstanceIdList = new ArrayList<>();
        //存储最终要展示的数据
        List<OaCollaboration> oaCollaborationList = new ArrayList<>();
        //根据用户id查询历史任务实例列表
        List<HistoricTaskInstance> historicTaskInstanceList = historyService.createHistoricTaskInstanceQuery().taskAssignee(assignee).finished().orderByHistoricTaskInstanceEndTime().desc().list();
        //历史任务实例列表为空
        if (historicTaskInstanceList.size() < 1) {
            return oaCollaborationList;
        } else {
            for (HistoricTaskInstance historicTaskInstance : historicTaskInstanceList) {
                processInstanceIdList.add(historicTaskInstance.getProcessInstanceId());
            }

            //去除重复
            LinkedHashSet<String> linkedHashSet = new LinkedHashSet<>(processInstanceIdList);
            List<HistoricProcessInstance> historicProcessInstanceList = historyService.createHistoricProcessInstanceQuery().processInstanceIds(linkedHashSet).list();
            for (HistoricProcessInstance hpi : historicProcessInstanceList) {
                OaCollaboration oaCollaboration = new OaCollaboration();
                oaCollaboration.setCorrelationId(hpi.getBusinessKey().substring(hpi.getBusinessKey().lastIndexOf(":") + 1));
                oaCollaboration.setTable(hpi.getBusinessKey().substring(0, hpi.getBusinessKey().indexOf(":")));
                oaCollaboration.setProcessInstanceId(hpi.getId());
                //d当前待办人
                Task task = getAssigneeByProcessInstanceId(hpi.getId());
                if (task == null) {
                    oaCollaboration.setCurrentExecutor("已结束");
                } else {
                    oaCollaboration.setCurrentExecutor(task.getAssignee());
                }
                oaCollaboration.setStartTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(hpi.getStartTime()));
                oaCollaborationList.add(oaCollaboration);
            }
            return oaCollaborationList;
        }

    }

    /**
     * 协同 获取待办任务
     *
     * @param taskList taskList
     * @return list
     */
    public List<OaCollaboration> getPendingProcessInstance(List<Task> taskList) {
        List<OaCollaboration> list = new ArrayList<>();
        for (Task task : taskList) {
            OaCollaboration oaCollaboration = new OaCollaboration();
            //根据任务id获取业务id
            String processInstanceId = taskService.createTaskQuery().taskId(task.getId()).singleResult().getProcessInstanceId();
            String businessKey = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult().getBusinessKey();

            oaCollaboration.setCorrelationId(businessKey.substring(businessKey.lastIndexOf(":") + 1));
            oaCollaboration.setTable(businessKey.substring(0, businessKey.indexOf(":")));
            oaCollaboration.setTaskId(task.getId());

            HistoricProcessInstance hpi = getHistoricProcessInstance(task.getProcessInstanceId());
            String startUser = hpi.getStartUserId();

            oaCollaboration.setCreateTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(hpi.getStartTime()));
            oaCollaboration.setPromoter(Integer.valueOf(startUser));
            oaCollaboration.setReceiptTimeStr(DateUtil.dateConvertYYYYMMDDHHMMSS(task.getCreateTime()));

            //获取上个执行人节点
            BpmnModel bpmnModel = repositoryService.getBpmnModel(task.getProcessDefinitionId());
            FlowNode myFlowNode = (FlowNode) bpmnModel.getMainProcess().getFlowElement(task.getTaskDefinitionKey());
            List<SequenceFlow> flows = myFlowNode.getIncomingFlows();
            for (SequenceFlow flow : flows) {
                //获取该节点执行人
                String sourceRef = flow.getSourceRef();
                //上个节点是发起人
                if ("start".equals(sourceRef)) {
                    oaCollaboration.setPreviousApprover(startUser);
                } else {
                    UserTask userTask = getUserTask(task.getProcessDefinitionId(), flow.getSourceRef());
                    if (userTask != null) {
                        oaCollaboration.setPreviousApprover(userTask.getAssignee());
                    } else {
                        oaCollaboration.setPreviousApprover("网关");
                    }
                }
            }
            list.add(oaCollaboration);
        }
        return list;
    }


    /**
     * 根据流程实例Id删除
     *
     * @param processInstanceId processInstanceId
     * @return int
     */
    public int deleteByProcessInstanceId(String processInstanceId) {
        //1.判断流程是否结束
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
        //流程已结束
        if (processInstance == null) {
            historyService.deleteHistoricProcessInstance(processInstanceId);
            taskService.deleteComments("", processInstanceId);
            return 1;
        } else {
            //流程未结束
            runtimeService.deleteProcessInstance(processInstanceId, "");
            historyService.deleteHistoricProcessInstance(processInstanceId);
            taskService.deleteComments("", processInstanceId);
            return 1;
        }
    }

    /**
     * 根据进程实例Id撤销
     *
     * @param processInstanceId processInstanceId
     * @return int
     */
    public int rescindByProcessInstanceId(String processInstanceId) {
        //1.判断流程是否结束
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
        //流程已结束(:不可以撤销)
        if (processInstance == null) {
            return -1;
        } else {
            runtimeService.deleteProcessInstance(processInstanceId, "");
            historyService.deleteHistoricProcessInstance(processInstanceId);
            taskService.deleteComments("", processInstanceId);
            return 1;
        }
    }

    /**
     * 得到当前执行人
     *
     * @param processInstanceId processInstanceId
     * @return assignee
     */
    public String getCurrentExecutor(String processInstanceId) {
        return taskService.createTaskQuery().processInstanceId(processInstanceId).singleResult().getAssignee();
    }

    /**
     * 完成审批指定固定执行人
     *
     * @param processInstanceId processInstanceId
     * @param processingOpinion processingOpinion
     * @param taskId            taskId
     * @param userName          userName
     * @param enforcer          enforcer
     * @param userId            userId
     */
    public void completeAndAppoint(String processInstanceId, String processingOpinion, String taskId, String userName, String enforcer, Integer userId) {

        //当前执行人批注
        Authentication.setAuthenticatedUserId(userName);
        taskService.addComment(taskId, processInstanceId, processingOpinion);

        Map<String, Object> map = new HashMap<>(16);
        map.put(enforcer, userId);
        //指定下个执行人
        taskService.complete(taskId, map);
    }
}
