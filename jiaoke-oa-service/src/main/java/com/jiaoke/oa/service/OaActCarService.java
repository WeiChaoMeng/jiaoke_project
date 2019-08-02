package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActCar;

/**
 * 用车审批单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-4 23:57
 */
public interface OaActCarService {

    /**
     * 用车审批单 - 保存待发
     *
     * @param oaActCar oaActCar
     * @param userId   userId
     * @param randomId randomId
     * @return int
     */
    int savePending(OaActCar oaActCar, Integer userId, String randomId);

    /**
     * 用车审批单 - 新增
     *
     * @param oaActCar oaActCar
     * @param userId   userId
     * @param randomId randomId
     * @return int
     */
    int insert(OaActCar oaActCar, Integer userId, String randomId);

    /**
     * 用车审批单 - 查询
     *
     * @param id id
     * @return OaActMeals
     */
    OaActCar selectByPrimaryKey(String id);

    /**
     * 修改数据
     *
     * @param oaActCar oaActCar
     * @return int
     */
    int edit(OaActCar oaActCar);

    /**
     * 删除
     *
     * @param id id
     * @return int
     */
    int deleteData(String id);


    /**
     * 更新状态(0,已发 - 1,待发)
     *
     * @param id    id
     * @param state state
     * @return int
     */
    int updateState(String id, Integer state);

    /**
     * 根据主键更新
     *
     * @param oaActCar oaActCar
     * @return int
     */
    int updateByPrimaryKey(OaActCar oaActCar);
}
