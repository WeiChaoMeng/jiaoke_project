package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaCollaboration;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.task.Task;

import java.util.List;

/**
 * OA模块首页
 *
 * @author lihui
 * @version 1.0
 * @date 2019-5-22 11:44
 */
public interface OaIndexService {

    /**
     * 待办工作
     *
     * @param taskList taskList
     * @return list
     */
    List<OaCollaboration> upcomingMatterData(List<Task> taskList);

    /**
     * 跟踪事项
     *
     * @param processInstanceList processInstanceList
     * @return list
     */
    List<OaCollaboration> trackingMatterData(List<HistoricProcessInstance> processInstanceList);
}
