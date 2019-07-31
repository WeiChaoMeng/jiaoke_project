package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActOvertimeRest;

/**
 * 加班（倒休）审批表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActOvertimeRestService {

    /**
     * 删除
     *
     * @param id id
     * @return int
     */
    int deleteData(String id);

    /**
     * 新增
     *
     * @param oaActOvertimeRest oaActOvertimeRest
     * @param userId            userId
     * @param randomId          randomId
     * @param state             state
     * @return int
     */
    int insert(OaActOvertimeRest oaActOvertimeRest, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActOvertimeRest oaActOvertimeRest
     * @return int
     */
    int edit(OaActOvertimeRest oaActOvertimeRest);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActOvertimeRest selectByPrimaryKey(String id);

    /**
     * 更新附件列表
     *
     * @param array array
     * @param id    id
     * @return int
     */
    int updateAnnexes(String[] array, String id);
}
