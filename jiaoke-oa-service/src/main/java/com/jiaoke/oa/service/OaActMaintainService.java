package com.jiaoke.oa.service;

import com.jiaoke.oa.bean.OaActMaintain;

/**
 * 设备维修申请单
 *
 * @author lihui
 * @version 1.0
 * @date 2019-6-5 3:10
 */
public interface OaActMaintainService {

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
     * @param oaActMaintain oaActMaintain
     * @param userId        userId
     * @param randomId      randomId
     * @param state         state
     * @return int
     */
    int insert(OaActMaintain oaActMaintain, Integer userId, String randomId, Integer state);

    /**
     * 编辑
     *
     * @param oaActMaintain oaActMaintain
     * @return int
     */
    int edit(OaActMaintain oaActMaintain);

    /**
     * 查询
     *
     * @param id id
     * @return OaActSealsUse
     */
    OaActMaintain selectByPrimaryKey(String id);

    /**
     * 选择性更新
     *
     * @param oaActMaintain oaActMaintain
     * @return int
     */
    int updateByPrimaryKeySelective(OaActMaintain oaActMaintain);
}
