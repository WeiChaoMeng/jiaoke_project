package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActTrainee;

/**
 * 毕业生见习期满考核鉴定表
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 2:02
 */
public interface OaActTraineeService {

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
     * @param oaActTrainee oaActTrainee
     * @param userId       userId
     * @param randomId     randomId
     * @param state        state
     * @return int
     */
    int insert(OaActTrainee oaActTrainee, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActTrainee oaActTrainee
     * @return int
     */
    int edit(OaActTrainee oaActTrainee);

    /**
     * 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActTrainee selectByPrimaryKey(String id);

    /**
     * 根据主键更新数据
     *
     * @param oaActTrainee oaActTrainee
     * @return int
     */
    int updateByPrimaryKeySelective(OaActTrainee oaActTrainee);
}
