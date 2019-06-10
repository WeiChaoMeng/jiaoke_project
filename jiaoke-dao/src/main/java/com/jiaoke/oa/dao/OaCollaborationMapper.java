package com.jiaoke.oa.dao;

import com.jiaoke.oa.bean.OaCollaboration;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * OA协同
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 16:54
 */
@Repository
public interface OaCollaborationMapper {

    /**
     * 新增
     *
     * @param oaCollaboration oaCollaboration
     * @return int
     */
    int insertData(OaCollaboration oaCollaboration);

    /**
     * 根据idList查询已发数据
     *
     * @param list  list
     * @param title title
     * @return list
     */
    List<OaCollaboration> selectAlreadySend(@Param("list") List<String> list, @Param("title") String title);

    /**
     * 根据idList查询待发数据
     *
     * @param userId userId
     * @param title  title
     * @return list
     */
    List<OaCollaboration> selectWaitSend(@Param("userId") Integer userId, @Param("title") String title);

    /**
     * 查询待办任务
     *
     * @param list list
     * @param title title
     * @return list
     */
    List<OaCollaboration> selectPending(@Param("list") List<String> list, @Param("title") String title);

    /**
     * 查询已办任务
     *
     * @param list list
     * @return list
     */
    List<OaCollaboration> selectDone(@Param("list") List<String> list, @Param("title") String title);

    /**
     * 更新数据
     *
     * @param correlationId correlationId
     * @param title         title
     * @return int
     */
    int update(@Param("correlationId") String correlationId, @Param("title") String title);

    /**
     * 更新状态和标题
     *
     * @param correlationId correlationId
     * @param state         state
     * @param title         title
     * @return int
     */
    int updateStateByCorrelationId(@Param("correlationId") String correlationId, @Param("state") Integer state, @Param("title") String title);

    /**
     * 删除
     *
     * @param correlationId correlationId
     * @return int
     */
    int deleteByCorrelationId(String correlationId);

    /**
     * 删除关联表数据
     *
     * @param correlationId correlationId
     * @param table         table
     * @return int
     */
    int deleteCorrelationTable(@Param("correlationId") String correlationId, @Param("table") String table);

    /**
     * 更新状态
     *
     * @param correlationId correlationId
     * @param state         state
     * @return int
     */
    int updateState(@Param("correlationId") String correlationId, @Param("state") Integer state);
}
