package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaCollaboration;

import java.util.List;

/**
 * 协同
 *
 * @author lihui
 * @version 1.0
 * @date 2019/5/11 14:45
 */
public interface OaCollaborationService {

    /**
     * 查询已办事项
     *
     * @param oaCollaborations oaCollaborations
     * @param title            title
     * @return list
     */
    List<OaCollaboration> selectDone(List<OaCollaboration> oaCollaborations, String title);

    /**
     * 查询已发事项
     *
     * @param oaCollaborations oaCollaborations
     * @param title title
     * @return list
     */
    List<OaCollaboration> selectAlreadySend(List<OaCollaboration> oaCollaborations, String title);

    /**
     * 查询待办事项
     *
     * @param oaCollaborations oaCollaborations
     * @param title            title
     * @return list
     */
    List<OaCollaboration> selectPending(List<OaCollaboration> oaCollaborations, String title);

    /**
     * 查询待发事项
     *
     * @param userId userId
     * @param title  title
     * @return list
     */
    List<OaCollaboration> selectWaitSend(Integer userId, String title);

    /**
     * 更新状态
     *
     * @param correlationId correlationId
     * @param state         state
     * @param title         title
     * @return int
     */
    int updateStateByCorrelationId(String correlationId, Integer state, String title);

    /**
     * 删除
     *
     * @param correlationId correlationId
     * @param table         table
     * @return int
     */
    int delete(String correlationId, String table);

    /**
     * 删除
     *
     * @param correlationId correlationId
     * @return int
     */
    int deleteByCorrelationId(String correlationId);

    /**
     * 更新状态
     *
     * @param correlationId correlationId
     * @param state         state
     * @return int
     */
    int updateState(String correlationId, Integer state);
}
