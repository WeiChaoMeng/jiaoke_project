package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActOvertime;

/**
 * 加班统计表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActOvertimeService {

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
     * @param oaActOvertime oaActOvertime
     * @param userId        userId
     * @param randomId      randomId
     * @param state         state
     * @return int
     */
    int insert(OaActOvertime oaActOvertime, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActOvertime oaActOvertime
     * @return int
     */
    int edit(OaActOvertime oaActOvertime);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActOvertime selectByPrimaryKey(String id);

    /**
     * 选择性更新
     *
     * @param oaActOvertime oaActOvertime
     * @return int
     */
    int updateByPrimaryKeySelective(OaActOvertime oaActOvertime);
}
